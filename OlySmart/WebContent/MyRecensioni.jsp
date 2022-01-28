 <%@page import="model.*" %>
<%@page import="control.*" %>
<%@page import="java.util.*" %>

<%         
      Cliente cliente= (Cliente) request.getSession().getAttribute("cliente-corrente");
      if(cliente!=null){
      	request.setAttribute("cliente-corrente", cliente);
      	
      }
            
      RecensioneDAO Recensione=new RecensioneDAO();
      List<Recensione> recensioni=Recensione.recensioneProdottoCliente(cliente.getUsername()); 
      
      
 %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Le Mie Recensioni</title>
</head>
<body>
<h1>Recensioni effettuate</h1>

<%
	if(!recensioni.isEmpty()){
	for(Recensione recensione:recensioni){
		int codiceprodotto=recensione.getCodiceProdotto();
			ProdottoDAO prodotto=new ProdottoDAO();
			List<Prodotto> prodotti=prodotto.getProductsForCodice(codiceprodotto);
				for(Prodotto prodottoVisualizza:prodotti){%>
				
		Prodotto:<%=prodottoVisualizza.getNome() %><br>
		Voto:<%=recensione.getVoto() %><br>
		Titolo:<%=recensione.getTitolo() %><br>
		Commento:<%=recensione.getCommento() %><br>
		<a href="#modificacommento">Modifica</a><br><br>
		
	<%		}
		}
	}else{%>
	Nessuna recensione disponibile
	<%}%>


</body>
</html>