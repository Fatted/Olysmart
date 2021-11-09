package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Carrello;


/**
 * Servlet implementation class AumentaDiminuisciQuantit‡Carrello
 */
@WebServlet("/RimozioneProdottiCarrello")
public class RimozioneProdottiCarrello extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RimozioneProdottiCarrello() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		try(PrintWriter out=response.getWriter()){			
			//prendiamo l'id del prodotto passato dal carrello.jsp
			String id=request.getParameter("id");
			
			if(id!=null) {
				ArrayList<Carrello> listacarrello=(ArrayList<Carrello>)request.getSession().getAttribute("listacarrello");//prendiamo gli elementi che ci sono nel carrello della sessione dell'utente
				if(listacarrello!=null) {//se il carrello dell'utente non Ë vuoto
					for(Carrello carrello:listacarrello) {//per ogni prodotto nel carrello lo assegnamo all'oggetto carrello
						if(carrello.getCodice()==Integer.parseInt(id)) {//se gli id del nuovo oggetto carrello e id passato da carrello.jsp corrispondono
							listacarrello.remove(listacarrello.indexOf(carrello));//rimuovo l'oggetto dalla listacarrello
							break;
						}
					}
					response.sendRedirect("carrello.jsp");
				}
			}else {
				
				response.sendRedirect("carrello.jsp");
			}
			
						
		}
	}
}


