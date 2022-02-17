<%@page import="model.*" %>
<%@page import="control.*" %>
<%@page import="java.util.List" %>


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

	int idordine=Integer.parseInt(request.getParameter("idordine")); 		
	
      		OrdineDAO ordine=new OrdineDAO();
      		List<Ordine> ordini=ordine.ordineCambiamento(idordine);
      		
      		%>
<!DOCTYPE html>
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Modifica Prodotto</title>
	
	<!-- Pagina CSS -->
<link rel="stylesheet" href="CSS/modificaProdotti.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<!-- Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<!-- JavaScript -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	

<title>Gestione ordini</title>
</head>
<body>


<h1 style="text-align:center">Modifica stato ordini</h1>
      		<table class="table" id="tavula" border="1">
      		
      		
      		<thead>
      		<tr>
				<th scope="col" style="border:1px solid">codice</th>
				<th scope="col" style="border:1px solid">costo totale</th>
				<th scope="col" style="border:1px solid">data</th>
				<th scope="col" style="border:1px solid">prezzo singolo prodotto</th>
				<th scope="col" style="border:1px solid">nome prodotto</th>
				<th scope="col" style="border:1px solid">Codice prodotto</th>
				<th scope="col" style="border:1px solid">quantità prodotto</th>
				<th scope="col" style="border:1px solid">tipo spedizione</th>
				<th scope="col" style="border:1px solid">indirizzo consegna</th>
				<th scope="col" style="border:1px solid">username</th>
				<th scope="col" style="border:1px solid">stato ordine</th>	
			</tr>
			</thead>	
			
			
			<tbody>
			<%	
			//for each che fa vedere tutti i clienti registrati nel database con i relativi valori
			for(Ordine ordinestampa:ordini){%>
				<tr style="border:1px solid">
				<td style="border:1px solid" data-label="Codice"><%=ordinestampa.getCodice() %></td> 
				<td style="border:1px solid" data-label="Costo totale"><%=ordinestampa.getCosto_totale() %></td>
				<td style="border:1px solid" data-label="Data"><%=ordinestampa.getData() %></td>
				<td style="border:1px solid" data-label="Prezzo singolo prodotto"><%=ordinestampa.getPrezzo_prodotto_singolo() %></td>
				<td style="border:1px solid" data-label="Nome prodotto"><%=ordinestampa.getNome_prodotto() %></td>
				<td style="border:1px solid" data-label="Codice prodotto"><%=ordinestampa.getProdotto_codice() %></td>
				<td style="border:1px solid" data-label="Quantità"><%=ordinestampa.getQuantità_prodotto() %></td>
				<td style="border:1px solid" data-label="Tipo spedizione"><%=ordinestampa.getTipo_spedizione() %>
				<td style="border:1px solid" data-label="Indirizzo consegna"><%=ordinestampa.getIndirizzo_consegna() %>
				<td style="border:1px solid" data-label="Username"><%=ordinestampa.getUsername() %>
				<td style="border:1px solid" data-label="Stato ordine"><%=ordinestampa.getStato() %><br><button type="button" class="btn btn-link" data-toggle="modal" data-target="#modalmodificastato">Modifica stato</button></td>			
				</tr>
			<%
			}
			%>
			</tbody>
			</table>


<!-- ------------------------------------------------------Modal gestione update stato ordine----------------------------------------------------------------- -->
<div class="modal fade" id="modalmodificastato" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modifica stato ordine</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <!-- inserisco il form che servirà per gestire lo stato delgli ordini  -->
        <form action="ModificaStatoOrdiniAdmin" method="post">
        
        <input type="hidden" name="operation" value="UpdateStato">
        
      		<div class="form-group">
      			 <input type="hidden" name="idordine" value="<%=idordine%>">
      			     			 
      			<select name="stato" class="form-control">
      			<option value="preso in carico">preso in carico</option>
      			<option value="spedito">spedito</option>
      			<option value="consegnato">consegnato</option>
      			</select>    
      		</div>
      	      	
      		<div class="container text-center">
      			<button type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>
        		<button type="submit" class="btn btn-primary" value="UpdateStato">Modifica</button>
      		</div>     	
        </form>
      </div>
    </div>
  </div>
</div>
</body>
</html>