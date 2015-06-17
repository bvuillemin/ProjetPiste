<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="template" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<template:Template>

    <h4>Ajouter un apprenant</h4>
    <input type="hidden" name="uneErreur" value="${MesErreurs}"
           id="id_erreur">

    <form method="post" action="ajouterApprenant.htm">
        <input type="hidden" name="type" value="ajout" id="type"/>
        <table BORDER="1" class="table table-stripped">
            <!-- input fields -->
            <tr>
                <td>Numéro</td>
                <td><input type="text" name="id" id="id"/></td>
            </tr>
            <tr>
                <td>Prénom</td>
                <td><input type="text" name="prenom" id="prenom"/></td>
            </tr>

            <tr>
                <td>Nom</td>
                <td><input type="text" name="nom" id="nom"/></td>
            </tr>

            <!-- Boutons Modifier -->
            <tr>
                <td colspan="1"><input type="submit" name="ajouter"
                                       value="Ajouter"/></td>
            </tr>
        </table>
    </form>

</template:Template>
