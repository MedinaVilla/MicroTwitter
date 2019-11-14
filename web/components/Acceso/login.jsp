<%-- 
    Document   : login
    Created on : 7/11/2019, 07:33:07 PM
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
     
        <script src="./js/jquery.min.js"></script>
        <script src="./js/jquery.validate.min.js"></script>
        <script src="./js/login.js"></script>
        <title>Inicia sesion</title>
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
        <section class="hero is-info">
            <div class="hero-body">
                <div class="container">
                    <h1 class="title">
                        Login
                    </h1>
                    <h2 class="subtitle">
                        Inicia sesion con tu cuenta para seguir con la experiencia
                    </h2>
                </div>
            </div>
        </section>

        <div style="text-align: right;width:650px">
            <section class="section">
                <div class="container">
                    <h1 class="title">
                        Inicie Sesión en <strong>Piolin</strong>
                    </h1>
                </div>
        </div>
        <form name="login" id="login" action="loguearse" method="GET">
            <div class="container">
                <div class="column">
                    <div class="column is 4">
                        <div class="field">
                            <p class="control has-icons-left has-icons-right">
                                <input name="nomU" id="nomU" class="input is-primary" type="text" placeholder="Usuario">
                                <span class="icon is-small is-left">
                                    <i class="fas fa-envelope"></i>
                                </span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="column">
                <div class="column is 4">
                    <div class="field">
                        <p class="control has-icons-left">
                            <input name="contra" id="contra" class="input" type="password" placeholder="Contraseña">
                            <span class="icon is-small is-left">
                                <i class="fas fa-lock"></i>
                            </span>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="field">
            <p class="control">
            <div style="text-align: right;width:200px">
                <button name="bLogin" id="bLogin" type="submit" class="button is-success">
                    Ingresar
                </button>
                </p>
            </div>
        </div>
    </form>
</body>
</html>
