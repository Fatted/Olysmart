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
                    <h1>Registrazione</h1>
                     <%@include file="CSS/messaggioRegistrazione.jsp" %>
 <!----------------------------------  tutti i dati inseriti dall'utente per accedere vengono passati alla servlet ServletRegister----------------------------------------- -->
 								<!-- alcuni dei valori sono required perchè serviranno per poter procedere a fare ordini -->                    
                    <form action="ServletRegister" method="post">
                        <p>Nome*</p>
                        <input type ="text" name="nome"  placeholder="Inserisci Nome" required>
                        <p>Cognome*</p>
                        <input type ="text" name="cognome"  placeholder="Inserisci Cognome" required>
                        <p>Data Di Nascita</p>
                        <input type ="date" name="data" placeholder="Inserisci Data">
                        <p>Codice Fiscale</p>
                        <input type ="text" name="CF"  placeholder="Inserisci CF">
                        <p>Email</p>
                        <input type ="email" name="email"  placeholder="Inserisci Email">
                        <p>Password*</p>
                        <input type ="text" name="password"  placeholder="Inserisci Password" required>
                        <p>Username*</p>
                        <input type ="text" name="username"  placeholder="Inserisci Username" required>
                        <p>Telefono</p>
                        <input type ="tel" name="telefono" maxlength="10"  placeholder="Inserisci Telefono">
                        <p>CAP*</p>
                        <input type ="number" name="cap" maxlength="5"  placeholder="Inserisci CAP" required>
                        <p>Via*</p>
                        <input type ="text" name="via"  placeholder="Inserisci Via" required>
                        <p>Città*</p>
                        <input type ="text" name="citta"  placeholder="Inserisci Città" required>
                        
                        <input type ="submit" value="Registrati" value="Login"> <br>
                    </form>
                </div>
<!-- -------------------------------------------------inclusione footer------------------------------------------------------------------------------------------------ -->
	<%@include file="include/footer.jsp" %>
<!-- -------------------------------------------------fine inclusione------------------------------------------------------------------------------------------------ --> 


</body>
</html>