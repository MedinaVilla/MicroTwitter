<%-- 
    Document   : Visor
    Created on : 10/11/2019, 07:25:41 PM
    Author     : MedinaVilla
--%>

<%@page import="java.util.Base64"%>
<%@page import="javax.swing.ImageIcon"%>
<%@page import="java.awt.Image"%>
<%@page import="java.io.File"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Java.database"%>
<%@page import="Java.Navbar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

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
            out.println(navbar.showNavbar(session.getAttribute("nomU").toString()));
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
    <div class="columns">
        <div class=" column container is-three-quarters">
            <div class="box">
                <div class="columns">
                    <div class="column is-one-fifths ">
                        <%
                            ResultSet res = null;
                            database db = new database();
                            db.conectar();
                            System.out.println(session.getAttribute("nomU"));
                            res = db.consulta("select * from usuario where nomU='" + session.getAttribute("nomU") + "';");
                            if (res.next()) {
                                Blob blob = res.getBlob("imagen");
                                byte byteArray[] = blob.getBytes(1, (int) blob.length());
                                String base64Encoded = Base64.getEncoder().encodeToString(byteArray);
                                out.println("<div class='columns'>");
                                out.println("<figure class='column image is-128x128'>");
                                out.println("<img class='is-rounded image is-64x64' src='data:image/jpg;base64," + base64Encoded + "' />");
                                out.println("<p class='has-text-weight-semibold'>@" + res.getString("nomU") + "</p>");
                                out.println("</figure>");
                                out.println("</div>");
                                //                                out.println();
                            }
                        %>    
                    </div>
                    <div class="field-body column is-four-fifths">
                        <form action="submitTweet" method="POST">
                            <div class="field">
                                <div class="control">
                                    <textarea name="texto" id="texto" class="textarea" rows="2" placeholder="¿Qué está pasando?"></textarea>
                                </div>
                            </div>
                            <div class="">
                                <div>
                                    <icon/>
                                </div>
                                <div>
                                    <input onchange="document.getElementById('blah').src = window.URL.createObjectURL(this.files[0]);
                                            document.getElementById('imagePreview').style.display = 'block';
                                           " type="file" id="selectedFile" style="display: none;" />
                                    <a onclick="document.getElementById('selectedFile').click();">
                                        <img class="image is-24x24" src="assets/picture.png"></img>
                                    </a>
                                    <button class="button is-danger is-rounded is-small" type="submit">Publicar</button>

                                        <figure id="imagePreview" name='imagePreview' class="image is-128x128 " style="display: none;">
                                            <img id="blah" name='blah' src="">
                                        </figure>
                                        <br/>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="box">
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
                        </div>
                    </article>
                </div>
            </div>
        </div>
        <div class="column is-one-quarter"> 
            <div class='box'>
                <p class="title">Seguidores</p>
                <hr/>
                <%
                    res = null;
                    db = new database();
                    db.conectar();
                    res = db.consulta(
                            "select correoE, nomU, contra, imagen, seguidores.fecha from usuario join seguidores on correoE = seguido"
                            + " where seguidor = '" + session.getAttribute("email").toString() + "';");
                    while (res.next()) {
                        Blob blob = res.getBlob("imagen");
                        byte byteArray[] = blob.getBytes(1, (int) blob.length());
                        String base64Encoded = Base64.getEncoder().encodeToString(byteArray);
                        out.println(" <article class='media'>");
                        out.println("<figure class='media-left image is-64x64'>");
                        out.println("<img class='is-rounded image is-64x64' src='data:image/jpg;base64," + base64Encoded + "' />");
                        out.println("</figure>");
                        out.println("<div class='media-content'>");
                        out.println("<div class='content'>");
                        out.println("<br/>");
                        out.println("<p class='is-size-5'><strong>@" + res.getString("nomU") + "</strong></p>"
                                + "<p><small>Seguido desde: " + res.getString("fecha") + "</small>"
                                + "</p>");
                        out.println("</div>");
                        out.println("</article>");
                        out.println("<hr/>");

                    }
                    db.cierraConexion();
                %>
            </div>
        </div>

    </div>
</body>
</html>
