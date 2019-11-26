<%--
    Document   : Perfil
    Created on : 10/11/2019, 07:25:30 PM
    Author     : MedinaVilla
--%>

<%@page import="java.util.Base64"%>
<%@page import="java.sql.Blob"%>
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
        <link rel="stylesheet" href="./assets/font/css/all.css" type="text/css">
        <link rel="stylesheet" href="./css/bulma.css" type="text/css"/>
        <title>Perfil</title>
    </head>
    <body>
        <%
            Navbar navbar = new Navbar();
            try {
                out.println(navbar.showNavbar(session.getAttribute("nomU").toString()));
            } catch (Exception e) {
                out.println(navbar.showNavbar(""));
            }
        %>

        <section class="hero is-info">
            <div class="hero-body">
                <div class ="container">
                    <article class="media">
                        <div class="container">
                            <br/>
                            <div class="media-left" align="left">
                                <%
                                    ResultSet res;
                                    res = null;
                                    database db = new database();
                                    db.conectar();
                                    res = db.consulta("select imagen from usuario where nomU='" + session.getAttribute("nomU") + "'");
                                    if (res.next()) {
                                        Blob blob = res.getBlob("imagen");
                                        byte byteArray[] = blob.getBytes(1, (int) blob.length());
                                        String base64Encoded = Base64.getEncoder().encodeToString(byteArray);
                                        out.println("<figure class='media-left'>");
                                        out.println("<p class='image is-128x128'>");
                                        out.println("<img src='data:image/jpg;base64," + base64Encoded + "'/>");
                                        out.println("</p>");
                                        out.println("</figure>");
                                    }
                                %>
                                <BR CLEAR=LEFT>
                            </div>
                        </div>
                        <div class="media-content">
                            <div class="content">

                            </div>
                        </div>
                        <div class="media-right">
                            <div class="content">
                                <section class="hero is-info">
                                    <div class="hero-body">
                                        <h1 class="title">
                                            <%
                                                out.println(session.getAttribute("nomU").toString());
                                            %>
                                        </h1>
                                        <h2 class="subtitle">
                                            <%
                                                String email = session.getAttribute("email").toString();
                                                out.println(email);
                                            %>
                                        </h2>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </article>
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
                            res = null;
                            db = new database();
                            db.conectar();
                            res = db.consulta("select count(idTweet) from tweet where usuario='" + session.getAttribute("email").toString() + "';");

                            if (res.next()) {
                                out.println(res.getString("count(idTweet)"));
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
                    <p class="title"><a href="perfil/seguidos" class="link is-info">
                            <%
                                res = null;
                                db = new database();
                                db.conectar();
                                res = db.consulta(
                                        "select count(correoE) as seguidos from usuario join seguidores on correoE = seguido "
                                        + "where seguidor = '" + session.getAttribute("email").toString() + "'  ;");

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
                            <%                                res = null;
                                db = new database();
                                db.conectar();
                                res = db.consulta(
                                        "select count(correoE) as seguidores from usuario join seguidores on correoE = seguidor"
                                        + " where seguido = '" + session.getAttribute("email").toString() + "';");
                                if (res.next()) {
                                    out.println(res.getString("seguidores"));
                                }
                            %>

                        </a></p>
                </div>
            </div>
        </nav>

        <br>

        <div class="box field">
            <div class ="container">
                <%
                        db = new database();
                        db.conectar();
                        res = db.consulta("select nomU, imagen, texto, fecha, nomUsuRet, ruta from ("
                                + "(select idTweet, texto, usuario, nomU, imagen, fecha, nomUsuRet from "
                                + "((select correoE, nomU, imagen from usuario where correoE ='" + session.getAttribute("email").toString() + "') as usuarioActual join tweet on usuarioActual.correoE = tweet.usuario)) "
                                + "as tweetsUsuarioActual left join imagen on tweetsUsuarioActual.idTweet = imagen.idTweet and "
                                + "tweetsUsuarioActual.usuario = imagen.usuario) order by fecha desc;");
                        while (res.next()) {
                            Blob blob = res.getBlob("imagen");
                            byte byteArray[] = blob.getBytes(1, (int) blob.length());
                            String base64Encoded = Base64.getEncoder().encodeToString(byteArray);
                            out.println("<article class='media'>");
                            out.println("<figure class='media-left'>");
                            out.println("<p class='image is-64x64'>");
                            out.println("<img src='data:image/jpg;base64," + base64Encoded + "'/>");
                            out.println("</p>");
                            out.println("</figure>");
                            out.println("<div class='media-content'>");
                            out.println("<div class='content'>");
                            out.println("<p>");
                            out.println("<strong>nomU</strong> <small>fecha</small>");
                            out.println("<br>");
                            out.println(res.getString("texto"));
                            out.println("<br>");
                            blob = res.getBlob("ruta");
                            if (blob != null) {
                                byteArray = blob.getBytes(1, (int) blob.length());
                                base64Encoded = Base64.getEncoder().encodeToString(byteArray);
                                out.println("<figure class='media-left'>");
                                out.println("<p class='image is-64x64'>");
                                out.println("<img src='data:image/jpg;base64," + base64Encoded + "'/>");
                                out.println("</p>");
                                out.println("</figure>");
                            }
                            out.println("<small>Fecha de publicacion: " + res.getString("fecha") + "</small>");
                            out.println("</p>");
                            out.println("</div>");
                            out.println("<nav class='level is-mobile'>");
                            out.println("<div class='level-left'>");
                            out.println("</div>");
                            out.println("</nav>");
                            out.println("</div>");
                            out.println("</article>");
                        }
                %>
            </div>
        </div>
    </body>
</html>
