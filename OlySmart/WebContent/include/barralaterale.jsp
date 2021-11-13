<%@page import="model.*" %>
<%@page import="control.*" %>
<%@page import="java.util.*" %>

<section id="menu">
         <div class="sidebar close">
             <ul class="nav-links">
             <li> <a href="Homepage.jsp">
                <i class="fas fa-home"></i>
            <span class="link_name">Home</span>
        </a>
        </li>
        <li> <a href="catalogo.jsp?Categoria=all">
            <i class="fas fa-list"></i>
         <span class="link_name">Catalogo</span>
          </a>
        </li>
        
     <%
     //assegnamo all'oggetto categoria ripetutamente tutte le categorie presenti
		for(Categoria categoria:categorialista){
		%>
         <li>
            <div class="icon-link">
             <a class="link_name" href="catalogo.jsp?Categoria=<%=categoria.getNome() %>"> <!-- selezionando una di esse andremo in un catalogo personalizzato formato solo dal nome della categoria selezionata -->
             <i><img src="Immagini/Categorie/<%=categoria.getNome() %>.svg" width="20" height="21"></i><!-- per ognuna di esse prendiamo la sua immagine  -->
              <span class="link_name"><%=categoria.getNome() %></span><!-- per ognuna di esse stampiamo il suo nome -->
              </a>
              <i class="fas fa-chevron-right arrow"></i>
           </div>
            <ul class="sub-menu">
           <%
           //creiamo il sub menù di ogni categoria contenente le marche dei prodotti
           //creo un controllo per eliminare i nomi delle marche duplicate all'interno delle varie categorie
           List<String> listanonduplicata=new ArrayList<>();//servirà per inserire le marche dei prodotti ed eliminare quelle ripetute che poi stamperò
           List<String> lista=new ArrayList<>();//sarà la lista senza ripetizioni
           
           for(Prodotto p:prodottiBarraLaterale){//per ogni prodotto prendo il suo tipo e vedo se è uguale a quello della categoria
        	   if(p.getTipo().equalsIgnoreCase(categoria.getNome())){
        		   lista.add(p.getMarca());//se lo è lo aggiungo alla lista che stamperò
        	   }
           }
           
        		   for(String parola:lista){//assegnamo alla stringa parola le paroli presenti nella lista contenente le marche dei prodotti
        			   if(!listanonduplicata.contains(parola)){listanonduplicata.add(parola); } //se la listaduplicata non contiene quella marca la inserisce altrimenti la salta   
        		   }
        		   
        		   for(String stampa:listanonduplicata){//la stringa stampa prenderà il valore delle marche che ora sono non duplicate e le stamperà
			%>
<!-- premendo su una categoria o su una marca andremo in un catalogo personalizzato dove gli vengono passati i relativi valori:nome della categoria o la marca del prodotto -->		
            <li><a href="catalogo.jsp?Categoria=<%=categoria.getNome()%>&ProdottoMarca=<%=stampa %>"><%=stampa %></a></li>
            <% 		   
        		  } %>
           </ul>
       <%}%>
        </li>
        </div>
