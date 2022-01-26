<%@page import="model.*" %>
<%@page import="control.*" %>
<%@page import="java.util.*" %>

<!-- Piccolo controllo se si sta cercando di accedere come admin se non si è admin o non loggati -->
<%
Cliente cliente= (Cliente) request.getSession().getAttribute("cliente");
if(cliente!=null){
	request.setAttribute("cliente-corrente", cliente);
}


int codice_prodotto=Integer.parseInt(request.getParameter("codiceprodotto"));
ProdottoDAO prodottoDAO=new ProdottoDAO();

List<Prodotto> prodottolista=prodottoDAO.getProductsForCodice(codice_prodotto);

CategoriaDAO cat=new CategoriaDAO();
List<Categoria> categorialista=cat.getCategorie();

%>


<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,model.Prodotto"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="CSS/styledet.css">
	<title>Recensione prodotto</title>
	
	<!-- Pagina CSS -->
<link rel="stylesheet" href="CSS/styleadmin.css">
</head>

<body>
<section id="intestazione">
 
 <div class="home">
  <a href="Homepage.jsp"><img src="Immagini/logonero.png"></a>
 </div>
 
 <div class="title">
 <h1>Recensione prodotto</h1>
 </div>
 

</section>
	
	<form action="RecensioneServlet" method="post">
	<section id="details">
	<% for(Prodotto prodotto:prodottolista){ %>
		<div class="left">
		    <div class="foto">
		  <img src="Immagini/Prodotti/<%=prodotto.getImmagine() %>">
		  </div>
			</div>
		<div class="right">
		<div class="nome">
			<h1><%=prodotto.getNome()%><h1>
			</div>
			<br>
			<div class="prezzo">
			<h3>Voto</h3>
			 <input type="number" name="voto" min="1" max="10" value="1" required>
			</div>
			<br>
		<h4>Titolo<h4>
		<input type="text" name="titolo" placehorder="Inserisci il titolo della recensione" required><br>
		<div class="dispo">
		<h4>Commento<h4>
		<textarea name="commento" placeholder="Inserisci una recensione del prodotto" rows="10" cols="50" required></textarea><br>
		</div>
		<br>
		<input type="hidden" name="codiceProdotto" value="<%=prodotto.getCodice() %>">
		<button type="submit" class="btn btn-primary" value="addRecensione">Aggiungi Recensione</button>		
	</section>
	<%}%>
</form>		

</body>
</html>