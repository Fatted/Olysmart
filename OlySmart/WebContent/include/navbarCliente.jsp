<%@page import="model.*" %>
<%@page import="control.*" %>
<%@page import="java.util.*" %> 


<div class="topnav" id="myTopnav">
  <a href="Homepage.jsp" class="active">Home</a>
  <a href="MyOrder.jsp" class="active">I miei ordini</a>
  <a href="MyRecensioni.jsp" class="active">Le mie recensioni</a>
  <a href="MyAccount.jsp" class="active">Il mio profilo</a>
  <a href="carrello.jsp" class="active">Carrello</a>

    
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