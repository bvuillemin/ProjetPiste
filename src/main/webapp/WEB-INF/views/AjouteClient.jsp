<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ajout d'un client </title>

<script language=javascript>
  function verif()
  {
  if(
     document.getElementById("nomCli").value == "" || 
     document.getElementById("adrRueCli").value == "" ||
     document.getElementById("cpCli").value == ""  ||
     document.getElementById("villeCli").value == ""  ||
     document.getElementById("pieceCli").value == ""  ||
     document.getElementById("numPieceCli").value == "") 
       { alert("Un des champs n'est pas rempli !"); 
         return false; 
       }
  else
    return true;
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
<h1>Formulaire d'ajout d'un client</h1>
  <br>
  <p><a href="Controleur?action=listeClients">[Retour à la liste]</a></p>
  <form method="post" action="Controleur?action=sauveClient" onsubmit="return verif();">
  <input type ="hidden" name="uneErreur"  value="${MesErreurs}"  id ="id_erreur" >
  <input type="hidden" name="action" value="sauveClient" />
  <table>
    <!-- input fields -->
    
   <tr>
      <td>Nom Client </td>
      <td><input type="text" name="nomCli" value="" id="nomCli"/></td> 
  </tr>
   
      <tr>
      <td>Adresse du client</td>
         <td><input type="text" name="adrRueCli" value="" id="adrRueCli"/></td>
      </tr>
      <tr>
      <td>Code postal</td>
     <td><input type="text" name="cpCli" value="" id="cpCli"/></td>
    </tr>
     <tr>
      <td>Ville Client</td>
     <td><input type="text" name="villeCli" value="" id="villeCli"/></td>
    </tr>
    <tr>
      <td> Type de pièce du Client</td>
     <td><input type="text" name="pieceCli" value="" id="pieceCli"/></td>
    </tr>
    <tr>
      <td>Numéro de pièce  du  Client</td>
     <td><input type="text" name="numPieceCli" value="" id="numPieceCli"/></td>
    </tr>
    <!-- Boutons Ajouter-->
    <tr>
      <td colspan="2">
        <input type="submit" name="ajouter" value="Ajouter"/>
        
      </td>
    </tr>
  </table>
  </form>
</body>
</html>
