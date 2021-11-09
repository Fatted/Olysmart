package control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cliente;
import model.Prodotto;
import model.ProdottoDAO;

/**
 * Servlet implementation class ModificaProdottiAdmin
 */
@WebServlet("/ModificaProdottiAdmin")
public class ModificaProdottiAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificaProdottiAdmin() {
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
		int codice=Integer.parseInt(request.getParameter("codice"));
		
		if(operazione.equals("addDescrizione")) {
			String descrizione=request.getParameter("descrizioneProdotto");
			System.out.print(descrizione);

			
			ProdottoDAO prodottoDAO=new ProdottoDAO();
			prodottoDAO.UpdateProdottoDescrizione(codice,descrizione);
			response.sendRedirect("PaginaAdminProdotti.jsp");						
		}
		doGet(request, response);
	}

}
