<%-- 
    Document   : uploadTweet
    Created on : 16/11/2019, 04:22:58 PM
    Author     : MedinaVilla
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Java.database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
System.out.println("ENTRAA");
            PrintWriter outM;
            ResultSet res;
            database db = new database();
            String email = session.getAttribute("email").toString();
            String texto = request.getParameter("texto");

            response.setContentType("text/html/charset=UTF-8");
            outM = response.getWriter();
            Part part = request.getPart("file");
            System.out.println(part);
            InputStream is = part.getInputStream();

            db.conectar();

            try {
                PreparedStatement ps = db.getC().prepareStatement("insert into tweet (usuario,texto)values(?,?);");
                PreparedStatement ps2 = db.getC().prepareStatement("insert into imagen (idTweet, usuario, ruta)values(?,?,?);");
                ps.setString(1, email);
                ps.setString(2, texto);
                ps.executeUpdate();
                res = db.consulta("select LAST_INSERT_ID() as id;");
                if (res.next()) {
                    int idTweet = res.getInt("id");System.out.println("idTweet: " + idTweet);
                }
                
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    int last_inserted_id = rs.getInt(1);
                    ps2.setInt(1, last_inserted_id);
                    ps2.setString(2, texto);
                    ps2.executeUpdate();
                }

                db.cierraConexion();
                response.sendRedirect("panel");
            } catch (SQLException ex) {
                System.out.println(ex.toString());
            }
        %>
    </body>
</html>
