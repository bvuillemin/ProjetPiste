<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="template" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<template:Template>

    <h1>Ajouter un apprenant</h1>

    <div class="row col-md-5">

        <form method="post" action="ajouterApprenant.htm">
            <input type="hidden" name="type" value="ajout" id="type"/>
            <table class="table">

                <tr>
                    <td>Numéro</td>
                    <td><input type="number" name="id" id="id"/></td>
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
                    <td><input class="btn btn-info col-lg-10"  type="submit" name="ajouter"
                                           value="Ajouter"/></td>
                </tr>
            </table>
        </form>

    </div>

</template:Template>
