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
public class EntidadInternacionalProyecto {

    private long idEntidadInternacionalProyecto;
    private String nombre;
    
    /**
     * @return the idEntidadInternacionalProyecto
     */
    public long getIdEntidadInternacionalProyecto() {
        return idEntidadInternacionalProyecto;
    }

    /**
     * @param idEntidadInternacionalProyecto the idEntidadInternacionalProyecto to set
     */
    public void setIdEntidadInternacionalProyecto(long idEntidadInternacionalProyecto) {
        this.idEntidadInternacionalProyecto = idEntidadInternacionalProyecto;
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
