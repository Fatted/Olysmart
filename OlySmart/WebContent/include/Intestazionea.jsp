<%@page import="model.*" %>
<%@page import="control.*" %>
<%@page import="java.util.*" %>

<!-- ----------------------------------intestazione con bottone ricerca pagine (home, catalogo, dettagli)------------------------------------------------------------------------------------------------ -->
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
    <form action="Ricerca" method="post"><!-- usiamo la servlet ricerva per il nome passato nel input text con nome seatch -->
            <div class="bottone-ricerca">                           
              <div class="search-box-avanzato">        
                  <input type="text" class="search-txt" name="search" placeholder="Cerca prodotto">
                  <button class="search-btn"  type="submit">
                    <i class="fa fa-search" aria-hidden="true"></i>
                  </button>
                  </div>
           		 </div>           		
               </form>
<!------------------------------------------- fine barra ----------------------------------------------------------------------------------------------->                 
</div>
    <div class="ultimo">
     <div class="accesso">

      <!-------------------------------------------controlliamo se il cliente ha fatto l'accesso ------------------------------------------------------------->    
 <!-- Se il cliente non ha fatto l'accesso uscirà solo (accedi e registrati)se ha fatto l'accesso uscirà (logout,ordini,carrello e il suo account  -->
         <%if(cliente == null){%>
        	<div class="registra"> <a href="register.jsp">Registrati</a> </div>
            <div class="accedi"> <a href="login.jsp">Accedi</a> </div>
        <%}else{%>
<!------------------------------------------- se è un admin andrà nella sua pagina dedicata --------------------------------------------------------------->
        	 
                
        <%if(cliente.getTipo().equals("admin")){%>
        		<br><div class="pdg"> <a href="paginaAdmin.jsp">Pagina di Gestione</a></div>
        		<div class="ladmin"> <a href="ServletLogout">Logout</a></div>
<!-- Se il cliente ha fatto l'accesso uscirà (logout,ordini,carrello e il suo account  -->
 
        <%}else {%>	 
        	<div class="Myaccount">Utente: <a href="Myaccount.jsp"> <%=cliente.getUsername() %></a></div>      
        	 <div class="logout"> <a href="ServletLogout">Logout</a></div>
        
        	 <div class="cartimage"><a href="carrello.jsp"><img src="Immagini/carella.png"></a></div>
        	
	              
      <%}}%>

     </div>
<!-- --------------------------------------------------fine cliente---------------------------------------------------------------------------------------------- -->
     <div class="loghi">
           <div class ="imgl1"> 
                <a href="https://instagram.com/_olysmart_?utm_medium=copy_link"><img src="Immagini/ig.png" ></a>
           </div>
              <div class ="imgl2">
              <a href="https://www.facebook.com/olyacciardo"><img src="Immagini/fb.png"></a> 
              </div>
               <div class ="imgl3">    
                <a href=https://tinyurl.com/IndirizzoNegozio><img src="Immagini/placeholder.png"></a>
                </div>     
     </div>
    </div>
    </div>
</section>