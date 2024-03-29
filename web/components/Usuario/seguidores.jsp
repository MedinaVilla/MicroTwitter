<%-- 
    Document   : Visor
    Created on : 10/11/2019, 07:25:41 PM
    Author     : MedinaVilla
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Java.Imagen"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Java.database"%>
<%@page import="Java.Navbar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="icon" href="/MicroTwitter/assets/twitter.png" type="image/icon type">
    <link rel="stylesheet" href="../css/bulma.css" type="text/css"/>
    <title>Seguidores</title>
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
                    Seguidores
                </h1>
                <h2 class="subtitle">

                </h2>
            </div>
        </div>
    </section>
    <div class="box">
        <%
            int cont =0;
            ResultSet res;
            database db = new database();
            db.conectar();
            PreparedStatement ps = db.getC().prepareStatement("select correoE, nomU, contra, imagen, seguidores.fecha as fecha from usuario join seguidores on correoE = seguidor"
                    + " where seguido = ?;");
            ps.setString(1, session.getAttribute("email").toString());
            res = ps.executeQuery();
            while (res.next()) {
                Imagen i = new Imagen(res.getBlob("imagen"));
                String base = i.getBase64();
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
                out.println("Siguiendo desde: " + res.getDate("fecha"));
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
                cont++;
            }
             if(cont==0){
            out.println("<div class='container'>No tiene seguidores</div>");
            }
        %>
    </div>

</body>
</html>
