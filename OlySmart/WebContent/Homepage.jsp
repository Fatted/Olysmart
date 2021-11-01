<%@page import="model.*" %>
<%@page import="control.*" %>
<%@page import="java.util.*" %>

<% 

ProdottoDAO prod= new ProdottoDAO();
List<Prodotto> prodotti=prod.getAllProducts();

List<Prodotto> prodottiSaldo=prod.getAllProductsForSconto();

CategoriaDAO cat=new CategoriaDAO();
List<Categoria> categorialista=cat.getCategorie();




Cliente cliente= (Cliente) request.getSession().getAttribute("cliente-corrente");
     if(cliente!=null){
     	request.setAttribute("cliente-corrente", cliente);
     }

     
     ArrayList<Carrello> prodotti_carrello=(ArrayList<Carrello>)session.getAttribute("listacarrello");
     List<Carrello> prodottocarrello=null;
     if(prodotti_carrello!=null){
   	 ProdottoDAO prodotto=new ProdottoDAO();
     	 prodottocarrello=prodotto.getProdottiCarrello(prodotti_carrello);
     	 request.setAttribute("prodotti_carrello",prodotti_carrello);
      }

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
 
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
            
            <!-- barra di ricerca -->
            <form action="Ricerca" method="post">
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
             <i><img src="Immagini/Categorie/<%=categoria.getNome() %>.svg" width="20" height="21"></i>
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

        <div class="slider">
                <div class="content">
                <div class="images">
                   <img src="Img1.jpg">
                    <img src="Img2.jpg">
                    <img src="Img3.jpg">
                    <img src="Img 4.jpg">
                    <img src="img5.jpg">
        
                </div>
                <div onclick="side_slide(-1)" class="slide left">
                    <span class="fas fa-angle-left"></span>
                </div>
                <div onclick="side_slide(1)" class="slide right">
                    <span class="fas fa-angle-right"></span>
                </div>
                <div class="btn-sliders">
                    <span onclick="btn_slide(1)"></span>
                    <span onclick="btn_slide(2)"></span>
                    <span onclick="btn_slide(3)"></span>
                    <span onclick="btn_slide(4)"></span>
                    <span onclick="btn_slide(5)"></span>
                </div>
            </div>
            <script>
              var indexValue=1;
              showImg(indexValue);
              function btn_slide(e){ showImg(indexValue = e);}
              function side_slide(e){ showImg(indexValue += e);}
              function showImg(e){
                  var i;
                  const img = document.querySelectorAll('.images img');
                  const sliders = document.querySelectorAll('.btn-sliders span');
                  if (e>5) {
                      indexValue =  1;
                  }
                  if (e<1){
                      indexValue = 5;
                  }
                  for(i=0 ; i< 5 ; i++){
                    img[i].style.display ="none";
                  }
                  for(i=0 ; i< 5 ; i++){
                    sliders[i].style.background="#ffde49";
                  }
                  img[indexValue-1].style.display ="block";
                  sliders[indexValue-1].style.background="white";
              }
            </script>
        </div>
     <div class="foto">
         <div class="img1">
             <a href="#">
                 <figure><img src="immg1.jpeg"></figure>
                 
             </a>
         </div>
        
         <div class="img2">
            <a href="#">
               <figure> <img src="s1.png"> </figure>
            </a>   
         </div>
     </div>
</section>

     

<section id="piuvenduti">
    <p>Prodotti in offerta</p>
<table>
    <div class="prodpiuvend">
 <%		
	    Iterator<Prodotto> iteratore=prodottiSaldo.iterator();
	    Prodotto p1;
	    Prodotto p2;
	    Prodotto p3;
	    Prodotto p4;
	    
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
		        <%if(cliente!=null){%>
		        <a href="AggiungiAlCarrello?id=<%=p1.getCodice() %>">add cart</a>
		        <%}else{%>
		        <a href="login.jsp">Accedi per inserire nel carrello</a>
		        <%}%>
		        <a href="dettagli.jsp">dettagli</a>
		        </td>

		        <td>
		        
		        <% if(iteratore.hasNext()){
		    		p2=iteratore.next(); %>
		             <div class="container">
		           <img src="Immagini/Prodotti/<%=p2.getImmagine() %>" height="250px" width="250px" class="image">
		           <div class="overlay">
		            <div class="text"><%=p2.getSpecifiche() %></div> 
		           </div>
		        </div>
		        <h1><%=p2.getNome() %></h1>
		        <h2>Prezzo:<%=p2.getPrezzo_vendita()%>&#8364</h2>
		        <%if(cliente!=null){%>
		        <a href="AggiungiAlCarrello?id=<%=p2.getCodice() %>">add cart</a>
		        <%}else{%>
		        <a href="login.jsp">Accedi per inserire nel carrello</a>
		        <%}%>
		        <a href="dettagli.jsp">dettagli</a>
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
		        <%if(cliente!=null){%>
		        <a href="AggiungiAlCarrello?id=<%=p3.getCodice() %>">add cart</a>
		        <%}else{%>
		        <a href="login.jsp">Accedi per inserire nel carrello</a>
		        <%}%>
		        <a href="dettagli.jsp">dettagli</a>
		        </td>
		    
		    <%if(iteratore.hasNext()){
		    		p4=iteratore.next(); %>
		        <td>
		             <div class="container">
		           <img src="Immagini/Prodotti/<%=p4.getImmagine() %>" height="250px" width="250px" class="image">
		           <div class="overlay">
		            <div class="text"><%=p4.getSpecifiche() %></div> 
		           </div>
		        </div>
		        <h1><%=p4.getNome() %></h1>
		        <h2>Prezzo:<%=p4.getPrezzo_vendita()%>&#8364</h2>
		        <%if(cliente!=null){%>
		        <a href="AggiungiAlCarrello?id=<%=p4.getCodice() %>">add cart</a>
		        <%}else{%>
		        <a href="login.jsp">Accedi per inserire nel carrello</a>
		        <%}%>
		        <a href="dettagli.jsp">dettagli</a>
		        </td>
		    </tr>
		<%	
		    		}
		    	}
			}		    	
	    }			
%>
</div>
</table>
</section>

<section id="nuoviarrivi">
    <p> Nuovi arrivi</p>
    <table>
        <div class="nuoviarr">
        <tr>
            <td>
                 <div class="container">
               <img src="pv1.jpeg" height="250px" width="250px" class="image">
               <div class="overlay">
                <div class="text">Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusamus vero ea ad iure, perferendis blanditiis?</div> 
               </div>
            </div>
            <h1>Nome Prodotto</h1>
            </td>
            <td>
             <div class="container">
                <img src="pv1.jpeg" height="250px" width="250px" class="image">
                <div class="overlay">
                    <div class="text"> Descrizione del Prodotto</div>
                </div>
             </div>
             <h1>Nome Prodotto</h1>
            </td>
            <td>
                <div class="container">
               <img src="pv1.jpeg" height="250px" width="250px" class="image">
               <div class="overlay">
            <div class="text"> Descrizione del Prodotto</div>
                </div>  
              </div>
              <h1>Nome Prodotto</h1>
            </td>
            <td>
                <div class="container">
                <img src="pv1.jpeg" height="250px" width="250px" class="image">
                <div class="overlay">
                    <div class="text">Descrizione del Prodotto</div>
                   </div>
            </div>
            <h1>Nome Prodotto</h1>
            </td>
        </tr>
    </div>
    </table>   

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