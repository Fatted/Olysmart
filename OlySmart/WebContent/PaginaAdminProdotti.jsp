<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="model.*" %>
<%@page import="control.*" %>
<%@page import="java.util.List" %>

<% 

ProdottoDAO prod= new ProdottoDAO();
List<Prodotto> prodotti=prod.getAllProducts();

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
		
		</tr >
		
		<% 
		for(Prodotto p:prodotti){%>
		<tr style="border:1px solid">
		<td style="border:1px solid"><%=p.getNome() %></td>
		<td style="border:1px solid"><%=p.getDescrizione() %></td>
		<td style="border:1px solid"><%=p.getPrezzo_acquisto() %></td>
		<td style="border:1px solid"><%=p.getDisponibilità() %> <a href="#">modifica</a></td>
		<td style="border:1px solid"><%=p.getIva() %></td>
		<td style="border:1px solid"><%=p.getPrezzo_vendita() %></td>
		<td style="border:1px solid"><%=p.getMarca() %></td>
		<td style="border:1px solid"><%=p.getNumero_pezzi_disponibili()%></td>
		<td style="border:1px solid"><%=p.getSconto() %></td>
		<td style="border:1px solid"><%=p.getSpecifiche() %></td>
		<td style="border:1px solid"><%=p.getTipo() %></td>
		<td style="border:1px solid"><%=p.getOfferta() %></td>
		<td style="border:1px solid"><%=p.getImmagine() %></td>
		</tr>
		
	<% }%>
		</table>
		<%
	}
%>
</body>
</html>