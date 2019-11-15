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
    <%
                        ResultSet res = null;
                        database db = new database();
                        db.conectar();
                        System.out.println(session.getAttribute("nomU"));
                        res = db.consulta("select * from usuario where nomU='"+session.getAttribute("nomU")+"';");
                        if (res.next()) {
                            Blob blob = res.getBlob("imagen");
                            byte byteArray[] = blob.getBytes(1, (int) blob.length());
                            String base64Encoded = Base64.getEncoder().encodeToString(byteArray);
                            out.println("<figure class='image is-128x128'>");
                            out.println("<img src='data:image/jpg;base64," + base64Encoded + "' />");
                            out.println("</figure>");
//                                out.println();
                        }
                    %>
</body>
</html>
