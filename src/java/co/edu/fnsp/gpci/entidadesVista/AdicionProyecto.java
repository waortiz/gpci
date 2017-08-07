/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.entidadesVista;

import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author William
 */
public class AdicionProyecto {

    private long idProyecto;
    private long idAdicion;
    private long montoAdicion;
    private String descripcionAdicion;
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date fechaActaAdicion;
    private String numeroActaAdicion;
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date fechaActaCODIAdicion;
    private String numeroActaCODIAdicion;
    
    private MultipartFile documentoAdicion;

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
     * @return the idAdicion
     */
    public long getIdAdicion() {
        return idAdicion;
    }

    /**
     * @param idAdicion the idAdicion to set
     */
    public void setIdAdicion(long idAdicion) {
        this.idAdicion = idAdicion;
    }

    /**
     * @return the documentoAdicion
     */
    public MultipartFile getDocumentoAdicion() {
        return documentoAdicion;
    }

    /**
     * @param documentoAdicion the documentoAdicion to set
     */
    public void setDocumentoAdicion(MultipartFile documentoAdicion) {
        this.documentoAdicion = documentoAdicion;
    }

    /**
     * @return the montoAdicion
     */
    public long getMontoAdicion() {
        return montoAdicion;
    }

    /**
     * @param montoAdicion the montoAdicion to set
     */
    public void setMontoAdicion(long montoAdicion) {
        this.montoAdicion = montoAdicion;
    }

    /**
     * @return the descripcionAdicion
     */
    public String getDescripcionAdicion() {
        return descripcionAdicion;
    }

    /**
     * @param descripcionAdicion the descripcionAdicion to set
     */
    public void setDescripcionAdicion(String descripcionAdicion) {
        this.descripcionAdicion = descripcionAdicion;
    }

    /**
     * @return the fechaActaAdicion
     */
    public Date getFechaActaAdicion() {
        return fechaActaAdicion;
    }

    /**
     * @param fechaActaAdicion the fechaActaAdicion to set
     */
    public void setFechaActaAdicion(Date fechaActaAdicion) {
        this.fechaActaAdicion = fechaActaAdicion;
    }

    /**
     * @return the numeroActaAdicion
     */
    public String getNumeroActaAdicion() {
        return numeroActaAdicion;
    }

    /**
     * @param numeroActaAdicion the numeroActaAdicion to set
     */
    public void setNumeroActaAdicion(String numeroActaAdicion) {
        this.numeroActaAdicion = numeroActaAdicion;
    }

    /**
     * @return the fechaActaCODIAdicion
     */
    public Date getFechaActaCODIAdicion() {
        return fechaActaCODIAdicion;
    }

    /**
     * @param fechaActaCODIAdicion the fechaActaCODIAdicion to set
     */
    public void setFechaActaCODIAdicion(Date fechaActaCODIAdicion) {
        this.fechaActaCODIAdicion = fechaActaCODIAdicion;
    }

    /**
     * @return the numeroActaCODIAdicion
     */
    public String getNumeroActaCODIAdicion() {
        return numeroActaCODIAdicion;
    }

    /**
     * @param numeroActaCODIAdicion the numeroActaCODIAdicion to set
     */
    public void setNumeroActaCODIAdicion(String numeroActaCODIAdicion) {
        this.numeroActaCODIAdicion = numeroActaCODIAdicion;
    }
}
