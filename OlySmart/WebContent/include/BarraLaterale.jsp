<%@page import="model.*" %>
<%@page import="control.*" %>
<%@page import="java.util.*" %>

<section id="menu">
         <div class="sidebar close">
             <ul class="nav-links">
             <li> <a href="#">
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
		for(Categoria categoria:categorialista){
		%>
         <li>
            <div class="icon-link">
             <a class="link_name" href="catalogo.jsp?Categoria=<%=categoria.getNome() %>">
             <i class="fas fa-laptop"></i>
              <span class="link_name"><%=categoria.getNome() %></span>
              </a>
              <i class="fas fa-chevron-right arrow"></i>
           </div>
            <ul class="sub-menu">
           <% 
           List<String> listanonduplicata=new ArrayList<>();
           List<String> lista=new ArrayList<>();
           
           for(Prodotto p:prodotti){
        	   if(p.getTipo().equalsIgnoreCase(categoria.getNome())){
        		   lista.add(p.getMarca());
        	   }
           }
           
        		   for(String parola:lista){
        			   if(!listanonduplicata.contains(parola)){listanonduplicata.add(parola); }    
        		   }
        		   
        		   for(String stampa:listanonduplicata){
			%>
					
            <li><a href="catalogo.jsp?Categoria=<%=categoria.getNome() %>&ProdottoMarca=<%=stampa %>"><%=stampa %></a></li>
            <% 		   
        		  } %>
           </ul>
       <%}%>
        </li>
        </div>