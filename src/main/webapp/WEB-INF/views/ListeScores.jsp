<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <script language="JavaScript">
    function checkAll(field)
    {
      for (i=0; i < field.length; i++)
      {   field[i].checked = true; }
    }
    function Chargement()
    {
      var obj = document.getElementById("id_erreur");
      if (obj.value!='')
        alert('Erreur signalée  : "'+obj.value+"'");
    }
  </script>
</head>
<body  onLoad="Chargement();">
<h1>Liste des Clients</h1>

<br>

<input type ="hidden" name="uneErreur"  value="${MesErreurs}"  id ="id_erreur" >
<p><a href="index.htm">[Accueil]</a></p>
<table>
  <tr>
    <th>Nom</th>
    <th>Prénom</th>
    <th>Score début</th>
    <th>Score fin</th>
  </tr>
  <c:forEach  items="${messcores}"  var="item" >
    <tr>
      <td>${monapprenant.nomapprenant}</td>
      <td>${monapprenant.prenomapprenant}</td>
      <td>${item.valeurdebut}</td>
      <td>${item.valeurfin}</td>
    </tr>
  </c:forEach>

  <tr>
    <td colspan="5">
      &nbsp;&nbsp;
    </td>
  </tr>
</table>
</body>
</html>
