<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="template" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<template:Template>

  <h4>Inscrire un apprenant</h4>

  <div class="row col-md-5">

    <form method="post" action="InscriptionApprenant.htm">
      <input type="hidden" name="type" value="ajout" id="type"/>
      <table class="table">

        <tr>
          <td>Numéro du Jeu</td>
          <td><input type="number" name="idJeu" id="idJeu"/></td>
        </tr>
        <tr>
          <td>Nom du Jeu</td>
          <td><input type="text" name="nomJeu" id="nomJeu"/></td>
        </tr>

        <tr>
          <td>Numéro d'apprenant</td>
          <td><input type="text" name="idApprenant" id="idApprenant"/></td>
        </tr>

        <!-- Boutons Modifier -->
        <tr>
          <td><input class="btn btn-info col-lg-10"  type="submit" name="inscrire"
                     value="Inscrire"/></td>
        </tr>
      </table>
    </form>

  </div>

</template:Template>
