<%@page import="model.*" %>
<%@page import="control.*" %>
<%@page import="java.util.*" %> 

<section id="navbar">
<div class="topnav" id="myTopnav">
  <a href="Homepage.jsp" class="active">Home</a>
  <a href="javascript:void(0);" style="font-size:25px;" class="icon" onclick="myFunction()">&#9776;</a>
  
  <a href="catalogo.jsp?Categoria=all" class="cat">
  <i><img src="Immagini/catalogo.svg" width="20" height="16" class="imgcateg"></i>
  Catalogo</a>
<%for(Categoria categoria:categorialista){ %>
<div class="dropdown">
    <button class="dropbtn">
     <a href="catalogo.jsp?Categoria=<%=categoria.getNome() %>">
    <i><img src="Immagini/Categorie/<%=categoria.getNome() %>.svg" width="20" height="16" class="imgcateg"></i>
   
    <%=categoria.getNome() %> 
    <i class="fa fa-caret-down" id="fdown"></i> 
    </a>
      
    </button>


<div class="dropdown-content">
                <%
           //creiamo il sub menù di ogni categoria contenente le marche dei prodotti
           //creo un controllo per eliminare i nomi delle marche duplicate all'interno delle varie categorie
           List<String> listanonduplicata=new ArrayList<>();//servirà per inserire le marche dei prodotti ed eliminare quelle ripetute che poi stamperà
           List<String> lista=new ArrayList<>();//sarà la lista senza ripetizioni
           
           for(Prodotto p:prodottiBarraLaterale){//per ogni prodotto prendo il suo tipo e vedo se è uguale a quello della categoria
        	   if(p.getTipo().equalsIgnoreCase(categoria.getNome())){
        		   lista.add(p.getMarca());//se lo è lo aggiungo alla lista che stamperà
        	   }
           }
           
        		   for(String parola:lista){//assegnamo alla stringa parola le paroli presenti nella lista contenente le marche dei prodotti
        			   if(!listanonduplicata.contains(parola)){listanonduplicata.add(parola); } //se la listaduplicata non contiene quella marca la inserisce altrimenti la salta   
        		   }
        		   
        		   for(String stampa:listanonduplicata){//la stringa stampa prenderà il valore delle marche che ora sono non duplicate e le stamperà
			%>
<a href="catalogo.jsp?Categoria=<%=categoria.getNome()%>&ProdottoMarca=<%=stampa %>"><%=stampa %></a>
            <% 		   
        		  } %>
    </div>
    </div>
 <%}%>
    
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
</section> 