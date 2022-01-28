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
			ArrayList<Carrello> carrello=new ArrayList<>(); //creo una lista di oggetti carrello che userò per prendere i prodotti nel carrello
			
			int id=Integer.parseInt(request.getParameter("id")); //prendo id del prodotto da inserire nel carrello	
			Carrello cart=new Carrello();
			cart.setCodice(id);//setto il codice
			cart.setQuantita(1);//setto la quantià del prodotto
			
			HttpSession session=request.getSession();
			ArrayList<Carrello> listacarrello=(ArrayList<Carrello>)session.getAttribute("listacarrello");//creo una lista di oggetti Carrello i cui valori vengono presi dalla sessione listacarrello
			
			if(listacarrello==null) {//se il carrello è vuoto allora inserisco il prodotto nel carrelo
				carrello.add(cart);//aggiungo il prodotto al carrello
				session.setAttribute("listacarrello",carrello);//setto ora la sessione del carrello al nuovo carrello contenente il prodotto
				response.sendRedirect("carrello.jsp");
			}
			else {
				carrello=listacarrello;//altrimento,se il prodotto è già nel carrello il carrello diventa listacarrello
				boolean esiste=false;//inizialmente esiste è falso
				
				for(Carrello c:listacarrello) {//pre ogni prodotto nella lista carrello
					if(c.getCodice()==id) {//controllo se il prodotto inserito nel carrello è già presente
						esiste=true;//se è presente allora esiste diventa true
						session.setAttribute("messaggio-errore", "Prodotto già presente,aumenta la quantità!");//stampo l'errore dicendo che il prodotto c'è e di aumentare la quantità
						response.sendRedirect("carrello.jsp");					
						}
			}	
				
				if(!esiste) {//se il prodotto inserito è un nuovo prodotto allora esiste è false e quindi lo inserisco nel carrello
						listacarrello.add(cart);
						response.sendRedirect("carrello.jsp");
					}
			}

		}
	}
}
	















			


