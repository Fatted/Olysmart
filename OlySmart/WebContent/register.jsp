<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="https://kit.fontawesome.com/12aebee45b.js" ></script>
    
    <link rel="stylesheet" href="CSS/Registrazione.css">
    <link rel="stylesheet" href="CSS/Footer.css">
  
    
<title>Registrazione</title>
</head>

<body>
                <div class="loginbox">
                    <h1>Registrazione</h1>
                     <%@include file="CSS/messaggioRegistrazione.jsp" %>
 <!----------------------------------  tutti i dati inseriti dall'utente per accedere vengono passati alla servlet ServletRegister----------------------------------------- -->
 								<!-- alcuni dei valori sono required perchè serviranno per poter procedere a fare ordini -->                    
                    <form id="login" class="form" action="ServletRegister" method="post">
                        
                 <div class="form-group">
	          	<label for="username">Username*</label><br> 
        		<input name="username" type="text" id="user" placeholder="Inserisci l'Username" required oninput="checkusername()"><br>
                <span id="usererr" class="errormx"></span><br><br>
                  
                  <label for="password">Password*</label><br> 
        		<input name="password" type="text" id="psw" placeholder="Inserisci la Password" required oninput="checkpassword()"><br>
                  <span id="pswerr" class="errormx"></span><br><br>
                  
                  <label for="nome">Nome*</label><br> 
        		<input name="nome" type="text" id="nome" placeholder="Inserisci il nome" required oninput="checknome()"><br>
                  <span id="nomeerr" class="errormx"></span> <br><br>
                  
                  <label for="cognome">Cognome*</label><br> 
        		<input name="cognome" type="text" id="cognome" placeholder="Inserisci il cognome" required oninput="checkcognome()"><br>
                  <span id="cognomeerr" class="errormx"></span> <br><br>
                  
                  <label for="data">Data di nascita</label><br> 
        		<input name="data" type="date"  id="data" placeholder="Inserisci la data di nascita"><br>
            
                  <label for="CF">Codice Fiscale</label><br> 
        		<input name="CF" type="text" id="cf" placeholder="Inserisci il codice fiscale"><br>
                  
                  <label for="email">E-Mail</label><br> 
        		<input name="email" type="email" id="email" placeholder="Inserisci l'e-mail" oninput="checkemail()"><br>
                  <span id="emailerr" class="errormx"></span> <br><br>
                  
                  <label for="telefono">Telefono</label><br> 
        		<input name="telefono" type="text" id="phone" placeholder="Inserisci il numero di telefono"><br>
                  
                  <label for="cap">CAP*</label><br> 
        		<input name="cap" type="text" id="cap" placeholder="Inserisci il CAP" required oninput="checkcap()"><br>
                  <span id="caperr" class="errormx"></span> <br><br>
                  
                  <label for="citta">Citta*</label><br> 
        		<input name="citta" type="text" id="city" placeholder="Inserisci la Citt&agrave" required oninput="checkcity()"><br>
                  <span id="cityerr" class="errormx"></span><br><br>
                  
                  <label for="via">Indirizzo*</label><br> 
        		<input name="via" type="text" id="address" placeholder="Inserisci l'indirizzo" required oninput="checkaddress()"><br>
                  <span id="addresserr" class="errormx"></span><br><br>
                        
                        <input type ="submit" value="Registrati" value="Login"> <br>
                        </div> 
                    </form>
                </div>  
             
                
    <script type="text/javascript">
    function checkusername(){     
        var username=/^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$/; //caratteri alfanumerici, massimo un underscore
        var us=document.getElementById("user");
        if(us.value.match(username)){
            us.classList.remove("error");
            document.getElementById("usererr").innerHTML = " ";
        }
        else{
            
            us.classList.add("error");
            document.getElementById("usererr").innerHTML = "Username non utilizzabile";
        }
            
        }
    
	function checkpassword(){
        
        var password=/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/; //minimo 8 caratteri, almeno un numero
        var psw=document.getElementById("psw");
        if(psw.value.match(password)){
            psw.classList.remove("error");
            document.getElementById("pswerr").innerHTML = " ";
        }
        else{
            psw.classList.add("error");
            document.getElementById("pswerr").innerHTML = "Password non utilizzabile";
        }
            
        }
	
	function checknome(){
        
        var nome=/^([a-zA-Z\xE0\xE8\xE9\xF9\xF2\xEC\x27]\s?)+$/; //No numeri e solo uno spazio tra le parole
        var no=document.getElementById("nome");
        if(no.value.match(nome)){
            no.classList.remove("error");
            document.getElementById("nomeerr").innerHTML = " ";
        }
        else{
            
            no.classList.add("error");
            document.getElementById("nomeerr").innerHTML = "Nome non valido";
        }
            
        }
 
	
	function checkcognome(){
        
        var cognome=/^([a-zA-Z\xE0\xE8\xE9\xF9\xF2\xEC\x27]\s?)+$/;//No numeri e solo uno spazio tra le parole
        var cogno=document.getElementById("cognome");
        if(cogno.value.match(cognome)){
            cogno.classList.remove("error");
            document.getElementById("cognomeerr").innerHTML = " ";
        }
        else{
            
            cogno.classList.add("error");
            document.getElementById("cognomeerr").innerHTML = "Cognome non valido";
        }
            
        }
	
	
	function checkemail(){
        
        var email=/^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/; //caratteri + @ + caratteri + . + minimo 2 max 4
        var em=document.getElementById("email");
        if(em.value.match(email)){
            em.classList.remove("error");
            document.getElementById("emailerr").innerHTML = " ";
        }
        else{
            
            em.classList.add("error");
            document.getElementById("emailerr").innerHTML = "E-mail non valida";
        }
            
        }
	
	function checkcap(){
        
        var cap=/^\d{5}$/;//Solo un numero a 5 cifre
        var cp=document.getElementById("cap");
        if(cp.value.match(cap)){
            cp.classList.remove("error");
            document.getElementById("caperr").innerHTML = " ";
        }
        else{
            
            cp.classList.add("error");
            document.getElementById("caperr").innerHTML = "Cap non valido";
        }
            
        }
	
	function checkcity(){
        
        var city=/^([a-zA-Z\xE0\xE8\xE9\xF9\xF2\xEC\x27]\s?)+$/;//No numeri e solo uno spazio tra le parole
        var ct=document.getElementById("city");
        if(ct.value.match(city)){
            ct.classList.remove("error");
            document.getElementById("cityerr").innerHTML = " ";
        }
        else{
            
            ct.classList.add("error");
            document.getElementById("cityerr").innerHTML = "Citt&agrave non valida";
        }
            
        }
	
	
	function checkaddress(){
        
        var address=/^([a-zA-Z0-9\xE0\xE8\xE9\xF9\xF2\xEC\x27]\s?)+$/;//Solo uno spazio tra le parole
        var add=document.getElementById("address");
        if(add.value.match(address)){
            add.classList.remove("error");
            document.getElementById("addresserr").innerHTML = " ";
        }
        else{
            
            add.classList.add("error");
            document.getElementById("addresserr").innerHTML = "Indirizzo non valido";
        }
            
        }
	
	
    </script>
</body>
</html>