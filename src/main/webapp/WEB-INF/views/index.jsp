<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <jsp:include page="/WEB-INF/views/Header.jsp"/>
</head>

<body onLoad="Chargement();">

<jsp:include page="/WEB-INF/views/NavHorizontal.jsp"/>

<div class="row">

    <div class="col-md-1"></div>
    <div class="col-md-2">
        <jsp:include page="/WEB-INF/views/NavVertical.jsp"/>
    </div>
    <div class="col-md-1"></div>
    <div class="col-md-7">
        <jsp:include page="/WEB-INF/views/Accueil.jsp"/>
    </div>
    <div class="col-md-1"></div>

</div>
</body>

<foot>
    <jsp:include page="/WEB-INF/views/Footer.jsp"/>
</foot>
</html>