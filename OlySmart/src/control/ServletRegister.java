package control;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cliente;



/**
 * Servlet implementation class ServletLogin
 */
@WebServlet("/ServletRegister")
public class ServletRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//prendiamo tutti i parametri inseriti nel form della register.jsp
		String nome = request.getParameter("nome");
		String cognome = request.getParameter("cognome");
		String data = request.getParameter("data");
		String cf = request.getParameter("CF");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String username = request.getParameter("username");
		String telefono=request.getParameter("telefono");
		
		// indirizzo
		String cap = request.getParameter("cap");
		String via = request.getParameter("via");
		String citta = request.getParameter("citta");
		
		//standard
		String tipo="utente";
		
		//creo il nuovo cliente
		Cliente nuovoCliente = new Cliente(nome,cognome,data,cf,email,password,username,telefono,cap,via,citta,tipo,null,null,null,null,null);
		request.setAttribute("cliente", nuovoCliente);
		
		//controllo se il cliente è gia presente nel database,se lo è il valore sarà true e nell'if successivo al cliente verrà detto che l'username è già presente
		boolean ok = nuovoCliente.controllocliente();
		HttpSession httpsession=request.getSession();

		if (ok) {
			httpsession.setAttribute("messaggio-errore", "Username già presente,inserire un altro username");//se l'username è già presente stampa il messaggio con il seguente valore
			response.sendRedirect("register.jsp");
		} else {
			nuovoCliente.setCliente();
			
			httpsession.setAttribute("messaggio", "Registrazione eseguita con successo!");//se la registrazione viene eseguita con successo
			response.sendRedirect("register.jsp");
		}
	}
}

