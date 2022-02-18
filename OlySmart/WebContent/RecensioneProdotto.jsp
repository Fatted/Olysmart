<%@page import="model.*" %>
<%@page import="control.*" %>
<%@page import="java.util.*" %>

<!-- Piccolo controllo se si sta cercando di accedere come admin se non si è admin o non loggati -->
<%
Cliente cliente= (Cliente) request.getSession().getAttribute("cliente-corrente");
if(cliente!=null){//se la sessione non è vuota settiamo il cliente
	request.setAttribute("cliente-corrente", cliente); //settiamo il nuovo cliente
}

ProdottoDAO prod= new ProdottoDAO();
List<Prodotto> prodottiBarraLaterale=prod.getAllProducts();	//lista usata per tenere sempre la barra attiva contenente tutti i prodotti disponibili nel db con il metodo getallproduct del prodotto DAO

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
	
	<link rel="stylesheet" media="screen and (max-width:2561px)" href="CSS/styledet.css">
    <link rel="stylesheet" media="screen and (max-width:1441px)" href="CSS/styledet.css">
    <link rel="stylesheet" media="screen and (max-width:1025px)" href="CSS/Laptop.css">
    <link rel="stylesheet" media="screen and (max-width:769px)" href="CSS/Tablet.css">
    <link rel="stylesheet" media="screen and (max-width:426px)" href="CSS/mobile.css">
	<title>OlySmartWeb|Recensione Prodotto</title>
	

</head>

<body>

<!-- -------------------------------------------------inclusione intestazione------------------------------------------------------------------------------------------------ -->

 <%@include file="include/Intestazioneb.jsp" %>
     
<!-- ------------------------------------------------- fine inclusione intestazione------------------------------------------------------------------------------------------------ -->

<!-- -------------------------------------------------inclusione navbar------------------------------------------------------------------------------------------------ -->

 <%@include file="include/navbar.jsp" %>
     
<!-- ------------------------------------------------- fine inclusione navbar------------------------------------------------------------------------------------------------ -->



 
 <div class="title">
 <h1>Recensione prodotto</h1>
 </div>
 

	
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
			<h1><%=prodotto.getNome()%></h1>
			</div>
			<br>
			<div class="prezzo">
			<h3>Voto</h3>
			 <input type="number" name="voto" min="1" max="10" value="1" required>
			</div>
			<br>
		<h4>Titolo</h4>
		<input type="text" name="titolo" placehorder="Inserisci il titolo della recensione" required><br>
		<div class="dispo">
		<h4>Commento</h4>
		<textarea name="commento" placeholder="Inserisci una recensione del prodotto" rows="10" cols="30" required></textarea><br>
		</div>
		<br>
		<input type="hidden" name="codiceProdotto" value="<%=prodotto.getCodice() %>">
		<button type="submit" class="btn btn-primary" value="addRecensione" style="background-color:#47a1ff ;color: white;padding: 10px 15px 10px;text-align: center;text-decoration: none;display: inline-block; margin-bottom:20px">Aggiungi Recensione</button>		
	</div>
	</section>
	<%}%>
</form>		
<!-- -------------------------------------------------inclusione footer------------------------------------------------------------------------------------------------ -->

 <%@include file="include/footer.jsp" %>
     
<!-- ----------------------------------------------- fine inclusione footer------------------------------------------------------------------------------------------------ -->
 
</body>
</html>
