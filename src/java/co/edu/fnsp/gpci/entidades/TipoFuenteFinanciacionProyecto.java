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
public class TipoFuenteFinanciacionProyecto {
    
    private int idTipoFuenteFinanciacionPresupuesto;
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
     * @return the idTipoFuenteFinanciacionPresupuesto
     */
    public int getIdTipoFuenteFinanciacionPresupuesto() {
        return idTipoFuenteFinanciacionPresupuesto;
    }

    /**
     * @param idTipoFuenteFinanciacionPresupuesto the idTipoFuenteFinanciacionPresupuesto to set
     */
    public void setIdTipoFuenteFinanciacionPresupuesto(int idTipoFuenteFinanciacionPresupuesto) {
        this.idTipoFuenteFinanciacionPresupuesto = idTipoFuenteFinanciacionPresupuesto;
    }
}
