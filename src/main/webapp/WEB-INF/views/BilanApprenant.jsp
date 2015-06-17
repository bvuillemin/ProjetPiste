<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="template" tagdir="/WEB-INF/tags" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<template:Template>

    <h1>Détails des scores pour ${monapprenant.prenomapprenant} ${monapprenant.nomapprenant}</h1>

    <h3>Liste des scores</h3>
    <table class="table table-striped">
        <tr>
            <th>Action</th>
            <th>Score Minimal</th>
            <th>Valeur de début</th>
            <th>Valeur de fin</th>
            <th>Résultat</th>
        </tr>
        <c:forEach items="${monapprenant.monJeu}" var="itemjeu">
            <c:forEach items="${itemjeu.actions}" var="itemactions">
                <tr>
                    <td>${itemjeu.libellejeu}</td>
                    <td>${itemactions.libaction}</td>
                    <td>${itemactions.scoremin}</td>
                    <c:forEach items="${messcores}" var="itemscore">
                        <c:if test="${itemscore.action.numaction = itemactions.numaction}">
                            <td>${itemscore.valeurdebut}</td>
                            <td>${itemscore.valeurfin}</td>
                        </c:if>
                        <td>${itemscore.libaction}</td>
                    </c:forEach>
                    <c:if test="${itemscore.action.scoremin < (itemscore.valeurdebut + itemscore.valeurfin)}"> 
                        Validé 
                    </c:if> 
                    <c:if test="${itemscore.action.scoremin >= (itemscore.valeurdebut + itemscore.valeurfin)}"> 
                        Non validé 
                    </c:if>
                </tr>
            </c:forEach>
        </c:forEach>
    </table>
</template:Template>
