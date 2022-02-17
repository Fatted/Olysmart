<%@page import="model.*" %>
<%@page import="control.*" %>
 	
 	<%
 	 	
 	 	Cliente cliente= (Cliente) request.getSession().getAttribute("cliente-corrente");
 	 	     if(cliente!=null){
 	 	     	request.setAttribute("cliente-corrente", cliente);
 	 	     	response.sendRedirect("Homepage.jsp");
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
<title>Prova Login</title>
</head>

            <body>
                <div class="loginbox">
                    <h1>ACCEDI</h1>
                    
                    <form action="ServletLogin" method="post">
                        <p>Username</p>
                        <input type ="text" name="username" placeholder="Inserisci Username">
                        <p>Password</p>
                        <input type ="password" name="password" placeholder="Inserisci Password">
                        
                        <input type ="submit" value="Login"> <br>
                        
                        
                        Non hai un account? <a href="register.jsp">Registrati</a> <br>
                        <a href="Homepage.jsp">Ritorna alla Home</a>
                    </form>

                </div>
                    <footer id="footer">
    <p>Olysmart &copy; 2021, All rights reserved</p>
    <p>Via napoli 310 81058 Vairano Patenora, Campania</p>
    <p>0823 988020</p>
    <p>olysmartvairano@gmail.com</p>
    <p>Powered by D'Amato Antonio, D'Amato Ludovica, Dello Buono Piero</p>
    </footer>

            </body>
    
</html>