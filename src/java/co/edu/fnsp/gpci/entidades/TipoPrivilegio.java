/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.entidades;

/**
 *
 * @author William
 */
public enum TipoPrivilegio {
    GESTOR_INFORMACION(1), USUARIOS_CI(2), ADMINISTRADOR(3);

    /**
     * @return the idPrivilegio
     */
    public int getIdPrivilegio() {
        return idPrivilegio;
    }

    /**
     * @param idPrivilegio the idPrivilegio to set
     */
    public void setIdPrivilegio(int idPrivilegio) {
        this.idPrivilegio = idPrivilegio;
    }

    private int idPrivilegio;

    private TipoPrivilegio(int idPrivilegio) {
        this.idPrivilegio = idPrivilegio;
    }
}
