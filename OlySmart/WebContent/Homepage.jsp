<%@page import="model.*" %>
<%@page import="control.*" %>
<%@page import="java.util.*" %>

<% 

ProdottoDAO prod= new ProdottoDAO();
List<Prodotto> prodotti=prod.getAllProducts(); //la lista prodotti contiene tutti i prodotti presenti nel database presi con il metodo getAllProduct nel prodottoDAO

List<Prodotto> prodottiSaldo=prod.getAllProductsForSconto();//la lista prodottiSaldo contiene tutti i prodotti che nel db hanno il 'si' in sconto,usando il metodo getAllProductForSconto che è in prodottoDAO

List<Prodotto> prodottiBarraLaterale=prod.getAllProducts();	//lista usata per tenere sempre la barra attiva contenente tutti i prodotti disponibili nel db con il metodo getallproduct del prodotto DAO

CategoriaDAO cat=new CategoriaDAO();
List<Categoria> categorialista=cat.getCategorie(); //la lista delle categorie comprende tutte le categorie presenti nel db che prendiamo con il metodo getCategorie in CategorieDAO



//controlliamo la sessione attuale del cliente
Cliente cliente= (Cliente) request.getSession().getAttribute("cliente-corrente");
     if(cliente!=null){ //se la sessione non è vuota settiamo il cliente
     	request.setAttribute("cliente-corrente", cliente);//settiamo il nuovo cliente
     }

     
     //la lista carrello contiene il carrello della sessione corrente del determinato cliente
     ArrayList<Carrello> prodotti_carrello=(ArrayList<Carrello>)session.getAttribute("listacarrello");
     List<Carrello> prodottocarrello=null; //creiamo una lista di elementi carrello contenente successivamente i prodotti nel carrello
     if(prodotti_carrello!=null){//se vengono inseriti i prodotti nel carrello
   	 ProdottoDAO prodotto=new ProdottoDAO();//creiamo un nuovo ProdottoDAO che ci servirà per prendere i prodotti inseriti nel carrello
     	 prodottocarrello=prodotto.getProdottiCarrello(prodotti_carrello);//la lista prodottocarrello conterrà i prodotti inseriti nel carrello dati tramite la getProdottiCarrello passandogli prodotti_carrello contenetnte gli attributi di listacarrello
     	 request.setAttribute("prodotti_carrello",prodotti_carrello);//settiamo i prodotti nel carrello
      }

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
 
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="https://kit.fontawesome.com/12aebee45b.js"></script>
    <link rel="stylesheet" href="CSS/Homepage.css">
    <link rel="stylesheet" href="CSS/Footer.css">
    <link rel="stylesheet" href="CSS/NavbarTOP.css">
    <link rel="stylesheet" href="CSS/BottoneDiRicerca.css">
    <link rel="stylesheet" href="CSS/CatalogoResponsiveTable.css">
<title>OlySmartWeb Homepage</title>
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
            <div class="cartimage"><a href="carrello.jsp"><img src="Immagini/carello.png"></a></div><br>
        <%}else{%>
        	<p>Utente:<%=cliente.getUsername() %></p>      
        	 <div class="logout"> <a href="ServletLogout">Logout</a></div><br>
        	 <div class="Myorder"> <a href="MyOrder.jsp">Miei ordini</a></div><br>
        	 <div class="cartimage"><a href="carrello.jsp"><img src="Immagini/carello.png"></a></div><br>
        	 <div class="Myaccount"> <a href="MyAccount.jsp">Il mio account</a></div><br>
        	 <div class="Myaccount"> <a href="MyRecensioni.jsp">Le mie recensioni</a></div><br>
<!------------------------------------------- se è un admin andrà nella sua pagina dedicata --------------------------------------------------------------->
        	 <%if(cliente.getTipo().equals("admin")){%>
        		<br><div> <a href="paginaAdmin.jsp">Pagina Gestione</a></div>
        <%}%>	       	              
      <%}%>
     </div>
<!-- --------------------------------------------------fine cliente-------------------------------------------------------------------------------------- -->
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
<!-- ------------------------------------------------------------------------------------------------------------------------------------------------- -->
<!-- -------------------------------------------------Slider immagini homepage------------------------------------------------------------------------ -->
<section id="menu">
        <div class="slider">
                <div class="content">
                <div class="images">
                   <img src="Immagini/img1.jpg">
                    <img src="Immagini/img2.jpg">
                    <img src="Immagini/img3.jpg">
                    <img src="Immagini/img4.jpg">
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
                 <figure> <img src="Immagini/imgg1.jpg"></figure>
                 
             </a>
         </div>
        
         <div class="img2">
            <a href="#">
               <figure> <img src="Immagini/imgg2.jpg"> </figure>
            </a>   
         </div>
     </div>
</section>
<!-- -------------------------------------------------fine slider------------------------------------------------------------------------------------------------ -->
     
<!-- -------------------------------------------------prodotto più venduti con iteratore------------------------------------------------------------------------------------------------ -->
<section id="piuvenduti">
    <p>Prodotti in offerta</p>
    <div class="prodpiuvend">
<table>
    
 <%		
 //uso un iteratore per selezionare i prodotti messi di lato uno dopo l'altro andando a capo ogni 4 prodotti
 //i prodotti selezionati sono i prodotti che hanno il valore "si" nella colonna saldo del db
	    Iterator<Prodotto> iteratore=prodottiSaldo.iterator();//prodottiSaldo è già stato dichiarato anche sopra proprio per selezionare quei prodotti nel db
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
		        <a href="AggiungiAlCarrello?id=<%=p1.getCodice() %>">add cart</a>		       
		        <a href="dettagli.jsp?id=<%=p1.getCodice() %>">dettagli</a>
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
		        <a href="AggiungiAlCarrello?id=<%=p4.getCodice() %>">add cart</a>		       
		        <a href="dettagli.jsp?id=<%=p4.getCodice() %>">dettagli</a>
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
<!-- -------------------------------------------------fine prodotti più venduti------------------------------------------------------------------------------------------------ -->

<!-- -------------------------------------------------inclusione footer------------------------------------------------------------------------------------------------ -->
<%@include file="include/footer.jsp" %>
<!-- -------------------------------------------------fine inclusione------------------------------------------------------------------------------------------------ -->
</body>
</html>