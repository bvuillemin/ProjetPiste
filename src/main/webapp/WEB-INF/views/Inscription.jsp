<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="template" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<template:Template>

    <h4>Inscrire un apprenant</h4>

    <div class="row col-md-5">


        <form method="post" action="InscriptionApprenant.htm">
            <input type="hidden" name="idJeu" value="${unjeu.numjeu}"/>
            <table class="table">

                <tr>
                    <td>Numéro du Jeu</td>
                    <td><LABEL id="idJeu" name="idJeu" FOR=jeu>${unjeu.numjeu}</LABEL></td>
                </tr>
                <tr>
                    <td>Libellé du Jeu</td>
                    <td><LABEL FOR=jeu>${unjeu.libellejeu}</LABEL></td>
                </tr>
                <tr>
                    <td>Nom de l'apprenant</td>
                    <td>
                        <FORM>
                            <SELECT class="form-control" id="idApprenant" name="idApprenant" size="1">
                                <c:forEach items="${mesapprenants}" var="item">
                                    <OPTION  value="${item.numapprenant}">${item.nomapprenant}</OPTION>
                                </c:forEach>
                            </SELECT>
                        </FORM>
                </tr>

            </table>
            <input class="btn btn-info col-lg-6" type="submit" name="inscription"
                   value="inscription"/>
        </form>
    </div>

</template:Template>
