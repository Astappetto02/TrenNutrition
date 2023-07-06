<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <title>Tren Nutrition</title>
    <script src="js/codici.js"></script>

  </head>
  <body>
    <div class="content">
      <section id="header">
        <a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/"><img src="img/Logo.png" class="logo"></a>
        <div class="search-bar">
          <form method="post" action="ricerca" autocomplete="off">
            <input type="text" name="ricerca" placeholder="Cerca...">
            <button type="submit"><i class="fas fa-search"></i></button>
          </form>
        </div>
        <div>
          <ul id="navbar" class="navbar">
            <li><a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/">Home</a></li>
            <li><a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/ChiSiamo.jsp">Chi siamo</a></li>
            <li><a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/categorie.jsp">Prodotti</a></li>
            <c:choose>
              <c:when test="${!empty utente && utente.admin}">
                <li><a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/utenti">Utenti</a></li>
              </c:when>
              <c:otherwise>
                <li><a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/carrello"><i class="fas fa-shopping-cart"></i></a></li>
              </c:otherwise>
            </c:choose>
            <li><a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/account.jsp"><i class="far fa-user"></i></a></li>
            <c:if test="${!empty utente}">
              <li><h5>Ciao, ${utente.nome}</h5></li>
            </c:if>
            <li class="icon"><a href="javascript:void(0);"><i class="fa-solid fa-bars fa-xl"></i></a></li>
          </ul>
        </div>
      </section>

      <navbar id="responsive">
        <ul class="responsive">
          <li><a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/">Home</a></li>
          <li><a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/ChiSiamo.jsp">Chi siamo</a></li>
          <li><a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/categorie.jsp">Prodotti</a></li>
        </ul>
      </navbar>

      <main id="checkout">
        <div class="confirm">
          <form method="post" onsubmit="return validateCard()" action="ordine" autocomplete="off">
            <h3><i class="fa-solid fa-truck-fast"></i> Informazioni sulla spedizione</h3>
            <div class="spedizione">
              <div class="informazioni">
                <label>Via </label>
                <input type="text" name="via" value="${utente.via}" required>
              </div>
              <div class="informazioni">
                <label>N. Civico </label>
                <input type="text" name="civico" value="${utente.ncivico}" required>
              </div>
              <div class="informazioni">
                <label>CAP </label>
                <input type="text" name="cap" value="${utente.CAP}" required>
              </div>
            </div>
            <h3><i class="far fa-credit-card"></i> Pagamento</h3>
            <div class="spedizione">
              <div class="carta">
                <div class="informazioni">
                  <label>Numero Carta </label>
                  <input type="text" name="carta" placeholder="0000 0000 0000 0000" id="card" required>
                </div>
                <div class="informazioni">
                  <label>CVC </label>
                  <input type="text" name="cvc" placeholder="123" id="cvc" required>
                </div>
              </div>
              <div class=" carta">
                <div class="informazioni">
                <label>Scadenza </label>
                <input type="text" name="scadenza" placeholder="00/00" id="scadenza" required>
              </div>
                <div class="informazioni">
                  <label>Nome sulla carta </label>
                  <input type="text" name="nome">
                </div>
              </div>
            </div>
            <div class="informazioni">
              <label> <b>Totale: ${totale}€</b></label>
            <input type="hidden" name = "totale" value="${totale}">
            <div class="button-container">
              <button type="submit" value="Conferma Ordine">Conferma Ordine</button>
            </div>
            </div>
          </form>
        </div>
        <script type="text/javascript">
          function validateCard(){
            let card = document.getElementById("card").value
            let pattern = /(\d{4}[-\s]?){3}\d{4}/
            if(!pattern.test(card)){
              alert("Inserire una carta valida")
              $("#card").css("border-color","red")
              return false
            }else {
              $("#card").css("border-color","green")
            }

            let cvc = document.getElementById("cvc").value
            if(cvc.length!=3){
              alert("CVC invalido")
              $("#cvc").css("border-color","red")
              return false
            }else {
              $("#cvc").css("border-color","green")
            }

            let scadenza = document.getElementById("scadenza").value
            if(!scadenza.includes("/")){
              alert("Scadenza non valida")
              $("#scadenza").css("border-color","red")
              return false
            }else{
              let split = scadenza.split("/");
              let uno = split[0];
              let due = split[1];
              if(uno.length!=2 || due.length!=2){
                alert("Scadenza non valida")
                $("#scadenza").css("border-color","red")
                return false
              }else {
                $("#scadenza").css("border-color","green")
              }
            }
            return true
          }
        </script>
      </main>
      <button onclick="scrollToTop()" id="scrollToTop"><i class="fa-solid fa-arrow-up fa-2xl"></i></button>
      <c:if test="${param.checkout==1}">
        <script>
          alert("Il pagamento non \u00E8 andato a buon fine")
        </script>
      </c:if>

    </div>

    <footer class="footer">
      <div class="social">
        <a href="https://www.instagram.com"><i class="fa-brands fa-instagram"></i></a>
        <a href="https://twitter.com"><i class="fa-brands fa-twitter"></i></a>
        <a href="https://it-it.facebook.com"><i class="fa-brands fa-facebook-f"></i></a>
      </div>
      <ul>
        <li><a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/">Home</a></li>
        <li><a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/categorie.jsp">Prodotti</a></li>
        <li><a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/ChiSiamo.jsp">About Us</a></li>
      </ul>
      <p class="copyright">TrenNutrition © 2023</p>
    </footer>
  </body>
</html>
