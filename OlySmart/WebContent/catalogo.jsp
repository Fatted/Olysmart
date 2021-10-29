<%@page import="model.*" %>
<%@page import="control.*" %>
<%@page import="java.util.*" %>

<% 

String trovacategoria=request.getParameter("Categoria");
String trovaMarca=request.getParameter("ProdottoMarca");
String trovaBarra=request.getParameter("search");

ProdottoDAO prod= new ProdottoDAO();
String trova;
String trovamarca;
String trovabarra;

List<Prodotto> prodotti=null;

if(trovaBarra!=null && trovacategoria==null && trovaMarca==null){
	trovabarra=trovaBarra;
	prodotti=prod.getAllProductsForNome(trovabarra);
}else if(trovacategoria.equals("all")){
	prodotti=prod.getAllProducts();
}else if(!trovacategoria.equals("all") && trovaMarca==null){
	trova=trovacategoria;
	prodotti=prod.getAllProductsForCategory(trova);
}else if(!trovacategoria.equals("all") && trovaMarca!=null){
	trova=trovacategoria;
	trovamarca=trovaMarca;
	prodotti=prod.getAllProductsForCategoryAndMarca(trova,trovamarca);	
}



CategoriaDAO cat=new CategoriaDAO();
List<Categoria> categorialista=cat.getCategorie();

Cliente cliente= (Cliente) request.getSession().getAttribute("cliente-corrente");
if(cliente!=null){
	request.setAttribute("cliente-corrente", cliente);
}

%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="https://kit.fontawesome.com/12aebee45b.js"></script>
    <link rel="stylesheet" href="CSS/style.css">
    <link rel="stylesheet" media="screen and (max-width:4096px) (min-width:1024px)" href="CSS/large.css">
    <link rel="stylesheet" media="screen and (max-width:500px)" href="CSS/mobile.css">
<title>OlySmartWeb</title>
</head>


<body>
    <section id="intestazione">
        <div class="mobile-container">
            <div class="topnav">
              <a href="#home" class="active">Logo</a>
              <div id="myLinks">
                <a href="#news">News</a>
                <a href="#contact">Contact</a>
                <a href="#about">About</a>
              </div>
              <a href="javascript:void(0);" class="icon" onclick="myFunction()">
                <i class="fa fa-bars"></i>
              </a>
            </div>
            </div>
            
            <script>
            function myFunction() {
              var x = document.getElementById("myLinks");
              if (x.style.display === "block") {
                x.style.display = "none";
              } else {
                x.style.display = "block";
              }
            }
            </script>
            
     <div class="container">
         <div class="image">
            <a href="Homepage.jsp"> 
                <img src="logonero.png" class="logo">
            </a> 
         </div>
        <div class="testo"><h1>OlySmart</h1>
            <script src="https://use.fontawesome.com/d8805b6d62.js"></script>
            <script src="https://use.fontawesome.com/relases/v5.0.6/js/all.js"></script>
            <form action="Ricerca" method="post">
            
            <!-- barra di ricerca -->
            <div class="bottone-ricerca">                           
              <div class="search-box-avanzato">        
                  <input type="text" class="search-txt" name="search" placeholder="Cerca prodotto">
                  <button class="search-btn"  type="submit">
                    <i class="fa fa-search" aria-hidden="true"></i>
                  </button>
                  </div>
           		 </div>           		
               </form>
               
        </div>
    <div class="ultimo">
     <div class="accesso">

     
         <%if(cliente == null){%>
        	<div class="registra"> <a href="register.jsp">Registrati</a> </div>
            <div class="accedi"> <a href="login.jsp">Accedi</a> </div>
        <%}else{%>
        	<p>Utente:<%=cliente.getUsername() %></p>      
        	 <div class="logout"> <a href="ServletLogout">Logout</a></div><br>
        	 <div class="My order"> <a href="#mieiordini">Miei ordini</a></div><br>
        	 <div class="image"><a href="carrello.jsp"><img src="carella.png"></a></div><br>
        	 <div class="My account"> <a href="#mioaccount">il mio account</a></div><br>

        	 <%if(cliente.getTipo().equals("admin")){%>
        		<br><div> <a href="paginaAdmin.jsp">Pagina Gestione</a></div>
        <%}%>	 
        	              
      <%}%>

     </div>
     <div class="loghi">
            
                <a href=><img src="insta.png"></a>
                <a href=><img src="FBlogo.png"></a>    
                <a href=https://tinyurl.com/IndirizzoNegozio><img src="geo.png"></a>     
     </div>
    </div>
</section>

<section id="menu">
         <div class="sidebar close">
             <ul class="nav-links">
             <li> <a href="Homepage.jsp">
                <i class="fas fa-home"></i>
            <span class="link_name">Home</span>
        </a>
        </li>
        <li> <a href="catalogo.jsp?Categoria=all">
            <i class="fas fa-list"></i>
         <span class="link_name">Catalogo</span>
          </a>
        </li>
        
     <%
		for(Categoria categoria:categorialista){
		%>
         <li>
            <div class="icon-link">
             <a class="link_name" href="catalogo.jsp?Categoria=<%=categoria.getNome() %>">
             <i class="fas fa-laptop"></i>
              <span class="link_name"><%=categoria.getNome() %></span>
              </a>
              <i class="fas fa-chevron-right arrow"></i>
           </div>
            <ul class="sub-menu">
           <% 
           List<String> listanonduplicata=new ArrayList<>();
           List<String> lista=new ArrayList<>();
           
           for(Prodotto p:prodotti){
        	   if(p.getTipo().equalsIgnoreCase(categoria.getNome())){
        		   lista.add(p.getMarca());
        	   }
           }
           
        		   for(String parola:lista){
        			   if(!listanonduplicata.contains(parola)){listanonduplicata.add(parola); }    
        		   }
        		   
        		   for(String stampa:listanonduplicata){
			%>
					
            <li><a href="catalogo.jsp?Categoria=<%=categoria.getNome()%>&ProdottoMarca=<%=stampa %>"><%=stampa %></a></li>
            <% 		   
        		  } %>
           </ul>
       <%}%>
        </li>
        </div>
</section>
   
<section id="piuvenduti">
    <p>Catalogo</p>

<%
if(prodotti.size()==0){%>
	<p>Nessun prodotto disponibile al momento...</p>
<%}%>

	<%if(!prodotti.isEmpty()){
		
		for(Prodotto p:prodotti){%>
		
			<table>
		    <div class="prodpiuvend">
		    <tr>
		        <td>
		             <div class="container">
		           <img src="Immagini/Prodotti/<%=p.getImmagine() %>" height="250px" width="250px" class="image">
		           <div class="overlay">
		            <div class="text"><%=p.getSpecifiche() %></div> 
		           </div>
		        </div>
		        <h1><%=p.getNome() %></h1>
		        <h2>Prezzo:<%=p.getPrezzo_vendita()%>&#8364</h2>
		        <%if(cliente!=null){%>
		        <a href="AggiungiAlCarrello?id=<%=p.getCodice() %>">add cart</a>
		        <%}else{%>
		        <a href="login.jsp">Accedi per inserire nel carrello</a>
		        <%}%>
		        <a href="dettagli.jsp">dettagli</a>
		        </td>
		    </tr>
		</div>
	</table>
		<%
		}		
	}
%>

</section>


<footer id="footer">
    <p>Olysmart &copy; 2021, All rights reserved<p>
    <p>Via napoli 310 81058 Vairano Patenora, Campania</p>
    <p>0823 988020</p>
    <p>olysmartvairano@gmail.com</p>
    <p>Powered by D'Amato Antonio, D'Amato Ludovica, Dello Buono Piero</p>
    </footer>
</body>
</html>