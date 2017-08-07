package co.edu.fnsp.gpci.entidades;

import java.util.ArrayList;

public class PrivilegiosUsuario {
    
    private ArrayList<Privilegio> privilegios;
    private long idUsuario;
    
    /**
     * @return the idUsuario
     */
    public long getIdUsuario() {
        return idUsuario;
    }

    /**
     * @param idUsuario the idUsuario to set
     */
    public void setIdUsuario(long idUsuario) {
        this.idUsuario = idUsuario;
    }

    /**
     * @return the privilegios
     */
    public ArrayList<Privilegio> getPrivilegios() {
        return privilegios;
    }

    /**
     * @param privilegios the privilegios to set
     */
    public void setPrivilegios(ArrayList<Privilegio> privilegios) {
        this.privilegios = privilegios;
    }
}
