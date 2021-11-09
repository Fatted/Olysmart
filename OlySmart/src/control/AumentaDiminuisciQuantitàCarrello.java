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
@WebServlet("/AumentaDiminuisciQuantit‡Carrello")
public class AumentaDiminuisciQuantit‡Carrello extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AumentaDiminuisciQuantit‡Carrello() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		try(PrintWriter out=response.getWriter()){
			String attivit‡=request.getParameter("action");
			int id=Integer.parseInt(request.getParameter("id"));
			
			ArrayList<Carrello> listacarrello=(ArrayList<Carrello>)request.getSession().getAttribute("listacarrello");
			
			if(attivit‡!=null && id>=1) {
				if(attivit‡.equals("aumenta")) {
					for(Carrello carrello:listacarrello) {
						if(carrello.getCodice()==id) {
							int quantita=carrello.getQuantita();
							quantita++;
							carrello.setQuantita(quantita);
							response.sendRedirect("carrello.jsp");
						}
					}
				}
				
				if(attivit‡.equals("diminuisci")) {
					for(Carrello carrello:listacarrello) {
						if(carrello.getCodice()==id && carrello.getQuantita()>1) {
							int quantita=carrello.getQuantita();
							quantita--;
							carrello.setQuantita(quantita);
							break;
							
						}
					}
					response.sendRedirect("carrello.jsp");
				}
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		doGet(request, response);
	}

}
