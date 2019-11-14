<%-- 
    Document   : Visor
    Created on : 10/11/2019, 07:25:41 PM
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
        <title>Hola!</title>
    </head>
    <body>
        <%
            Navbar navbar = new Navbar();
            try {
                out.println(navbar.showNavbar(session.getAttribute("nombreU").toString()));
            } catch (Exception e) {
                 response.sendRedirect("./login");
                out.println(navbar.showNavbar(""));
            }
        %>
        <section class="hero is-info">
            <div class="hero-body">
                <div class="container">
                    <h1 class="title">
                        Tuits
                    </h1>
                    <h2 class="subtitle">

                    </h2>
                </div>
            </div>
        </section>
    </body>
</html>
