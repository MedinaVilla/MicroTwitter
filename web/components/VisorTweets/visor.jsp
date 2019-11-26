<%-- 
    Document   : Visor
    Created on : 10/11/2019, 07:25:41 PM
    Author     : MedinaVilla
--%>

<%@page import="java.sql.PreparedStatement"%>
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
    <link rel="icon" href="/MicroTwitter/assets/twitter.png" type="image/icon type">
    <link rel="stylesheet" href="/MicroTwitter/assets/font/css/all.css" type="text/css">
    <link rel="stylesheet" href="./css/bulma.css" type="text/css"/>
    <title>Hola!</title>

</head>
<body>
    <script>
        function retweetHandler(id) {
            document.getElementById(id).submit();
        }
    </script>
    <%
        int cont = 0;
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
                    Inicio
                </h1>
                <h2 class="subtitle">

                </h2>
            </div>
        </div>
    </section>
    <div class="columns">
        <div class="column is-one-fifth"></div>
        <div class=" column container is-three-fifths">
            <div class="box">
                <div class="columns">
                    <div class="column is-one-fifths ">
                        <%
                            ResultSet res = null;
                            database db = new database();
                            db.conectar();
                            res = db.consulta("select * from usuario where nomU='" + session.getAttribute("nomU") + "';");
                            if (res.next()) {
                                Blob blob = res.getBlob("imagen");
                                byte byteArray[] = blob.getBytes(1, (int) blob.length());
                                String base64Encoded = Base64.getEncoder().encodeToString(byteArray);
                                out.println("<div >");
                                out.println("<figure class='column image is-128x128'>");
                                out.println("<img class='is-rounded image is-64x64' src='data:image/jpg;base64," + base64Encoded + "' />");
                                out.println("<p class='has-text-weight-semibold'>@" + res.getString("nomU") + "</p>");
                                out.println("</figure>");
                                out.println("</div>");
                            }
                        %>    
                    </div>

                    <div class="field-body column is-four-fifths">
                        <form action="submitTweet" enctype="multipart/form-data" method="post">
                            <div class="field">
                                <div class="control column">
                                    <textarea name="texto" id="texto" class="textarea" rows="2" placeholder="¿Qué está pasando?"></textarea>
                                </div>
                            </div>
                            <div class="field">
                                <input  onchange="document.getElementById('blah').src = window.URL.createObjectURL(this.files[0]);
                                        document.getElementById('imagePreview').style.display = 'block';
                                        document.getElementById('selectedFile').name = 'selectedFileCheck';
                                        " type="file" id="selectedFile" name="selectedFile" style="display: none;" />
                                <a onclick="document.getElementById('selectedFile').click();">
                                    <img class="image is-24x24" src="assets/picture.png"></img>
                                </a>
                            </div>
                            <div class="field">
                                <button class="button is-danger is-rounded is-small" type="submit">Publicar</button>
                            </div>
                            <figure id="imagePreview" name='imagePreview' class="image is-128x128 " style="display: none;">
                                <img id="blah" name='blah' src="">
                            </figure>
                            <br/>
                        </form>

                    </div>
                </div>
            </div>
            <div class="box field">
                <div class ="container">
                    <%
                        PreparedStatement ps = db.getC().prepareStatement("select nomU, imagen, texto, fecha, ruta, nomUsuRet from "
                                + "(select idTweet, usuario, nomU, imagen, texto, fecha, nomUsuRet from ((select correoE, nomU, imagen from "
                                + "((select seguido from seguidores where seguidor ='"+session.getAttribute("email").toString()+"') as correoSeguidos "
                                + "join usuario on correoSeguidos.seguido = usuario.correoE)) as seguidos "
                                + "join tweet on seguidos.correoE = tweet.usuario)) as tweetsSeguidos left join imagen on tweetsSeguidos.idTweet = imagen.idTweet and "
                                + "tweetsSeguidos.usuario = imagen.usuario order by fecha desc;"
                        );
                        res = ps.executeQuery();
                        while (res.next()) {
                            Blob blob = res.getBlob("imagen");
                            byte byteArray[] = blob.getBytes(1, (int) blob.length());
                            String base64Encoded = Base64.getEncoder().encodeToString(byteArray);
                            if(res.getString("nomUsuRet")!=null){
                            out.println("<div class='has-text-grey'>"+res.getString("nomU") + " retwitteo de: " + res.getString("nomUsuRet")+"</div>");
                            }
                            out.println("<article class='media'>");
                            out.println("<figure class='media-left'>");
                            out.println("<p class='image is-64x64'>");
                            out.println("<img src='data:image/jpg;base64," + base64Encoded + "'/>");
                            out.println("</p>");
                            out.println("</figure>");
                            blob = res.getBlob("ruta");

                            out.println("<div class='media-content'>");
                            out.println("<div class='content'>");
                            out.println("<p>");
                            out.println("<strong>" + res.getString("nomU") + "</strong> <small>@" + res.getString("nomU") + "</small>");
                            out.println("<br>");
                            out.println(res.getString("texto"));
                            out.println("<br>");
                            if (blob != null) {
                                byteArray = blob.getBytes(1, (int) blob.length());
                                base64Encoded = Base64.getEncoder().encodeToString(byteArray);
                                out.println("<figure class='media-left'>");
                                out.println("<p class='image is-128x128'>");
                                out.println("<img src='data:image/jpg;base64," + base64Encoded + "'/>");
                                out.println("</p>");
                                out.println("</figure>");
                            }
                            out.println("<small>Fecha de publicacion: " + res.getString("fecha") + "</small>");
                            out.println("</p>");
                            out.println("</div>");
                            out.println("<nav class='level is-mobile'>");
                            out.println("<div class='level-left'>");
                            out.println("<form id='" + cont + "' method='POST' action='retweet?userTweet=" + res.getString("nomU") + "&textTweet=" + res.getString("texto") + "'>");
                            out.println("<a onClick='retweetHandler(" + cont + ")' class='level-item'>");
                            out.println("<span class='icon is-small'><i class='fas fa-retweet'></i></span>");
                            out.println("</a>");
                            out.println("</form>");
                            out.println("</div>");
                            out.println("</nav>");
                            out.println("</div>");
                            out.println("</article>");
                            cont++;
                        }
                        if(cont==0){
                                    out.println("<div class='container'>Aun no tiene tweets de sus seguidos :(</div>");
                        }
                    %>
                </div>
            </div>

        </div>
        <div onclick="olaa('sdf')" class="column is-one-fifth"></div>
    </div>
</body>
</html>
