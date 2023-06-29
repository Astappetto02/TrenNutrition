<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="css/style.css" type="text/css">
  <title>Tren Nutrition</title>

</head>
<body>
<section id="header">
  <a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/"><img src="img/Logo.png" class="logo"></a>
  <div class="search-bar">
    <form method="post" action="ricerca" autocomplete="off">
      <input type="text" name="ricerca" placeholder="Cerca...">
      <button type="submit"><i class="fas fa-search"></i></button>
    </form>
  </div>
  <div>
    <ul id="navbar">
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
    </ul>
  </div>
</section>

<main>
  <h4>I risultati della ricerca per la categoria "${categoria.nome}" sono:</h4>
  <div class="prodotti">
    <c:forEach items="${prodotticategoria}" var="prodotto">
      <div class="bordo">
      <a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/visualizza?id=${prodotto.id}" style="text-decoration: none">
        <div class="prodotto">
          <img src="img/${prodotto.nome}${prodotto.id}.jpg"><br>
        </div>
        <h3 style="color: black">${prodotto.nome}</h3>
        <p style="color: #393E46">${prodotto.prezzo}€</p>
      </a>
      </div>
    </c:forEach>
  </div>
</main>

<footer>
  <!-- Il piè di pagina va qui -->
</footer>
</body>
</html>
