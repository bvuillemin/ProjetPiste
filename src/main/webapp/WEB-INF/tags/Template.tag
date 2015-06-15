<%@tag description="" pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <jsp:include page="/WEB-INF/views/Gabarit/Header.jsp"/>
</head>

<body onLoad="Chargement();">

<jsp:include page="/WEB-INF/views/Gabarit/Nav/NavHorizontal.jsp"/>

<div class="row">

    <div class="col-md-1"></div>
    <!-- <div class="col-md-2">-->
    <jsp:include page="/WEB-INF/views/Gabarit/Nav/NavVertical.jsp"/>
    <!--</div>
    <div class="col-md-1"></div>-->
    <div class="col-md-10">


        <jsp:doBody/>


    </div>
    <div class="col-md-1"></div>

</div>
</body>

<foot>
    <jsp:include page="/WEB-INF/views/Gabarit/Footer.jsp"/>
</foot>
</html>
