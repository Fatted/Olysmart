<%@page import="model.*" %>
<%@page import="control.*" %>
<%@page import="java.util.*" %>

<% 
String trovacategoria=request.getParameter("Categoria");	//prendiamo la categoria selezionata
String trovaMarca=request.getParameter("ProdottoMarca");	//prendiamo la marca selezionata
String trovaBarra=request.getParameter("search");			//prendiamo ciò che cerca l'utente
ProdottoDAO prod= new ProdottoDAO();
String trova;
String trovamarca;
String trovabarra;
List<Prodotto> prodottiBarraLaterale=prod.getAllProducts();	//lista usata per tenere sempre la barra attiva contenente tutti i prodotti disponibili nel db con il metodo getallproduct del prodotto DAO
List<Prodotto> prodotti=null;
//se la barra laterale non è stata selezionata ma l'utente ha scritto nella barra di ricerca
if(trovaBarra!=null && trovacategoria==null && trovaMarca==null){
	trovabarra=trovaBarra;
	prodotti=prod.getAllProductsForNome(trovabarra);//la lista dei prodotti sarà  selezionata per nome 
}else if(trovacategoria.equals("all")){	//altimenti se l'utente ha selezionato il catalogo
	prodotti=prod.getAllProducts();//la lista dei prodotti comprende tutti i prodotti
}else if(!trovacategoria.equals("all") && trovaMarca==null){ //se e stata selezionata la barra laterale ma ha scelto la categoria
	trova=trovacategoria;
	prodotti=prod.getAllProductsForCategory(trova);	//la lista dei prodotti sarà  formata dai prodotti con la categoria selezionata
}else if(!trovacategoria.equals("all") && trovaMarca!=null){ //se trovacategoria è diversa da all e trovamarca non è nulla
	trova=trovacategoria;
	trovamarca=trovaMarca;
	prodotti=prod.getAllProductsForCategoryAndMarca(trova,trovamarca);	
}
CategoriaDAO cat=new CategoriaDAO();
List<Categoria> categorialista=cat.getCategorie();//categorielista contiene tutte le categorie tramite il metodo getCategorie in categoriaDAO
//controllo del cliente se ha loggato o meno
Cliente cliente= (Cliente) request.getSession().getAttribute("cliente-corrente");
if(cliente!=null){
	request.setAttribute("cliente-corrente", cliente);
}
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<!------------------------------------------------------------- STILE CSS IMPORTATI ----------------------------------------------------------------------->
	
	<link rel="stylesheet" href="CSS/CatalogoResponsiveTable.css">
	<link rel="stylesheet" media="screen and (max-width:2561px)" href="CSS/stylecata.css">
    <link rel="stylesheet" media="screen and (max-width:1441px)" href="CSS/stylecata.css">
    <link rel="stylesheet" media="screen and (max-width:1025px)" href="CSS/Laptop.css">
    <link rel="stylesheet" media="screen and (max-width:769px)" href="CSS/Tablet.css">
	<link rel="stylesheet" media="screen and (max-width:426px)" href="CSS/mobile.css">
	
   
    
<!------------------------------------------------------------- FINE STILE CSS IMPORTATI ----------------------------------------------------------------->
    
<title>OlySmartWeb|Catalogo</title>
</head>


<body>
<!-- -------------------------------------------------inclusione intestazione------------------------------------------------------------------------------------------------ -->

 <%@include file="include/Intestazionea.jsp" %>
     
<!-- ------------------------------------------------- fine inclusione intestazione------------------------------------------------------------------------------------------------ -->

<!-- -------------------------------------------------inclusione navbar------------------------------------------------------------------------------------------------ -->

 <%@include file="include/navbar.jsp" %>
     
<!-- ------------------------------------------------- fine inclusione navbar------------------------------------------------------------------------------------------------ -->

<section id="center">             
<div class="prodotti">   
 
        <%
//controllo se c'è almeno un prodotto nel db
if(prodotti.size()==0){%>
	<h2>Nessun prodotto disponibile al momento...</h2>
<%}%>

	<%
	//se c'è almeno un prodotto nel db
	if(!prodotti.isEmpty()){%>
		<table>	
		<!-- Stampa dei prodotti messi in 3 colonne per ogni riga -->	   
	   <%		
	    Iterator<Prodotto> iteratore=prodotti.iterator();
	    Prodotto p1;
	    Prodotto p2;
	    Prodotto p3;
	    
	    while(iteratore.hasNext()){	    	
	    	p1=iteratore.next();	    		    		    
	    %>
		    <tr>
		        <td>
		        <div class="sfondo" style="border-style: outset; margin-top:10px">
		         <div class="containers">
		         	<img src="Immagini/Prodotti/<%=p1.getImmagine() %>" height="250px" width="250px" class="image">
		         	<div class="overlay">
		         	<div class="text"><%=p1.getSpecifiche() %></div> 
		         	</div>
		        </div>	        
		        <h1><%=p1.getNome() %></h1>
		        <h2>Prezzo:<%=p1.getPrezzo_vendita()%>&#8364</h2>
		        <!-- passiamo alla servlet id del prodotto da mettere nel carrello, alla servlet AggiungiAlCarrello -->
		        <a href="AggiungiAlCarrello?id=<%=p1.getCodice() %>" style="background-color:#47a1ff ;color: white;padding: 10px 15px 10px;text-align: center;text-decoration: none;display: inline-block; margin-bottom:20px">Aggiungi al carrello</a>		  
		        <!-- Passiamo alla jsp l'id del prodotto da visualizzare i dettagli -->
		        <a href="dettagli.jsp?id=<%=p1.getCodice() %>" style="background-color:#47a1ff ;color: white;padding: 10px 15px 10px;text-align: center;text-decoration: none;display: inline-block; margin-bottom:20px">Visualizza i dettagli</a>
		        </div>
		        </td>
       
		        <% if(iteratore.hasNext()){
		    		p2=iteratore.next(); %>
		    	<td>
		         <div class="sfondo" style="border-style: outset; margin-top:10px">
		         <div class="containers">
		         	<img src="Immagini/Prodotti/<%=p2.getImmagine() %>" height="250px" width="250px" class="image">
		         	<div class="overlay">
		         	<div class="text"><%=p2.getSpecifiche() %></div> 
		         	</div>
		        </div>	        
		        <h1><%=p2.getNome() %></h1>
		        <h2>Prezzo:<%=p2.getPrezzo_vendita()%>&#8364</h2>
		        <!-- passiamo alla servlet id del prodotto da mettere nel carrello, alla servlet AggiungiAlCarrello -->
		        <a href="AggiungiAlCarrello?id=<%=p2.getCodice() %>" style="background-color:#47a1ff ;color: white;padding: 10px 15px 10px;text-align: center;text-decoration: none;display: inline-block; margin-bottom:20px">Aggiungi al carrello</a>		  
		        <!-- Passiamo alla jsp l'id del prodotto da visualizzare i dettagli -->
		        <a href="dettagli.jsp?id=<%=p2.getCodice() %>" style="background-color:#47a1ff ;color: white;padding: 10px 15px 10px;text-align: center;text-decoration: none;display: inline-block; margin-bottom:20px">Visualizza i dettagli</a>
		        </div>
		        </td>
				
				<%if(iteratore.hasNext()){
		    		p3=iteratore.next(); %>
		        <td>
		        <div class="sfondo" style="border-style: outset; margin-top:10px">
		         <div class="containers">
		         	<img src="Immagini/Prodotti/<%=p3.getImmagine() %>" height="250px" width="250px" class="image">
		         	<div class="overlay">
		         	<div class="text"><%=p3.getSpecifiche() %></div> 
		         	</div>
		        </div>	        
		        <h1><%=p3.getNome() %></h1>
		        <h2>Prezzo:<%=p3.getPrezzo_vendita()%>&#8364</h2>
		        <!-- passiamo alla servlet id del prodotto da mettere nel carrello, alla servlet AggiungiAlCarrello -->
		        <a href="AggiungiAlCarrello?id=<%=p3.getCodice() %>" style="background-color:#47a1ff ;color: white;padding: 10px 15px 10px;text-align: center;text-decoration: none;display: inline-block; margin-bottom:20px">Aggiungi al carrello</a>		  
		        <!-- Passiamo alla jsp l'id del prodotto da visualizzare i dettagli -->
		        <a href="dettagli.jsp?id=<%=p3.getCodice() %>" style="background-color:#47a1ff ;color: white;padding: 10px 15px 10px;text-align: center;text-decoration: none;display: inline-block; margin-bottom:20px">Visualizza i dettagli</a>
		        </div>
		        </td>
		    </tr>
		<%
			}		    	
	    }
	}
}
%>		
</table>
</div>
</section>
<!-- -------------------------------------------------inclusione footer------------------------------------------------------------------------------------------------ -->
 <%@include file="include/footer.jsp" %>
<!-- ----------------------------------------------- fine inclusione footer------------------------------------------------------------------------------------------------ -->

</body>
</html>