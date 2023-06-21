<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <title>Tren Nutrition</title>
</head>

<body>
<selection id="header">
    <div>
        <ul id="navbar">
            <li><a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/">Home</a></li>
            <li><a href="#">Chi siamo</a></li>
            <li><a href="#">Prodotti</a></li>
            <c:choose> <%-- Questo è un if else che serve per vedere se l'utente è l'admin perchè se lo è non serve avere il carrello --%>
                <c:when test="${!empty utente && utente.admin==true}">
                    <li><a href="#">Utenti</a></li> <%-- Se è un adimn aggiungo un altro elemento al menù per poter gestire gli utenti --%>
                </c:when>
                <c:otherwise>
                    <a href="#"><img src="img/shopping-cart-svgrepo-com.svg" class="logo" alt=""></a>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</selection>

<main>

    <c:choose> <%-- Questo if invece serve per vedere se l'utente ha fatto l'accesso. Se ha fatto l'accesso non mostro più form--%>
        <c:when test="${empty utente || utente == null}">
            <h1>ACCEDI</h1><br>
            <c:if test="${param.accesso == 0}">
                <h3>Email o password errata</h3><br>
            </c:if>
            <form action="Login" method="post">
                <label><b>Email</b></label> <br>
                <input type="email" name="email" id="email" required><br><br>
                <label><b>Password</b></label><br>
                <input type="password" name="password" id="password" required><br><br>
                <input type="submit" name="submit" value="Accedi">
                <a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/registrazione.html" style="text-decoration: none">Crea un account</a>
            </form>
        </c:when>
        <c:otherwise>
            <c:choose>
                <c:when test="${utente.admin != true}"> <%--Se l'utente che ha fatto l'accesso non è l'admin aggiungo i link per vedere gli ordini e i dati personali --%>
                    <h1> Bentornato ${utente.nome}, questa e' la tua pagina riservata</h1>
                    <ul>
                        <li><a href="#">I tuoi ordini</a></li>
                        <li><a href="#">Le tue informazioni personali</a></li>
                    </ul>
                    <form action="Login?esci=1" method="post">
                        <input type="submit" name="submit" value="Esci">
                    </form>
                </c:when>
                <c:otherwise>
                    <a href="AggiungiProdotto.jsp">Aggiungi Prodotto</a>
                    <form action="Login?esci=1" method="post">
                        <input type="submit" name="submit" value="Esci">
                    </form>
                </c:otherwise>
            </c:choose>
        </c:otherwise>
    </c:choose>
</main>

<footer>
    <!-- Il piè di pagina va qui -->
</footer>
</body>

</html>