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
public class Compromiso {

    private int idCompromiso;
    private String nombre;

    /**
     * @return the idCompromiso
     */
    public int getIdCompromiso() {
        return idCompromiso;
    }

    /**
     * @param idCompromiso the idCompromiso to set
     */
    public void setIdCompromiso(int idCompromiso) {
        this.idCompromiso = idCompromiso;
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
