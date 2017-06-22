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
     * @return the idProyecto
     */
    public long getIdProyecto() {
        return idProyecto;
    }

    /**
     * @param idProyecto the idProyecto to set
     */
    public void setIdProyecto(long idProyecto) {
        this.idProyecto = idProyecto;
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

    /**
     * @return the homologado
     */
    public String getHomologado() {
        return homologado;
    }

    /**
     * @param homologado the homologado to set
     */
    public void setHomologado(String homologado) {
        this.homologado = homologado;
    }

    private int idCompromisoProyecto;
    private long idProyecto;
    private Date fechaCompromiso;
    private String homologado;
}
