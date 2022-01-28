<%@page import="model.*" %>
<%@page import="control.*" %>
<%@page import="java.util.*" %>
     
      <%         
      Cliente cliente= (Cliente) request.getSession().getAttribute("cliente-corrente");
      if(cliente!=null){
      	request.setAttribute("cliente-corrente", cliente);
      	
      }
      
      String utentenome=cliente.getUsername();
      
      OrdineDAO ordinedao=new OrdineDAO();
      List<Ordine> ordini=ordinedao.ordineUtente(utentenome);
      
      RecensioneDAO Recensione=new RecensioneDAO();
      List<Recensione> recensioni=Recensione.recensioneProdottoCliente(cliente.getUsername());
    
 %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>I miei oridni</title>
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
<%

if(ordini.size()>0){
	for(Ordine ordine:ordini){%>
		Nome:<%=ordine.getNome_prodotto() %> /Quantità:<%=ordine.getQuantità_prodotto() %> /Prezzo singolo:<%=ordine.getPrezzo_prodotto_singolo() %> /Prezzo totale:<%=ordine.getCosto_totale() %> /Stato:<%=ordine.getStato()%> /Spedizione:<%=ordine.getTipo_spedizione()%>
		<td class="addrecensione">
		
	<%
	for(Recensione recensioneutente:recensioni){
	if(ordine.getProdotto_codice()!=recensioneutente.getCodiceProdotto()){ %>
	<a href="RecensioneProdotto.jsp?codiceprodotto=<%=ordine.getProdotto_codice() %>">Recensisci prodotto</a> <br><br>
	
	
	<%}else{%>
		<a href="MyRecensioni.jsp">Recensione già effettuata</a><br>
	<%}
			}
		}%>
<%}else{%>

NESSUN ORDINE EFFETTUATO
	
<%}%>

</body>
</html>