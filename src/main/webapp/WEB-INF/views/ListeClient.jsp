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
      <th>Numéro Client </th>
      <th>Nom Client</th>
      <th>Adresse Client</th>
      <th> Code postal</th>
      <th>Ville</th>
      <th> Type de pièce d'identité</th>
      <th> Numéro de pièce d'identité</th>
    </tr>
  <c:forEach  items="${mesclients}"  var="item" >
  <tr>
     <td>${item.numCli}</td>
     <td>${item.nomCli}</td>
     <td>${item.adrRueCli}</td>
     <td>${item.cpCli}</td>
     <td>${item.villeCli}</td>
      <td>${item.pieceCli}</td>
     <td>${item.numPieceCli}</td>
    
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
