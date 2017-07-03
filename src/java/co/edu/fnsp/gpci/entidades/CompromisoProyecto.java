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
public class CompromisoProyecto {

    /**
     * @return the descripcion
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * @param descripcion the descripcion to set
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    /**
     * @return the idCompromisoProyecto
     */
    public int getIdCompromisoProyecto() {
        return idCompromisoProyecto;
    }

    /**
     * @param idCompromisoProyecto the idCompromisoProyecto to set
     */
    public void setIdCompromisoProyecto(int idCompromisoProyecto) {
        this.idCompromisoProyecto = idCompromisoProyecto;
    }

    /**
     * @return the fechaCompromiso
     */
    public Date getFechaCompromiso() {
        return fechaCompromiso;
    }

    /**
     * @param fechaCompromiso the fechaCompromiso to set
     */
    public void setFechaCompromiso(Date fechaCompromiso) {
        this.fechaCompromiso = fechaCompromiso;
    }

    private int idCompromisoProyecto;
    private Date fechaCompromiso;
    private String descripcion;
}
