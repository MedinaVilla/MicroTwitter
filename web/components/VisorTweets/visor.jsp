<%-- 
    Document   : Visor
    Created on : 10/11/2019, 07:25:41 PM
    Author     : MedinaVilla
--%>

<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Java.database"%>
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
                        <%
                            ResultSet res = null;
                            database db = new database();
                            db.conectar();
                            res = db.consulta("select * from usuario where nomU='Yip';");
                            if (res.next()) {
                                Blob blob = res.getBlob("imagen");
                                byte byteArray[] = blob.getBytes(1, (int) blob.length());
                                response.setContentType("image/gif");
                                OutputStream os = response.getOutputStream();
                                os.write(byteArray);

                            }
                        %>
                    </h1>
                    <h2 class="subtitle">

                    </h2>
                </div>
            </div>
        </section>
    </body>
</html>
