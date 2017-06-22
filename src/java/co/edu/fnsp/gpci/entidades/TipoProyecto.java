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
public class TipoProyecto {

    private int idTipoProyecto;
    private String nombre;

    /**
     * @return the idTipoProyecto
     */
    public int getIdTipoProyecto() {
        return idTipoProyecto;
    }

    /**
     * @param idTipoProyecto the idTipoProyecto to set
     */
    public void setIdTipoProyecto(int idTipoProyecto) {
        this.idTipoProyecto = idTipoProyecto;
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
        return "{Id: " + idTipoProyecto + ", nombre: " + nombre + "}";
    }
}
