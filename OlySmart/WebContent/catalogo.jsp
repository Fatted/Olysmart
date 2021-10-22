<%@page import="model.*" %>
<%@page import="control.*" %>
<%@page import="java.util.List" %>

<% 

ProdottoDAO prod= new ProdottoDAO();
List<Prodotto> prodotti=prod.getAllProducts();

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
            <div class="bottone-ricerca">  
              <div class="search-box-avanzato">
                  <input type="text" class="search-txt" placeholder="Trova...">
                  <a class="search-btn" href="#">
                    <i class="fa fa-search" aria-hidden="true"></i>
                  </a>
             </div>
            </div>
        </div>
    <div class="ultimo">
     <div class="accesso">
     
     <%
          
          Cliente cliente= (Cliente) request.getSession().getAttribute("cliente");
               if(cliente!=null){
               	request.setAttribute("cliente", cliente);
               }
          %>
     
        <%if(cliente == null){%>
        	<div class="registra"> <a href="register.jsp">Registrati</a> </div>
            <div class="accedi"> <a href="login.jsp">Accedi</a> </div>
        <%}else{%>
        	 <div class="logout"> <a href="ServletLogout">Logout</a> </div>
             <div class="image"><a href="carrello.jsp"><img src="carella.png"></a></div>
             
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
             <li> <a href="#">
                <i class="fas fa-home"></i>
            <span class="link_name">Home</span>
        </a>
        </li>
        <li> <a href="catalogo.jsp">
            <i class="fas fa-list"></i>
         <span class="link_name">Catalogo</span>
          </a>
        </li>
         <li>
            <div class="icon-link">
             <a class="link_name" href="#">
             <i class="fas fa-laptop"></i>
              <span class="link_name">Notebook</span>
              </a>
              <i class="fas fa-chevron-right arrow"></i>
           </div>
           <ul class="sub-menu">
            <li><a href="#">HP</a></li>
           </ul>
        </li>
        <li>
            <div class="icon-link">
             <a  class="link_name" href="#">
                <i class="fas fa-gamepad"></i>
              <span class="link_name">Gaming</span>
              </a>
              <i class="fas fa-chevron-right arrow"></i>
           </div>
           <ul class="sub-menu">
            <li><a href="#">Console</a></li>
            <li><a href="#">Giochi</a></li>
            <li><a href="#">Controller</a></li>
           </ul>
        </li>
        <li>
            <div class="icon-link">
             <a class="link_name" href="#">
                <i class="fas fa-tablet"></i>
              <span class="link_name">Tablet</span>
              </a>
              <i class="fas fa-chevron-right arrow"></i>
           </div>
           <ul class="sub-menu">
            <li><a href="#">Apple</a></li>
            <li><a href="#">Samsung</a></li>
            <li><a href="#">Huawei</a></li>
           </ul>
        </li>
        <li>
            <div class="icon-link">
             <a class="link_name" href="#">
                <i class="fas fa-mobile-alt"></i>
              <span class="link_name">Smartphone</span>
              </a>
              <i class="fas fa-chevron-right arrow"></i>
           </div>
           <ul class="sub-menu">
            <li><a href="#">Apple</a></li>
            <li><a href="#">Samsung</a></li>
            <li><a href="#">Huawei</a></li>
            <li><a href="#">Xiaomi</a></li>
            <li><a href="#">Oppo</a></li>
           </ul>
        </li>
        <li>
            <div class="icon-link">
             <a class="link_name" href="#">
                <i class="fas fa-tv"></i>
              <span class="link_name">Tv</span>
              </a>
              <i class="fas fa-chevron-right arrow"></i>
           </div>
           <ul class="sub-menu">
            <li><a href="#">Lg</a></li>
            <li><a href="#">Samsung</a></li>
           </ul>
        </li>
        <li>
            <div class="icon-link">
             <a class="link_name" href="#">
                <i class="fas fa-headset"></i>
              <span class="link_name">Cuffie</span>
              </a>
              <i class="fas fa-chevron-right arrow"></i>
           </div>
           <ul class="sub-menu">
            <li><a  href="#">Gaming</a></li>
            <li><a  href="#">Wireless</a></li>
            <li><a  href="#">Apple</a></li>
           </ul>
        </li>
        <li>
            <div class="icon-link">
             <a class="link_name" href="#">
                <i class="fab fa-usb"></i>
              <span class="link_name">Accessori</span>
              </a>
              <i class="fas fa-chevron-right arrow"></i>
           </div>
           <ul class="sub-menu">
            <li><a href="#">Cover</a></li>
            <li><a href="#">Smartwatch</a></li>
            <li><a href="#">Casse bluetooth</a></li>
            <li><a href="#">Caricatori</a></li>
            <li><a href="#">Smartwatch case</a></li>
           </ul>
        </li>
        <li>
            <div class="icon-link">
             <a class="link_name" href="#">
                <i class="fas fa-wrench"></i>
              <span class="link_name">Servizi</span>
              </a>
              <i class="fas fa-chevron-right arrow"></i>
           </div>
           <ul class="sub-menu">
            <li><a href="#">Riparazioni</a></li>
            <li><a href="#">Assistenza</a></li>
            <li><a href="#">Promozioni telefoniche</a></li>
            <li><a href="#">Pellicole</a></li>
           </ul>
        </li>
        </ul>
        </div>
     </section>

     

<section id="piuvenduti">
    <p>Catalogo</p>

<%
	if(!prodotti.isEmpty()){
		
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
		        <a href="AggiungiAlCarrello?id=<%=p.getCodice() %>">add cart</a>
		        <a href="buy now">buy now</a>
		        <a href="dettagli">dettagli</a>
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