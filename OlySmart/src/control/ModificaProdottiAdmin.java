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
		int id=Integer.parseInt(request.getParameter("id"));
		
		
		if(operazione.equals("addNome")) {
			String nome=request.getParameter("nome");
			ProdottoDAO prodottoDAO=new ProdottoDAO();		
			prodottoDAO.UpdateProdottoNome(id,nome);
			response.sendRedirect("ModificaProdottiAdmin.jsp?id="+id);						
		}
		if(operazione.equals("addDescrizione")) {
			String descrizione=request.getParameter("descrizioneProdotto");
			ProdottoDAO prodottoDAO=new ProdottoDAO();		
			prodottoDAO.UpdateProdottoDescrizione(id,descrizione);
			response.sendRedirect("ModificaProdottiAdmin.jsp?id="+id);						
		}
		if(operazione.equals("addPrezzoAcquisto")) {
			double prezzo=Double.valueOf(request.getParameter("prezzoacquisto"));
			ProdottoDAO prodottoDAO=new ProdottoDAO();		
			prodottoDAO.UpdateProdottoPrezzoAcquisto(id,prezzo);
			response.sendRedirect("ModificaProdottiAdmin.jsp?id="+id);						
		}
		if(operazione.equals("addDisponibilita")) {
			String disponibilita=request.getParameter("disponibilita");
			ProdottoDAO prodottoDAO=new ProdottoDAO();		
			prodottoDAO.UpdateProdottoDisponibilita(id,disponibilita);
			response.sendRedirect("ModificaProdottiAdmin.jsp?id="+id);						
		}
		if(operazione.equals("addIva")) {
			int iva=Integer.parseInt(request.getParameter("iva"));
			ProdottoDAO prodottoDAO=new ProdottoDAO();		
			prodottoDAO.UpdateProdottoIva(id,iva);
			response.sendRedirect("ModificaProdottiAdmin.jsp?id="+id);						
		}
		if(operazione.equals("addPrezzoVendita")) {
			double prezzo=Double.valueOf(request.getParameter("prezzovendita"));
			ProdottoDAO prodottoDAO=new ProdottoDAO();		
			prodottoDAO.UpdateProdottoPrezzoVendita(id,prezzo);
			response.sendRedirect("ModificaProdottiAdmin.jsp?id="+id);						
		}
		if(operazione.equals("addMarca")) {
			String marca=request.getParameter("marca");
			ProdottoDAO prodottoDAO=new ProdottoDAO();		
			prodottoDAO.UpdateProdottoMarca(id,marca);
			response.sendRedirect("ModificaProdottiAdmin.jsp?id="+id);						
		}
		if(operazione.equals("addPezziDisponibili")) {
			int pezzi=Integer.parseInt(request.getParameter("pezzidisponibili"));
			ProdottoDAO prodottoDAO=new ProdottoDAO();		
			prodottoDAO.UpdateProdottoPezziDisponibili(id,pezzi);
			response.sendRedirect("ModificaProdottiAdmin.jsp?id="+id);						
		}
		if(operazione.equals("addSconto")) {
			int sconto=Integer.parseInt(request.getParameter("sconto"));
			ProdottoDAO prodottoDAO=new ProdottoDAO();		
			prodottoDAO.UpdateProdottoSconto(id,sconto);
			response.sendRedirect("ModificaProdottiAdmin.jsp?id="+id);						
		}
		if(operazione.equals("addSpecifiche")) {
			String specifiche=request.getParameter("specifiche");
			ProdottoDAO prodottoDAO=new ProdottoDAO();		
			prodottoDAO.UpdateProdottoSpecifiche(id,specifiche);
			response.sendRedirect("ModificaProdottiAdmin.jsp?id="+id);						
		}
		if(operazione.equals("addCategoria")) {
			String categoria=request.getParameter("categoria");
			ProdottoDAO prodottoDAO=new ProdottoDAO();		
			prodottoDAO.UpdateProdottoCategoria(id,categoria);
			response.sendRedirect("ModificaProdottiAdmin.jsp?id="+id);						
		}
		if(operazione.equals("addOfferta")) {
			String offerta=request.getParameter("offerta");
			ProdottoDAO prodottoDAO=new ProdottoDAO();		
			prodottoDAO.UpdateProdottoOfferta(id,offerta);
			response.sendRedirect("ModificaProdottiAdmin.jsp?id="+id);						
		}
		if(operazione.equals("EliminaProdotto")) {
			ProdottoDAO prodottoDAO=new ProdottoDAO();		
			prodottoDAO.UpdateProdottoEliminazione(id);
			response.sendRedirect("PaginaAdminProdotto.jsp");						
		}
		
		
		
		doGet(request, response);
	}

}
