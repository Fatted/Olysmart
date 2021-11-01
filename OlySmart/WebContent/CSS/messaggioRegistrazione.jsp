<style>
.alert {
  padding: 20px;
  background-color: #f44336;
  color: white;
  opacity: 1;
  transition: opacity 0.6s;
  margin-bottom: 15px;
}

.alert.success {background-color: #04AA6D;}

.alert.error {background-color: red;}
</style>

<%

String messaggio=(String)session.getAttribute("messaggio");
if(messaggio!=null){
%>


<div class="alert success">
  <span class="closebtn">&times;</span>  
  <strong><%=messaggio %><% if(messaggio.equals("Registrazione eseguita con successo!")){%>
  <a href="login.jsp">ACCEDI</a></strong> <%}%>
</div>

<%	
	session.removeAttribute("messaggio");	
}
%>

<%

String messaggio2=(String)session.getAttribute("messaggio-errore");
if(messaggio2!=null){
%>


<div class="alert error">
  <span class="closebtn">&times;</span>  
  <strong><%=messaggio2 %></strong> 
</div>

<%	
	session.removeAttribute("messaggio-errore");	
}

%>