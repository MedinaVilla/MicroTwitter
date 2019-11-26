<%-- 
    Document   : retweet
    Created on : 22/11/2019, 09:07:30 PM
    Author     : MedinaVilla
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
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
            String userTweet = request.getParameter("userTweet");
            String textTweet = request.getParameter("textTweet");
            String emailSession = session.getAttribute("email").toString();
            System.out.println(textTweet);
            database db = new database();
            db.conectar();
            PreparedStatement ps = db.getC().prepareStatement("insert into tweet (usuario, texto, nomUsuRet) values (?,?,?);");
            ps.setString(1,emailSession);
            ps.setString(2, textTweet);
            ps.setString(3, userTweet);
            ps.executeUpdate();
             response.sendRedirect("/MicroTwitter/panel");
        %>
    </body>
</html>
