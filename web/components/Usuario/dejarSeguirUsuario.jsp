<%-- 
    Document   : seguirUsuario
    Created on : 15/11/2019, 08:49:57 PM
    Author     : MedinaVilla
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Java.database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>loading</title>
    </head>
    <body>
        <%
            String userSeguir = request.getParameter("user");
            String emailSeguido = session.getAttribute("email").toString();
            ResultSet res = null;

            database db = new database();
            db.conectar();
            try {
                res = db.consulta("select correoE from usuario where nomU='" + userSeguir + "';");
                if (res.next()) {
                    String emailSeguir = res.getString("correoE");
                    PreparedStatement ps = db.getC().prepareStatement("delete from seguidores where seguidor = ? and seguido = ?;");
                    ps.setString(1, emailSeguir);
                    ps.setString(2, emailSeguido);
                    ps.executeUpdate();
                    db.cierraConexion();
                    response.sendRedirect("/MicroTwitter/panel");
                }
            } catch (SQLException ex) {
                System.out.println(ex.toString());
            }

        %>

    </body>
</html>
