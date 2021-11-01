<%@page import="model.*" %>
<%@page import="control.*" %>
<%@page import="java.util.*" %>

<%

Cliente cliente= (Cliente) request.getSession().getAttribute("cliente-corrente");
     if(cliente!=null){
     	request.setAttribute("cliente-corrente", cliente);
     }%>
     
     
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=devide-width, initial-scale=1">
<title>Pagina di gestione admin</title>

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
<%@include file="CSS/messaggioRegistrazione.jsp" %>
<div style="float: left; margin-right:4px">
<img src="#" width="500px" height="600px"></div> 
<h1><%=cliente.getNome() %> <%=cliente.getCognome() %></h1><br>
<p>

Data:<%if(cliente.getDatadinascita().equals("")){%><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalinserimentodata">Inserisci Data</button>
	<%}else{%><%=cliente.getDatadinascita() %> <a href="#ModificaData">Modifica</a><%}%><br><br>

Codice Fiscale:<%if(cliente.getCodicefiscale().equals("")){%><a href="#inseriscicf">Inserisci</a><%}else{%><%=cliente.getCodicefiscale() %> <a href="#ModificaCF">Modifica</a><%}%><br><br>

Email:<%if(cliente.getEmail().equals("")){%><a href="#inserisciemail">Inserisci</a><%}
		else{%><%=cliente.getEmail() %> <a href="#ModificaEmail">Modifica</a><%}%><br><br>

Username:<%=cliente.getUsername()%><br><br>

Telefono:<%if(cliente.getTelefono().equals("")){%><a href="#inseriscitelefono">Inserisci</a><%}
		else{%><%=cliente.getTelefono() %> <a href="#ModificaTelefono">Modifica</a><%}%><br><br>

Indirizzo: Città:<%=cliente.getCitta() %><br> Via:<%=cliente.getVia() %><br>  CAP:<%=cliente.getCap() %><br><a href="#ModificaIndirizzo">Modifica</a><br><br>



Metodo di pagamento:<%if(cliente.getNumero_carta()==null){%> <a href="#inseriscicarta">Inserisci</a> <%}else{%>	
								
								Numero carta:<%=cliente.getNumero_carta() %> 
								Data Scadenza:<%=cliente.getData_scadenza_carta() %>
								CVV:<%=cliente.getCVV() %>
								Intestatario:<%=cliente.getIntestatario_carta() %>
								<a href="#ModificaUsername">Modifica</a><br><br>								
							<%}%>
</p>






<!-- Modal gestione add/update data -->
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
      <!-- inserisco il form che servirà per gestire le varie scelte da parte del utente -->
        <form action="ProfiloUtenteServlet" method="post">
        
        <input type="hidden" name="operation" value="addData">
        
      		<div class="form-group">
      			<input type="date" class="form-control" name="data"><br>     			     		
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


</body>
</html>