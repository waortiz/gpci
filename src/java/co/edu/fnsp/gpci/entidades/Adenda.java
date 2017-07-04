/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.entidades;

import java.util.Date;

/**
 *
 * @author William
 */
public class Adenda {
     private long idAdenda;
     private Date fecha;
     private String modificacion;

    /**
     * @return the idAdenda
     */
    public long getIdAdenda() {
        return idAdenda;
    }

    /**
     * @param idAdenda the idAdenda to set
     */
    public void setIdAdenda(long idAdenda) {
        this.idAdenda = idAdenda;
    }

    /**
     * @return the fecha
     */
    public Date getFecha() {
        return fecha;
    }

    /**
     * @param fecha the fecha to set
     */
    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    /**
     * @return the modificacion
     */
    public String getModificacion() {
        return modificacion;
    }

    /**
     * @param modificacion the modificacion to set
     */
    public void setModificacion(String modificacion) {
        this.modificacion = modificacion;
    }
}
