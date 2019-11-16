<%-- 
    Document   : loguearse
    Created on : 18/11/2018, 08:28:14 PM
    Author     : MedinaVilla
--%>

<%@page import="java.sql.ResultSet, Java.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ResultSet rs = null;
    database db = new database();
    String nombreUsu = request.getParameter("nomU");
    String contra = request.getParameter("contra");
    try {
        db.conectar();
        usuario usuario = new usuario();

        if (usuario.iniciarSesion(nombreUsu, contra)) {
            HttpSession sesion = request.getSession();
            sesion.setAttribute("identificador", nombreUsu);
            rs = usuario.getUsuarioPorID(nombreUsu);
            while (rs.next()) {
                sesion.setAttribute("nomU", rs.getString("usuario.nomU"));
                sesion.setAttribute("email", rs.getString("usuario.correoE"));
            }
            response.sendRedirect("./panel");
        } else {
            response.sendRedirect("./login?errLogin=EmptyInput573");
        }
    } catch (Exception e) {
        System.out.println(e.toString());
        response.sendRedirect("./login");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Loading...</title>
    </head>
    <body>
    </body>
</html>
