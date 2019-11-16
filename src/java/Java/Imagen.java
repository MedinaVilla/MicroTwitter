package Java;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.Base64;

public class Imagen {

    private Blob blob;

    public Imagen(Blob b) {
        this.blob = b;
    }

    public String getBase64() throws SQLException {
        byte byteArray[] = blob.getBytes(1, (int) this.blob.length());
        return Base64.getEncoder().encodeToString(byteArray);
    }
}
