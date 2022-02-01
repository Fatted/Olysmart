<!-- da aggiungere css -->
<%@page import="model.*" %>
<%@page import="control.*" %>
<%@page import="java.util.*" %>
     
      <%
       
      //controlliamo la sessione attuale del cliente
      Cliente cliente= (Cliente) request.getSession().getAttribute("cliente-corrente");
      if(cliente!=null){
      	request.setAttribute("cliente-corrente", cliente);
      }
      
      //prendiao gli attributi dei prodotti nel carrello
      ArrayList<Carrello> prodotti_carrello=(ArrayList<Carrello>)session.getAttribute("listacarrello");
      List<Carrello> prodottocarrello=null;
      
      double totale=0;
      
      if(prodotti_carrello!=null){//se il carrello non è vuoto
    	 ProdottoDAO prodotto=new ProdottoDAO();
    	 
    	 totale=prodotto.getTotaleCarrello(prodotti_carrello);//il totale è dato da tutti i prodotti presenti nel carrello,usando il metodo getTotaleCarrello
    	 
      	 prodottocarrello=prodotto.getProdottiCarrello(prodotti_carrello);//prodotto carrello contiene tutti i prodotti nel carrello
      	 
      	 request.setAttribute("prodotti_carrello",prodotti_carrello);//settiamo i prodotti nel carrello
      	 
      	request.setAttribute("totale",totale);//settiamo il totale
       }
      
      
           %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="CSS/NavbarTOP.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>

    
    <link rel="stylesheet" href="CSS/cart.css">
<title>Carrello</title>
</head>

<body>

<%@include file="include/navbarCliente.jsp" %>


<!-- se il cliente non ha fatto il login può inserire i prodotti nel carrello però dovrà accedere per fare il pagamento e la conferma dell'ordine -->
	<%if(cliente==null){ %>
	<p>Accedi per poter procedere al pagamento del tuo carrello</p>
	<%}else{ %>
    <p>Carrello di:<%=cliente.getUsername() %></p>
    <%} %>
    <%@include file="CSS/messaggioRegistrazione.jsp" %>
    <div class="small-container cart-page">
        <table>
             <tr>
                <th>Prodotto</th>
                <th>Quantità</th>
                <th>Prezzo</th>
            </tr>
        <%
        if(prodotti_carrello!=null){
        	//for each dei prodotti presenti nel carrello per stampare i loro valori
                	for(Carrello carrello:prodottocarrello){
        %>
                <tr>
                <td>
                    <p>Nome:<%=carrello.getNome()%></p>
                    <a href="RimozioneProdottiCarrello?id=<%=carrello.getCodice() %>">Rimuovi</a><!-- la rimozione viene gestita dalla servlet RimozioneProdottiCarrello passandogli l'id -->
                </td>
                
                <td>
                      <%//controlliamo se la quantità selezionata non è maggiore della quantità disponibile del prodotto
                      if(carrello.getQuantita()<carrello.getNumero_pezzi_disponibili()){%>
                <form action="" method="post">
<!------------------------- L'aumento ed il decremento viene gestito dalla servlet AumentaDiminuisciQuantitàCarrello passandogli id del prodotto-----------------------------------------  -->
                <a href="AumentaDiminuisciQuantitàCarrello?action=diminuisci&id=<%=carrello.getCodice()%>">-</a>
                <input type="number" name="quantita" value="<%=carrello.getQuantita()%>" readonly>
               	<a href="AumentaDiminuisciQuantitàCarrello?action=aumenta&id=<%=carrello.getCodice()%>">+</a>   
                  </form> 
                		<%//se siamo arrivati alal quantità massima disponibile esce la scritta MAX e può solo decrementare la quantità
                		} else{%>
                <a href="AumentaDiminuisciQuantitàCarrello?action=diminuisci&id=<%=carrello.getCodice()%>">-</a>
                <input type="text" value="MAX" readonly>   
                		<%} %>
 
                </td>  
                
                <td>
                    <small><%=carrello.getPrezzo_vendita()%></small><br> 
                                                                     
                </td>            
            </tr>                                 
        	<%}        	
        }      
        %>         
        </table>
    </div>
    <div class="total-price">
        <table>
            <tr>
                <td>Totale:<%=totale %></td><!-- il totale è dato da tutti i prodotti inseriti nel carrello -->
                <td>$$</td>
            </tr>
        </table> 
   </div>
   
	
	<%if(totale==0){ %>
   	<p>Nessun prodotto inserito</p><!-- stampiamo in caso non ci sono prodotti nel carrello -->
<%}%>
	
	<%if(cliente!=null){%>
		<a href="ordine.jsp">Procedi all'ordine</a>			
<%}else{%>
		<a href="login.jsp">Accedi per poter procedere all'ordine</a>
<%}%>
</body>
</html>