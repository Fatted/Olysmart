<%@page import="model.*" %>
<%@page import="control.*" %>
<%@page import="java.util.*" %>
     
      <%         
      Cliente cliente= (Cliente) request.getSession().getAttribute("cliente-corrente");
      if(cliente!=null){
      	request.setAttribute("cliente-corrente", cliente);
      	
      }
      CategoriaDAO cat=new CategoriaDAO();
      List<Categoria> categorialista=cat.getCategorie(); //la lista delle categorie comprende tutte le categorie presenti nel db che prendiamo con il metodo getCategorie in CategorieDAO

      ProdottoDAO prod= new ProdottoDAO();
      List<Prodotto> prodottiBarraLaterale=prod.getAllProducts();	//lista usata per tenere sempre la barra attiva contenente tutti i prodotti disponibili nel db con il metodo getallproduct del prodotto DAO

      
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
<link rel="stylesheet" media="screen and (max-width:2561px)" href="CSS/MyOrder.css">
    <link rel="stylesheet" media="screen and (max-width:1441px)" href="CSS/MyOrder.css">
    <link rel="stylesheet" media="screen and (max-width:1025px)" href="CSS/Laptop.css">
    <link rel="stylesheet" media="screen and (max-width:769px)" href="CSS/Tablet.css">
<link rel="stylesheet" media="screen and (max-width:426px)" href="CSS/mobile.css">
<title>I miei oridni</title>
</head>

<body>
<!-- -------------------------------------------------inclusione intestazione------------------------------------------------------------------------------------------------ -->

 <%@include file="include/Intestazioneb.jsp" %>
     
<!-- ------------------------------------------------- fine inclusione intestazione------------------------------------------------------------------------------------------------ -->

<!-- -------------------------------------------------inclusione navbar------------------------------------------------------------------------------------------------ -->

 <%@include file="include/navbar.jsp" %>
     
<!-- ------------------------------------------------- fine inclusione navbar------------------------------------------------------------------------------------------------ -->

<h1>I miei ordini </h1>
<%
if(ordini.size()>0){
	for(Ordine ordine:ordini){%>
	    <ul>
<li>
		Prodotto: <%=ordine.getNome_prodotto() %><br>
		Quantità: <%=ordine.getQuantità_prodotto() %><br> 
		Prezzo prodotto: <%=ordine.getPrezzo_prodotto_singolo() %> <br>
		Stato: <%=ordine.getStato()%> <br>
		Spedizione: <%=ordine.getTipo_spedizione()%> <br>
		Prezzo totale: <%=ordine.getCosto_totale() %> <br>
		</li></ul>

<div class="addrecensione">		
	<%
	for(Recensione recensioneutente:recensioni){
	if(ordine.getProdotto_codice()!=recensioneutente.getCodiceProdotto()){ %>
	<a href="RecensioneProdotto.jsp?codiceprodotto=<%=ordine.getProdotto_codice() %>">Recensisci prodotto</a> <br><br>
	
	
	<%}else{%>
		<a href="MyRecensioni.jsp">Recensione già effettuata</a><br><br>
	<%}
			}
		}%>
		
<%}else{%>

 <p class="ord"> NESSUN ORDINE EFFETTUATO </p>
	
<%}%>
</div>
<!-- -------------------------------------------------inclusione footer------------------------------------------------------------------------------------------------ -->

 <%@include file="include/footer.jsp" %>
     
<!-- ----------------------------------------------- fine inclusione footer------------------------------------------------------------------------------------------------ -->
 
</body>
</html>