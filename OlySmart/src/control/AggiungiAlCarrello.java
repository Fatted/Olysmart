package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;
import control.*;

/**
 * Servlet implementation class AggiungiAlCarrello
 */
@WebServlet("/AggiungiAlCarrello")
public class AggiungiAlCarrello extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AggiungiAlCarrello() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		try(PrintWriter out=response.getWriter()){
			ArrayList<Carrello> carrello=new ArrayList<>();
			
			int id=Integer.parseInt(request.getParameter("id"));
			Carrello cart=new Carrello();
			cart.setCodice(id);
			cart.setNumero_pezzi_disponibili(1);
			
			HttpSession session=request.getSession();
			ArrayList<Carrello> listacarrello=(ArrayList<Carrello>)session.getAttribute("listacarrello");
			
			if(listacarrello==null) {
				carrello.add(cart);
				session.setAttribute("listacarrello",carrello);
				response.sendRedirect("carrello.jsp");
			}
			else {
				carrello=listacarrello;
				boolean esiste=false;

							
				for(Carrello c:listacarrello) {
					if(c.getCodice()==id) {
						esiste=true;
						out.println("<h3>Prodotto già presente nel carrello</h3><a href='carrello.jsp'>Vai al carrello");
				}
			}	
				
				if(!esiste) {
						listacarrello.add(cart);
						response.sendRedirect("carrello.jsp");
					}
			}

		}
	}
}
			
			


