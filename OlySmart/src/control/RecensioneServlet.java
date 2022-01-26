package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Cliente;
import model.Recensione;

/**
 * Servlet implementation class RecensioneServlet
 */
@WebServlet("/RecensioneServlet")
public class RecensioneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecensioneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String commento=request.getParameter("commento");
		int voto=Integer.parseInt(request.getParameter("voto"));
		Cliente cliente=(Cliente) request.getSession().getAttribute("cliente-corrente");
		int codiceProdotto=Integer.parseInt(request.getParameter("codiceProdotto"));
		String titolo=request.getParameter("titolo");
		
		
		Recensione recensione=new Recensione(cliente.getUsername(),codiceProdotto,titolo,commento,voto);
		recensione.setRecensione();
		response.sendRedirect("Homepage.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		doGet(request, response);
	}

}
