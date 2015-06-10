<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE HTML>
<html>

<head>
  <title>${param.title}</title>
  <jsp:include page="/WEB-INF/views/Header.jsp"/>
</head>

<body  onLoad="Chargement();">

<h1>${param.title}</h1>





<jsp:include page="/WEB-INF/views/Footer.jsp"/>


</body>
</html>