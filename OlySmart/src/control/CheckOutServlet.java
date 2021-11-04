package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;


/**
 * Servlet implementation class CheckOutServlet
 */
@WebServlet("/CheckOutServlet")
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckOutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try(PrintWriter out=response.getWriter()){
			
			SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
			Date data=new Date(0);
			
			HttpSession session=request.getSession();
			ArrayList<Carrello> listacarrello=(ArrayList<Carrello>)session.getAttribute("listacarrello");
		      List<Carrello> prodottocarrello=null;
		      
		      double totale=0;
		   
		      SpedizioneDAO spedizione=new SpedizioneDAO();
		      
		      List<Spedizione> spedizioni=null;
		      spedizioni=spedizione.getSpedizioni();

		      
		     	
		      
		      
		      if(listacarrello!=null){
		    	 ProdottoDAO prodotto=new ProdottoDAO();
		    	 
		    	 totale=prodotto.getTotaleCarrello(listacarrello);
		    	 
		      	 prodottocarrello=prodotto.getProdottiCarrello(listacarrello);
		      }

			
			//prendo il cliente corrente
			Cliente cliente=(Cliente) request.getSession().getAttribute("cliente-corrente");
			String indirizzo=cliente.getVia()+","+cliente.getCitta()+"("+cliente.getCap()+")";
			
			
			//check out con inserimento nel db
			if(prodottocarrello!=null && cliente!=null) {
				
				Ordine ordine=new Ordine();
				
				for(Prodotto prodotti:prodottocarrello) {				
					ordine.setPrezzo_prodotto_singolo(prodotti.getPrezzo_vendita());
					ordine.setNome_prodotto(prodotti.getNome());
						
					for(Carrello pcarrello:prodottocarrello) {					
					ordine.setCodice(0);
					ordine.setCosto_totale(totale);
					ordine.setData(formatter.format(data));
					ordine.setUsername(cliente.getUsername());
					ordine.setTipo_spedizione("");
					ordine.setQuantità_prodotto(pcarrello.getQuantita());
					ordine.setIndirizzo_consegna(indirizzo);
					}
					
					OrdineDAO ordinedao=new OrdineDAO();
					ordinedao.inserimentoOrdine(ordine);
					}
				
				listacarrello.clear();
				response.sendRedirect("Homepage.jsp");
				
			}
					
		}catch(Exception e) {
			System.out.print(e);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
