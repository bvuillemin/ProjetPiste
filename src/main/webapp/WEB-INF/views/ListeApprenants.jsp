<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="template" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<template:Template>

    <h1>Liste des Apprenants</h1>
    <input type="hidden" name="uneErreur" value="${MesErreurs}" id="id_erreur">
    <p><a href="Index.htm">[Accueil]</a></p>
    <table>
        <tr>
            <th>Numéro Apprenant</th>
            <th>Nom Apprenant</th>
            <th>Prénom Apprenant</th>
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
