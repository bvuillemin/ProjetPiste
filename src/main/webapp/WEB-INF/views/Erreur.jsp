<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="template" tagdir="/WEB-INF/tags" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<template:Template>
    <div class="container">
        <div class="span12">
            <br><br>

            <p id="face">:(</p><br><br>

            <p id="description">Your website ran into a problem that it couldn't handle, and now it needs to
                restart.</p>

            <p><br></p>

            <p id="guide">You can search for the error online:<br>${MesErreurs}</p>
        </div>
        <!-- span12 -->
    </div>
</template:Template>