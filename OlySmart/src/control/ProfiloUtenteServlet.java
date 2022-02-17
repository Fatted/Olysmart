package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cliente;
import model.ClienteDAO;

/**
 * Servlet implementation class ProfiloUtenteServlet
 */
@WebServlet("/ProfiloUtenteServlet")
public class ProfiloUtenteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfiloUtenteServlet() {
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
		
		//alla stringa operazione assegnamo i vari value selezionati in MyAccount che sono nei form dei vari modal di gestione
		String operazione=request.getParameter("operation");
		
		//se l'operazione è addData allora aggiorno/inserisco solo la data
		if(operazione.equals("addData")) {
			String data=request.getParameter("data");//prendo il valore dal input con il nome data 
			HttpSession httpsession=request.getSession();
			Cliente cliente=(Cliente) httpsession.getAttribute("cliente-corrente");//prendo il cliente corrente
			cliente.setDatadinascita(data);//setto la nuova data al cliente
			
			ClienteDAO clienteAggiornato=new ClienteDAO();
			clienteAggiornato.UpdateCliente(cliente);//aggiorno la data grazie alla query presente nel ClienteDAO nel metodo UpdateCliente
			response.sendRedirect("MyInfo.jsp");//ritorno alla pagina di account con le informazioni aggiornate
		}
		
		//se l'operazione è addCF allora aggiorno/inserisco solo il codice fiscale
		else if(operazione.equals("addCF")) {
			String CF=request.getParameter("CF");//prendo il valore dal input con il nome CF
			HttpSession httpsession=request.getSession();
			Cliente cliente=(Cliente) httpsession.getAttribute("cliente-corrente");
			cliente.setCodicefiscale(CF);//setto il nuovo codice fiscale al cliente
			
			ClienteDAO clienteAggiornato=new ClienteDAO();
			clienteAggiornato.UpdateCliente(cliente);//aggiorno il cf grazie alla query presente nel ClienteDAO nel metodo UpdateCliente
			response.sendRedirect("MyInfo.jsp");//ritorno alla pagina di account con le informazioni aggiornate
		}
		//faccio lo stesso per tutte le altre operazioni scelte dall'utente
		else if(operazione.equals("addEmail")) {
			String email=request.getParameter("email");
			HttpSession httpsession=request.getSession();
			Cliente cliente=(Cliente) httpsession.getAttribute("cliente-corrente");
			cliente.setEmail(email);
			
			ClienteDAO clienteAggiornato=new ClienteDAO();
			clienteAggiornato.UpdateCliente(cliente);
			response.sendRedirect("MyInfo.jsp");
		}
		
		else if(operazione.equals("addTelefono")) {
			String telefono=request.getParameter("telefono");
			HttpSession httpsession=request.getSession();
			Cliente cliente=(Cliente) httpsession.getAttribute("cliente-corrente");
			cliente.setTelefono(telefono);
			
			ClienteDAO clienteAggiornato=new ClienteDAO();
			clienteAggiornato.UpdateCliente(cliente);
			response.sendRedirect("MyInfo.jsp");
		}
		
		else if(operazione.equals("addIndirizzo")) {
			String cap=request.getParameter("cap");
			String via=request.getParameter("via");
			String citta=request.getParameter("citta");
			HttpSession httpsession=request.getSession();
			Cliente cliente=(Cliente) httpsession.getAttribute("cliente-corrente");
			cliente.setVia(via);
			cliente.setCap(cap);
			cliente.setCitta(citta);
			
			ClienteDAO clienteAggiornato=new ClienteDAO();
			clienteAggiornato.UpdateCliente(cliente);
			response.sendRedirect("MyInfo.jsp");
		}
		
		else if(operazione.equals("addCarta")) {
			String intestatario=request.getParameter("intestatariocarta");
			String numerocarta=request.getParameter("numerocarta");
			String datascadenza=request.getParameter("datascadenza");
			String CVV=request.getParameter("CVV");
			String circuito=request.getParameter("circuito");
			HttpSession httpsession=request.getSession();
			Cliente cliente=(Cliente) httpsession.getAttribute("cliente-corrente");
			cliente.setIntestatario_carta(intestatario);
			cliente.setNumero_carta(numerocarta);
			cliente.setData_scadenza_carta(datascadenza);
			cliente.setCVV(CVV);
			cliente.setCircuito_carta(circuito);
			
			ClienteDAO clienteAggiornato=new ClienteDAO();
			clienteAggiornato.UpdateCliente(cliente);
			response.sendRedirect("MyInfo.jsp");
		}
		
		doGet(request, response);
	}

}
