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
</head>

<body>
<%

if(ordini.size()>0){
	for(Ordine ordine:ordini){%>
		Nome:<%=ordine.getNome_prodotto() %> /Quantità:<%=ordine.getQuantità_prodotto() %> /Prezzo singolo:<%=ordine.getPrezzo_prodotto_singolo() %> /Prezzo totale:<%=ordine.getCosto_totale() %> /Stato:<%=ordine.getStato()%> /Spedizione:<%=ordine.getTipo_spedizione()%>

<div class="addrecensione">		
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
</div>
</body>
</html>