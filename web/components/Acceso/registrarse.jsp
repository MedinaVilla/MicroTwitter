<%-- 
    Document   : registrase
    Created on : 13/11/2019, 09:20:18 PM
    Author     : MedinaVilla
--%>

<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.InputStream"%>
<%@page import="Java.usuario"%>
<%@page import="Java.database"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ResultSet rs = null;
    database db = new database();
    FileInputStream fis = null;
    String nombreUsu = request.getParameter("nomU");
    String contra = request.getParameter("contra");
    String email = request.getParameter("email");
    String image = request.getParameter("fileInput");
    System.out.println(image);
    File im = new File(image);
    fis = new FileInputStream(im);
    try {
        db.conectar();
        String query = "insert into usuario values('" + email + "'"
                + ",'" + nombreUsu + "'," + contra + ",'" + fis + "'," + "); ";
        db.alta(query);

//        String insertUsuario = ("insert into estadistica(pregunta1,pregunta2,pregunta3,pregunta4,pregunta5)values(?,?,?,?,?);");
//
//        ps = db.getC().prepareStatement(insertUsuario);
//        ps.setString(1, r1);
//        ps.setString(2, r2);
//        ps.setString(3, r3);
//        ps.setString(4, r4);
//        ps.setString(5, r5);
//        ps.executeUpdate();
//
//        s = db.getC().createStatement();
//        db.cierraConexion();

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
