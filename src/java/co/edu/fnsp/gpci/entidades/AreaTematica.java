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
public class AreaTematica {

    /**
     * @return the idAreaTematica
     */
    public int getIdAreaTematica() {
        return idAreaTematica;
    }

    /**
     * @param idAreaTematica the idAreaTematica to set
     */
    public void setIdAreaTematica(int idAreaTematica) {
        this.idAreaTematica = idAreaTematica;
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
        return "{Id: " + idAreaTematica + ", nombre: " + nombre + "}";
    }

    private int idAreaTematica;
    private String nombre;
}
