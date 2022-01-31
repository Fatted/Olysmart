<%@page import="model.*" %>
<%@page import="control.*" %>
<%@page import="java.util.*" %>
     
      <%
    //controlliamo la sessione attuale del cliente     
      Cliente cliente= (Cliente) request.getSession().getAttribute("cliente-corrente");
      if(cliente!=null){//se la sessione non è vuota settiamo il cliente
      	request.setAttribute("cliente-corrente", cliente);
      }
       
    //la lista carrello contiene il carrello della sessione corrente del determinato cliente
      ArrayList<Carrello> prodotti_carrello=(ArrayList<Carrello>)session.getAttribute("listacarrello");
      List<Carrello> prodottocarrello=null;
      
      double totale=0;
   
      SpedizioneDAO spedizione=new SpedizioneDAO();

      List<Spedizione> spedizioni=null;
      spedizioni=spedizione.getSpedizioni();//spedizioni contiene tutte le spedizioni presenti nel db


      if(prodotti_carrello!=null){
    	 ProdottoDAO prodotto=new ProdottoDAO();
    	 
    	 totale=prodotto.getTotaleCarrello(prodotti_carrello);//il totale è dato da tutti i prodotti presenti nel carrello,usando il metodo getTotaleCarrello
    	 
      	 prodottocarrello=prodotto.getProdottiCarrello(prodotti_carrello);//prodotto carrello contiene tutti i prodotti nel carrello
      	 
      	 request.setAttribute("prodotti_carrello",prodotti_carrello); 	
       }
%>
           
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="CSS/Ordine.css">
<title>ordine</title>
</head>
<body>
<!-- -------------------------------------------------------- Intestazione -------------------------------------------------------- -->
<section id="intestazione">
<h1>Conferma ordine</h1>
<p>Ordine di <%=cliente.getNome() %></p>
</section>
<!-- -------------------------------------------------------- Fine Intestazione -------------------------------------------------------- -->
<section id="center">
<div class="left">
<div class="lefta">
<p>L'ordine contiene:</p>
<%for(Carrello carrello:prodottocarrello){%>
	<ul>
         <li><%=carrello.getNome() %>
         <br>Quantita:<%=carrello.getQuantita() %>
         <br>Prezzo:<%=carrello.getPrezzo_vendita() %>
       </li>
      </ul>
<%}%>
<br>

<form action="CheckOutServlet">
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
<input type="radio" id ="spedizione1" value="<%=s1.getCosto()%>" name="spedizione" onclick = "clickMe(this.id)">
<label for="<%=s1.getTipo()%>"><%=s1.getTipo() %>(<%=s1.getCosto() %>EURO/<%=s1.getTempo() %>)</label><br>


<%if(iteratore.hasNext()){
	s2=iteratore.next();
	
	%>
<input type="radio" id ="spedizione2" value="<%=s2.getCosto()%>" name="spedizione" onclick = "clickMe(this.id)">
<label for="<%=s2.getTipo()%>"><%=s2.getTipo() %>(<%=s2.getCosto() %>EURO/<%=s2.getTempo() %>)</label><br>

<% if(iteratore.hasNext()){
	s3=iteratore.next(); %>
<input type="radio" id ="spedizione3" value="<%=s3.getCosto()%>" name="spedizione" onclick = "clickMe(this.id)">
<label for="<%=s3.getTipo()%>"><%=s3.getTipo() %>(<%=s3.getCosto() %>EURO/<%=s3.getTempo() %>)</label><br>

<%		} 
	} 
} %>

</div>
</div>
<div class="right">
<div class="righttop">
<p> Dati di spedizione:<br>
 Nome: <%=cliente.getNome() %> <br>
Indirizzo: <%=cliente.getVia() %>,<%=cliente.getCitta() %>(<%=cliente.getCap() %> <br>
 email: <%=cliente.getEmail()%> <br>
 Numero di telefono: <%=cliente.getTelefono()%><br>
<a href="MyAccount.jsp">Modifica</a>
</p>
</div>

<div class="rightbottom">
Metodo di pagamento:<%if(cliente.getIntestatario_carta()==null){%><a href="MyAccount.jsp">Inserisci</a>
<%}else{%><br>	
								Intestatario:<%=cliente.getIntestatario_carta() %><br>
								Numero carta:<%=cliente.getNumero_carta() %><br> 
								Data Scadenza:<%=cliente.getData_scadenza_carta() %><br>
								CVV:<%=cliente.getCVV() %><br>
								
								<a href="MyAccount.jsp">Modifica</a>
																								
							<%}%>


<br><br><p id="totale"><%=totale %><%session.setAttribute("totale",totale); %></p>


<%if(cliente.getIntestatario_carta()==null){%><a href="MyAccount.jsp">Inserisci metodo di pagamento per continuare</a>
<%}else{%><br><br><input type="submit" value="conferma pagamento">
<%}%>
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