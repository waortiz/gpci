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
public class TipoActa {

    private int idTipoActa;
    private String nombre;
    
    /**
     * @return the idTipoActa
     */
    public int getIdTipoActa() {
        return idTipoActa;
    }

    /**
     * @param idTipoActa the idTipoActa to set
     */
    public void setIdTipoActa(int idTipoActa) {
        this.idTipoActa = idTipoActa;
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
    
    @Override
    public String toString() {
        return "{Id: " + getIdTipoActa() + ", nombre: " + getNombre() + "}";
    }
}
