<%@page import="model.*" %>
<%@page import="control.*" %>
<%@page import="java.util.*" %>

<%
//controlliamo la sessione attuale del cliente
Cliente cliente= (Cliente) request.getSession().getAttribute("cliente-corrente");
   if(cliente!=null){//se la sessione Ã¨ nuovala creiamo
   	request.setAttribute("cliente-corrente", cliente);//settiamo il nuovo cliente
 }
CategoriaDAO cat=new CategoriaDAO();
List<Categoria> categorialista=cat.getCategorie(); //la lista delle categorie comprende tutte le categorie presenti nel db che prendiamo con il metodo getCategorie in CategorieDAO

ProdottoDAO prod= new ProdottoDAO();
List<Prodotto> prodottiBarraLaterale=prod.getAllProducts();	//lista usata per tenere sempre la barra attiva contenente tutti i prodotti disponibili nel db con il metodo getallproduct del prodotto DAO

int id=Integer.parseInt(request.getParameter("id"));
ProdottoDAO prodottoDAO=new ProdottoDAO();


List<Prodotto> prodottolista=prodottoDAO.getProductsForCodice(id);

RecensioneDAO Recensione=new RecensioneDAO();
List<Recensione> recensioni=Recensione.recensioneProdotto(id);


%>


<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,model.Prodotto"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" media="screen and (max-width:2561px)" href="CSS/styledet.css">
    <link rel="stylesheet" media="screen and (max-width:1441px)" href="CSS/styledet.css">
    <link rel="stylesheet" media="screen and (max-width:1025px)" href="CSS/Laptop.css">
    <link rel="stylesheet" media="screen and (max-width:769px)" href="CSS/Tablet.css">
    <link rel="stylesheet" media="screen and (max-width:426px)" href="CSS/mobile.css">
    <!-- -------------------------------------------------------------SCRIPT LENTE E CSS---------------------------------------------------------- -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

<script>
function magnify(imgID, zoom) {
  var img, glass, w, h, bw;
  img = document.getElementById(imgID);
  /*create magnifier glass:*/
  glass = document.createElement("DIV");
  glass.setAttribute("class", "img-magnifier-glass");
  /*insert magnifier glass:*/
  img.parentElement.insertBefore(glass, img);
  /*set background properties for the magnifier glass:*/
  glass.style.backgroundImage = "url('" + img.src + "')";
  glass.style.backgroundRepeat = "no-repeat";
  glass.style.backgroundSize = (img.width * zoom) + "px " + (img.height * zoom) + "px";
  bw = 3;
  w = glass.offsetWidth / 2;
  h = glass.offsetHeight / 2;
  /*execute a function when someone moves the magnifier glass over the image:*/
  glass.addEventListener("mousemove", moveMagnifier);
  img.addEventListener("mousemove", moveMagnifier);
  /*and also for touch screens:*/
  glass.addEventListener("touchmove", moveMagnifier);
  img.addEventListener("touchmove", moveMagnifier);
  function moveMagnifier(e) {
    var pos, x, y;
    /*prevent any other actions that may occur when moving over the image*/
    e.preventDefault();
    /*get the cursor's x and y positions:*/
    pos = getCursorPos(e);
    x = pos.x;
    y = pos.y;
    /*prevent the magnifier glass from being positioned outside the image:*/
    if (x > img.width - (w / zoom)) {x = img.width - (w / zoom);}
    if (x < w / zoom) {x = w / zoom;}
    if (y > img.height - (h / zoom)) {y = img.height - (h / zoom);}
    if (y < h / zoom) {y = h / zoom;}
    /*set the position of the magnifier glass:*/
    glass.style.left = (x - w) + "px";
    glass.style.top = (y - h) + "px";
    /*display what the magnifier glass "sees":*/
    glass.style.backgroundPosition = "-" + ((x * zoom) - w + bw) + "px -" + ((y * zoom) - h + bw) + "px";
  }
  function getCursorPos(e) {
    var a, x = 0, y = 0;
    e = e || window.event;
    /*get the x and y positions of the image:*/
    a = img.getBoundingClientRect();
    /*calculate the cursor's x and y coordinates, relative to the image:*/
    x = e.pageX - a.left;
    y = e.pageY - a.top;
    /*consider any page scrolling:*/
    x = x - window.pageXOffset;
    y = y - window.pageYOffset;
    return {x : x, y : y};
  }
}
</script>
 <!-- -------------------------------------------------------------SCRIPT LENTE E CSS---------------------------------------------------------- -->    	
    
	<title>Dettagli</title>
</head>

<body>
<!-- -------------------------------------------------inclusione intestazione------------------------------------------------------------------------------------------------ -->

 <%@include file="include/Intestazionea.jsp" %>
     
<!-- ------------------------------------------------- fine inclusione intestazione------------------------------------------------------------------------------------------------ -->

<!-- -------------------------------------------------inclusione navbar------------------------------------------------------------------------------------------------ -->

 <%@include file="include/navbar.jsp" %>
     
<!-- ------------------------------------------------- fine inclusione navbar------------------------------------------------------------------------------------------------ -->



 	<section id="details">
	<% for(Prodotto prodotto:prodottolista){ %>
		<div class="left">
		    <div class="foto">	   
		  <img src="Immagini/Prodotti/<%=prodotto.getImmagine() %>" id="myimage">	  
		  </div>
			</div>
		<div class="right">
		<div class="nome">
			<h3><%=prodotto.getNome()%></h3>
			
			</div>
			<br>
			<div class="prezzo">
			<h3>Prezzo</h3>
			<p><%=prodotto.getPrezzo_vendita()%></p>
			</div>
			<br>
		<div class="dispo">
		<h4>Disponibilità</h4>
		<p><%=prodotto.getNumero_pezzi_disponibili()%></p>
		</div>
		<br>
		<div class="descr">
		<h3>Descrizione</h3>
		<p><%=prodotto.getDescrizione()%></p>
		</div>
		<br>
		<div class="addcart">
		  <a href="AggiungiAlCarrello?id=<%=prodotto.getCodice() %>">Aggiungi al carrello</a>
		</div>
		<br>
	<div class="recens">
		<h3>Recensioni Prodotto</h3>
		<%
		if(!recensioni.isEmpty()){
		for(Recensione recensione:recensioni){%>
		Utente:<%=recensione.getUsernameCliente() %>  Voto:<%=recensione.getVoto() %><br>
		Titolo:<%=recensione.getTitolo() %><br>
		Commento:<%=recensione.getCommento() %><br><br>
		
		<%}
		}else{%>
		Nessuna recensione disponibile
		<%}%>
		
		</div>
		
		  
		
		</div>
		
	  
			
	</section>
	

	<%
		}
	%>
	
	<!-- -------------------------------------------------inclusione footer------------------------------------------------------------------------------------------------ -->

 <%@include file="include/footer.jsp" %>
     
<!-- ----------------------------------------------- fine inclusione footer------------------------------------------------------------------------------------------------ -->
	
<script>
/* Initiate Magnify Function
with the id of the image, and the strength of the magnifier glass:*/
magnify("myimage", 1);
</script>

</body>
</html>