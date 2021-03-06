<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="template" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<template:Template>

    <h1>Liste des Apprenants</h1>

    <div class="row">
        <input type="hidden" name="uneErreur" value="${MesErreurs}" id="id_erreur">
        <table class="table table-bordered">
            <tr>
                <th>Numéro Apprenant</th>
                <th>Nom Apprenant</th>
                <th>Prénom Apprenant</th>
                <th>Modifier</th>
                <th>Bilan</th>
                <th>Supprimer</th>
            </tr>
            <c:forEach items="${mesapprenants}" var="item">
                <tr>
                    <td>${item.numapprenant}</td>
                    <td>${item.nomapprenant}</td>
                    <td>${item.prenomapprenant}</td>
                    <td>
                        <form method="post" action="modifierApprenant.htm">
                            <input type="hidden" name="id" value="${item.numapprenant}"/>
                            <button class="btn btn-info col-lg-10" type="submit" name="modifier" value="Modifier">
                                Modifier
                            </button>
                        </form>
                    </td>
                    <td>
                        <form method="post" action="Bilan.htm">
                            <input type="hidden" name="id" value="${item.numapprenant}"/>
                            <button class="btn btn-success col-lg-10" type="submit" name="bilan" value="Bilan">
                                Bilan
                            </button>
                        </form>
                    </td>
                    <td>
                        <form method="post" action="effacerApprenant.htm">
                            <input type="hidden" name="id" value="${item.numapprenant}"/>
                            <button class="btn btn-danger col-lg-10" type="submit" name="supprimer" value="Supprimer">
                                Supprimer
                            </button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <div class="row col-lg-2">
        <form method="post" action="/ajouterUnApprenant.htm">
            <input type="hidden" name="id" value="${item.numapprenant}"/>
            <button class="btn btn-success" type="submit" name="ajouter" value="Ajouter">
                Ajouter
            </button>
        </form>
    </div>

</template:Template>
