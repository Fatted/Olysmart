package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.OrdineDAO;
import model.ProdottoDAO;

/**
 * Servlet implementation class ModificaStatoOrdiniAdmin
 */
@WebServlet("/ModificaStatoOrdiniAdmin")
public class ModificaStatoOrdiniAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificaStatoOrdiniAdmin() {
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
		String operazione=request.getParameter("operation");
		
		int idordine=Integer.parseInt(request.getParameter("idordine"));
		
		if(operazione.equals("UpdateStato")) {
			String stato=request.getParameter("stato");
			OrdineDAO ordine=new OrdineDAO();		
			ordine.UpdateOrdineStato(idordine, stato);
			response.sendRedirect("ModificaStatoOrdini.jsp?idordine="+idordine);						
		}
		doGet(request, response);
	}

}
