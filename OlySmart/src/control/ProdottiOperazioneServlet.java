package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Categoria;

/**
 * Servlet implementation class ProdottiOperazioneServlet
 */
@WebServlet("/ProdottiOperazioneServlet")
public class ProdottiOperazioneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProdottiOperazioneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//controllo del tipo di operazione	
		String operazione=request.getParameter("operation");
			
			if(operazione.equals("addCategory")) {	//se l'operazione scelta è addcategory
			int numero=Integer.parseInt(request.getParameter("numeroCategoria")); //prendo il numero inserito nel form
			String titolo=request.getParameter("TitoloCategoria");				//prendo la stringa inserito nel form
			
			Categoria categoria=new Categoria(numero,titolo);	//creo il nuovo oggetto categoria con i valori inseriti nel form
			
			//categoria database salvataggio
			categoria.setCategoria();
			request.setAttribute("categoria", categoria);
			HttpSession httpsession=request.getSession();
			httpsession.setAttribute("messaggio","Categoria inserita correttamente: Nome:"+categoria.getNome()+" Numero:"+categoria.getNumero()); //stampo a video il messaggio di inserimeto
			response.sendRedirect("paginaAdmin.jsp"); //ritorno alla pagina di gestione
			}else if(operazione.equals("addProdotto")){
				
			}

						
		
		doGet(request, response);
	}

}
