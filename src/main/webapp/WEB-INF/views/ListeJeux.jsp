<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="template" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<template:Template>

    <h1>Liste des Jeux</h1>
    <input type="hidden" name="uneErreur" value="${MesErreurs}" id="id_erreur">

    <div class="container">

        <table class="table table-bordered">
            <tr>
                <th>Numéro Jeu</th>
                <th>Libellé du Jeu</th>
                <th>Inscription au Jeu</th>
            </tr>
            <c:forEach items="${mesjeux}" var="item">
                <tr>
                    <td>${item.numjeu}</td>
                    <td>${item.libellejeu}</td>
                    <td>
                        <form method="post" action="InscriptionJeu.htm">
                            <input type="hidden" name="id" value="${item.numjeu}"/>
                            <button class="btn btn-info col-lg-10" type="submit" name="inscription" value="Inscription">Inscription
                            </button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</template:Template>
