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
public class TipoVinculacion {

    private int idTipoVinculacion;
    private String nombre;
    
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

    /**
     * @return the idTipoVinculacion
     */
    public int getIdTipoVinculacion() {
        return idTipoVinculacion;
    }

    /**
     * @param idTipoVinculacion the idTipoVinculacion to set
     */
    public void setIdTipoVinculacion(int idTipoVinculacion) {
        this.idTipoVinculacion = idTipoVinculacion;
    }
}
