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

RecensioneDAO Recensione=new RecensioneDAO();
List<Recensione> recensioni=Recensione.recensioneProdotto(id);

%>


<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,model.Prodotto"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="CSS/Dettagli.css">
	<link rel="stylesheet" href="CSS/Footer.css">   
	<title>Dettagli</title>
</head>

<body>
<!-- ---------------------------------------------------------------------------------------------------------------------------------------------- -->
<section id="intestazione">
 <div class="home">
  <a href="Homepage.jsp"><img src="Immagini/logonero.png"></a>
 </div>
 <div class="title">
 <h1>Dettagli Prodotto</h1>
 </div>
</section>
<!-- ---------------------------------------------------------------------------------------------------------------------------------------------- -->
<!-- ---------------------------------------------------------------------------------------------------------------------------------------------- -->
<section id="details">
	<% for(Prodotto prodotto:prodottolista){ %>
		<div class="left">
		    <div class="foto">
		  <img src="Immagini/Prodotti/<%=prodotto.getImmagine() %>">
		  </div>
			</div>
		<div class="right">
		<div class="nome">
			<h3>Nome</h3>
			<p><%=prodotto.getNome()%></p>
			</div>
			<br>
			<div class="prezzo">
			<h3>Prezzo</h3>
			<p><%=prodotto.getPrezzo_vendita()%></p>
			</div>
			<br>
		<div class="dispo">
		<h4>Disponibilità </h4>
		<p><%=prodotto.getNumero_pezzi_disponibili()%></p>
		</div>
		<br>
		<div class="descr">
		<h3>Descrizione</h3>
		<p><%=prodotto.getDescrizione()%></p>
		<br>
		  
		  <div class="addcart">
		  <a href="AggiungiAlCarrello?id=<%=prodotto.getCodice() %>">Aggiungi al carrello</a>
		  </div>
	
	
	
	<h3>Recensioni Prodotto</h3>
	<%
	if(!recensioni.isEmpty()){
	for(Recensione recensione:recensioni){%>
		Utente:<%=recensione.getUsernameCliente() %>  Voto:<%=recensione.getVoto() %><br>
		Titolo:<%=recensione.getTitolo() %><br>
		Commento:<%=recensione.getCommento() %><br><br>
		
	<%}
	}else{%>
	Nessuna recensione disponibile
	<%}%>
	
		</div>	
	  </div>			
	</section>
	<%}%>
<!-- ---------------------------------------------------------------------------------------------------------------------------------------------- -->	

<!-- -------------------------------------------------inclusione footer------------------------------------------------------------------------------------------------ -->
<%@include file="include/footer.jsp" %>
<!-- -------------------------------------------------fine inclusione------------------------------------------------------------------------------------------------ -->
</body>
</html>