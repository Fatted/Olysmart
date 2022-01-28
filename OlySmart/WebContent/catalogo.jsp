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
	prodotti=prod.getAllProductsForNome(trovabarra);//la lista dei prodotti sarà selezionata per nome 
}else if(trovacategoria.equals("all")){	//altimenti se l'utente ha selezionato il catalogo
	prodotti=prod.getAllProducts();//la lista dei prodotti comprende tutti i prodotti
}else if(!trovacategoria.equals("all") && trovaMarca==null){ //se e stata selezionata la barra laterale ma ha scelto la categoria
	trova=trovacategoria;
	prodotti=prod.getAllProductsForCategory(trova);	//la lista dei prodotti sarà formata dai prodotti con la categoria selezionata
}else if(!trovacategoria.equals("all") && trovaMarca!=null){ //se trovacategoria è diversa da all e trovamarca non è nulla
	trova=trovacategoria;
	trovamarca=trovaMarca;
	prodotti=prod.getAllProductsForCategoryAndMarca(trova,trovamarca);	
}


CategoriaDAO cat=new CategoriaDAO();
List<Categoria> categorialista=cat.getCategorie();//categorielista contiene tutte le categorie tramite il metodo getCategorie in categoriaDAO

//controllo del cliente se è loggato o meno
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
	<link rel="stylesheet" href="CSS/Catalogo.css">
	<link rel="stylesheet" href="CSS/Footer.css">
    <link rel="stylesheet" href="CSS/NavbarTOP.css">
    <link rel="stylesheet" href="CSS/BottoneDiRicerca.css">
<!------------------------------------------------------------- FINE STILE CSS IMPORTATI ----------------------------------------------------------------->
    
<title>OlySmartWeb Catalogo</title>
</head>


<body>
 <section id="intestazione">    
<div class="container">
         <div class="image">
            <a href="Homepage.jsp"> 
                <img src="Immagini/logonero.png" class="logo"> <!-- cliccando sul logo andiamo sulla homepage -->
            </a> 
         </div>
        <div class="testo"><h1>OlySmart</h1>
            <script src="https://use.fontawesome.com/d8805b6d62.js"></script>
            <script src="https://use.fontawesome.com/relases/v5.0.6/js/all.js"></script>
            
<!------------------------------------------- barra di ricerca usata per cercare i prodotti per nome/categoria ----------------------------------------->
<%@include file="include/BottoneDiRicerca.jsp" %>
<!------------------------------------------- fine barra ----------------------------------------------------------------------------------------------->                 
</div>
    <div class="ultimo">
     <div class="accesso"> 
 <!-------------------------------------------controlliamo se il cliente ha fatto l'accesso ------------------------------------------------------------->    
 <!-- Se il cliente non ha fatto l'accesso uscirà solo (accedi e registrati) mentre se ha fatto l'accesso uscirà (logout,ordini,carrello e il suo account  -->
        <%if(cliente == null){%>
        	<div class="registra"> <a href="register.jsp">Registrati</a> </div>
            <div class="accedi"> <a href="login.jsp">Accedi</a> </div>
            <div class="image"><a href="carrello.jsp"><img src="carella.png"></a></div><br>
        <%}else{%>
        	<p>Utente:<%=cliente.getUsername() %></p>      
        	 <div class="logout"> <a href="ServletLogout">Logout</a></div><br>
        	 <div class="Myorder"> <a href="MyOrder.jsp">Miei ordini</a></div><br>
        	 <div class="cartimage"><a href="carrello.jsp"><img src="carella.png"></a></div><br>
        	 <div class="Myaccount"> <a href="MyAccount.jsp">il mio account</a></div><br>
        	 <div class="###"> <a href="MyRecensioni.jsp">le mie recensioni</a></div><br>
<!------------------------------------------- se è un admin andrà nella sua pagina dedicata --------------------------------------------------------------->
        	 <%if(cliente.getTipo().equals("admin")){%>
        		<br><div> <a href="paginaAdmin.jsp">Pagina Gestione</a></div>
        <%}%>	 
        	              
      <%}%>
     </div>
<!-- --------------------------------------------------fine cliente---------------------------------------------------------------------------------------------- -->
     <div class="loghi">
           <div class ="imgl1"> 
                <a href=><img src="Immagini/ig.png" ></a>
           </div>
              <div class ="imgl2">
              <a href=><img src="Immagini/fb.png"></a> 
              </div>
               <div class ="imgl3">    
                <a href=https://tinyurl.com/IndirizzoNegozio><img src="Immagini/placeholder.png"></a>
                </div>     
     </div>
    </div>
    </div>
</section>
     

<!---------------------------- Includo ala barra laterale che è nel file dedicaro barralaterale.jsp in include --------------------------------------- -->
<%@include file="include/NavbarTOP.jsp" %>
<!-- ------------------------------------------------------------------------------------------------------------------------------------------------ -->

   
<section id="center">             
<div class="prodotti">
<%
//se la quantità dei prodotti è zero stampa nessun prodotto disponibile al momento
if(prodotti.size()==0){%>
	<p>Nessun prodotto disponibile al momento...</p>
<%}%>

	<%if(!prodotti.isEmpty()){%>

		<table id="catalogo">
			<tbody>    
		<!-- Stampa dei prodotti messi in 3 colonne per ogni riga -->		   
	   <%
	   //uso 3 iteratori in modo tale da poter andare a capo ogni 3 prodotti messi di fianco
	    Iterator<Prodotto> iteratore=prodotti.iterator(); //in questo caso i prodotti sono tutti quelli presenti nel db nella tabella prodotti
	    Prodotto p1;
	    Prodotto p2;
	    Prodotto p3;
	    
	    while(iteratore.hasNext()){	    	
	    	p1=iteratore.next();	    		    		    
	    %>
	    
		    <tr>
		        <td>
		           <div class="container">
		           <img src="Immagini/Prodotti/<%=p1.getImmagine() %>" height="250px" width="250px" class="image">
		           <div class="overlay">
		            <div class="text"><%=p1.getSpecifiche() %></div> 
		           </div>
		        </div>
		        <h1><%=p1.getNome() %></h1>
		        <h2>Prezzo:<%=p1.getPrezzo_vendita()%>&#8364</h2>		        
		        <a href="AggiungiAlCarrello?id=<%=p1.getCodice() %>">add cart</a>		  
		        <a href="dettagli.jsp?id=<%=p1.getCodice() %>">dettagli</a>
		        </td>

		        		        
		        <% if(iteratore.hasNext()){
		    		p2=iteratore.next(); %>
		    	<td>
		             <div class="container">
		           <img src="Immagini/Prodotti/<%=p2.getImmagine() %>" height="250px" width="250px" class="image">
		           <div class="overlay">
		            <div class="text"><%=p2.getSpecifiche() %></div> 
		           </div>
		        </div>
		        <h1><%=p2.getNome() %></h1>
		        <h2>Prezzo:<%=p2.getPrezzo_vendita()%>&#8364</h2>
		      	<a href="AggiungiAlCarrello?id=<%=p2.getCodice() %>">add cart</a>		        
		        <a href="dettagli.jsp?id=<%=p2.getCodice() %>">dettagli</a>
		        </td>
				
				
				<%if(iteratore.hasNext()){
		    		p3=iteratore.next(); %>
		    	<td>
		             <div class="container">
		           <img src="Immagini/Prodotti/<%=p3.getImmagine() %>" height="250px" width="250px" class="image">
		           <div class="overlay">
		            <div class="text"><%=p3.getSpecifiche() %></div> 
		           </div>
		        </div>
		        <h1><%=p3.getNome() %></h1>
		        <h2>Prezzo:<%=p3.getPrezzo_vendita()%>&#8364</h2>	       
		        <a href="AggiungiAlCarrello?id=<%=p3.getCodice() %>">add cart</a>		        
		        <a href="dettagli.jsp?id=<%=p3.getCodice() %>">dettagli</a>
		        </td>
		    </tr>
		    
		    
		<%	}	
		   }
	    }
	}				    				
%>		</tbody>
	</table>
        </div>
</section>
<!-- -------------------------------------------------inclusione footer------------------------------------------------------------------------------------------------ -->
<%@include file="include/footer.jsp" %>
<!-- -------------------------------------------------fine inclusione------------------------------------------------------------------------------------------------ -->
</body>
</html>