<%-- 
    Document   : Perfil
    Created on : 10/11/2019, 07:25:30 PM
    Author     : MedinaVilla
--%>

<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="Java.database"%>
<%@page import="Java.Navbar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="assets/twitter.png" type="image/icon type">
        <link rel="stylesheet" href="./css/bulma.css" type="text/css"/>
        <title>Perfil</title>
    </head>
    <body>
        <%
            Navbar navbar = new Navbar();
            try {
                out.println(navbar.showNavbar(session.getAttribute("nombreU").toString()));
            } catch (Exception e) {
                out.println(navbar.showNavbar(""));
            }
        %>

        <section class="hero is-info">
            <div class="hero-body">
                <div class="columns is-mobile">
                    <div class="column">
                        <div class="container" align="left">
                            <figure class="image is-128x128">
                                <img class="is-rounded" src="https://bulma.io/images/placeholders/128x128.png">
                            </figure>
                            <BR CLEAR=LEFT>
                        </div>
                    </div>
                    <div class="container" align="right">
                        <div class="column is-6 is-offset-4">
                            <section class="hero is-info">
                                <div class="hero-body">
                                    <h1 class="title">
                                        @Nombre Usuario
                                    </h1>
                                    <h2 class="subtitle">
                                        correo@outlook.com
                                    </h2>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <nav class="level">
            <div class="level-item has-text-centered">
                <div>
                    <br>
                    <p class="heading">Mis Tweets</p>
                    <p class="title">
                         <%     
                             ResultSet res;
                                res = null;
                                database db = new database();
                                db.conectar();
                                res = db.consulta(
                                        "select count(idTweet) as tweets "+
                                        "from (select texto, fecha "+
                                        "from (select correoE "+
                                        "from usuario join seguidores on correoE = seguidor where seguidor = '" + session.getAttribute("email").toString() + "') as seguidos " +
                                        "join tweet on tweet.usuario = seguidos.correoE) "+
                                        "as tweetUsuario natural join imagen;");
                                if (res.next()) {
                                    out.println(res.getString("tweets"));
                                }
                            %>
                        
                        
                    </p>
                </div>
            </div>
            <div class="level-item has-text-centered">
                <div>
                    <br>
                    <p class="heading">Siguiendo</p>
                    <!--Este es el boton para ver a los que sigues-->
                    <p class="title"><a href="perfil/siguiendo" class="link is-info">
                            <%
                                res = null;
                                db = new database();
                                db.conectar();
                                res = db.consulta(
                                        "select count(correoE) as seguidos from usuario join seguidores on correoE = seguidor "
                                        + "where seguido = '" + session.getAttribute("email").toString() + "'  ;");

                                if (res.next()) {
                                    out.println(res.getString("seguidos"));
                                }

                            %>

                        </a></p>
                </div>
            </div>
            <div class="level-item has-text-centered">
                <div>
                    <br>
                    <p class="heading">Seguidores</p>
                    <!--Este es el boton para ver los seguidores-->
                    <p class="title"><a href="perfil/seguidores" class="link is-info">
                            <%                                
                                res = null;
                                db = new database();
                                db.conectar();
                                res = db.consulta(
                                        "select count(correoE) as seguidores from usuario join seguidores on correoE = seguido"
                                        + " where seguidor = '" + session.getAttribute("email").toString() + "';");
                                if (res.next()) {
                                    out.println(res.getString("seguidores"));
                                }
                            %>

                        </a></p>
                </div>
            </div>
        </nav>

        <br>
        <div class ="container">
            <article class="media">
                <figure class="media-left">
                    <p class="image is-64x64">
                        <img src="https://bulma.io/images/placeholders/128x128.png">
                    </p>
                </figure>
                <div class="media-content">
                    <div class="content">
                        <p>
                            <strong>Usuario(Yo)</strong> <small>@Usuario</small> <small>fecha</small>
                            <br>
                            Here Goes the Tweet
                        </p>
                    </div>
                    <nav class="level is-mobile">
                        <div class="level-left">
                            <!--Boton de Retweet-->
                            <a class="level-item">
                                <span class="icon is-small"><i class="fas fa-retweet"></i></span>
                            </a>
                        </div>
                    </nav>
                </div>

                <div class="media-right">
                    <button class="delete"></button>
                </div>
            </article>
        </div>
        <br><br>

        <div class ="container">
            <article class="media">
                <figure class="media-left">
                    <p class="image is-64x64">
                        <img src="https://bulma.io/images/placeholders/128x128.png">
                    </p>
                </figure>
                <div class="media-content">
                    <div class="content">
                        <p>
                            <strong>Usuario(Yo)</strong> <small>@Usuario</small> <small>fecha</small>
                            <br>
                            Another Tweet
                        </p>
                    </div>
                    <nav class="level is-mobile">
                        <div class="level-left">
                            <!--Boton de Retweet-->
                            <a class="level-item">
                                <span class="icon is-small"><i class="fas fa-retweet"></i></span>
                            </a>
                        </div>
                    </nav>
                </div>

                <div class="media-right">
                    <button class="delete"></button>
                </div>
            </article>
        </div>

    </body>
</html>
