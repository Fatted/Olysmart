<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   
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
<title>OlySmartWeb|Gestione Prodotti</title>
<!-- Pagina CSS -->
<link rel="stylesheet" href="CSS/styleadmin.css">
<link rel="stylesheet" href="CSS/modificaProdotti.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<!-- Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<!-- JavaScript -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</head>

<body>
<header>
        <nav id="navbar">
        <div class="container">
            <h1>Admin: <%=cliente.getUsername() %></h1>
            <div class="homelog">
                <div class="pdg"> <a href="paginaAdmin.jsp">Gestione</a></div>
                <div class="home"><a href="Homepage.jsp">Home</a></div>
                <div class="logout"><a href="ServletLogout">Logout</a></div> <!-- il logout viene gestito dalla servlet di logout -->
            </div>
        </div>
    </nav>
    </header>
<h1 style="text-align:center">Prodotti Presenti nel DataBase</h1>
			
<%
	if(!prodotti.isEmpty()){%>
		<table style="border: 1px solid" bgcolor="white" class="table" id="tavula">
		<tr style="border:1px solid">
		<thead>
		<th scope="col">Nome</th>
		<th scope="col">Descrizione</th>
		<th scope="col">Prezzo Acquisto</th>
		<th scope="col">Disponibilità</th>
		<th scope="col">Iva</th>
		<th scope="col">Prezzo Vendita</th>
		<th scope="col">Marca</th>
		<th scope="col">Numero pezzi disponibili</th>
		<th scope="col">Sconto</th>
		<th scope="col">Specifiche</th>
		<th scope="col">Categoria</th>
		<th scope="col">Offerta</th>
		<th scope="col">Immagine</th>
		<th scope="col">Modifica Prodotto</th>
		</thead>
		
		</tr>
		
		<tbody>
		<% 
		//facciamo un for each per stampare tutti i prodotti presenti nel database
		for(Prodotto p:prodotti){			
		%>
		<tr style="border:1px solid">
		<td style="border:1px solid" data-label="Codice"><%=p.getCodice() %>)<%=p.getNome() %></td>
		<td style="border:1px solid" data-label="Descrizione"><%=p.getDescrizione() %>		
		<td style="border:1px solid" data-label="Prezzo Acquisto"><%=p.getPrezzo_acquisto() %></td>
		<td style="border:1px solid" data-label="Disponibilità"><%=p.getDisponibilità() %></td>
		<td style="border:1px solid" data-label="IVA"><%=p.getIva() %></td>
		<td style="border:1px solid" data-label="Prezzo Vendita"><%=p.getPrezzo_vendita() %></td>
		<td style="border:1px solid" data-label="Marca"><%=p.getMarca() %></td>
		<td style="border:1px solid" data-label="Numero Pezzi Disponibili"><%=p.getNumero_pezzi_disponibili()%></td>
		<td style="border:1px solid" data-label="Sconto"><%=p.getSconto() %></td>
		<td style="border:1px solid" data-label="Specifiche"><%=p.getSpecifiche() %></td>
		<td style="border:1px solid" data-label="Tipo"><%=p.getTipo() %></td>
		<td style="border:1px solid" data-label="Offerta"><%=p.getOfferta() %></td>
		<td style="border:1px solid" data-label="Immagine"><%=p.getImmagine() %></td>
		<td style="border:1px solid"><a href="ModificaProdottiAdmin.jsp?id=<%=p.getCodice()%>">vai alla pagina di modifica</a></td>
		
		</tr>				
	<% }%>
	</tbody>
		</table>
		<%
		}	
%>

</body>
</html>