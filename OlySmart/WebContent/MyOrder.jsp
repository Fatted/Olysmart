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
      
      ProdottoDAO prodotti=new ProdottoDAO();    
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

<style type="text/css">

#rcorners2 {
  border-radius: 25px;
  border: 1px solid #808080;
  padding: 20px; 
  width: auto;
  height: auto;  
  posizion:center;
  margin-top:5px;
  margin-left:150px;
  margin-right:150px;
}

#separatore{
border-bottom:1px solid;
}

#info{
text-align:right
}


</style>


<title>OlySmartWeb|Miei ordini</title>
</head>

<body>
<!-- -------------------------------------------------inclusione intestazione------------------------------------------------------------------------------------------------ -->

 <%@include file="include/Intestazioneb.jsp" %>
     
<!-- ------------------------------------------------- fine inclusione intestazione------------------------------------------------------------------------------------------------ -->

<!-- -------------------------------------------------inclusione navbar------------------------------------------------------------------------------------------------ -->

 <%@include file="include/navbar.jsp" %>
     
<!-- ------------------------------------------------- fine inclusione navbar------------------------------------------------------------------------------------------------ -->
<%
if(ordini.size()>0){
	for(Ordine ordine:ordini){
	      List<Prodotto> fotoprodotti=prodotti.getProductsForCodice(ordine.getProdotto_codice());%>
<ul>
		<li>
		<div id="rcorners2">
		<div class="prodottord">		
		<%for(Prodotto prodotto:fotoprodotti){ %>
		
		<div id="separatore">
		<p id="info">
		<strong>Data Ordine:</strong> <%=ordine.getData()%> &nbsp <strong>Stato:</strong><%=ordine.getStato()%> &nbsp <strong>Ordine:</strong><%=ordine.getCodice()%>		
		</p>
		</div>
		
        <div class="leftord"><img src="Immagini/Prodotti/<%=prodotto.getImmagine()%>" width="150" height="150"></div>
		<%}%>

		<strong>Prodotto:</strong> <%=ordine.getNome_prodotto() %><br>
		<strong>Quantità:</strong> <%=ordine.getQuantità_prodotto() %><br> 
		<strong>Prezzo prodotto:</strong> <%=ordine.getPrezzo_prodotto_singolo() %>&euro;<br>		
		<strong>Spedizione:</strong> <%=ordine.getTipo_spedizione()%> <br>
		<strong>Prezzo totale:</strong> <%=ordine.getCosto_totale() %>&euro;<br>
		</div>

<div class="addrecensione">		
	<%
	if(recensioni.size()==0){%>
	<a href="RecensioneProdotto.jsp?codiceprodotto=<%=ordine.getProdotto_codice() %>" style="background-color:#47a1ff ;color: white;padding: 10px 15px 10px;text-align: center;text-decoration: none;display: inline-block; margin-bottom:20px">Recensisci prodotto</a><br><br>
	<%}
	for(Recensione recensioneutente:recensioni){
	if(ordine.getProdotto_codice()!=recensioneutente.getCodiceProdotto()){ %>
	<a href="RecensioneProdotto.jsp?codiceprodotto=<%=ordine.getProdotto_codice() %>" style="background-color:#47a1ff ;color: white;padding: 10px 15px 10px;text-align: center;text-decoration: none;display: inline-block; margin-bottom:20px">Recensisci prodotto</a><br><br>
	
	<%break;}else{%>
		<a href="MyRecensioni.jsp" style="background-color:#47a1ff ;color: white;padding: 10px 15px 10px;text-align: center;text-decoration: none;display: inline-block; margin-bottom:20px">Recensione già effettuata</a><br><br>
	<%break;}
			}%>
			</div>
		</div>
	</li>
</ul>
		<%}%>
<%}else{%>
 <p class="ord"> NESSUN ORDINE EFFETTUATO </p>	
<%}%>


<!-- -------------------------------------------------inclusione footer------------------------------------------------------------------------------------------------ -->

 <%@include file="include/footer.jsp" %>
     
<!-- ----------------------------------------------- fine inclusione footer------------------------------------------------------------------------------------------------ -->
</body>
</html>