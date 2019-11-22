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
            String userSeguido = session.getAttribute("email").toString();
            ResultSet res = null;

            System.out.println(userSeguir);
            System.out.println(userSeguido);
            database db = new database();
            db.conectar();
//         try {
//             res =db.consulta("select * from usuario where nomU='"+userSeguir+"';");
//          if (res.next()) {
//            PreparedStatement ps = db.getC().prepareStatement("insert into seguidores "+
//              "(seguidor,seguido)values(?,?);");
//            System.out.println("PAPS");
//            ps.setString(1, res.getString("correoE"));
//            ps.setString(2, userSeguido);
//            ps.executeUpdate();
//            
//            db.cierraConexion();
//            response.sendRedirect("/MicroTwitter/panel");
//          }
//        } catch (SQLException ex) {
//            System.out.println(ex.toString());
//        }
//        
%>

    </body>
</html>
