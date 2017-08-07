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
public class AdendaRetiroProyecto {
    private long idProyecto;
    private long idAdenda;
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date fechaAdendaRetiro;
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date fechaActaAdendaRetiro;
    private String numeroActaAdendaRetiro;
    private int tipoPersonaAdendaRetiro;
    private int tipoIdentificacionPersonaAdendaRetiro;
    private long numeroIdentificacionPersonaAdendaRetiro;
    private String motivoAdendaRetiro;    
    private MultipartFile documentoAdendaRetiro;
    
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
     * @return the fechaAdendaRetiro
     */
    public Date getFechaAdendaRetiro() {
        return fechaAdendaRetiro;
    }

    /**
     * @param fechaAdendaRetiro the fechaAdendaRetiro to set
     */
    public void setFechaAdendaRetiro(Date fechaAdendaRetiro) {
        this.fechaAdendaRetiro = fechaAdendaRetiro;
    }

    /**
     * @return the fechaActaAdendaRetiro
     */
    public Date getFechaActaAdendaRetiro() {
        return fechaActaAdendaRetiro;
    }

    /**
     * @param fechaActaAdendaRetiro the fechaActaAdendaRetiro to set
     */
    public void setFechaActaAdendaRetiro(Date fechaActaAdendaRetiro) {
        this.fechaActaAdendaRetiro = fechaActaAdendaRetiro;
    }

    /**
     * @return the numeroActaAdendaRetiro
     */
    public String getNumeroActaAdendaRetiro() {
        return numeroActaAdendaRetiro;
    }

    /**
     * @param numeroActaAdendaRetiro the numeroActaAdendaRetiro to set
     */
    public void setNumeroActaAdendaRetiro(String numeroActaAdendaRetiro) {
        this.numeroActaAdendaRetiro = numeroActaAdendaRetiro;
    }

    /**
     * @return the tipoPersonaAdendaRetiro
     */
    public int getTipoPersonaAdendaRetiro() {
        return tipoPersonaAdendaRetiro;
    }

    /**
     * @param tipoPersonaAdendaRetiro the tipoPersonaAdendaRetiro to set
     */
    public void setTipoPersonaAdendaRetiro(int tipoPersonaAdendaRetiro) {
        this.tipoPersonaAdendaRetiro = tipoPersonaAdendaRetiro;
    }

    /**
     * @return the tipoIdentificacionPersonaAdendaRetiro
     */
    public int getTipoIdentificacionPersonaAdendaRetiro() {
        return tipoIdentificacionPersonaAdendaRetiro;
    }

    /**
     * @param tipoIdentificacionPersonaAdendaRetiro the tipoIdentificacionPersonaAdendaRetiro to set
     */
    public void setTipoIdentificacionPersonaAdendaRetiro(int tipoIdentificacionPersonaAdendaRetiro) {
        this.tipoIdentificacionPersonaAdendaRetiro = tipoIdentificacionPersonaAdendaRetiro;
    }

    /**
     * @return the numeroIdentificacionPersonaAdendaRetiro
     */
    public long getNumeroIdentificacionPersonaAdendaRetiro() {
        return numeroIdentificacionPersonaAdendaRetiro;
    }

    /**
     * @param numeroIdentificacionPersonaAdendaRetiro the numeroIdentificacionPersonaAdendaRetiro to set
     */
    public void setNumeroIdentificacionPersonaAdendaRetiro(long numeroIdentificacionPersonaAdendaRetiro) {
        this.numeroIdentificacionPersonaAdendaRetiro = numeroIdentificacionPersonaAdendaRetiro;
    }

    /**
     * @return the motivoAdendaRetiro
     */
    public String getMotivoAdendaRetiro() {
        return motivoAdendaRetiro;
    }

    /**
     * @param motivoAdendaRetiro the motivoAdendaRetiro to set
     */
    public void setMotivoAdendaRetiro(String motivoAdendaRetiro) {
        this.motivoAdendaRetiro = motivoAdendaRetiro;
    }

    /**
     * @return the documentoAdendaRetiro
     */
    public MultipartFile getDocumentoAdendaRetiro() {
        return documentoAdendaRetiro;
    }

    /**
     * @param documentoAdendaRetiro the documentoAdendaRetiro to set
     */
    public void setDocumentoAdendaRetiro(MultipartFile documentoAdendaRetiro) {
        this.documentoAdendaRetiro = documentoAdendaRetiro;
    }
}
