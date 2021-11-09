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
		    ArrayList<Carrello> prodotti_carrello=(ArrayList<Carrello>)session.getAttribute("listacarrello");
		    List<Carrello> prodottocarrello=null;
		      
		      double totale=0;
		      		     					      

		    	 ProdottoDAO prodotto=new ProdottoDAO();
		    	 
		    	 totale=prodotto.getTotaleCarrello(prodotti_carrello);//il totale è dato grazie al getTotaleCarrello
		    	 
		      	 prodottocarrello=prodotto.getProdottiCarrello(prodotti_carrello);//prodottocarrello conterrà tutti i prodotti presenti nella sessione del carrello
		      	 
		      	 request.getAttribute("prodotti_carrello"); 	
		      			   			
			//prendo il cliente corrente
			Cliente cliente=(Cliente) request.getSession().getAttribute("cliente-corrente");
			String indirizzo=cliente.getVia()+","+cliente.getCitta()+"("+cliente.getCap()+")";
			
			
			//check out con inserimento nel db
			//faccio un controllo per vedere che il cliente e i prodotti nel carrello non sono nulli
			if(prodottocarrello!=null && cliente!=null) {
				Ordine ordine=new Ordine();
				OrdineDAO ordinedao=new OrdineDAO();
				
					//effettuo un for each per settare all'ordine tutti i valori che mi prendo dai prodotti presenti nel carrello								
					for(Carrello pcarrello:prodottocarrello) {					
					ordine.setCodice(0);
					ordine.setCosto_totale(totale);
					ordine.setData(formatter.format(data));
					ordine.setUsername(cliente.getUsername());
					ordine.setTipo_spedizione("");
					ordine.setQuantità_prodotto(pcarrello.getQuantita());
					ordine.setIndirizzo_consegna(indirizzo);
					ordine.setNome_prodotto(pcarrello.getNome());
					ordine.setPrezzo_prodotto_singolo(pcarrello.getPrezzo_vendita());
					int darimuovere=pcarrello.getNumero_pezzi_disponibili()-pcarrello.getQuantita();//mi calcolo la quantità del prodotto da rimuovere nel db
	
					ordinedao.inserimentoOrdine(ordine);//inserisco l'ordine nel database con i valori settati sopra
					prodotto.rimuoviquantitaprodotto(pcarrello.getCodice(), darimuovere);//rimuovo la quantità di quel prodotto dalla table prodotti,in base alla quantità ordinata dal cliente
				
				}	
					
			}
												
				prodotti_carrello.clear();
				response.sendRedirect("Homepage.jsp");
									
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
