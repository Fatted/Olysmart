<%@page import="model.*" %>
<%@page import="control.*" %>
<%@page import="java.util.*" %>

<%
Cliente cliente= (Cliente) request.getSession().getAttribute("cliente");
if(cliente!=null){
	request.setAttribute("cliente-corrente", cliente);
}

int id=Integer.parseInt(request.getParameter("id"));
ProdottoDAO prodottoDAO=new ProdottoDAO();

List<Prodotto> prodottolista=prodottoDAO.getProductsForCodice(id);



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

	<table border="1">
	<%for(Prodotto prodotto:prodottolista){ %>
		<tr>
			<th>Codice</th>
			<th>Nome</th>
			<th>Descrizione</th>
			<th>Prezzo</th>
			<th>Quantità</th>
			<th>compra</th>
			<th>immagine</th>
		</tr>
		<tr>
			<td><%=prodotto.getCodice()%></td>
			<td><%=prodotto.getNome()%></td>
			<td><%=prodotto.getDescrizione()%></td>
			<td><%=prodotto.getPrezzo_vendita()%></td>
			<td><%=prodotto.getNumero_pezzi_disponibili()%></td>
			<td><a href="AggiungiAlCarrello?id=<%=prodotto.getCodice() %>">add cart</a></td>
			<td><img src="Immagini/Prodotti/<%=prodotto.getImmagine() %>" height="250px" width="250px" class="image"></td>
		</tr>
	</table>
<%}%>

</body>
</html>