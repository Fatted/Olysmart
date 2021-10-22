package control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ServletLogout")
public class ServletLogout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ServletLogout() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out=response.getWriter()){
			if(request.getSession().getAttribute("cliente-corrente")!=null) {			//controllo se la sessione dell'utente è diversa da null
				request.getSession().removeAttribute("cliente-corrente");				//se non è null rimuovo l'utente dalla sessione e lo riporto alla homepage.jsp
				response.sendRedirect("Homepage.jsp");
			}
			else {
				response.sendRedirect("login.jsp");										//altrimenti lo riporto alla login.jsp
			}
			
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
