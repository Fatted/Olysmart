package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Carrello;

/**
 * Servlet implementation class AumentaDiminuisciQuantit‡Carrello
 */
@WebServlet("/AumentaDiminuisciQuantit‡Carrello")
public class AumentaDiminuisciQuantit‡Carrello extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AumentaDiminuisciQuantit‡Carrello() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		try(PrintWriter out=response.getWriter()){
			String attivit‡=request.getParameter("action"); //prendiamo il parametro con valore action, che puÚ essere rispettivamente aumenta o diminuisci
			int id=Integer.parseInt(request.getParameter("id")); //prendiamo id del prodtto da aumentare o diminuire
			
			ArrayList<Carrello> listacarrello=(ArrayList<Carrello>)request.getSession().getAttribute("listacarrello"); //prendiamo i prodotti presnti nel carrello
			
			//controllo se l'attivit‡ Ë diversa da null e id del prodotto Ë uguale o maggiore di 1
			if(attivit‡!=null && id>=1) {
				if(attivit‡.equals("aumenta")) {//se l'azione che abbiamo selezionato Ë aumenta (quindi abbiamo cliccato sul pulsante + della jsp carrello)
					for(Carrello carrello:listacarrello) { //prendiamo tutti i prodotti del carrello passati con la sessione
						if(carrello.getCodice()==id) {//vediamo se il codice del prodotto del carrello corrisponde all'id del prodotto
							int quantita=carrello.getQuantita();//facciamo una variabile quantit‡ che indica la quantit‡ del prodotto
							quantita++;//aumentiamo la quantit‡
							carrello.setQuantita(quantita);//settiamo la nuova quantit‡ al prodotto nel carrello
							response.sendRedirect("carrello.jsp");//restiamo nella pagina del carrello
						}
					}
				}
				
				if(attivit‡.equals("diminuisci")) { //se l'azione passata Ë diminuisci
					for(Carrello carrello:listacarrello) {// prendiamo tutti i prodotti del carrello tramite la sessione
						if(carrello.getCodice()==id && carrello.getQuantita()>1) { //se il codice del prodotto corrisponde con id del prodotto e se la quantit‡ del prodotto nel carrello Ë >1
							int quantita=carrello.getQuantita();//ci prendiamo la quantit‡ di quel prodotto presente nel carrello
							quantita--;//diminuisco la sua quantit‡ con un mimimo di 1
							carrello.setQuantita(quantita); //settiamo la nuova quantit‡
							break;
							
						}
					}
					response.sendRedirect("carrello.jsp"); //restiamo nel carrello
				}
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		doGet(request, response);
	}

}
