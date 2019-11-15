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
        <script src="./js/jquery.min.js"></script>
        <script src="./js/jquery.validate.min.js"></script>
        <script src="./js/registro.js"></script>
        <title>Registrate</title>
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
                        Registrate
                    </h1>
                    <h2 class="subtitle">
                        Unete ahora para ser parte de una red social que te acompanara en tu dia a dia
                    </h2>
                </div>
            </div>
        </section>
        <section class="section">
            <div class="container">
                <h1 class="title">
                    Crea tu cuenta en Piolin
                </h1>
            </div>
        </section>
        <form name="registro"id="registro" action="registrarse"  enctype="multipart/form-data" method="post">
            <div class="container ">
                <div class="column">
                    <div class="column is 4">
                        <div class="field">
                            <p class="control has-icons-left has-icons-right">
                                <input name="email" id="email" class="input is-primary" type="text" placeholder="Correo electornico">
                                <span class="icon is-small is-left">
                                    <i class="fas fa-envelope"></i>
                                </span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container">
                <div class="column">
                    <div class="column is 4">
                        <div class="field">
                            <p class="control has-icons-left has-icons-right">
                                <input name="nomU" id="nomU" class="input is-primary" type="text" placeholder="Crea tu Nuevo Nombre de Usuario">
                                <span class="icon is-small is-left">
                                    <i class="fas fa-envelope"></i>
                                </span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container">
                <div class="column">
                    <div class="column is 4">
                        <div class="field">
                            <p class="control has-icons-left">
                                <input name="contra" id="contra" class="input" type="password" placeholder="Crea tu Nueva Contraseña">
                                <span class="icon is-small is-left">
                                    <i class="fas fa-lock"></i>
                                </span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container">
                <div class="column">
                    <div class="column is 4">
                        <div class="field">
                            <p class="control has-icons-left">
                                <input name="rContra" id="rContra" class="input" type="password" placeholder="Repite tu Nueva Contraseña">
                                <span class="icon is-small is-left">
                                    <i class="fas fa-lock"></i>
                                </span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="is-size-4" align="center">
                Foto de Perfil<br />
                <input type="file" id="file" name="file" size="50" 
                       onchange="document.getElementById('blah').src = window.URL.createObjectURL(this.files[0])"
                       />
                <div class="column is-8">
                    <figure class="image is-128x128">
                        <img id="blah" src="./assets/empty.jpg">
                    </figure>
                    <br/>
                </div>
                <br/>
            </div>
            <div class="field">
                <p class="control">
                <div align="center">
                    <button name="bRegistro" id="bRegistro"class="button is-success">
                        Crear Cuenta
                    </button>
                    </p>
                </div>
            </div>               
        </form>
    </body>
</html>
