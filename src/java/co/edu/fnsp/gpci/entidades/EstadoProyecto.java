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
public class EstadoProyecto {
   
    private int idEstadoProyecto;
    private String nombre;
    
    /**
     * @return the idEstadoProyecto
     */
    public int getIdEstadoProyecto() {
        return idEstadoProyecto;
    }

    /**
     * @param idEstadoProyecto the idEstadoProyecto to set
     */
    public void setIdEstadoProyecto(int idEstadoProyecto) {
        this.idEstadoProyecto = idEstadoProyecto;
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
