<%@page import="model.*" %>
<%@page import="control.*" %>
<%@page import="java.util.*" %> 

   
<div class="topnav" id="myTopnav">
  <a href="Homepage.jsp" class="active">Home</a>
  <a href="catalogo.jsp?Categoria=all" class="active">Catalogo</a>
<%for(Categoria categoria:categorialista){ %>
<div class="dropdown">
    <a href="catalogo.jsp?Categoria=<%=categoria.getNome() %>"><button class="dropbtn"><%=categoria.getNome()%>
      <i class="fa fa-caret-down"></i>
    </button></a> 


<div class="dropdown-content">
                <%
           //creiamo il sub men� di ogni categoria contenente le marche dei prodotti
           //creo un controllo per eliminare i nomi delle marche duplicate all'interno delle varie categorie
           List<String> listanonduplicata=new ArrayList<>();//servir� per inserire le marche dei prodotti ed eliminare quelle ripetute che poi stamper�
           List<String> lista=new ArrayList<>();//sar� la lista senza ripetizioni
           
           for(Prodotto p:prodottiBarraLaterale){//per ogni prodotto prendo il suo tipo e vedo se � uguale a quello della categoria
        	   if(p.getTipo().equalsIgnoreCase(categoria.getNome())){
        		   lista.add(p.getMarca());//se lo � lo aggiungo alla lista che stamper�
        	   }
           }
           
        		   for(String parola:lista){//assegnamo alla stringa parola le paroli presenti nella lista contenente le marche dei prodotti
        			   if(!listanonduplicata.contains(parola)){listanonduplicata.add(parola); } //se la listaduplicata non contiene quella marca la inserisce altrimenti la salta   
        		   }
        		   
        		   for(String stampa:listanonduplicata){//la stringa stampa prender� il valore delle marche che ora sono non duplicate e le stamper�
			%>
<a href="catalogo.jsp?Categoria=<%=categoria.getNome()%>&ProdottoMarca=<%=stampa %>"><%=stampa %></a>
            <% 		   
        		  } %>
    </div>
    </div>
 <%}%>
    
  <a href="javascript:void(0);" style="font-size:15px;" class="icon" onclick="myFunction()">&#9776;</a>
</div>
 

<script>
function myFunction() {
  var x = document.getElementById("myTopnav");
  if (x.className === "topnav") {
    x.className += " responsive";
  } else {
    x.className = "topnav";
  }
}
</script>