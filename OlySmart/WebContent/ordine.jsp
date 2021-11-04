<%@page import="model.*" %>
<%@page import="control.*" %>
<%@page import="java.util.*" %>
     
      <%
           
      Cliente cliente= (Cliente) request.getSession().getAttribute("cliente-corrente");
      if(cliente!=null){
      	request.setAttribute("cliente-corrente", cliente);
      }
                           
      ArrayList<Carrello> prodotti_carrello=(ArrayList<Carrello>)session.getAttribute("listacarrello");
      List<Carrello> prodottocarrello=null;
      
      double totale=0;
   
      SpedizioneDAO spedizione=new SpedizioneDAO();
      
      List<Spedizione> spedizioni=null;
      spedizioni=spedizione.getSpedizioni();

      
     	
      
      
      if(prodotti_carrello!=null){
    	 ProdottoDAO prodotto=new ProdottoDAO();
    	 
    	 totale=prodotto.getTotaleCarrello(prodotti_carrello);
    	 
      	 prodottocarrello=prodotto.getProdottiCarrello(prodotti_carrello);
      	 
      	 request.setAttribute("prodotti_carrello",prodotti_carrello);
      	 
      	request.setAttribute("totale",totale);
       }
                
           %>
           
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ordine</title>
</head>
<body>

<h1>Conferma ordine</h1>

<p>Ordine di <%=cliente.getNome() %></p><br>

<p>l'ordine contiene:

<%for(Carrello carrello:prodottocarrello){%>
	Nome prodotto:<%=carrello.getNome() %>/Quantità:<%=carrello.getQuantita() %>/Prezzo:<%=carrello.getPrezzo_vendita() %>
<%} %>
<br>
</p>

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


<br>indirizzo spedizione:<%=cliente.getVia() %>,<%=cliente.getCitta() %>(<%=cliente.getCap() %>)<br>

<br><br><br>Metodo di pagamento:<%if(cliente.getIntestatario_carta()==null){%><a href="MyAccount.jsp">Inserisci</a>
<%}else{%><br>	
								
								Numero carta:<%=cliente.getNumero_carta() %><br> 
								Data Scadenza:<%=cliente.getData_scadenza_carta() %><br>
								CVV:<%=cliente.getCVV() %><br>
								Intestatario:<%=cliente.getIntestatario_carta() %><br>
								<a href="MyAccount.jsp">Modifica</a>
																								
							<%}%>


<br><br><p>per un totale di:<p id="totale"><%=totale%></p></p>

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
	  document.getElementById("totale").innerHTML = totaleNum
	  document.getElementById("totale").value = totaleNum;
	}
</script>


<%if(cliente.getIntestatario_carta()==null){%><a href="MyAccount.jsp">Inserisci metodo di pagamento per continuare</a>
<%}else{%>
<form action="CheckOutServlet" method="post">
<button type="submit">Conferma ordine</button>
</form>	
<%}%>


</body>
</html>