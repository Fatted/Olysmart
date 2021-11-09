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


@WebServlet("/ServletLogin")
public class ServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ServletLogin() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}


	private Cliente cliente;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//prendo i valori inseriti dal form della login.jsp per controllarli 
		String username=request.getParameter("username"); //prendo l'username
		String password=request.getParameter("password"); //prendo la password	
		cliente = new Cliente(null, null, null, null, null, password, username, null, null, null, null, null,null,null,null,null,null); //creo un oggetto cliente(di tipo clientbean) e gli assegno solo username e pass

		// VEDENDO SE L'UTENTE è VALIDO con la getUsernameAndPawword in ClienteDAO
		ClienteDAO controllo = new ClienteDAO();
		boolean ok = controllo.getUsernameAndPassword(cliente);
		HttpSession httpsession=request.getSession();
		

		//setto il cliente a valido e vado nell'if
		cliente.setValido(ok);
		if (cliente.getValido()) {														//se il cliente è valido eseguo il getcliente
			cliente.getCliente();														//mi prendo il cliente e controllo che tipo è
			
			httpsession.setAttribute("cliente-corrente",cliente);						//setto la sessione del cliente corrente che effettua il login
			
			if (cliente.getTipo().equalsIgnoreCase("admin")) {							//attraveso il getTipo mi prendo il tipo e in base ad esso vado in admin,utente,registrati
				response.sendRedirect("paginaAdmin.jsp");								//vado in pagineadmin.jsp se il tipo è admin
			}   
			else if(cliente.getTipo().equalsIgnoreCase("utente")) {
				response.sendRedirect("Homepage.jsp");	//vado in homepage.jsp se il tipo è utente,quindi ho effettuato l'accesso

			}
		} else {
			response.sendRedirect("register.jsp"); //vado in register.jsp,se non ho ancora un account oppure ho sbagliato credenziali
			
		}

	}
}
