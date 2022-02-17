<%@page import="model.*" %>
<%@page import="control.*" %>
<%@page import="java.util.*" %>

<%
//controlliamo la sessione attuale del cliente
Cliente cliente= (Cliente) request.getSession().getAttribute("cliente-corrente");
   if(cliente!=null){//se la sessione non è vuota settiamo il cliente
   	request.setAttribute("cliente-corrente", cliente); //settiamo il nuovo cliente
   }
     
     CategoriaDAO cat=new CategoriaDAO();
     List<Categoria> categorialista=cat.getCategorie(); //la lista delle categorie comprende tutte le categorie presenti nel db che prendiamo con il metodo getCategorie in CategorieDAO

     ProdottoDAO prod= new ProdottoDAO();
     List<Prodotto> prodottiBarraLaterale=prod.getAllProducts();//lista usata per tenere sempre la barra attiva contenente tutti i prodotti disponibili nel db con il metodo getallproduct del prodotto DAO
     %>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet" media="screen and (max-width:2561px)" href="CSS/Myaccount.css">
    <link rel="stylesheet" media="screen and (max-width:1441px)" href="CSS/Myaccount.css">
    <link rel="stylesheet" media="screen and (max-width:1025px)" href="CSS/Laptop.css">
    <link rel="stylesheet" media="screen and (max-width:769px)" href="CSS/Tablet.css">
    <link rel="stylesheet" media="screen and (max-width:426px)" href="CSS/mobile.css">
<title>OlySmartWeb|Il mio Account</title>
</head>
<body>
<!-- -------------------------------------------------inclusione intestazione------------------------------------------------------------------------------------------------ -->

 <%@include file="include/Intestazioneb.jsp" %>
     
<!-- ------------------------------------------------- fine inclusione intestazione------------------------------------------------------------------------------------------------ -->

<!-- -------------------------------------------------inclusione navbar------------------------------------------------------------------------------------------------ -->

 <%@include file="include/navbar.jsp" %>
     
<!-- ------------------------------------------------- fine inclusione navbar------------------------------------------------------------------------------------------------ -->

<section id="int">

 <div class="id">
<!-- indichiamo il nome e cognome del cliente che entra nella pagina -->
  <h1>Pagina profilo di:<%=cliente.getNome() %> <%=cliente.getCognome() %></h1>
 </div>
 
</section>

<section id="menuacc">

 <table>
  <tr>
  
   <td>
	<div class="all">
		 <div class="containers" >
		       <a href="MyOrder.jsp">
      			<div class="l">
      			 <img src="Immagini/ordini.svg" >
     			</div>
    			<div class="r">
     			  <h2>I miei ordini</h2>
     			</div>
    			</a> 
		 </div>
     </div>	        
   </td>
  </tr>
  </table> 
  <table>
  <tr>
  
   <td>
	<div class="all">
		 <div class="containers" >
		       <a href="MyRecensioni.jsp">
      			<div class="l">
      			 <img src="Immagini/recensioni.svg" >
     			</div>
    			<div class="r">
     			  <h2>Recensioni</h2>
     			</div>
    			</a> 
		 </div>
     </div>	        
   </td>
  </tr>
  </table> 
    <table>
  <tr>
   <td>
	<div class="all">
		 <div class="containers">
		       <a href="MyInfo.jsp">
      			<div class="l">
      			 <img src="Immagini/info.svg" >
     			</div>
    			<div class="r">
     			  <h2>Le mie info</h2>
     			</div>
    			</a> 
		 </div>
     </div>	        
   </td>
    </tr>
    </table>

</section>


<!-- -------------------------------------------------inclusione footer------------------------------------------------------------------------------------------------ -->

 <%@include file="include/footer.jsp" %>
     
<!-- ----------------------------------------------- fine inclusione footer------------------------------------------------------------------------------------------------ -->
 

</body>
</html>