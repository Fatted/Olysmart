   
<%@page import="model.*" %>
<%@page import="control.*" %>
<%@page import="java.util.*" %>

<% 

ProdottoDAO prod= new ProdottoDAO();
List<Prodotto> prodotti=prod.getAllProductsAdmin();//la lista dei prodotti conterrà tutti i prodotti che ci sono nel db dato che li prendiamo con la getAllProducts

%>

<!-- Piccolo controllo se si sta cercando di accedere come admin se non si è admin o non loggati -->
<%
	Cliente cliente=(Cliente)session.getAttribute("cliente-corrente");
	if(cliente==null){
	response.sendRedirect("login.jsp");
	return;
		}else{
	if(cliente.getTipo().equals("utente")){
		response.sendRedirect("Homepage.jsp");
		return;
	}
		}
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gestione prodotti</title>
<!-- Pagina CSS -->
<link rel="stylesheet" href="CSS/styleadmin.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<!-- Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<!-- JavaScript -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</head>
<body>
<h1 style="text-align:center">Prodotti Presenti nel DataBase</h1>
			
<%
	if(!prodotti.isEmpty()){%>
		<table style="border: 1px solid" bgcolor="white">
		<tr style="border:1px solid">
		
		<th style="border:1px solid">Nome</th>
		<th style="border:1px solid">Descrizione</th>
		<th style="border:1px solid">Prezzo Acquisto</th>
		<th style="border:1px solid">Disponibilità</th>
		<th style="border:1px solid">Iva</th>
		<th style="border:1px solid">Prezzo Vendita</th>
		<th style="border:1px solid">Marca</th>
		<th style="border:1px solid">Numero pezzi disponibili</th>
		<th style="border:1px solid">Sconto</th>
		<th style="border:1px solid">Specifiche</th>
		<th style="border:1px solid">Categoria</th>
		<th style="border:1px solid">Offerta</th>
		<th style="border:1px solid">Immagine</th>
		<th style="border:1px solid">Modifica Prodotto</th>

		
		</tr >
		
		<% 
		//facciamo un for each per stampare tutti i prodotti presenti nel database
		for(Prodotto p:prodotti){			
		%>
		<tr style="border:1px solid">
		<td style="border:1px solid"><%=p.getCodice() %>)<%=p.getNome() %></td>
		<td style="border:1px solid"><%=p.getDescrizione() %>		
		<td style="border:1px solid"><%=p.getPrezzo_acquisto() %></td>
		<td style="border:1px solid"><%=p.getDisponibilità() %></td>
		<td style="border:1px solid"><%=p.getIva() %></td>
		<td style="border:1px solid"><%=p.getPrezzo_vendita() %></td>
		<td style="border:1px solid"><%=p.getMarca() %></td>
		<td style="border:1px solid"><%=p.getNumero_pezzi_disponibili()%></td>
		<td style="border:1px solid"><%=p.getSconto() %></td>
		<td style="border:1px solid"><%=p.getSpecifiche() %></td>
		<td style="border:1px solid"><%=p.getTipo() %></td>
		<td style="border:1px solid"><%=p.getOfferta() %></td>
		<td style="border:1px solid"><%=p.getImmagine() %></td>
		<td style="border:1px solid"><a href="ModificaProdottiAdmin.jsp?id=<%=p.getCodice()%>">vai alla pagina di modifica</a></td>
		
		</tr>				
	<% }%>
		</table>
		<%
		}	
%>

</body>
</html>