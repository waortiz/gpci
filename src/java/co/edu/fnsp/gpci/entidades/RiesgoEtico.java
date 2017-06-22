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
public class RiesgoEtico {

    /**
     * @return the idRiesgoEtico
     */
    public int getIdRiesgoEtico() {
        return idRiesgoEtico;
    }

    /**
     * @param idRiesgoEtico the idRiesgoEtico to set
     */
    public void setIdRiesgoEtico(int idRiesgoEtico) {
        this.idRiesgoEtico = idRiesgoEtico;
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

    private int idRiesgoEtico;
    private String nombre;

    @Override
    public String toString() {
        return "{Id: " + idRiesgoEtico + ", nombre: " + nombre + "}";
    }
}
