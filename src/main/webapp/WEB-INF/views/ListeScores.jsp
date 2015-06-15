<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="template" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<template:Template>

  <h1>Scores</h1>
  <input type="hidden" name="uneErreur" value="${MesErreurs}" id="id_erreur">
  <table class="table table-bordered">

  </table>
</template:Template>
