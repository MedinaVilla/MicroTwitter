<%-- 
    Document   : index.jsp
    Created on : 7/11/2019, 07:30:55 PM
    Author     : MedinaVilla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="./assets/twitter.png" type="image/icon type">
        <link rel="stylesheet" href="./css/bulma.css" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bievenido</title>
    </head>
    <body>
        <nav class="navbar" role="navigation" aria-label="main navigation">
            <div class="navbar-brand">
                <a class="navbar-item" href="https://bulma.io">
                    <img src="https://bulma.io/images/bulma-logo.png" width="112" height="28">
                </a>

                <a role="button" class="navbar-burger burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
                    <span aria-hidden="true"></span>
                    <span aria-hidden="true"></span>
                    <span aria-hidden="true"></span>
                </a>
            </div>

            <div id="navbarBasicExample" class="navbar-menu">
                <div class="navbar-start">
                    <a class="navbar-item">
                        Home
                    </a>

                    <a class="navbar-item">
                        Documentation
                    </a>

                    <div class="navbar-item has-dropdown is-hoverable">
                        <a class="navbar-link">
                            More
                        </a>

                        <div class="navbar-dropdown">
                            <a class="navbar-item">
                                About
                            </a>
                            <a class="navbar-item">
                                Jobs
                            </a>
                            <a class="navbar-item">
                                Contact
                            </a>
                            <hr class="navbar-divider">
                            <a class="navbar-item">
                                Report an issue
                            </a>
                        </div>
                    </div>
                </div>

                <div class="navbar-end">
                    <div class="navbar-item">
                        <div class="buttons">
                            <a href="registro" class="button is-link">
                                <strong>Registro</strong>
                            </a>
                            <a href="login"class="button is-light">
                                Iniciar Sesion
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
        <section class="hero is-fullheight is-default is-bold">
            <div class="hero-body">
                <div class="container has-text-centered">
                    <div class="columns is-vcentered">
                        <div class="column is-5">
                            <figure class="image is-4by3">
                                <img src="././assets/earth.jpg" alt="Description">
                            </figure>
                        </div>
                        <div class="column is-6 is-offset-1">
                            <h1 class="title is-2">
                                MicroTwitter
                            </h1>
                            <h2 class="subtitle is-4">
                                Descubre lo que está pasando en el mundo en este momento
                            </h2>
                            <br>
                            <p class="has-text-centered">
                                <a href="registro" class="button is-medium is-info is-outlined">
                                    Unete
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="hero-foot">
                <div class="container">
                    <div class="tabs is-centered">
                        <ul>
                            <li><a>Todos derechos estan reservados 2019</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>

    </body>
</html>
