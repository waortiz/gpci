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
public class CumplimientoCompromisoProyecto {

    private long idCumplimientoCompromisoProyecto;
    private long idCompromisoProyecto;
    private String descripcionCompromisoProyecto;
    private Date fechaActa;
    private String numeroActa;
    private String fechaActaFormateada;

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
     * @return the idCumplimientoCompromisoProyecto
     */
    public long getIdCumplimientoCompromisoProyecto() {
        return idCumplimientoCompromisoProyecto;
    }

    /**
     * @param idCumplimientoCompromisoProyecto the idCumplimientoCompromisoProyecto to set
     */
    public void setIdCumplimientoCompromisoProyecto(long idCumplimientoCompromisoProyecto) {
        this.idCumplimientoCompromisoProyecto = idCumplimientoCompromisoProyecto;
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
}
