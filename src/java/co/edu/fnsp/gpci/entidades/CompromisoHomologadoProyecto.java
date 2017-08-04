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
public class CompromisoHomologadoProyecto {

    private long idCompromisoHomologadoProyecto;
    private long idCompromisoProyecto;
    private String descripcionCompromisoProyecto;
    private Date fechaActa;
    private String numeroActa;
    private String fechaActaFormateada;
    private String observaciones;
    private String descripcion;

    /**
     * @return the idCompromisoHomologadoProyecto
     */
    public long getIdCompromisoHomologadoProyecto() {
        return idCompromisoHomologadoProyecto;
    }

    /**
     * @param idCompromisoHomologadoProyecto the idCompromisoHomologadoProyecto to set
     */
    public void setIdCompromisoHomologadoProyecto(long idCompromisoHomologadoProyecto) {
        this.idCompromisoHomologadoProyecto = idCompromisoHomologadoProyecto;
    }

    /**
     * @return the idCompromisoProyecto
     */
    public long getIdCompromisoProyecto() {
        return idCompromisoProyecto;
    }

    /**
     * @param idCompromisoProyecto the idCompromisoProyecto to set
     */
    public void setIdCompromisoProyecto(long idCompromisoProyecto) {
        this.idCompromisoProyecto = idCompromisoProyecto;
    }

    /**
     * @return the descripcionCompromisoProyecto
     */
    public String getDescripcionCompromisoProyecto() {
        return descripcionCompromisoProyecto;
    }

    /**
     * @param descripcionCompromisoProyecto the descripcionCompromisoProyecto to set
     */
    public void setDescripcionCompromisoProyecto(String descripcionCompromisoProyecto) {
        this.descripcionCompromisoProyecto = descripcionCompromisoProyecto;
    }

    /**
     * @return the fechaActa
     */
    public Date getFechaActa() {
        return fechaActa;
    }

    /**
     * @param fechaActa the fechaActa to set
     */
    public void setFechaActa(Date fechaActa) {
        this.fechaActa = fechaActa;
    }

    /**
     * @return the numeroActa
     */
    public String getNumeroActa() {
        return numeroActa;
    }

    /**
     * @param numeroActa the numeroActa to set
     */
    public void setNumeroActa(String numeroActa) {
        this.numeroActa = numeroActa;
    }

    /**
     * @return the fechaActaFormateada
     */
    public String getFechaActaFormateada() {
        return fechaActaFormateada;
    }

    /**
     * @param fechaActaFormateada the fechaActaFormateada to set
     */
    public void setFechaActaFormateada(String fechaActaFormateada) {
        this.fechaActaFormateada = fechaActaFormateada;
    }

    /**
     * @return the observaciones
     */
    public String getObservaciones() {
        return observaciones;
    }

    /**
     * @param observaciones the observaciones to set
     */
    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

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
    
}
