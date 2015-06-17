<%@ page import="java.util.Iterator" %>
<%@ page import="com.epul.cerisaie.hibernate.metier.Apprenant" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="template" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<template:Template>

    <h4>Inscrire un apprenant</h4>

    <div class="row col-md-5">


        <form method="post" action="InscriptionApprenant.htm">
            <input type="hidden" name="jeu" value="${unjeu}" id="jeu"/>
            <input type="hidden" name="apprenants" value="${mesapprenants}" id="apprenants"/>
            <table class="table">

                <tr>
                    <td>Numéro du Jeu</td>
                    <td><LABEL FOR=jeu>${unjeu.numjeu}</LABEL></td>
                </tr>
                <tr>
                    <td>Libellé du Jeu</td>
                    <td><LABEL FOR=jeu>${unjeu.libellejeu}</LABEL></td>
                </tr>
                <tr>
                    <td>Nom de l'apprenant</td>
                    <td>
                        <FORM>
                            <SELECT name="apprenants" size="1">
                                <c:forEach items="${mesapprenants}" var="item">
                                    <OPTION value="${item.numapprenant}">${item.nomapprenant}</OPTION>
                                        </c:forEach>
                            </SELECT>
                        </FORM>
                </tr>
                <tr>
                    <td>
                        <input class="btn btn-info col-lg-10" type="submit" name="inscrire"
                               value="Inscrire"/>
                    </td>
                </tr>
            </table>
            <input type="hidden" name="jeu" value="${mesapprenants}" id="jeu"/>
        </form>

    </div>

</template:Template>
