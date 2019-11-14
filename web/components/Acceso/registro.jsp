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
        <section class="section">
      <div class="container">
        <h1 class="title">
          Crea tu cuenta en Piolin
        </h1>
      </div>
    </section>

    <div class="container">
      <div class="column">
        <div class="column is 4">
          <div class="field">
            <p class="control has-icons-left has-icons-right">
              <input class="input is-primary" type="text" placeholder="Crea tu Nuevo Nombre de Usuario">
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
                <input class="input" type="password" placeholder="Crea tu Nueva Contraseña">
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
                <input class="input" type="password" placeholder="Repite tu Nueva Contraseña">
                  <span class="icon is-small is-left">
                    <i class="fas fa-lock"></i>
                  </span>
                  </p>
            </div>
          </div>
        </div>
      </div>


        <div align="center">
        Selecciona tu Nueva foto de Perfil
          <input name="file-input" id="file-input" type="file" />
          <br />
        <img id="imgSalida" width="50%" height="50%" src="" />
      </div>

      <div align="center">
        <figure class="image is-128x128">
          <img class="is-rounded" src="https://bulma.io/images/placeholders/128x128.png">
        </figure>
        <BR CLEAR=LEFT>
      </div>

      <div class="field">
        <p class="control">
          <div align="center">
          <form action="Servlet" method="POST">
          <button class="button is-success">
            Crear Cuenta
          </button>
        </form>
        </p>
      </div>
      </div>
    </body>
</html>
