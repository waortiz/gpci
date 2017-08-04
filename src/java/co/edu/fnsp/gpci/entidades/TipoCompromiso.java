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
public class TipoCompromiso {

    private int idTipoCompromiso;
    private String nombre;
    
    /**
     * @return the idTipoCompromiso
     */
    public int getIdTipoCompromiso() {
        return idTipoCompromiso;
    }

    /**
     * @param idTipoCompromiso the idTipoCompromiso to set
     */
    public void setIdTipoCompromiso(int idTipoCompromiso) {
        this.idTipoCompromiso = idTipoCompromiso;
    }

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

}
