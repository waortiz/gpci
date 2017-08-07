/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.entidades;

import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author William
 */
public class CumplimientoAlertaAvalProyecto {

    private long idCumplimientoAlertaAvalProyecto;
    private long idAlertaAvalProyecto;
    private String descripcionAlertaAvalProyecto;   
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date fechaActa;
    private String fechaActaFormateada;
    private String numeroActa;

    /**
     * @return the idCumplimientoAlertaAvalProyecto
     */
    public long getIdCumplimientoAlertaAvalProyecto() {
        return idCumplimientoAlertaAvalProyecto;
    }

    /**
     * @param idCumplimientoAlertaAvalProyecto the idCumplimientoAlertaAvalProyecto to set
     */
    public void setIdCumplimientoAlertaAvalProyecto(long idCumplimientoAlertaAvalProyecto) {
        this.idCumplimientoAlertaAvalProyecto = idCumplimientoAlertaAvalProyecto;
    }
    
    /**
     * @return the idAlertaAvalProyecto
     */
    public long getIdAlertaAvalProyecto() {
        return idAlertaAvalProyecto;
    }

    /**
     * @param idAlertaAvalProyecto the idAlertaAvalProyecto to set
     */
    public void setIdAlertaAvalProyecto(long idAlertaAvalProyecto) {
        this.idAlertaAvalProyecto = idAlertaAvalProyecto;
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
     * @return the descripcionAlertaAvalProyecto
     */
    public String getDescripcionAlertaAvalProyecto() {
        return descripcionAlertaAvalProyecto;
    }

    /**
     * @param descripcionAlertaAvalProyecto the descripcionAlertaAvalProyecto to set
     */
    public void setDescripcionAlertaAvalProyecto(String descripcionAlertaAvalProyecto) {
        this.descripcionAlertaAvalProyecto = descripcionAlertaAvalProyecto;
    }
   
}
