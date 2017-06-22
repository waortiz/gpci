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
public class TipoFuentePresupuesto {

    private int idTipoFuentePresupuesto;
    private String nombre;
    
    /**
     * @return the idTipoFuentePresupuesto
     */
    public int getIdTipoFuentePresupuesto() {
        return idTipoFuentePresupuesto;
    }

    /**
     * @param idTipoFuentePresupuesto the idTipoFuentePresupuesto to set
     */
    public void setIdTipoFuentePresupuesto(int idTipoFuentePresupuesto) {
        this.idTipoFuentePresupuesto = idTipoFuentePresupuesto;
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
