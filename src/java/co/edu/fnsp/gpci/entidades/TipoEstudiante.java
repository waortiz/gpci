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
public class TipoEstudiante {

    private int idTipoEstudiante;
    private String nombre;

    /**
     * @return the idTipoEstudiante
     */
    public int getIdTipoEstudiante() {
        return idTipoEstudiante;
    }

    /**
     * @param idTipoEstudiante the idTipoEstudiante to set
     */
    public void setIdTipoEstudiante(int idTipoEstudiante) {
        this.idTipoEstudiante = idTipoEstudiante;
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
        return "{Id: " + idTipoEstudiante + ", nombre: " + nombre + "}";
    }
}
