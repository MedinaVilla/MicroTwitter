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
import java.sql.ResultSet;
import java.sql.SQLException;
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
public class imageUploadTweet extends HttpServlet {

    PrintWriter out;
    database db = new database();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ResultSet res;

        String email = request.getSession(false).getAttribute("email").toString();
        String texto = request.getParameter("texto");

        response.setContentType("text/html/charset=UTF-8");
        out = response.getWriter();

        Part part = request.getPart("selectedFileCheck");
        InputStream is = null;
        if (part != null) {
            is = part.getInputStream();
        }

        db.conectar();
        try {
            PreparedStatement ps = db.getC().prepareStatement("insert into tweet (usuario,texto)values(?,?);");
            ps.setString(1, email);
            ps.setString(2, texto);
            ps.executeUpdate();
            res = db.consulta("select LAST_INSERT_ID() as id;");

            if (res.next()) {
                if (is != null) {
                    PreparedStatement ps2 = db.getC().prepareStatement("insert into imagen (idTweet, usuario, ruta)values(?,?,?);");
                    int idTweet = res.getInt("id");
                    ps2.setInt(1, idTweet);
                    ps2.setString(2, email);
                    ps2.setBlob(3, is);
                    ps2.executeUpdate();
                }
            }
            db.cierraConexion();
            response.sendRedirect("panel");
        } catch (SQLException ex) {
            System.out.println(ex.toString());
        }
    }
}
