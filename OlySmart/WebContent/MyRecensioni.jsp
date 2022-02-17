<%@page import="model.*" %>
<%@page import="control.*" %>
<%@page import="java.util.*" %>

<%         
      Cliente cliente= (Cliente) request.getSession().getAttribute("cliente-corrente");
      if(cliente!=null){
      	request.setAttribute("cliente-corrente", cliente);
      	
      }

      ProdottoDAO prod= new ProdottoDAO();
      List<Prodotto> prodottiBarraLaterale=prod.getAllProducts();	//lista usata per tenere sempre la barra attiva contenente tutti i prodotti disponibili nel db con il metodo getallproduct del prodotto DAO


      CategoriaDAO cat=new CategoriaDAO();
      List<Categoria> categorialista=cat.getCategorie(); //la lista delle categorie comprende tutte le categorie presenti nel db che prendiamo con il metodo getCategorie in CategorieDAO

      RecensioneDAO Recensione=new RecensioneDAO();
      List<Recensione> recensioni=Recensione.recensioneProdottoCliente(cliente.getUsername());
      
      
 %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" media="screen and (max-width:2561px)" href="CSS/MyRecensioni.css">
    <link rel="stylesheet" media="screen and (max-width:1441px)" href="CSS/MyRecensioni.css">
    <link rel="stylesheet" media="screen and (max-width:1025px)" href="CSS/Laptop.css">
    <link rel="stylesheet" media="screen and (max-width:769px)" href="CSS/tablet.css">
    <link rel="stylesheet" media="screen and (max-width:426px)" href="CSS/mobile.css">
<title>Le Mie Recensioni</title>
</head>
<body>
<!-- -------------------------------------------------inclusione intestazione------------------------------------------------------------------------------------------------ -->

 <%@include file="include/Intestazioneb.jsp" %>
     
<!-- ------------------------------------------------- fine inclusione intestazione------------------------------------------------------------------------------------------------ -->

<!-- -------------------------------------------------inclusione navbar------------------------------------------------------------------------------------------------ -->
 <%@include file="include/navbar.jsp" %>    
<!-- ------------------------------------------------- fine inclusione navbar------------------------------------------------------------------------------------------------ -->

<h1>Recensioni effettuate</h1>
<ul>
<li>
<%
	if(!recensioni.isEmpty()){
	for(Recensione recensione:recensioni){
		int codiceprodotto=recensione.getCodiceProdotto();
			ProdottoDAO prodotto=new ProdottoDAO();
			List<Prodotto> prodotti=prodotto.getProductsForCodice(codiceprodotto);
				for(Prodotto prodottoVisualizza:prodotti){%>
				
		Prodotto: <%=prodottoVisualizza.getNome() %><br>
		Voto: <%=recensione.getVoto() %><br>
		Titolo: <%=recensione.getTitolo() %><br>
		Commento: <%=recensione.getCommento() %><br>
		<a href="#modificacommento">Modifica</a><br><br>
		
	<%		}
		}
	}else{%>
	<p class="recensione">
	Nessuna recensione disponibile
	</p>
	<%}%>
</li>
</ul>
<!-- -------------------------------------------------inclusione footer------------------------------------------------------------------------------------------------ -->

 <%@include file="include/footer.jsp" %>
     
<!-- ----------------------------------------------- fine inclusione footer------------------------------------------------------------------------------------------------ -->

</body>
</html>