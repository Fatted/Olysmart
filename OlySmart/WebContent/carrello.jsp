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
      
      if(prodotti_carrello!=null){
    	 ProdottoDAO prodotto=new ProdottoDAO();
    	 
    	 totale=prodotto.getTotaleCarrello(prodotti_carrello);
    	 
      	 prodottocarrello=prodotto.getProdottiCarrello(prodotti_carrello);
      	 
      	 request.setAttribute("prodotti_carrello",prodotti_carrello);
      	 
      	request.setAttribute("totale",totale);
       }
      
      
           %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>

    
    <link rel="stylesheet" href="CSS/cart.css">
<title>Carrello</title>
</head>

<body>
    <p>Carrello di:<%=cliente.getUsername() %></p>
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
                	for(Carrello carrello:prodottocarrello){
        %>
                <tr>
                <td>
                    <p>Nome:<%=carrello.getNome()%></p>
                    <a href="RimozioneProdottiCarrello?id=<%=carrello.getCodice() %>">Rimuovi</a>
                </td>
                
                <td>
                      <%if(carrello.getQuantità()<carrello.getNumero_pezzi_disponibili()){%>
                			  <form action="" method="post">
                <a href="AumentaDiminuisciQuantitàCarrello?action=diminuisci&id=<%=carrello.getCodice()%>">-</a>
                <input type="number" value="<%=carrello.getQuantità()%>" readonly>
               	<a href="AumentaDiminuisciQuantitàCarrello?action=aumenta&id=<%=carrello.getCodice()%>">+</a>   
                  </form> 
                		<%} else{%>
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
                <td>Totale:<%=totale %></td>
                <td>$$</td>
            </tr>
        </table> 
   </div>
   
	
	<%if(totale==0){ %>
   	<p>Nessun prodotto inserito</p>
<%}else{%>
	<a href="ordine.jsp">Procedi all'ordine</a>	
<%}%>

</body>
</html>