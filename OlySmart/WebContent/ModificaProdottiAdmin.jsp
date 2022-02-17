<%@page import="model.*" %>
<%@page import="control.*" %>
<%@page import="java.util.*" %>

<!-- Piccolo controllo se si sta cercando di accedere come admin se non si è admin o non loggati -->
<%
	//controlliamo la sessione attuale del cliente
	Cliente cliente=(Cliente)session.getAttribute("cliente-corrente");
	if(cliente==null){//se il cliente non è loggato lo portiamo nella pagina di login
	response.sendRedirect("login.jsp");
	return;
		}else{
	if(cliente.getTipo().equals("utente")){//se l'utente sta cercando di accedere alla pagina di admin ma è un utente ritorna alla homepage
		response.sendRedirect("Homepage.jsp");
		return;
	}
		}


int id=Integer.parseInt(request.getParameter("id"));
ProdottoDAO prodottoDAO=new ProdottoDAO();

List<Prodotto> prodottolista=prodottoDAO.getProductsForCodice(id);

CategoriaDAO cat=new CategoriaDAO();
List<Categoria> categorialista=cat.getCategorie();

%>


<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,model.Prodotto"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="CSS/style.css">
	<link rel="stylesheet" href="CSS/modificaProdotti.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<title>OlySmartWeb|Modifica prodotto admin</title>
	
	<!-- Pagina CSS -->
<link rel="stylesheet" href="CSS/styleadmin.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<!-- Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<!-- JavaScript -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	
</head>

<body>

<header>
        <nav id="navbar">
        <div class="container">
            <h1>Admin: <%=cliente.getUsername() %></h1>
            <div class="homelog">
                <div class="pdg"> <a href="paginaAdmin.jsp">Gestione</a></div>
                <div class="home"><a href="Homepage.jsp">Home</a></div>
                <div class="logout"><a href="ServletLogout">Logout</a></div> <!-- il logout viene gestito dalla servlet di logout -->
            </div>
        </div>
    </nav>
    </header>
	
	<%
		
		%>

	<h2 style="text-align:center">Modifica Dettagli Prodotto</h2>

	<table class="table" id="tavula" border="1">
	<%
	//facciamo un for each per prenderci tutte le informazioni necessarie
	for(Prodotto p:prodottolista){ %>
	<thead>
		<tr>
		<th scope="col">Nome</th>
		<th scope="col">Descrizione</th>
		<th scope="col">Prezzo Acquisto</th>
		<th scope="col">Disponibilità</th>
		<th scope="col">Iva</th>
		<th scope="col">Prezzo Vendita</th>
		<th scope="col">Marca</th>
		<th scope="col">Numero pezzi disponibili</th>
		<th scope="col">Sconto</th>
		<th scope="col">Specifiche</th>
		<th scope="col">Categoria</th>
		<th scope="col">Offerta</th>
		<th scope="col">Immagine Nome</th>
		<th scope="col">Immagine</th>
		<th scope="col">Elimina</th>
		</tr>
		</thead>
		
		<tbody>
		<tr>
		<td scope="row" style="border:1px solid" data-label="Nome"><%=p.getNome() %><button type="button" class="btn btn-link" data-toggle="modal" data-target="#modalmodificanome">Modifica nome</button></td>
		<td style="border:1px solid" data-label="Descrizione"><%=p.getDescrizione() %><button type="button" class="btn btn-link" data-toggle="modal" data-target="#modalmodificadescrizione">Modifica descrizione</button>		
		<td style="border:1px solid" data-label="Prezzo Acquisto"><%=p.getPrezzo_acquisto() %><button type="button" class="btn btn-link" data-toggle="modal" data-target="#modalmodificaprezzoacquisto">Modifica Prezzo Acquisto</button></td>
		<td style="border:1px solid" data-label="Disponibilità"><%=p.getDisponibilità() %><button type="button" class="btn btn-link" data-toggle="modal" data-target="#modalmodificadisponibilita">Modifica Disponibilità</button></td>
		<td style="border:1px solid" data-label="IVA"><%=p.getIva() %><button type="button" class="btn btn-link" data-toggle="modal" data-target="#modalmodificiva">Modifica Iva</button></td>
		<td style="border:1px solid" data-label="Prezzo Vendita"><%=p.getPrezzo_vendita() %><button type="button" class="btn btn-link" data-toggle="modal" data-target="#modalmodificaprezzovendita">Modifica Prezzo vendita</button></td>
		<td style="border:1px solid" data-label="Marca"><%=p.getMarca() %><button type="button" class="btn btn-link" data-toggle="modal" data-target="#modalmodificamarca">Modifica Marca</button></td>
		<td style="border:1px solid" data-label="Numero"><%=p.getNumero_pezzi_disponibili()%><button type="button" class="btn btn-link" data-toggle="modal" data-target="#modalmodificapezzidisponibili">Modifica pezzi disponibili</button></td>
		<td style="border:1px solid" data-label="Sconto"><%=p.getSconto() %><button type="button" class="btn btn-link" data-toggle="modal" data-target="#modalmodificasconto">Modifica Sconto</button></td>
		<td style="border:1px solid" data-label="Specifiche"><%=p.getSpecifiche() %><button type="button" class="btn btn-link" data-toggle="modal" data-target="#modalmodificaspecifiche">Modifica specifiche</button></td>
		<td style="border:1px solid" data-label="Tipo"><%=p.getTipo() %><button type="button" class="btn btn-link" data-toggle="modal" data-target="#modalmodificatipo">Modifica tipo</button></td>
		<td style="border:1px solid" data-label="Offerta"><%=p.getOfferta() %><button type="button" class="btn btn-link" data-toggle="modal" data-target="#modalmodificaofferta">Modifica offerta</button></td>
		<td style="border:1px solid" data-label="Img"><%=p.getImmagine() %></td>
		<td><img src="Immagini/Prodotti/<%=p.getImmagine() %>" height="250px" width="250px" class="responsive"></td>
		<td style="border:1px solid"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modaleliminaprodotto">ELIMINA</button></td>
		</tr>
		</tbody>
	</table>
<%}%>




<!-- ------------------------------------------------------Modal gestione update descrizione prodotto----------------------------------------------------------------- -->
<div class="modal fade" id="modalmodificadescrizione" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modifica Descrizione</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <!-- inserisco il form che servirà per gestire le varie scelte da parte del utente -->
        <form action="ModificaProdottiAdmin" method="post">
        
        <!-- indichiamo il nome del form con operation,che sarà uguale per tutti i form,quello che cambia è il valore,in base a quello in ProfiloutenteServlet facciamo diverse operazioni di inserimento/modifica -->
        <input type="hidden" name="operation" value="addDescrizione">
        
      		<div class="form-group">
      			 <input type="hidden" name="id" value="<%=id%>"> <!-- uso l'hidden per passare id del prodotto -->    			 
      			<textarea name="descrizioneProdotto" placeholder="inserisci una descrizione (visibile nei dettagli del prodotto)" rows="10" cols="100" required></textarea><br>    			     		
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

<!-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->

<!-- ------------------------------------------------------Modal modifica nome prodotto----------------------------------------------------------------- -->
<div class="modal fade" id="modalmodificanome" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modifica Nome</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <!-- inserisco il form che servirà per gestire le varie scelte da parte del utente -->
        <form action="ModificaProdottiAdmin" method="post">
        
        <!-- indichiamo il nome del form con operation,che sarà uguale per tutti i form,quello che cambia è il valore,in base a quello in ProfiloutenteServlet facciamo diverse operazioni di inserimento/modifica -->
        <input type="hidden" name="operation" value="addNome">
        
      		<div class="form-group">
      			 <input type="hidden" name="id" value="<%=id%>"><!-- uso l'hidden per passare id del prodotto -->    			 
      			<input type="text" name="nome" placeholder="inserisci nome del prodotto aggiornato" required>    
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

<!-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->


<!-- ------------------------------------------------------Modal gestione update prezzo acquisto prodotto----------------------------------------------------------------- -->
<div class="modal fade" id="modalmodificaprezzoacquisto" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modifica Prezzo acquisto</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <!-- inserisco il form che servirà per gestire le varie scelte da parte del utente -->
        <form action="ModificaProdottiAdmin" method="post">
        
        <!-- indichiamo il nome del form con operation,che sarà uguale per tutti i form,quello che cambia è il valore,in base a quello in ProfiloutenteServlet facciamo diverse operazioni di inserimento/modifica -->
        <input type="hidden" name="operation" value="addPrezzoAcquisto">
        
      		<div class="form-group">
      			 <input type="hidden" name="id" value="<%=id%>"><!-- uso l'hidden per passare id del prodotto -->    			 
      			<input type="number" name="prezzoacquisto" placeholder="inserisci prezzo del prodotto aggiornato" min="1" required >    
      		</div>
      	      	
      		<div class="container text-center">
      			<button type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>
        		<button type="submit" class="btn btn-primary" value="addPrezzoAcquisto">Aggiungi</button>
      		</div>     	
        </form>
      </div>
    </div>
  </div>
</div>

<!-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->


<!-- ------------------------------------------------------Modal gestione disponibilità prodotto----------------------------------------------------------------- -->
<div class="modal fade" id="modalmodificadisponibilita" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modifica Prezzo acquisto</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <!-- inserisco il form che servirà per gestire le varie scelte da parte del utente -->
        <form action="ModificaProdottiAdmin" method="post">
        
        <!-- indichiamo il nome del form con operation,che sarà uguale per tutti i form,quello che cambia è il valore,in base a quello in ProfiloutenteServlet facciamo diverse operazioni di inserimento/modifica -->
        <input type="hidden" name="operation" value="addDisponibilita" >
        
      		<div class="form-group">
      			 <input type="hidden" name="id" value="<%=id%>"><!-- uso l'hidden per passare id del prodotto -->
      			     			 
      			<select name="disponibilita" class="form-control">
      			<option value="si">si</option>
      			<option value="no">no</option>
      			</select>    
      		</div>
      	      	
      		<div class="container text-center">
      			<button type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>
        		<button type="submit" class="btn btn-primary" value="addDisponibilita">Aggiungi</button>
      		</div>     	
        </form>
      </div>
    </div>
  </div>
</div>

<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->


<!-- ------------------------------------------------------Modal gestione iva prodotto----------------------------------------------------------------- -->
<div class="modal fade" id="modalmodificiva" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modifica Iva</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <!-- inserisco il form che servirà per gestire le varie scelte da parte del utente -->
        <form action="ModificaProdottiAdmin" method="post">
        
        <!-- indichiamo il nome del form con operation,che sarà uguale per tutti i form,quello che cambia è il valore,in base a quello in ProfiloutenteServlet facciamo diverse operazioni di inserimento/modifica -->
        <input type="hidden" name="operation" value="addIva">
        
      		<div class="form-group">
      			 <input type="hidden" name="id" value="<%=id%>"><!-- uso l'hidden per passare id del prodotto -->
      			  <input type="number" name="iva" placeholder="inserisci iva del prodotto aggiornato" required >  			 
      			     			  
      		</div>
      	      	
      		<div class="container text-center">
      			<button type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>
        		<button type="submit" class="btn btn-primary" value="addIva">Aggiungi</button>
      		</div>     	
        </form>
      </div>
    </div>
  </div>
</div>

<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->

<!-- ------------------------------------------------------Modal gestione update prezzo vendita prodotto----------------------------------------------------------------- -->
<div class="modal fade" id="modalmodificaprezzovendita" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modifica Prezzo vendita</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <!-- inserisco il form che servirà per gestire le varie scelte da parte del utente -->
        <form action="ModificaProdottiAdmin" method="post">
        
        <!-- indichiamo il nome del form con operation,che sarà uguale per tutti i form,quello che cambia è il valore,in base a quello in ProfiloutenteServlet facciamo diverse operazioni di inserimento/modifica -->
        <input type="hidden" name="operation" value="addPrezzoVendita">
        
      		<div class="form-group">
      			 <input type="hidden" name="id" value="<%=id%>"><!-- uso l'hidden per passare id del prodotto -->
      			  <input type="number" name="prezzovendita" placeholder="inserisci prezzo vendita del prodotto aggiornato" min="1" required>  			 
      			     			   
      		</div>
      	      	
      		<div class="container text-center">
      			<button type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>
        		<button type="submit" class="btn btn-primary" value="addPrezzoVendita">Aggiungi</button>
      		</div>     	
        </form>
      </div>
    </div>
  </div>
</div>

<!-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->


<!-- ------------------------------------------------------Modal gestione update marca prodotto----------------------------------------------------------------- -->
<div class="modal fade" id="modalmodificamarca" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modifica Marca</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <!-- inserisco il form che servirà per gestire le varie scelte da parte del utente -->
        <form action="ModificaProdottiAdmin" method="post">
        
        <!-- indichiamo il nome del form con operation,che sarà uguale per tutti i form,quello che cambia è il valore,in base a quello in ProfiloutenteServlet facciamo diverse operazioni di inserimento/modifica -->
        <input type="hidden" name="operation" value="addMarca">
        
      		<div class="form-group">
      			 <input type="hidden" name="id" value="<%=id%>"><!-- uso l'hidden per passare id del prodotto -->
      			 <input type="text" name="marca" placeholder="inserisci marca del prodotto aggiornato" required>  			 
      			     			   
      		</div>
      	      	
      		<div class="container text-center">
      			<button type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>
        		<button type="submit" class="btn btn-primary" value="addMarca">Aggiungi</button>
      		</div>     	
        </form>
      </div>
    </div>
  </div>
</div>

<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->

<!-- ------------------------------------------------------Modal gestione update pezzi disponibili prodotto----------------------------------------------------------------- -->
<div class="modal fade" id="modalmodificapezzidisponibili" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modifica pezzi disponibili</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <!-- inserisco il form che servirà per gestire le varie scelte da parte del utente -->
        <form action="ModificaProdottiAdmin" method="post">
        
        <!-- indichiamo il nome del form con operation,che sarà uguale per tutti i form,quello che cambia è il valore,in base a quello in ProfiloutenteServlet facciamo diverse operazioni di inserimento/modifica -->
        <input type="hidden" name="operation" value="addPezziDisponibili">
        
      		<div class="form-group">
      			 <input type="hidden" name="id" value="<%=id%>"><!-- uso l'hidden per passare id del prodotto -->
      			 <input type="number" name="pezzidisponibili" placeholder="inserisci pezzi disponibili del prodotto aggiornato" required>  			 
      			     			   
      		</div>
      	      	
      		<div class="container text-center">
      			<button type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>
        		<button type="submit" class="btn btn-primary" value="addPezziDisponibili">Aggiungi</button>
      		</div>     	
        </form>
      </div>
    </div>
  </div>
</div>

<!-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->

<!-- ------------------------------------------------------Modal gestione update sconto----------------------------- prodotto----------------------------------------------------------------- -->
<div class="modal fade" id="modalmodificasconto" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modifica Sconto</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <!-- inserisco il form che servirà per gestire le varie scelte da parte del utente -->
        <form action="ModificaProdottiAdmin" method="post">
        
        <!-- indichiamo il nome del form con operation,che sarà uguale per tutti i form,quello che cambia è il valore,in base a quello in ProfiloutenteServlet facciamo diverse operazioni di inserimento/modifica -->
        <input type="hidden" name="operation" value="addSconto">
        
      		<div class="form-group">
      			 <input type="hidden" name="id" value="<%=id%>"><!-- uso l'hidden per passare id del prodotto -->
      			 <input type="number" name="sconto" placeholder="inserisci sconto del prodotto aggiornato" required>  			 
      			     			   
      		</div>
      	      	
      		<div class="container text-center">
      			<button type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>
        		<button type="submit" class="btn btn-primary" value="addSconto">Aggiungi</button>
      		</div>     	
        </form>
      </div>
    </div>
  </div>
</div>

<!-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->

<!-- ------------------------------------------------------Modal gestione update specifiche prodotto----------------------------------------------------------------- -->
<div class="modal fade" id="modalmodificaspecifiche" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modifica Specifiche</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <!-- inserisco il form che servirà per gestire le varie scelte da parte del utente -->
        <form action="ModificaProdottiAdmin" method="post">
        
        <!-- indichiamo il nome del form con operation,che sarà uguale per tutti i form,quello che cambia è il valore,in base a quello in ProfiloutenteServlet facciamo diverse operazioni di inserimento/modifica -->
        <input type="hidden" name="operation" value="addSpecifiche">
        
      		<div class="form-group">
      			 <input type="hidden" name="id" value="<%=id%>"> <!-- uso l'hidden per passare id del prodotto -->   			 
      			<textarea name="specifiche" placeholder="inserisci una descrizione (visibile nei dettagli del prodotto)" rows="10" cols="100" required></textarea><br>    			     		
      		</div>
      	      	
      		<div class="container text-center">
      			<button type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>
        		<button type="submit" class="btn btn-primary" value="addSpecifiche" >Aggiungi</button>
      		</div>     	
        </form>
      </div>
    </div>
  </div>
</div>

<!-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->

<!-- ------------------------------------------------------Modal gestione update tipo prodotto----------------------------------------------------------------- -->
<div class="modal fade" id="modalmodificatipo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modifica Categoria</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <!-- inserisco il form che servirà per gestire le varie scelte da parte del utente -->
        <form action="ModificaProdottiAdmin" method="post">
        
        <!-- indichiamo il nome del form con operation,che sarà uguale per tutti i form,quello che cambia è il valore,in base a quello in ProfiloutenteServlet facciamo diverse operazioni di inserimento/modifica -->
        <input type="hidden" name="operation" value="addCategoria">
        
      		<div class="form-group">
      			 <input type="hidden" name="id" value="<%=id%>"><!-- uso l'hidden per passare id del prodotto -->    			 
      			<select name="categoria" class="form-control" id="">
 <!--------------------------------------------andiamo ad indicare solo le categorie presenti che l'admin può scegliere per collocare il suo prodotto  --------------------------------------->     		
      		<%	for(Categoria categoria:categorialista){%>
      		
      		<option value="<%=categoria.getNome() %>"><%=categoria.getNome() %></option>
      		
      		<%} %>
      		    		
      		</select>    			     		
      		</div>
      	      	
      		<div class="container text-center">
      			<button type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>
        		<button type="submit" class="btn btn-primary" value="addCategoria">Aggiungi</button>
      		</div>     	
        </form>
      </div>
    </div>
  </div>
</div>

<!-- ------------------------------------------------------Modal gestione update nome prodotto----------------------------------------------------------------- -->

<!-- ------------------------------------------------------Modal gestione update offerta prodotto----------------------------------------------------------------- -->
<div class="modal fade" id="modalmodificaofferta" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modifica Offerta</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <!-- inserisco il form che servirà per gestire le varie scelte da parte del utente -->
        <form action="ModificaProdottiAdmin" method="post">
        
        <!-- indichiamo il nome del form con operation,che sarà uguale per tutti i form,quello che cambia è il valore,in base a quello in ProfiloutenteServlet facciamo diverse operazioni di inserimento/modifica -->
        <input type="hidden" name="operation" value="addOfferta">
        
      		<div class="form-group">
      			 <input type="hidden" name="id" value="<%=id%>"><!-- uso l'hidden per passare id del prodotto -->
      			     			 
      			<select name="offerta" class="form-control">
      			<option value="si">si</option>
      			<option value="no">no</option>
      			</select>    
      		</div>
      	      	
      		<div class="container text-center">
      			<button type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>
        		<button type="submit" class="btn btn-primary" value="addOfferta">Aggiungi</button>
      		</div>     	
        </form>
      </div>
    </div>
  </div>
</div>

<!-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->

<!-- ------------------------------------------------------Modal gestione eliminazione prodotto----------------------------------------------------------------- -->
<div class="modal fade" id="modaleliminaprodotto" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Eliminazione prodotto</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <!-- inserisco il form che servirà per gestire le varie scelte da parte del utente -->
        <form action="ModificaProdottiAdmin" method="post">
        
        <!-- indichiamo il nome del form con operation,che sarà uguale per tutti i form,quello che cambia è il valore,in base a quello in ProfiloutenteServlet facciamo diverse operazioni di inserimento/modifica -->
        <input type="hidden" name="operation" value="EliminaProdotto">
        
      		<div class="form-group">
      			 <input type="hidden" name="id" value="<%=id%>"><!-- uso l'hidden per passare id del prodotto -->
      			 <h1 style="text-align:center">VUOI ELIMINARE IL PRODTTO?</h1>

      		</div>
      	      	
      		<div class="container text-center">
      			<button type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>
        		<button type="submit" class="btn btn-primary" value="EliminaProdotto">Elimina</button>
      		</div>     	
        </form>
      </div>
    </div>
  </div>
</div>

<!-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->


</body>
</html>