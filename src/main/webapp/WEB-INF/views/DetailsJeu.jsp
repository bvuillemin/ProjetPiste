<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="template" tagdir="/WEB-INF/tags" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<template:Template>

    <h1>Liste des Jeux</h1>
    <input type="hidden" name="uneErreur" value="${MesErreurs}" id="id_erreur">

    <div class="container">

        <table class="table table-striped">
            <tr>
                <th>Numéro</th>
                <th>Libellé</th>
            </tr>
            <c:forEach items="${mesmissions}" var="item">
                <tr>
                    <td>${item.nummission}</td>
                    <td>${item.libmission}</td>
                </tr>
            </c:forEach>
            <c:forEach items="${mesactions}" var="item">
                <tr>
                    <td>${item.numaction}</td>
                    <td>${item.libaction}</td>
                </tr>
            </c:forEach>

            <tr>
                <td colspan="5">
                    &nbsp;&nbsp;
                </td>
            </tr>
        </table>
    </div>
</template:Template>
