<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="https://kit.fontawesome.com/12aebee45b.js" ></script>
    
    <link rel="stylesheet" href="CSS/Registrazione.css">
<title>Registrazione</title>
</head>

            <body>
                <div class="loginbox">
                    <h1>Register Here</h1>
                     <%@include file="CSS/messaggioRegistrazione.jsp" %>
                    <form action="ServletRegister" method="post">
                        <p>Nome*</p>
                        <input type ="text" name="nome"  placeholder="Enter Nome" required>
                        <p>Cognome*</p>
                        <input type ="text" name="cognome"  placeholder="Enter Cognome" required>
                        <p>Data Di Nascita</p>
                        <input type ="date" name="data" placeholder="Enter Data">
                        <p>Codice Fiscale</p>
                        <input type ="text" name="CF"  placeholder="Enter CF">
                        <p>Email</p>
                        <input type ="text" name="email"  placeholder="Enter Email">
                        <p>Password*</p>
                        <input type ="text" name="password"  placeholder="Enter Password" required>
                        <p>Username*</p>
                        <input type ="text" name="username"  placeholder="Enter Username" required>
                        <p>Telefono</p>
                        <input type ="text" name="telefono"  placeholder="Enter Telefono">
                        <p>CAP*</p>
                        <input type ="text" name="cap"  placeholder="Enter CAP" required>
                        <p>Via*</p>
                        <input type ="text" name="via"  placeholder="Enter Via" required>
                        <p>Città*</p>
                        <input type ="text" name="citta"  placeholder="Enter Città" required>
                        
                        <input type ="submit" value="Registrati" placeholder="Login"> <br>
                    </form>

                </div>
                    <footer id="footer">
                        <p>Olysmart &copy; 2021, All rights reserved<p>
                        <p>Via napoli 310 81058 Vairano Patenora, Campania</p>
                        <p>0823 988020</p>
                        <p>olysmartvairano@gmail.com</p>
                        <p>Powered by D'Amato Antonio, D'Amato Ludovica, Dello Buono Piero</p>
                        </footer>
            </body>
    
</html>