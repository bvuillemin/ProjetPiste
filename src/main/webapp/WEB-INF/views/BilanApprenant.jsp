<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="template" tagdir="/WEB-INF/tags" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<template:Template>

    <h1>Détails des scores pour ${monapprenant.prenomapprenant} ${monapprenant.nomapprenant}</h1>

    <h3>Liste des scores</h3>
    <table class="table table-bordered">
        <tr>
            <th>Jeu</th>
            <th>Date d'inscription</th>
            <th>Action</th>
            <th>Score Minimal</th>
            <th>Valeur de début</th>
            <th>Valeur de fin</th>
            <th>Résultat</th>
        </tr>
        <c:forEach items="${monapprenant.mesInscriptions}" var="itemInscriptions">
            <c:forEach items="${itemInscriptions.jeu.actions}" var="itemactions">
                <tr>
                    <td>${itemInscriptions.jeu.libellejeu}</td>
                    <td><fmt:formatDate type="both" dateStyle="short"
                                        timeStyle="short" value="${itemInscriptions.calendrier.datejour}"
                                        pattern="dd/MM/yyyy"/></td>
                    <td>${itemactions.libaction}</td>
                    <td>${itemactions.scoremin}</td>
                    <c:set var="valeurdebut" value="-"/>
                    <c:set var="valeurfin" value="-"/>
                    <c:set var="resultat" value="Non passé"/>
                    <c:forEach items="${messcores}" var="itemscore">
                        <c:if test="${itemscore.action.numaction == itemactions.numaction}">
                            <c:set var="valeurdebut" value="${itemscore.valeurdebut}"/>
                            <c:set var="valeurfin" value="${itemscore.valeurfin}"/>
                            <c:if test="${itemactions.scoremin < (itemscore.valeurdebut + itemscore.valeurfin)}"> 
                                <c:set var="resultat" value="Validé"/>
                            </c:if> 
                            <c:if test="${itemactions.scoremin >= (itemscore.valeurdebut + itemscore.valeurfin)}"> 
                                <c:set var="resultat" value="Non Validé"/>
                            </c:if>
                        </c:if>
                    </c:forEach>
                    <td>${valeurdebut}</td>
                    <td>${valeurfin}</td>
                    <td>${resultat}</td>
                </tr>
            </c:forEach>
        </c:forEach>
    </table>
</template:Template>
