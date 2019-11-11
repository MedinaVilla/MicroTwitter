<%-- 
    Document   : registro
    Created on : 7/11/2019, 07:33:14 PM
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

        <title>Registrate</title>
    </head>
    <body>
        <%
            Navbar navbar = new Navbar();
            try {
                out.println(navbar.showNavbar());
            } catch (Exception e) {
                out.println(navbar.showNavbar());
            }
        %>
        <section class="hero is-info">
            <div class="hero-body">
                <div class="container">
                    <h1 class="title">
                        Registrate
                    </h1>
                    <h2 class="subtitle">
                        Unete ahora para ser parte de una red social que te acompanara en tu dia a dia
                    </h2>
                </div>
            </div>
        </section>
    </body>
</html>
