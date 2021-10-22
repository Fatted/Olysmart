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