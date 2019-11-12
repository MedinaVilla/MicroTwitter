package Java;

import java.sql.*;

/**
 *
 * @author MedinaVilla
 */
public class usuario {

    private String nomU;
    private String correoU;
    private String contra;
    private Blob imagen;
    private Date fecha;

    Statement s = null;
    ResultSet rs = null;

    private database db = new database();
    PreparedStatement ps = null;

 public usuario() {
    }
    public usuario(String nomU, String correoU, String contra, Blob imagen, Date fecha) {
        this.nomU = nomU;
        this.correoU = correoU;
        this.contra = contra;
        this.imagen = imagen;
        this.fecha = fecha;
    }

    public void registrarUsuario() throws SQLException {
        db.conectar();
        PreparedStatement ps;

        String insertUsuario = ("insert into usuario(correoU,nomU, contra, imagen, fecha) values("
                + "?, "
                + "?, "
                + "?, "
                + "?"
                + ");");

        ps = db.getC().prepareStatement(insertUsuario);
        ps.setString(1, this.getCorreoU());
        ps.setString(2, this.getNomU());
        ps.setString(3, this.getContra());
        ps.setBlob(4, this.getImagen());
        ps.setDate(5, this.getFecha());
        

        ps.executeUpdate();

        s = db.getC().createStatement();
        db.cierraConexion();
    }

    public boolean iniciarSesion(String nomU, String contra) throws SQLException {
        ResultSet rsIniciarSesion;
        boolean userExist = false;
        db.conectar();

        String queryBuscar = ("select * from usuario where nomU = ? and contra = ?;");

        PreparedStatement psIniciarSesion = db.getC().prepareStatement(queryBuscar);

        psIniciarSesion.setString(1, nomU);
        psIniciarSesion.setString(2, contra);
        rsIniciarSesion = psIniciarSesion.executeQuery();

        if (rsIniciarSesion.next()) {
            userExist = true;
        }
        return userExist;
    }

    public ResultSet getUsuarioPorID(String idAlumno) throws SQLException {
        String query = "select * from usuario " + "where nomU = ?;";
        db.conectar();
        PreparedStatement psQueryPerfil = db.getC().prepareStatement(query);
        psQueryPerfil.setString(1, idAlumno);
        return psQueryPerfil.executeQuery();
    }
    
    public String getNomU() {
        return nomU;
    }

    public String getCorreoU() {
        return correoU;
    }

    public String getContra() {
        return contra;
    }

    public Blob getImagen() {
        return imagen;
    }

    public Date getFecha() {
        return fecha;
    }


}
