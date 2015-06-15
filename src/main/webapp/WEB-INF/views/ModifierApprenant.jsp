<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="template" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<template:Template>
    <h4>Modifier un jouet</h4>
    <input type="hidden" name="uneErreur" value="${MesErreurs}"
           id="id_erreur">

    <form method="post" action="sauverApprenants.htm">
        <input type="hidden" name="id" value="${apprenant.numapprenant}"/> <input
            type="hidden" name="type" value="modif" id="type"/>

        <table>
            <!-- input fields -->
            <tr>
                <td>Numéro</td>
                <td><LABEL FOR=id>"${apprenant.numapprenant}"</LABEL></td>
            </tr>
            <tr>
                <td>Prénom</td>
                <td><input type="text" name="libelle"
                           value="${apprenant.prenomapprenant}" id="prenom"/></td>
            </tr>

            <tr>
                <td>Nom</td>
                <td><input type="text" name="libelle"
                           value="${apprenant.nomapprenant}" id="nom"/></td>
            </tr>

            <!-- Boutons Modifier -->
            <tr>
                <td colspan="1"><input type="submit" name="modifier"
                                       value="Modifier"/></td>
            </tr>
        </table>
    </form>
</template:Template>