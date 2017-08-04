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
public class TipoAval {

    private int idTipoAval;
    private String nombre;
    
    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the idTipoAval
     */
    public int getIdTipoAval() {
        return idTipoAval;
    }

    /**
     * @param idTipoAval the idTipoAval to set
     */
    public void setIdTipoAval(int idTipoAval) {
        this.idTipoAval = idTipoAval;
    }
}
