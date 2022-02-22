<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="model.*" %>
<%@page import="control.*" %>
<%@page import="java.util.*" %>
<%
    //controlliamo la sessione attuale del cliente     
      Cliente cliente= (Cliente) request.getSession().getAttribute("cliente-corrente");
      if(cliente!=null){//se la sessione non � vuota settiamo il cliente
      	request.setAttribute("cliente-corrente", cliente);
      }
      ProdottoDAO prod= new ProdottoDAO();
      List<Prodotto> prodottiBarraLaterale=prod.getAllProducts();	//lista usata per tenere sempre la barra attiva contenente tutti i prodotti disponibili nel db con il metodo getallproduct del prodotto DAO

      CategoriaDAO cat=new CategoriaDAO();
      List<Categoria> categorialista=cat.getCategorie(); //la lista delle categorie comprende tutte le categorie presenti nel db che prendiamo con il metodo getCategorie in CategorieDAO

    //la lista carrello contiene il carrello della sessione corrente del determinato cliente
      ArrayList<Carrello> prodotti_carrello=(ArrayList<Carrello>)session.getAttribute("listacarrello");
      List<Carrello> prodottocarrello=null;
      
      double totale=0;
   
      SpedizioneDAO spedizione=new SpedizioneDAO();

      List<Spedizione> spedizioni=null;
      spedizioni=spedizione.getSpedizioni();//spedizioni contiene tutte le spedizioni presenti nel db


      if(prodotti_carrello!=null){
    	 ProdottoDAO prodotto=new ProdottoDAO();
    	 
    	 totale=prodotto.getTotaleCarrello(prodotti_carrello);//il totale � dato da tutti i prodotti presenti nel carrello,usando il metodo getTotaleCarrello
    	 
      	 prodottocarrello=prodotto.getProdottiCarrello(prodotti_carrello);//prodotto carrello contiene tutti i prodotti nel carrello
      	 
      	 request.setAttribute("prodotti_carrello",prodotti_carrello); 	
       }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

    <link rel="stylesheet" media="screen and (max-width:2561px)" href="CSS/styleordine.css">
    <link rel="stylesheet" media="screen and (max-width:1441px)" href="CSS/styleordine.css">
    <link rel="stylesheet" media="screen and (max-width:1025px)" href="CSS/Laptop.css">
    <link rel="stylesheet" media="screen and (max-width:769px)" href="CSS/Tablet.css">
    <link rel="stylesheet" media="screen and (max-width:426px)" href="CSS/mobile.css">
<title>OlySmartWeb|Ordine</title>
</head>
<body>
<!-- -------------------------------------------------inclusione intestazione------------------------------------------------------------------------------------------------ -->

 <%@include file="include/Intestazioneb.jsp" %>
     
<!-- ------------------------------------------------- fine inclusione intestazione------------------------------------------------------------------------------------------------ -->




<!-- -------------------------------------------------------- Header -------------------------------------------------------- -->
<section id="header">
<h1>Conferma ordine</h1>
<p>Ordine di <%=cliente.getNome() %></p>
</section>
<!-- -------------------------------------------------------- Fine Header -------------------------------------------------------- -->
<section id="centerord">
<div class="left">
<div class="lefta">
<p>L'ordine contiene:</p>
<%for(Carrello carrello:prodottocarrello){%>
	<ul>
         <li><div class="prodottord">
          <div class="leftord"><img src="Immagini/Prodotti/<%=carrello.getImmagine()%>" width="150" height="150"></div>
          <div class="rightord">
          <%=carrello.getNome() %>
         <br>Quantit�: <%=carrello.getQuantita() %>
         <br>Prezzo: <%=carrello.getPrezzo_vendita() %>
         <br><a href="RimozioneProdottiCarrello?id=<%=carrello.getCodice() %>">Remove</a>
         </div>
         </div>
       </li>
      </ul>
<%}%>
<br>

<form action="CheckOutServlet" id="pagamento">
Seleziona tipo di spedizione:
<%
Iterator<Spedizione> iteratore=spedizioni.iterator();
Spedizione s1;
Spedizione s2;
Spedizione s3;

while(iteratore.hasNext()){	    	
	s1=iteratore.next();
	
%>
<br>
<input type="radio" id ="spedizione1" value="<%=s1.getCosto()%>" name="spedizione" onclick = "clickMe(this.id)" >
<label for="<%=s1.getTipo()%>"><%=s1.getTipo() %>(<%=s1.getCosto() %>&euro;||<%=s1.getTempo() %>)</label><br>


<%if(iteratore.hasNext()){
	s2=iteratore.next();
	
	%>
<input type="radio" id ="spedizione2" value="<%=s2.getCosto()%>" name="spedizione" onclick = "clickMe(this.id)" >
<label for="<%=s2.getTipo()%>"><%=s2.getTipo() %>(<%=s2.getCosto() %>&euro;||<%=s2.getTempo() %>)</label><br>

<% if(iteratore.hasNext()){
	s3=iteratore.next(); %>
<input type="radio" id ="spedizione3" value="<%=s3.getCosto()%>" name="spedizione" onclick = "clickMe(this.id)" required checked>
<label for="<%=s3.getTipo()%>"><%=s3.getTipo() %>(<%=s3.getCosto() %>&euro;||<%=s3.getTempo() %>)</label><br>

<%		} 
	} 
} %>

</div>
</div>
<div class="right">
<div class="righttop">
<br>
<p> Dati di spedizione:<br>
 Nome: <%=cliente.getNome() %> <br>
Indirizzo: <%=cliente.getVia() %>,<%=cliente.getCitta() %>(<%=cliente.getCap() %>) <br>
 email: <%=cliente.getEmail()%> <br>
 Numero di telefono: <%=cliente.getTelefono()%><br>
<a href="MyInfo.jsp">Modifica</a>
</p>
</div>

<div class="rightbottom">
<div class="tot">
<p>Totale:</p>

<p id="totale"><%=totale %><%session.setAttribute("totale",totale); %> </p>
<p>&euro;</p>
</div>

    <script src="https://www.paypal.com/sdk/js?client-id=AS3VEG1mTJHhnEZbXSG-geLTkiXg-nwjGa-qVwEHHdBujPW31BLpjtkZaCwuU5BC1lsgWI4iNEJfmfHq&currency=EUR"></script>
    <!-- Set up a container element for the button -->
    <div id="paypal-button-container"></div>
<!--------------------------------------------------------------------------------------- inizio paypal ----------------------------------------------->
    <script>
      paypal.Buttons({
        // Sets up the transaction when a payment button is clicked
        createOrder: function(data, actions) {
          return actions.order.create({
            purchase_units: [{
              amount: {
                value: document.getElementById("totale").textContent // Can reference variables or functions. Example: `value: document.getElementById('...').value`
              }
            }]
          });
        },

        // Finalize the transaction after payer approval
        onApprove: function(data, actions) {
          return actions.order.capture().then(function(orderData) {
            // Successful capture! For dev/demo purposes:
                document.forms["pagamento"].submit();                        
          });
        }
      }).render('#paypal-button-container');

    </script> 
<!--------------------------------------------------------------------------------------- fine paypal ----------------------------------------------->
</div>
</div>
</form>
</section>

<script>
var totale = document.getElementById("totale").textContent;
var totaleNum = +totale;
document.getElementById("totale").innerHTML = totaleNum;

var temp = 0;

function clickMe(clicked_id) {
	  var value = document.getElementById(clicked_id).value;
	  var totale = document.getElementById("totale").textContent;
	  
	  var totaleNum = totale;
	  totaleNum = totaleNum - temp;
	  temp = value;
	  var totaleNum = +totaleNum + +value;
	  document.getElementById("totale").innerHTML = totaleNum;

	}
</script>

</body>
</html>