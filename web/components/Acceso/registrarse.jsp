<%-- 
    Document   : registrase
    Created on : 13/11/2019, 09:20:18 PM
    Author     : MedinaVilla
--%>

<%@page import="java.io.InputStream"%>
<%@page import="Java.usuario"%>
<%@page import="Java.database"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ResultSet rs = null;
    database db = new database();
    String nombreUsu = request.getParameter("nomU");
    String contra = request.getParameter("contra");
    String email = request.getParameter("contra");

    InputStream inputStream = null; // input stream of the upload file
    Part filePart = request.getPart("image");
    inputStream = filePart.getInputStream();

    try {
        db.conectar();
        usuario usuario = new usuario();

        String query = "insert into experiencia(contenido,nombreAlumno,fechaEnvio,tipoExperiencia,estado) values('" + contenido + "'"
                + ",'" + nombre + "',now(), " + tipo + ",2); ";
        db.alta(query);

    } catch (Exception e) {
        System.out.println(e.toString());
        response.sendRedirect("./login");
    }
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
