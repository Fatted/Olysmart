
<%@page import="model.*" %>
<%@page import="control.*" %>
<%@page import="java.util.*" %>
     
      <%
       
      //controlliamo la sessione attuale del cliente
      Cliente cliente= (Cliente) request.getSession().getAttribute("cliente-corrente");
      if(cliente!=null){
      	request.setAttribute("cliente-corrente", cliente);
      }
      
      CategoriaDAO cat=new CategoriaDAO();
      List<Categoria> categorialista=cat.getCategorie(); //la lista delle categorie comprende tutte le categorie presenti nel db che prendiamo con il metodo getCategorie in CategorieDAO
      
      ProdottoDAO prod= new ProdottoDAO();
      List<Prodotto> prodottiBarraLaterale=prod.getAllProducts();	//lista usata per tenere sempre la barra attiva contenente tutti i prodotti disponibili nel db con il metodo getallproduct del prodotto DAO

      //prendiao gli attributi dei prodotti nel carrello
      ArrayList<Carrello> prodotti_carrello=(ArrayList<Carrello>)session.getAttribute("listacarrello");
      List<Carrello> prodottocarrello=null;
      
      double totale=0;
      
      if(prodotti_carrello!=null){//se il carrello non è vuoto
    	 ProdottoDAO prodotto=new ProdottoDAO();
    	 
    	 totale=prodotto.getTotaleCarrello(prodotti_carrello);//il totale è dato da tutti i prodotti presenti nel carrello,usando il metodo getTotaleCarrello
    	 
      	 prodottocarrello=prodotto.getProdottiCarrello(prodotti_carrello);//prodotto carrello contiene tutti i prodotti nel carrello
      	 
      	 request.setAttribute("prodotti_carrello",prodotti_carrello);//settiamo i prodotti nel carrello
      	 
      	request.setAttribute("totale",totale);//settiamo il totale
       }
      
      
           %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="CSS/NavbarTOP.css">
    <link rel="stylesheet" href="CSS/carrelloCSS.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>

    
    <link rel="stylesheet" media="screen and (max-width:2561px)" href="CSS/cart.css">
    <link rel="stylesheet" media="screen and (max-width:1441px)" href="CSS/cart.css">
    <link rel="stylesheet" media="screen and (max-width:1025px)" href="CSS/Laptop.css">
    <link rel="stylesheet" media="screen and (max-width:769px)" href="CSS/Tablet.css">
    <link rel="stylesheet" media="screen and (max-width:426px)" href="CSS/mobile.css">
<title>Carrello</title>
</head>

<body>

<!-- -------------------------------------------------inclusione intestazione------------------------------------------------------------------------------------------------ -->

 <%@include file="include/Intestazioneb.jsp" %>
     
<!-- ------------------------------------------------- fine inclusione intestazione------------------------------------------------------------------------------------------------ -->

<!-- -------------------------------------------------inclusione navbar------------------------------------------------------------------------------------------------ -->

 <%@include file="include/navbar.jsp" %>
     
<!-- ------------------------------------------------- fine inclusione navbar------------------------------------------------------------------------------------------------ -->




<!-- se il cliente non ha fatto il login può inserire i prodotti nel carrello però dovrà accedere per fare il pagamento e la conferma dell'ordine -->
	<%if(cliente==null){ %>
	<p>Accedi per poter procedere al pagamento del tuo carrello</p>
	<%}else{ %>
	
	<div class="Cart-Container">
	<div class="Header">
 		<h3 class="Heading">Carrello di: <%=cliente.getUsername() %></h3>
 	</div>
    <%} %>
    <%@include file="CSS/messaggioRegistrazione.jsp"%>
    
    
    <%
        if(prodotti_carrello!=null){
        	//for each dei prodotti presenti nel carrello per stampare i loro valori
                	for(Carrello carrello:prodottocarrello){
        %>
    
    <div class="Cart-Items">
 		<div class="about">
 			<h1 class="title"><%=carrello.getNome()%></h1>
 				<img src="Immagini/Prodotti/<%=carrello.getImmagine()%>" class="imgprod">
 		</div>
 		
 	</div>
    	
   
                      <%//controlliamo se la quantità selezionata non è maggiore della quantità disponibile del prodotto
                      if(carrello.getQuantita()<carrello.getNumero_pezzi_disponibili()){%>
                
       
                <form action="" method="post" style="align: center">
                
                <div class="counter">
                <div class="button"><a href="AumentaDiminuisciQuantitàCarrello?action=diminuisci&id=<%=carrello.getCodice()%>">-</a></div>
                <div class="count"><%=carrello.getQuantita()%></div>
               	<div class="button"><a href="AumentaDiminuisciQuantitàCarrello?action=aumenta&id=<%=carrello.getCodice()%>">+</a></div> 
               	 
                 <%//se siamo arrivati alal quantità massima disponibile esce la scritta MAX e può solo decrementare la quantità
                		} else{%>
                		<div class="counter">
                <div class="button"><a href="AumentaDiminuisciQuantitàCarrello?action=diminuisci&id=<%=carrello.getCodice()%>">-</a></div>
                <div class="count">MAX</div>
                		<%} %>
                		</div>
                		</div>
                  </form> 
                		
 	
 				
               
    
   	 <div class="prices">
 		<div class="amount"><%=carrello.getPrezzo_vendita() %></div>
 		<div class="remove"><a href="RimozioneProdottiCarrello?id=<%=carrello.getCodice() %>"><u>Remove</u></a></div>
 	</div>
 	<%}
        	}
        	%>
 	<br>
 	<hr> 
 		<div class="checkout">
 		<div class="total">
 		<div class="total-amount">Totale: <%=totale %>&euro; </div>

 		
 		
 			<%if(totale==0){ %>
   		<p>Nessun prodotto inserito</p><!-- stampiamo in caso non ci sono prodotti nel carrello -->
			<%}%>
	
		<%if(cliente!=null && totale > 0){ %>
		<a href="ordine.jsp"><button>Procedi all'ordine</button></a>	
		<%}else if(cliente == null){%>
		<a href="login.jsp"><button>Accedi per poter procedere all'ordine</button></a>
		<%} %>
    

</div>
</div>
</div>

<!-- -------------------------------------------------inclusione footer------------------------------------------------------------------------------------------------ -->

 <%@include file="include/footer.jsp" %>
     
<!-- ----------------------------------------------- fine inclusione footer------------------------------------------------------------------------------------------------ -->
 

</body>
</html>