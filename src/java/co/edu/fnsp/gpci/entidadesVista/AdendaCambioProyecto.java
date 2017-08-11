/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.entidadesVista;

import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author William
 */
public class AdendaCambioProyecto {

    private long idProyecto;
    private long idAdendaCambio;
    private String fechaAdendaCambio;
    private String fechaActaAdendaCambio;
    private String numeroActaAdendaCambio;
    private int tipoPersonaAdendaCambio;
    private int tipoIdentificacionPersonaAnteriorAdendaCambio;
    private long numeroIdentificacionPersonaAnteriorAdendaCambio;
    private int tipoIdentificacionPersonaAdendaCambio;
    private long numeroIdentificacionPersonaAdendaCambio;
    private int rolAdendaCambio;
    private String observacionesAdendaCambio;    
    private MultipartFile documentoAdendaCambio;

    /**
     * @return the idAdendaCambio
     */
    public long getIdAdendaCambio() {
        return idAdendaCambio;
    }

    /**
     * @param idAdendaCambio the idAdendaCambio to set
     */
    public void setIdAdendaCambio(long idAdendaCambio) {
        this.idAdendaCambio = idAdendaCambio;
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
     * @return the fechaActaAdendaCambio
     */
    public String getFechaActaAdendaCambio() {
        return fechaActaAdendaCambio;
    }

    /**
     * @param fechaActaAdendaCambio the fechaActaAdendaCambio to set
     */
    public void setFechaActaAdendaCambio(String fechaActaAdendaCambio) {
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
    public String getFechaAdendaCambio() {
        return fechaAdendaCambio;
    }

    /**
     * @param fechaAdendaCambio the fechaAdendaCambio to set
     */
    public void setFechaAdendaCambio(String fechaAdendaCambio) {
        this.fechaAdendaCambio = fechaAdendaCambio;
    }

    /**
     * @return the tipoIdentificacionPersonaAnteriorAdendaCambio
     */
    public int getTipoIdentificacionPersonaAnteriorAdendaCambio() {
        return tipoIdentificacionPersonaAnteriorAdendaCambio;
    }

    /**
     * @param tipoIdentificacionPersonaAnteriorAdendaCambio the tipoIdentificacionPersonaAnteriorAdendaCambio to set
     */
    public void setTipoIdentificacionPersonaAnteriorAdendaCambio(int tipoIdentificacionPersonaAnteriorAdendaCambio) {
        this.tipoIdentificacionPersonaAnteriorAdendaCambio = tipoIdentificacionPersonaAnteriorAdendaCambio;
    }

    /**
     * @return the numeroIdentificacionPersonaAnteriorAdendaCambio
     */
    public long getNumeroIdentificacionPersonaAnteriorAdendaCambio() {
        return numeroIdentificacionPersonaAnteriorAdendaCambio;
    }

    /**
     * @param numeroIdentificacionPersonaAnteriorAdendaCambio the numeroIdentificacionPersonaAnteriorAdendaCambio to set
     */
    public void setNumeroIdentificacionPersonaAnteriorAdendaCambio(long numeroIdentificacionPersonaAnteriorAdendaCambio) {
        this.numeroIdentificacionPersonaAnteriorAdendaCambio = numeroIdentificacionPersonaAnteriorAdendaCambio;
    }
}
