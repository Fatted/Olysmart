<%@page import="model.*" %>
<%@page import="control.*" %>
<%@page import="java.util.*" %>
     
      <%
           
                      Cliente cliente= (Cliente) request.getSession().getAttribute("cliente");
                           if(cliente!=null){
                           	request.setAttribute("cliente", cliente);
                           }
                           
                           ArrayList<Carrello> prodotti_carrello=(ArrayList<Carrello>)session.getAttribute("listacarrello");
                           List<Carrello> prodottocarrello=null;
                           if(prodotti_carrello!=null){
                          	 ProdottoDAO prodotto=new ProdottoDAO();
                          	 prodottocarrello=prodotto.getProdottiCarrello(prodotti_carrello);
                          	 request.setAttribute("prodotti_carrello",prodotti_carrello);
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
<title>Prova Cart</title>
</head>

<body>
    
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
                    <small>Prezzo:<%=carrello.getPrezzo_vendita()%></small> <br>
                    <a href="">Remove</a>
                </td>
                
                <form action="" method="post">
       	 		<input type="hidden" value="<%=carrello.getCodice() %>">
        		</form> 
              
            </tr>
        	<%}
        	
        }
        else{
        	System.out.print("non va");
        }
        %>
           
        </table>

    </div>

    <div class="total-price">

        <table>
            <tr>
                <td>Totale</td>
                <td>$$</td>
            </tr>
        </table>
    </div>
    
    
    
    
    
    
    
    <footer id="footer">
        <p>Olysmart &copy; 2021, All rights reserved<p>
        <p>Via napoli 310 81058 Vairano Patenora, Campania</p>
        <p>0823 988020</p>
        <p>olysmartvairano@gmail.com</p>
        <p>Powered by D'Amato Antonio, D'Amato Ludovica, Dello Buono Piero</p>
        </footer>
</body>
</html>