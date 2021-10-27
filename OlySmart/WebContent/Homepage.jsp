<%@page import="model.*" %>
<%@page import="control.*" %>
<%@page import="java.util.*" %>

<% 

ProdottoDAO prod= new ProdottoDAO();
List<Prodotto> prodotti=prod.getAllProducts();

CategoriaDAO cat=new CategoriaDAO();
List<Categoria> categorialista=cat.getCategorie();

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
          
          Cliente cliente= (Cliente) request.getSession().getAttribute("cliente-corrente");
               if(cliente!=null){
               	request.setAttribute("cliente-corrente", cliente);
               }
          %>
     
        <%if(cliente == null){%>
        	<div class="registra"> <a href="register.jsp">Registrati</a> </div>
            <div class="accedi"> <a href="login.jsp">Accedi</a> </div>
        <%}else{%>
       
        	 <div class="logout"> <a href="ServletLogout">Logout</a></div><br>
        	 <%if(cliente.getTipo().equals("admin")){%>
        		<br><div> <a href="paginaAdmin.jsp">Pagina Gestione</a></div>
        <%}%>	 
        	 
             <div class="image"><a href="carrello.jsp"><img src="carella.png"></a></div><br>
             <p>Utente:<%=cliente.getUsername() %></p>
             
      <%}%>
        

     </div>
     <div class="loghi">
            
                <a href=><img src="insta.png"></a>
                <a href=><img src="FBlogo.png"></a>    
                <a href=https://tinyurl.com/IndirizzoNegozio><img src="geo.png"></a>     
     </div>
    </div>
</section>
     
<!-- Barra laterale -->     
<%@include file="include/BarraLaterale.jsp" %>

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
    <p>Prodotti più  acquistati </p>
<table>
    <div class="prodpiuvend">
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