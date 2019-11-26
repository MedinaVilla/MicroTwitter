<%-- 
    Document   : index.jsp
    Created on : 7/11/2019, 07:30:55 PM
    Author     : MedinaVilla
--%>

<%@page import="Java.Navbar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="assets/twitter.png" type="image/icon type">
        <link rel="stylesheet" href="./css/bulma.css" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bienvenido</title>
    </head>
    <body>
        <%
            Navbar navbar = new Navbar();
            try {
                out.println(navbar.showNavbar(session.getAttribute("nomU").toString()));
                              response.sendRedirect("./panel");

            } catch (Exception e) {
                out.println(navbar.showNavbar(""));
            }
        %>
        <section class="hero is-fullheight is-default is-bold">
            <div class="hero-body">
                <div class="container has-text-centered">
                    <div class="columns is-vcentered">
                        <div class="column is-5">
                            <figure class="image is-4by3">
                                <img src="././assets/earth.jpg" alt="earth">
                            </figure>
                        </div>
                        <div class="column is-6 is-offset-1">
                            <h1 class="title is-2">
                                Piolin
                            </h1>
                            <h2 class="subtitle is-4">
                                Descubre lo que está pasando en el mundo en este momento
                            </h2>
                            <br>
                            <p class="has-text-centered">
                                <a name="bLogin" id="bLogin" href="registro"class="button is-medium is-info is-outlined">
                                    Únete
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
