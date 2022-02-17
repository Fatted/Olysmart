<%@page import="model.*" %>
<%@page import="control.*" %>
<%@page import="java.util.*" %>

<%
//controlliamo la sessione attuale del cliente
Cliente cliente= (Cliente) request.getSession().getAttribute("cliente-corrente");
     if(cliente!=null){//se la sessione è nuovala creiamo
     	request.setAttribute("cliente-corrente", cliente);//settiamo il nuovo cliente
      	
     }
     ProdottoDAO prod= new ProdottoDAO();
     List<Prodotto> prodottiBarraLaterale=prod.getAllProducts();	//lista usata per tenere sempre la barra attiva contenente tutti i prodotti disponibili nel db con il metodo getallproduct del prodotto DAO


     CategoriaDAO cat=new CategoriaDAO();
     List<Categoria> categorialista=cat.getCategorie(); //la lista delle categorie comprende tutte le categorie presenti nel db che prendiamo con il metodo getCategorie in CategorieDAO

     
     
     
     %>
     
     
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=devide-width, initial-scale=1">
<title>Il mio account</title>

<!-- Pagina CSS -->		
	<link rel="stylesheet" media="screen and (max-width:2561px)" href="CSS/myinfo.css">
    <link rel="stylesheet" media="screen and (max-width:1441px)" href="CSS/myinfo.css">
    <link rel="stylesheet" media="screen and (max-width:1025px)" href="CSS/Laptop.css">
    <link rel="stylesheet" media="screen and (max-width:769px)" href="CSS/Tablet.css">
    <link rel="stylesheet" media="screen and (max-width:426px)" href="CSS/mobile.css">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<!-- Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<!-- JavaScript -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>



</head>

<body>

<!-- -------------------------------------------------inclusione intestazione------------------------------------------------------------------------------------------------ -->

 <%@include file="include/Intestazioneb.jsp" %>
     
<!-- ------------------------------------------------- fine inclusione intestazione------------------------------------------------------------------------------------------------ -->

<!-- -------------------------------------------------inclusione navbar------------------------------------------------------------------------------------------------ -->

 <%@include file="include/navbar.jsp" %>
     
<!-- ------------------------------------------------- fine inclusione navbar------------------------------------------------------------------------------------------------ -->

<div class="container rounded bg-white mt-5 mb-5">

<!-- indichiamo il nome e cognome del cliente che entra nella pagina -->

<div class="row">
        <div class="col-md-3 border-right">
            <div class="d-flex flex-column align-items-center text-center p-3 py-5">
            <img class="rounded-circle mt-5" width="150px" src="Immagini/icon.png">
            <span class="font-weight-bold"><%=cliente.getNome() %> <%=cliente.getCognome() %></span><span class="text-black-50"><%=cliente.getEmail() %></span><span> </span></div>
        </div>


<!-- facciamo dei vari controlli,nel caso in cui la data di nascita,il codice fiscale o qualsiasi altro valore personale del cliente � vuoto stampa mancante,altrimenti lo mostriamo -->
<!-- nel caso in cui � mancante c'� un bottone "inserisci" che attraverso il metodo updatecliente in clientedao permette di inserire il valore mancante,lo stesso vale nel caso in cui il valore è presente e si vuole modificare -->
<!-- tutti gli inserimenti/modifiche vengono gestiti da ProfiloUtenteServlet e i valori gli vengono passati grazie ai popup presenti in questa pagina -->

<div class="col-md-8 border-right">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-right">Informazioni profilo</h4>
                </div>
                <div class="row mt-2">
                    <div class="col-md-6"><label class="labels">Username: <%=cliente.getUsername()%></label></div>
                 	</div>
                    
                <div class="row mt-3">
                    <div class="col-md-12"><label class="labels">Data di nascita: </label><%if(cliente.getDatadinascita().equals("")){%><label class="labels">Mancante</label>
                    <br><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalinserimentodata">Inserisci Data</button><%}
                    else{%><label class="labels"><%=cliente.getDatadinascita()%></label><br><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalinserimentodata">Modifica Data</button><%}%>
                    </div>
                    
                    <div class="col-md-12"><label class="labels">Codice Fiscale: </label><%if(cliente.getCodicefiscale().equals("")){%><label class="labels">Mancante</label>
                    <br><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalinserimentoCF"">Inserisci codice fiscale</button><%}
                    else{%><label class="labels"><%=cliente.getCodicefiscale()%></label><br><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalinserimentoCF">Modifica codice fiscale</button><%}%>
                    </div>
                    
                    <div class="col-md-12"><label class="labels">Email: </label><%if(cliente.getEmail().equals("")){%><label class="labels">Mancante</label>
                    <br><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalinserimentoemail">Inserisci email</button><%}
                    else{%><label class="labels"><%=cliente.getEmail()%></label><br><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalinserimentoemail">Modifica email</button><%}%>
                    </div>
                    
                    <div class="col-md-12"><label class="labels">Numero telefono: </label><%if(cliente.getTelefono().equals("")){%><label class="labels">Mancante</label>
                    <br><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalinserimentotelefono">Inserisci numero telefono</button><%}
                    else{%><label class="labels"><%=cliente.getTelefono()%></label><br><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalinserimentotelefono">Modifica numero telefono</button><%}%>
                    </div>
                    
                    <div class="col-md-12"><label class="labels">Indirizzo: <%=cliente.getVia() %>,<%=cliente.getCitta() %>(<%=cliente.getCap()%></label>
                    <br><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalinserimentoindirizzo">Modifica indirizzo</button>
                    </div>                    
 
                <div class="col-md-12"><label class="labels">Metodo di pagamento:</label><br>
                <%if(cliente.getIntestatario_carta()==null){%><label class="labels">Mancante</label><br><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalinserimentocarta">Inserisci Carta</button></div> <%}
                else{%>		
				<div class="col-md-12"><label class="labels">Numero carta: <%=cliente.getNumero_carta() %> </label></div>
                <div class="col-md-12"><label class="labels">Data scadenza: <%=cliente.getData_scadenza_carta() %></label></div>
                <div class="col-md-12"><label class="labels">CVV: <%=cliente.getCVV() %> </label></div>
                <div class="col-md-12"><label class="labels">Intestatario: <%=cliente.getIntestatario_carta() %></label></div>
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalinserimentocarta">Modifica</button>																
				<%}%>
				
				</div>
        </div>
	</div>
</div>
        
<!-- ------------------------------------------------------Modal gestione add/update data----------------------------------------------------------------- -->
<div class="modal fade" id="modalinserimentodata" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Aggiungi la data di nascita</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <!-- inserisco il form che servir� per gestire le varie scelte da parte del utente -->
        <form action="ProfiloUtenteServlet" method="post">
        
        <!-- indichiamo il nome del form con operation,che sar� uguale per tutti i form,quello che cambia � il valore,in base a quello in ProfiloutenteServlet facciamo diverse operazioni di inserimento/modifica -->
        <input type="hidden" name="operation" value="addData">
        
      		<div class="form-group">
      			<input type="date" class="form-control" name="data" required><br>     			     		
      		</div>
      	      	
      		<div class="container text-center">
      			<button type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>
        		<button type="submit" class="btn btn-primary" value="addData">Aggiungi</button>
      		</div>     	
        </form>
      </div>
    </div>
  </div>
</div>

<!-- ------------------------------------------------------Modal gestione add/update CF----------------------------------------------------------------- -->
<div class="modal fade" id="modalinserimentoCF" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Aggiungi cofice fiscale</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <!-- inserisco il form che servirà per gestire le varie scelte da parte del utente -->
        <form action="ProfiloUtenteServlet" method="post">
<!-- indichiamo il nome del form con operation,che sarà uguale per tutti i form,quello che cambia è il valore,in base a quello in ProfiloutenteServlet facciamo diverse operazioni di inserimento/modifica -->
        <input type="hidden" name="operation" value="addCF">
        
      		<div class="form-group">
      			<input type="text" class="form-control" name="CF"  placeholder="Enter CF" required><br>     			     		
      		</div>
      	      	
      		<div class="container text-center">
      			<button type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>
        		<button type="submit" class="btn btn-primary" value="addCF">Aggiungi</button>
      		</div>     	
        </form>
      </div>
    </div>
  </div>
</div>

<!-- ------------------------------------------------------Modal gestione add/update email----------------------------------------------------------------- -->
<div class="modal fade" id="modalinserimentoemail" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Aggiungi email</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <!-- inserisco il form che servirà per gestire le varie scelte da parte del utente -->
        <form action="ProfiloUtenteServlet" method="post">
         <!-- indichiamo il nome del form con operation,che sarà uguale per tutti i form,quello che cambia è il valore,in base a quello in ProfiloutenteServlet facciamo diverse operazioni di inserimento/modifica -->       
        <input type="hidden" name="operation" value="addEmail">
        
      		<div class="form-group">
      			<input type="email" class="form-control" name="email" placeholder="Enter Email" required><br>     			     		
      		</div>
      	      	
      		<div class="container text-center">
      			<button type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>
        		<button type="submit" class="btn btn-primary" value="addEmail">Aggiungi</button>
      		</div>     	
        </form>
      </div>
    </div>
  </div>
</div>

<!-- ------------------------------------------------------Modal gestione add/update telefono----------------------------------------------------------------- -->
<div class="modal fade" id="modalinserimentotelefono" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Aggiungi telefono</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <!-- inserisco il form che servirà per gestire le varie scelte da parte del utente -->
        <form action="ProfiloUtenteServlet" method="post">
        <!-- indichiamo il nome del form con operation,che sarà uguale per tutti i form,quello che cambia è il valore,in base a quello in ProfiloutenteServlet facciamo diverse operazioni di inserimento/modifica -->        
        <input type="hidden" name="operation" value="addTelefono">
        
      		<div class="form-group">
      			<input type="tel"  class="form-control" name="telefono" maxlength="10" placeholder="Enter Telefono" required><br>     			     		
      		</div>
      	      	
      		<div class="container text-center">
      			<button type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>
        		<button type="submit" class="btn btn-primary" value="addTelefono">Aggiungi</button>
      		</div>     	
        </form>
      </div>
    </div>
  </div>
</div>

<!-- ------------------------------------------------------Modal gestione add/update indirizzo----------------------------------------------------------------- -->
<div class="modal fade" id="modalinserimentoindirizzo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Aggiungi Indirizzo</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <!-- inserisco il form che servirà per gestire le varie scelte da parte del utente -->
        <form action="ProfiloUtenteServlet" method="post">
        <!-- indichiamo il nome del form con operation,che sarà uguale per tutti i form,quello che cambia è il valore,in base a quello in ProfiloutenteServlet facciamo diverse operazioni di inserimento/modifica -->        
        <input type="hidden" name="operation" value="addIndirizzo">
        
      		<div class="form-group">
      			via: <input type="text"  class="form-control" name="via" placeholder="Enter Via"  required><br>
      			cap: <input type="number"  class="form-control" name="cap" max="99999" placeholder="Enter CAP" required><br> 
      			citt�: <input type="text"  class="form-control" 	placeholder="Enter Citt&agrave" name="citta" required><br>      			     		
      		</div>
      	      	
      		<div class="container text-center">
      			<button type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>
        		<button type="submit" class="btn btn-primary" value="addIndirizzo">Aggiungi</button>
      		</div>     	
        </form>
      </div>
    </div>
  </div>
</div>

<!-- ------------------------------------------------------Modal gestione add/update carta----------------------------------------------------------------- -->
<div class="modal fade" id="modalinserimentocarta" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Aggiungi Carta di credito</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <!-- inserisco il form che servirà per gestire le varie scelte da parte del utente -->
        <form action="ProfiloUtenteServlet" method="post">
        <!-- indichiamo il nome del form con operation,che sarà uguale per tutti i form,quello che cambia è il valore,in base a quello in ProfiloutenteServlet facciamo diverse operazioni di inserimento/modifica -->        
        <input type="hidden" name="operation" value="addCarta">
        
      		<div class="form-group">
      		
      			<img src="Immagini/cartadicredito.png" width="300px" height="350px"><br>
      		
      			Intestatario Carta:
      			<input type="text"  class="form-control" name="intestatariocarta" placeholder="Enter numero carta"  required><br>
      			
      			Numero Carta:
      			<input type="text"  class="form-control" name="numerocarta" placeholder="Enter numero carta"  required><br>
      			
      			Data Scadenza
      			<input type="date"  class="form-control" name="datascadenza" required><br>

      			CVV:
      			<input type="number"  class="form-control" 	placeholder="Inserisci CVV" name="CVV" min="000" max="999" required><br>
      			
      			Circuito:
      			<select name="circuito">
      			<option value="VISA">VISA</option>
  				<option value="Maestro">Maestro</option>
  				<option value="Bancomat">Bancomat</option>
 			
      			</select>   
      			   			     		
      		</div>
      	      	
      		<div class="container text-center">
      			<button type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>
        		<button type="submit" class="btn btn-primary" value="addCarta">Aggiungi</button>
      		</div>     	
        </form>
      </div>
    </div>
  </div>
</div>
</div>
</div>

<!-- -------------------------------------------------inclusione footer------------------------------------------------------------------------------------------------ -->

 <%@include file="include/footer.jsp" %>
     
<!-- ----------------------------------------------- fine inclusione footer------------------------------------------------------------------------------------------------ -->
 
</body>
</html>