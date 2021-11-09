<%@page import="model.*" %>
<%@page import="control.*" %>
<%@page import="java.util.*" %>
     
      <%
      

           
      Cliente cliente= (Cliente) request.getSession().getAttribute("cliente-corrente");
      if(cliente!=null){
      	request.setAttribute("cliente-corrente", cliente);
      	
      }
      
      OrdineDAO ordinedao=new OrdineDAO();
      List<Ordine> ordini=ordinedao.ordineUtente(cliente.getUsername());
                           
      
      
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
		<p>Nome:<%=ordine.getNome_prodotto() %>/Quantità:<%=ordine.getQuantità_prodotto() %>/Prezzo singolo:<%=ordine.getPrezzo_prodotto_singolo() %>/Prezzo totale:<%=ordine.getCosto_totale() %></p>

	<%}
}else{%>

NESSUN ORDINE EFFETTUATO
	
<%}%>



</body>
</html>