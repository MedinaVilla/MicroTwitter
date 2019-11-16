/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Java;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author MedinaVilla
 */
@MultipartConfig
public class imageUpload extends HttpServlet {

    PrintWriter out;
    database db = new database();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String usuario = request.getParameter("nomU");
        String contra = request.getParameter("contra");

        response.setContentType("text/html/charset=UTF-8");
        out = response.getWriter();
        Part part = request.getPart("file");
        System.out.println(part);
        InputStream is = part.getInputStream();

        db.conectar();
        Date date = new Date(System.currentTimeMillis());
        try {
            PreparedStatement ps = db.getC().prepareStatement("insert into usuario values(?,?,?,?,?)");
            ps.setString(1, email);
            ps.setString(2, usuario);
            ps.setString(3, contra);
            ps.setBlob(4, is);
            ps.setDate(5, date);
            ps.executeUpdate();
            db.cierraConexion();
            response.sendRedirect("login");
        } catch (SQLException ex) {
            System.out.println(ex.toString());
        }
    }
}
