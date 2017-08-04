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
public class AlertaAvalProyecto {

    private int idAlertaAvalProyecto;
    private String descripcion;
    private String nombreTipoAval;
    private int idTipoAval;
    
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date fechaActa;
    private String fechaActaFormateada;
    private String numeroActa;
    
    /**
     * @return the idAlertaAvalProyecto
     */
    public int getIdAlertaAvalProyecto() {
        return idAlertaAvalProyecto;
    }

    /**
     * @param idAlertaAvalProyecto the idAlertaAvalProyecto to set
     */
    public void setIdAlertaAvalProyecto(int idAlertaAvalProyecto) {
        this.idAlertaAvalProyecto = idAlertaAvalProyecto;
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

    /**
     * @return the nombreTipoAval
     */
    public String getNombreTipoAval() {
        return nombreTipoAval;
    }

    /**
     * @param nombreTipoAval the nombreTipoAval to set
     */
    public void setNombreTipoAval(String nombreTipoAval) {
        this.nombreTipoAval = nombreTipoAval;
    }

    /**
     * @return the idTipoAval
     */
    public int getIdTipoAval() {
        return idTipoAval;
    }

    /**
     * @param idTipoAval the idTipoAval to set
     */
    public void setIdTipoAval(int idTipoAval) {
        this.idTipoAval = idTipoAval;
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
   
}
