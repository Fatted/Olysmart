<%@page import="model.*" %>
<%@page import="control.*" %>
<%@page import="java.util.*" %>

<%
Cliente cliente= (Cliente) request.getSession().getAttribute("cliente");
if(cliente!=null){
	request.setAttribute("cliente-corrente", cliente);
}



%>


<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,model.Prodotto"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="CSS/style.css">
    <link rel="stylesheet" media="screen and (max-width:4096px) (min-width:1024px)" href="CSS/large.css">
    <link rel="stylesheet" media="screen and (max-width:500px)" href="CSS/mobile.css">
	<title>Dettaglio prodotto</title>
</head>

<body>
	
	<%
		
		%>

	<h2>Dettagli</h2>
	<%
		if (prodotto != null) {
	%>
	<table border="1">
		<tr>
			<th>Codice</th>
			<th>Nome</th>
			<th>Descrizione</th>
			<th>Prezzo</th>
			<th>Quantità</th>
		</tr>
		<tr>
			<td><%=prodotto.getCodice()%></td>
			<td><%=prodotto.getNome()%></td>
			<td><%=prodotto.getDescrizione()%></td>
			<td><%=prodotto.getPrezzo_vendita()%></td>
			<td><%=prodotto.getNumero_pezzi_disponibili()%></td>
		</tr>
	</table>
	<%
		}
	%>

</body>
</html>