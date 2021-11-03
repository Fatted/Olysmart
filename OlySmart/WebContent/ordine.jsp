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
      
      double costospedizione=0;
      
      
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
	Nome prodotto:<%=carrello.getNome() %>/Quantità:<%=carrello.getQuantità() %>/Prezzo:<%=carrello.getPrezzo_vendita() %>
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
	costospedizione=5;
%>
<br>
<input type="radio" id="spedizione1" name="spedizione" checked>
<label for="<%=s1.getTipo()%>"><%=s1.getTipo() %>(<%=s1.getCosto() %>EURO/<%=s1.getTempo() %>)</label><br>


<%if(iteratore.hasNext()){
	s2=iteratore.next();
	costospedizione=10;
	%>
<input type="radio" value="<%=s2.getTipo()%>" name="spedizione">
<label for="<%=s2.getTipo()%>"><%=s2.getTipo() %>(<%=s2.getCosto() %>EURO/<%=s2.getTempo() %>)</label><br>

<% if(iteratore.hasNext()){
	s3=iteratore.next(); %>
<input type="radio"  value="<%=s3.getTipo()%>" name="spedizione">
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


<br><br><p id="totale">per un totale di:<%=totale+costospedizione %></p>


<%if(cliente.getIntestatario_carta()==null){%><a href="MyAccount.jsp">Inserisci metodo di pagamento per continuare</a>
<%}else{%><a href="#CheckOutServlet">Conferma pagamento</a>	
<%}%>

</body>
</html>