<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="template" tagdir="/WEB-INF/tags" %>

<template:Template>
    <h1>Bienvenue sur notre application Permis Piste</h1>

    <div class="row col-lg-2"></div>
    <div class="row col-lg-8 center-block">
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>

            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="/resources/image/voiture.jpg" alt="voiture">

                    <div class="carousel-caption">
                        <h2>Rouler vers l'excellence</h2>
                    </div>
                </div>
                <div class="item">
                    <img src="/resources/image/avion.jpg" alt="avion">

                    <div class="carousel-caption">
                        <h2>Planer vers d'autres horizons</h2>
                    </div>
                </div>
            </div>

            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>

</template:Template>