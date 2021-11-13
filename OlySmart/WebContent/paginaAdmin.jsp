<%@page import="model.*" %>
<%@page import="control.*" %>
<%@page import="java.util.List" %>


<!-- Piccolo controllo se si sta cercando di accedere come admin se non si è admin o non loggati -->
<%
	//controlliamo la sessione attuale del cliente
	Cliente cliente=(Cliente)session.getAttribute("cliente-corrente");
	if(cliente==null){//se il cliente non è loggato lo portiamo nella pagina di login
	response.sendRedirect("login.jsp");
	return;
		}else{
	if(cliente.getTipo().equals("utente")){//se l'utente sta cercando di accedere alla pagina di admin ma è un utente ritorna alla homepage
		response.sendRedirect("Homepage.jsp");
		return;
	}
		}

     		CategoriaDAO cat=new CategoriaDAO();
      		List<Categoria> categorialista=cat.getCategorie();     		
      		
      		ProdottoDAO prod= new ProdottoDAO();
      		List<Prodotto> prodotti=prod.getAllProductsAdmin();
      		
      		ClienteDAO clientelista=new ClienteDAO();
      		List<Cliente> listaclienti=clientelista.getUtentiRegistrati();
      		
      		OrdineDAO ordine=new OrdineDAO();
      		List<Ordine> ordini=ordine.ordini();
      		
      		%>



<!DOCTYPE html>
<html lang="eng">


<head>
<meta charset="utf-8">
<meta name="viewport" content="width=devide-width, initial-scale=1">
<title>Pagina di gestione admin</title>

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
<header>
        <nav id="navbar">
        <div class="container">
            <h1>Admin:<%=cliente.getUsername() %></h1>
            <ul>
                <li><a href="Homepage.jsp">Home</a></li>
                <li class="right"><a href="ServletLogout">Logout</a></li> <!-- il logout viene gestito dalla servlet di logout -->
            </ul>
        </div>
    </nav>
    </header>
<!-- tutti i bottoni qui presenti vengono gestiti dai modal sottostanti che nei loro form di nome operation hanno diversi valori,i quali, indicheranno nella servlet ProdottiOperazione servlet cosa fare -->
<section id="menu">
    <table class="primo">
    <%@include file="CSS/messaggioRegistrazione.jsp" %>
        <tr>
            <td class="utenti"><img src="Immagini/Admin/user.png">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalutenti">
  					Visualizza Utenti
				</button>
            </td>
            
            <td class="categorie"><img src="Immagini/Admin/categorie.jpeg">
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalcategorie">
  					Visualizza Categorie
				</button>	
            </td>
            
            <td class="prodotti"><img src="Immagini/Admin/prodotti.jpeg">            
  			<a href="PaginaAdminProdotti.jsp" class="btn btn-primary">Prodotti presenti</a><!-- viene gestita direttamente dalla pagina PaginaAdminProdotti.jsp -->
            </td>
            
            <td class="categorie"><img src="Immagini/Admin/ordini.png">
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalordini">
  					Visualizza Ordini
				</button>	
            </td>
        </tr>
        </table>
        <table class="secondo">
        <tr >
            <td class="addcate"><img src="Immagini/Admin/addCategoria.jpeg">
               <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalcategoria">
  					Inserisci categoria
				</button>
            </td>
            <td class="addprod"><img src="Immagini/Admin/addProdotti.jpeg">
                <br>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalprodotto">
  					Inserisci Prodotto
				</button>
            </td>
            
        </tr>
    </table>
</section>


<!------------------------------------------------ Gestione della finestra popup della pagina admin --------------------------------------------------------------------------------->

<!------------------------------------------------------ Modal gestione addcategorie ---------------------------------------------------------------------------------------------------->
<div class="modal fade" id="modalcategoria" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"><!-- id corrisponde al data-target del button -->
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Aggiungi una categoria</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
<!-------------------- inserisco il form che servirà per gestire le varie scelte da parte dell'admin alla servlet di prodottioperazioneservlet------------------------------------- -->
        <form action="ProdottiOperazioneServlet" method="post" enctype='multipart/form-data'>
        
        <input type="hidden" name="operation" value="addCategory"><!-- in questo caso l'operazione sarà l'aggiunta di una categoria -->
        
      		<div class="form-group">
									<!-- inserimento dei valori che passeremo alla servlet -->      		
      			<input type="number" class="form-control" name="numeroCategoria" placeholder="inserisci il numero della categoria" required><br>
      			<input type="text" class="form-control" name="TitoloCategoria" placeholder="inserisci il tipo della categoria" required><br>
      			Immagine:<input type="file" name="immagineCategoria" required>
      			
      		</div>
      	      	
      		<div class="container text-center">
      			<button type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>
        		<button type="submit" class="btn btn-primary" value="addCategory">Aggiungi</button>
      		</div>     	
        </form>
      </div>
    </div>
  </div>
</div>

<!------------------------------------------------------------ Modal gestione addprodotto---------------------------------------------------------------------------------------------- -->
<div class="modal fade" id="modalprodotto" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Aggiungi un prodotto</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
<!-------------------- inserisco il form che servirà per gestire le varie scelte da parte dell'admin alla servlet di prodottioperazioneservlet------------------------------------- -->
        <form action="ProdottiOperazioneServlet" method="post" enctype='multipart/form-data' >
        
        <input type="hidden" name="operation" value="addProdotto">
<!------------------------------------------------------------------------------------- Inseriemto dei valori---------------------------------------------------------------------- -->
      		<div class="form-group">
      		<input type="text" class="form-control" name="nomeProdotto" placeholder="inserisci il nome del prodotto" required><br>
      		<textarea name="descrizioneProdotto" placeholder="inserisci una descrizione (visibile nei dettagli del prodotto)" rows="10" cols="100" required></textarea><br>
      		<input type="number" class="form-control" name="prezzo_acquistoProdotto" placeholder="inserisci il prezzo di acquisto del prodotto(anche con decimali)" step="any" required><br>
      		<input type="text" class="form-control" name="disponibilitàProdotto" placeholder="inserisci la disponibilità del prodotto (si o no)" required><br>
      		<input type="number" class="form-control" name="ivaProdotto" placeholder="inserisci l'iva del prodotto" required><br>
      		<input type="number" class="form-control" name="prezzo_venditaProdotto" placeholder="inserisci il prezzo di vendita del prodotto(anche con decimali)" step="any" required><br>
      		<input type="text" class="form-control" name="marcaProdotto" placeholder="inserisci la marca del prodotto" required><br>
      		<input type="number" class="form-control" name="numeri_pezzi_disponibiliProdotto" placeholder="inserisci numero pezzi disponibili di questo prodotto" step="any" required><br>
      		<input type="number" class="form-control" name="scontoProdotto" placeholder="inserisci sconto da applicare sul prodotto(0 se non c'è lo sconto)" step="any" required><br>
      		<textarea name="specificheProdotto" placeholder="inserisci le specifiche (visibile passando sui prodotti)" rows="10" cols="100" required></textarea><br>
      		
      		<select name="tipoProdotto" class="form-control" id="">
 <!--------------------------------------------andiamo ad indicare solo le categorie presenti che l'admin può scegliere per collocare il suo prodotto  --------------------------------------->     		
      		<%	for(Categoria categoria:categorialista){%>
      		
      		<option value="<%=categoria.getNome() %>"><%=categoria.getNome() %></option>
      		
      		<%} %>
      		    		
      		</select>
      		
      		<br><input type="text" class="form-control" name="offertaProdotto" placeholder="indicare se il prodotto è in offerta (si o no)" required><br>
      		Immagine:<input type="file" name="immagineProdotto" required>
      		</div>
      	
      		<div class="container text-center">
      			<button type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>
        		<button type="submit" class="btn btn-primary" value="addCategory">Aggiungi</button>
      		</div>     	
        </form>
      </div>
    </div>
  </div>
</div>


<!-------------------------------------------------------------------- Modal visualizzazione categorie --------------------------------------------------------------------------------------->
<div class="modal fade" id="modalcategorie" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Categorie Presenti</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
<!-------------------- inserisco il form che servirà per gestire le varie scelte da parte dell'admin alla servlet di prodottioperazioneservlet------------------------------------- -->
        <form action="ProdottiOperazioneServlet" method="post">
  
      		<div class="form-group">
      		
      		<h1 style="text-align:center">Categorie Presenti</h1>
      		<table>
      		<tr>
				<th style="border:1px solid">Nome</th>
				<th style="border:1px solid">Numero</th>
			</tr>
      		
			<%	 
			for(Categoria categoria:categorialista){%>
			<tr style="border:1px solid">
				<td style="border:1px solid"><%=categoria.getNome() %></td>
				<td style="border:1px solid"><%=categoria.getNumero() %></td>
			</tr>

			<%
			}
			%>
      		</table>
      		</div>
      	
      		<div class="container text-center">
      			<button type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>
      		</div>     	
        </form>
      </div>
    </div>
  </div>
</div>


<!------------------------------------------------------- Modal visualizzazione clienti ----------------------------------------------------------------------------------------------->
<div class="modal fade" id="modalutenti" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Utenti Presenti</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
<!-------------------- inserisco il form che servirà per gestire le varie scelte da parte dell'admin alla servlet di prodottioperazioneservlet------------------------------------- -->
        <form action="ProdottiOperazioneServlet" method="post">
  
      		<div class="form-group">
      		
      		<h1 style="text-align:center">Utenti Presenti</h1>
      		<table>
      		
      		<tr>
				<th style="border:1px solid">Nome</th>
				<th style="border:1px solid">Cognome</th>
				<th style="border:1px solid">Username</th>
				<th style="border:1px solid">email</th>
				<th style="border:1px solid">Telefono</th>
				<th style="border:1px solid">Indirizzo</th>
			</tr>
			<%	
			//for each che fa vedere tutti i clienti registrati nel database con i relativi valori
			for(Cliente clienti:listaclienti){%>
				<tr style="border:1px solid">
				<td style="border:1px solid"><%=clienti.getNome() %></td> <!-- stampa del nome -->
				<td style="border:1px solid"><%=clienti.getCognome() %></td><!-- stampa del cognome -->
				<td style="border:1px solid"><%=clienti.getUsername() %></td><!-- stampa del username -->
				<td style="border:1px solid"><%=clienti.getEmail() %></td><!-- stampa dell' email -->
				<td style="border:1px solid"><%=clienti.getTelefono() %></td><!-- stampa del telefono -->
				<td style="border:1px solid">Via:<%=clienti.getVia() %>, CAP:<%=clienti.getCap() %>, Città:<%=clienti.getCitta() %></td><!-- stampa dell'indirizzo -->
				</tr>

			<%
			}
			%>
			</table>
      			
      		</div>
      	
      		<div class="container text-center">
      			<button type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>
      		</div>     	
        </form>
      </div>
    </div>
  </div>
</div>
<!-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->


<!------------------------------------------------------- Modal visualizzazione ordini ----------------------------------------------------------------------------------------------->
<div class="modal fade" id="modalordini" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Utenti Presenti</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
<!-------------------- inserisco il form che servirà per gestire le varie scelte da parte dell'admin alla servlet di prodottioperazioneservlet------------------------------------- -->
        <form action="ProdottiOperazioneServlet" method="post">
  
      		<div class="form-group">
      		
      		<h1 style="text-align:center">Oridni Presenti</h1>
      		<table>
      		
      		<tr>
				<th style="border:1px solid">codice</th>
				<th style="border:1px solid">costo totale</th>
				<th style="border:1px solid">data</th>
				<th style="border:1px solid">prezzo singolo prodotto</th>
				<th style="border:1px solid">nome prodotto</th>
				<th style="border:1px solid">quantità prodotto</th>
				<th style="border:1px solid">tipo spedizione</th>
				<th style="border:1px solid">indirizzo consegna</th>
				<th style="border:1px solid">username</th>
			</tr>
			<%	
			//for each che fa vedere tutti i clienti registrati nel database con i relativi valori
			for(Ordine ordinestampa:ordini){%>
				<tr style="border:1px solid">
				<td style="border:1px solid"><%=ordinestampa.getCodice() %></td> 
				<td style="border:1px solid"><%=ordinestampa.getCosto_totale() %></td>
				<td style="border:1px solid"><%=ordinestampa.getData() %></td>
				<td style="border:1px solid"><%=ordinestampa.getPrezzo_prodotto_singolo() %></td>
				<td style="border:1px solid"><%=ordinestampa.getNome_prodotto() %></td>
				<td style="border:1px solid"><%=ordinestampa.getQuantità_prodotto() %></td>
				<td style="border:1px solid"><%=ordinestampa.getTipo_spedizione() %>
				<td style="border:1px solid"><%=ordinestampa.getIndirizzo_consegna() %>
				<td style="border:1px solid"><%=ordinestampa.getUsername() %>			
				</tr>
			<%
			}
			%>
			</table>
      			
      		</div>
      	
      		<div class="container text-center">
      			<button type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>
      		</div>     	
        </form>
      </div>
    </div>
  </div>
</div>


</body>
</html>