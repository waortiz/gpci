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
public class TipoContrato {
        
    private int idTipoContrato;
    private String nombre;
    
    /**
     * @return the idTipoContrato
     */
    public int getIdTipoContrato() {
        return idTipoContrato;
    }

    /**
     * @param idTipoContrato the idTipoContrato to set
     */
    public void setIdTipoContrato(int idTipoContrato) {
        this.idTipoContrato = idTipoContrato;
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
        return "{Id: " + idTipoContrato + ", nombre: " + nombre + "}";
    }
}
