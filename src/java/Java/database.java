/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Java;

import java.sql.*;

/**
 *
 * @author MedinaVilla
 */
public class database {

    private Connection c = null;
    private Statement s = null;

    private final String nombre = "jdbc:mysql://localhost:3306/piolin?autoReconnect=true&useSSL=false";
    private final String usuario = "root";
    private final String password = "N0M3L0";
    private final String driver = "com.mysql.jdbc.Driver";

    public Connection getC() {
        return c;
    }

    public String getNombre() {
        return nombre;
    }

    public void conectar() {
        try {
            Class.forName(this.driver).newInstance();
            c = DriverManager.getConnection(this.nombre, this.usuario, this.password);
            s = c.createStatement();
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
            System.out.println("Error" + e.getMessage());
        }
    }

    public void cierraConexion() throws SQLException {
        this.c.close();
    }

    public ResultSet consulta(String consulta) throws SQLException {
        return s.executeQuery(consulta);
    }

    public int alta(String consulta) throws SQLException {
        return s.executeUpdate(consulta);
    }

}
