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
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ingreso Piolin</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.8.0/css/bulma.min.css">
    <script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
  </head>

  <body>
    <div style="text-align: right;width:650px">
    <section class="section">
    <div class="container">
      <h1 class="title">
        Inicie Sesión en <strong>Piolin</strong>
      </h1>
    </div>
  </div>
  </section>
    <div class="container">
      <div class="column">
        <div class="column is 4">
          <div class="field">
            <p class="control has-icons-left has-icons-right">
              <input class="input is-primary" type="text" placeholder="Usuario">
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
              <input class="input" type="password" placeholder="Contraseña">
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
        <div style="text-align: right;width:400px">
        <form action="Servlet" method="POST">
        <button class="button is-success">
          Ingresar
        </button>
      </form>
      </p>
    </div>
    </div>
  </body>
</html>

<!--
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="assets/twitter.png" type="image/icon type">
        <link rel="stylesheet" href="./css/bulma.css" type="text/css"/>
        <title>Inicia sesion</title>
    </head>
    <body>
                    Navbar navbar = new Navbar();
           try {
               out.println(navbar.showNavbar());
            } catch (Exception e) {
                out.println(navbar.showNavbar());
            }
        
        <section class="hero is-info">
            <div class="hero-body">
                <div class="container">
                    <h1 class="title">
                        Login
                    </h1>
                    <h2 class="subtitle">
                        Logueate con tu cuenta para seguir con la experiencia
                    </h2>
                </div>
            </div>
        </section>
    </body>
</html>
        -->