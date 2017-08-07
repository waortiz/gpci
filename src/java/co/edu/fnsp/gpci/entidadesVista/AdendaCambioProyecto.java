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
public class AdendaCambioProyecto {

    private long idProyecto;
    private long idAdenda;
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date fechaAdendaCambio;
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date fechaActaAdendaCambio;
    private String numeroActaAdendaCambio;
    private int tipoPersonaAdendaCambio;
    private int tipoIdentificacionPersonaAdendaCambio;
    private long numeroIdentificacionPersonaAdendaCambio;
    private int rolAdendaCambio;
    private String observacionesAdendaCambio;    
    private MultipartFile documentoAdendaCambio;

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
     * @return the fechaActaAdendaCambio
     */
    public Date getFechaActaAdendaCambio() {
        return fechaActaAdendaCambio;
    }

    /**
     * @param fechaActaAdendaCambio the fechaActaAdendaCambio to set
     */
    public void setFechaActaAdendaCambio(Date fechaActaAdendaCambio) {
        this.fechaActaAdendaCambio = fechaActaAdendaCambio;
    }

    /**
     * @return the numeroActaAdendaCambio
     */
    public String getNumeroActaAdendaCambio() {
        return numeroActaAdendaCambio;
    }

    /**
     * @param numeroActaAdendaCambio the numeroActaAdendaCambio to set
     */
    public void setNumeroActaAdendaCambio(String numeroActaAdendaCambio) {
        this.numeroActaAdendaCambio = numeroActaAdendaCambio;
    }

    /**
     * @return the tipoPersonaAdendaCambio
     */
    public int getTipoPersonaAdendaCambio() {
        return tipoPersonaAdendaCambio;
    }

    /**
     * @param tipoPersonaAdendaCambio the tipoPersonaAdendaCambio to set
     */
    public void setTipoPersonaAdendaCambio(int tipoPersonaAdendaCambio) {
        this.tipoPersonaAdendaCambio = tipoPersonaAdendaCambio;
    }

    /**
     * @return the tipoIdentificacionPersonaAdendaCambio
     */
    public int getTipoIdentificacionPersonaAdendaCambio() {
        return tipoIdentificacionPersonaAdendaCambio;
    }

    /**
     * @param tipoIdentificacionPersonaAdendaCambio the tipoIdentificacionPersonaAdendaCambio to set
     */
    public void setTipoIdentificacionPersonaAdendaCambio(int tipoIdentificacionPersonaAdendaCambio) {
        this.tipoIdentificacionPersonaAdendaCambio = tipoIdentificacionPersonaAdendaCambio;
    }

    /**
     * @return the numeroIdentificacionPersonaAdendaCambio
     */
    public long getNumeroIdentificacionPersonaAdendaCambio() {
        return numeroIdentificacionPersonaAdendaCambio;
    }

    /**
     * @param numeroIdentificacionPersonaAdendaCambio the numeroIdentificacionPersonaAdendaCambio to set
     */
    public void setNumeroIdentificacionPersonaAdendaCambio(long numeroIdentificacionPersonaAdendaCambio) {
        this.numeroIdentificacionPersonaAdendaCambio = numeroIdentificacionPersonaAdendaCambio;
    }

    /**
     * @return the rolAdendaCambio
     */
    public int getRolAdendaCambio() {
        return rolAdendaCambio;
    }

    /**
     * @param rolAdendaCambio the rolAdendaCambio to set
     */
    public void setRolAdendaCambio(int rolAdendaCambio) {
        this.rolAdendaCambio = rolAdendaCambio;
    }

    /**
     * @return the observacionesAdendaCambio
     */
    public String getObservacionesAdendaCambio() {
        return observacionesAdendaCambio;
    }

    /**
     * @param observacionesAdendaCambio the observacionesAdendaCambio to set
     */
    public void setObservacionesAdendaCambio(String observacionesAdendaCambio) {
        this.observacionesAdendaCambio = observacionesAdendaCambio;
    }

    /**
     * @return the documentoAdendaCambio
     */
    public MultipartFile getDocumentoAdendaCambio() {
        return documentoAdendaCambio;
    }

    /**
     * @param documentoAdendaCambio the documentoAdendaCambio to set
     */
    public void setDocumentoAdendaCambio(MultipartFile documentoAdendaCambio) {
        this.documentoAdendaCambio = documentoAdendaCambio;
    }

    /**
     * @return the fechaAdendaCambio
     */
    public Date getFechaAdendaCambio() {
        return fechaAdendaCambio;
    }

    /**
     * @param fechaAdendaCambio the fechaAdendaCambio to set
     */
    public void setFechaAdendaCambio(Date fechaAdendaCambio) {
        this.fechaAdendaCambio = fechaAdendaCambio;
    }
}
