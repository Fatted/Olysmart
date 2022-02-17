package control;


import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.Categoria;
import model.Prodotto;

/**
 * Servlet implementation class ProdottiOperazioneServlet
 */
@WebServlet("/ProdottiOperazioneServlet")
@MultipartConfig
public class ProdottiOperazioneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProdottiOperazioneServlet() {
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
		//controllo del tipo di operazione del form
		String operazione=request.getParameter("operation");
			
			if(operazione.equals("addCategory")) {//se l'operazione scelta Ë addcategory
			
			int numero=Integer.parseInt(request.getParameter("numeroCategoria")); //prendo il numero inserito nel form
			String titolo=request.getParameter("TitoloCategoria");				//prendo la stringa inserito nel form
			
			Part file=request.getPart("immagineCategoria");
			String imageFileName=file.getSubmittedFileName();
			String uploadpath="C:\\Users\\fatte\\git\\Olysmart_TSW2021\\OlySmart\\WebContent\\Immagini\\Categorie\\"+imageFileName;
			
			try {
			FileOutputStream fos=new FileOutputStream(uploadpath);
			InputStream is=file.getInputStream();
			
			byte[] data=new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			Categoria categoria=new Categoria(numero,titolo);	//creo il nuovo oggetto categoria con i valori inseriti nel form
			
			//categoria database salvataggio
			categoria.setCategoria();//effettuo la query di inserimento della categoria nel database
			request.setAttribute("categoria", categoria);
			HttpSession httpsession=request.getSession();
			httpsession.setAttribute("messaggio","Categoria inserita correttamente: Nome:"+categoria.getNome()+" Numero:"+categoria.getNumero()); //stampo a video il messaggio di inserimeto
			response.sendRedirect("paginaAdmin.jsp"); //ritorno alla pagina di gestione
			}else if(operazione.equals("addProdotto")){ //se invece abbiamo deciso di aggiungere un prodotto
				
				int codice=0;
				String nome=request.getParameter("nomeProdotto");
				String descrizione=request.getParameter("descrizioneProdotto");
				double prezzo_acquisto=Double.valueOf(request.getParameter("prezzo_acquistoProdotto"));
				String disponibilit‡=request.getParameter("disponibilit‡Prodotto");
				int iva=Integer.parseInt(request.getParameter("ivaProdotto"));
				double prezzo_vendita=Double.valueOf(request.getParameter("prezzo_venditaProdotto"));
				String marca=request.getParameter("marcaProdotto");
				int pezzi_disponibili=Integer.parseInt(request.getParameter("numeri_pezzi_disponibiliProdotto"));
				int sconto=Integer.parseInt(request.getParameter("scontoProdotto"));
				String specifiche=request.getParameter("specificheProdotto");
				String tipo=request.getParameter("tipoProdotto");
				String offerta=request.getParameter("offertaProdotto");
				Part immagine=request.getPart("immagineProdotto");//prendo l'immagine dal type=file del form
				String immaginesalva=immagine.getSubmittedFileName();//converto il suo nome in stringa
				
				//importazione immagine nella cartella
				Part file=request.getPart("immagineProdotto");
				String imageFileName=file.getSubmittedFileName();
				String uploadpath="C:\\Users\\fatte\\git\\Olysmart_TSW2021\\OlySmart\\WebContent\\Immagini\\Prodotti\\"+imageFileName;
				
				try {
				FileOutputStream fos=new FileOutputStream(uploadpath);
				InputStream is=file.getInputStream();
				
				byte[] data=new byte[is.available()];
				is.read(data);
				fos.write(data);
				fos.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
				 
				Prodotto prodotto=new Prodotto(codice,nome,descrizione,prezzo_acquisto,disponibilit‡,iva,prezzo_vendita,marca,pezzi_disponibili,sconto,specifiche,tipo,offerta,immaginesalva);
				prodotto.setProdotto();//effettuo la query di inserimento del prodotto nel database
				request.setAttribute("prodotto", prodotto);
				HttpSession httpsession=request.getSession();
				httpsession.setAttribute("messaggio","Prodotto inserito:"+prodotto.getNome()); //stampo a video il messaggio di inserimeto
				response.sendRedirect("paginaAdmin.jsp"); //ritorno alla pagina di gestione
			}

		doGet(request, response);
	}

}
