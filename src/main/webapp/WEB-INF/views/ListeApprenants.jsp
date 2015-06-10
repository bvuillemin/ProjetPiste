<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="template" tagdir="/WEB-INF/tags" %>

<template:Template>

    <h1>Liste des Clients</h1>
    <input type="hidden" name="uneErreur" value="${MesErreurs}" id="id_erreur">
    <p><a href="index.htm">[Accueil]</a><a href="index.htm">[Accueil]</a></p>
    <table>
        <tr>
            <th>Numéro Client</th>
            <th>Nom Client</th>
            <th>Adresse Client</th>
        </tr>
        <c:forEach items="${mesapprenants}" var="item">
            <tr>
                <td>${item.numapprenant}</td>
                <td>${item.nomapprenant}</td>
                <td>${item.prenomapprenant}</td>

            </tr>
        </c:forEach>

        <tr>
            <td colspan="5">
                &nbsp;&nbsp;
            </td>
        </tr>
    </table>
</template:Template>
