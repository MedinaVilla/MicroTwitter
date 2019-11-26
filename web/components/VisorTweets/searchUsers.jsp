<%-- 
    Document   : Perfil
    Created on : 10/11/2019, 07:25:30 PM
    Author     : MedinaVilla
--%>

<%@page import="Java.Imagen"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Java.database"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Java.Navbar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="assets/twitter.png" type="image/icon type">
        <link rel="stylesheet" href="./css/bulma.css" type="text/css"/>
        <title>Busqueda</title>
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
                <div class="container">
                    <h1 class="title">
                        Búsqueda
                    </h1>
                    <h2 class="subtitle">

                    </h2>
                </div>
            </div>
        </section>

        <%
            int cont = 0;
            database db = new database();
            String search = request.getParameter("search");
            db.conectar();
            try {
                PreparedStatement ps = db.getC().prepareStatement("select * from usuario where nomU=?;");
                ps.setString(1, search);
                ResultSet res = ps.executeQuery();
                while (res.next()) {
                    Imagen i = new Imagen(res.getBlob("imagen"));
                    String base = i.getBase64();
                    out.println("<div class='box'>");
                    out.println("<article class='media'>");
                    out.println("<figure class='media-left'>");
                    out.println("<figure class='image is-64x64'>");
                    out.println("<img src='data:image/jpg;base64," + base + "' />");
                    out.println("</figure>");
                    out.println("</figure>");
                    out.println("<div class='media-content'>");
                    out.println("<div class='content'>");
                    out.println("<p>");
                    out.println("<strong>" + res.getString("nomU") + "</strong> <small>@" + res.getString("nomU") + "</small>");
                    out.println(" <br>");
                    out.println("Fecha de inicio:" + res.getDate("fecha"));
                    out.println("</p>");
                    out.println("</div>");
                    out.println("<br>");
                    out.println("<div class='media-right'>");
                    out.println("<form action='follow?user=" + res.getString("nomU") + "' method='POST'>");
                    out.println("<button type='submit' class='button is-link'>Seguir</button>");
                    out.println("</form>");
                    out.println("</div>");
                    out.println("</div>");
                    out.println("</article>");
                    out.println("</div>");
                    cont++;
                }
                db.cierraConexion();
            } catch (SQLException ex) {
                System.out.println(ex.toString());
            }
            if (cont == 0) {
                out.println("<div class='box container'>No hay coincidencias</div>");
            }

        %>
    </body>
</html>

