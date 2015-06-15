<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="template" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<template:Template>

    <h1>Liste des Clients</h1>
    <input type="hidden" name="uneErreur" value="${MesErreurs}" id="id_erreur">
    <table>
        <tr>
            <th>Numéro Client</th>
            <th>Nom Client</th>
        </tr>
        <c:forEach items="${mesjeux}" var="item">
            <tr>
                <td>${item.numjeu}</td>
                <td>${item.libellejeu}</td>
            </tr>
        </c:forEach>

        <tr>
            <td colspan="5">
                &nbsp;&nbsp;
            </td>
        </tr>
    </table>
</template:Template>
