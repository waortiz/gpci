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
public class EntidadInternacional {

    private long idEntidadInternacional;
    private String nombre;
    
    /**
     * @return the idEntidadInternacional
     */
    public long getIdEntidadInternacional() {
        return idEntidadInternacional;
    }

    /**
     * @param idEntidadInternacional the idEntidadInternacional to set
     */
    public void setIdEntidadInternacional(long idEntidadInternacional) {
        this.idEntidadInternacional = idEntidadInternacional;
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
