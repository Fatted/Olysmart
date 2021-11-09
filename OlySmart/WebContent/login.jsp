<%@page import="model.*" %>
<%@page import="control.*" %>
 	
 	
 	<%
 	//controllo del cliente se è loggato o meno
 	 	Cliente cliente= (Cliente) request.getSession().getAttribute("cliente-corrente");
 	 	     if(cliente!=null){
 	 	     	request.setAttribute("cliente-corrente", cliente);
 	 	     	response.sendRedirect("Homepage.jsp");//se è loggato setto la sua sessione e lo riporto alla home
 	 	     }
 	 	%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="https://kit.fontawesome.com/12aebee45b.js"></script>
    
    <link rel="stylesheet" href="CSS/login.css">
<title>Pagina Login</title>
</head>
   
    <body>
                <div class="loginbox">
                    <h1>Accedi</h1>
                    
 <!----------------------------------  tutti i dati inseriti dall'utente per accedere vengono passati alla servlet ServletLogin----------------------------------------- -->
                    <form action="ServletLogin" method="post">
                        <p>Username</p>
                        <input type ="text" name="username" placeholder="Inserisci Username">
                        <p>Password</p>
                        <input type ="password" name="password" placeholder="Inserisci Password">
                        
                        <input type ="submit" value="Login"><br>
                        
                        
                        <a href="register.jsp">Non hai un Account? Registrati!</a> <br>
                        <a href="Homepage.jsp">Ritorna alla Home</a>
                    </form>

                </div>
<!-- -------------------------------------------------inclusione footer------------------------------------------------------------------------------------------------ -->
	<%@include file="include/footer.jsp" %>
<!-- -------------------------------------------------fine inclusione------------------------------------------------------------------------------------------------ -->                  
   </body>
</html>