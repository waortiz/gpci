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
public class AdendaIngresoProyecto {

    private long idProyecto;
    private long idAdendaIngreso;
    private String fechaAdendaIngreso;
    private String fechaActaAdendaIngreso;
    private String numeroActaAdendaIngreso;
    private int tipoPersonaAdendaIngreso;
    private int tipoIdentificacionPersonaAdendaIngreso;
    private String numeroIdentificacionPersonaAdendaIngreso;
    private MultipartFile documentoAdendaIngreso;

    /**
     * @return the idAdendaIngreso
     */
    public long getIdAdendaIngreso() {
        return idAdendaIngreso;
    }

    /**
     * @param idAdendaIngreso the idAdendaIngreso to set
     */
    public void setIdAdendaIngreso(long idAdendaIngreso) {
        this.idAdendaIngreso = idAdendaIngreso;
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
     * @return the fechaAdendaIngreso
     */
    public String getFechaAdendaIngreso() {
        return fechaAdendaIngreso;
    }

    /**
     * @param fechaAdendaIngreso the fechaAdendaIngreso to set
     */
    public void setFechaAdendaIngreso(String fechaAdendaIngreso) {
        this.fechaAdendaIngreso = fechaAdendaIngreso;
    }

    /**
     * @return the fechaActaAdendaIngreso
     */
    public String getFechaActaAdendaIngreso() {
        return fechaActaAdendaIngreso;
    }

    /**
     * @param fechaActaAdendaIngreso the fechaActaAdendaIngreso to set
     */
    public void setFechaActaAdendaIngreso(String fechaActaAdendaIngreso) {
        this.fechaActaAdendaIngreso = fechaActaAdendaIngreso;
    }

    /**
     * @return the numeroActaAdendaIngreso
     */
    public String getNumeroActaAdendaIngreso() {
        return numeroActaAdendaIngreso;
    }

    /**
     * @param numeroActaAdendaIngreso the numeroActaAdendaIngreso to set
     */
    public void setNumeroActaAdendaIngreso(String numeroActaAdendaIngreso) {
        this.numeroActaAdendaIngreso = numeroActaAdendaIngreso;
    }

    /**
     * @return the tipoPersonaAdendaIngreso
     */
    public int getTipoPersonaAdendaIngreso() {
        return tipoPersonaAdendaIngreso;
    }

    /**
     * @param tipoPersonaAdendaIngreso the tipoPersonaAdendaIngreso to set
     */
    public void setTipoPersonaAdendaIngreso(int tipoPersonaAdendaIngreso) {
        this.tipoPersonaAdendaIngreso = tipoPersonaAdendaIngreso;
    }

    /**
     * @return the tipoIdentificacionPersonaAdendaIngreso
     */
    public int getTipoIdentificacionPersonaAdendaIngreso() {
        return tipoIdentificacionPersonaAdendaIngreso;
    }

    /**
     * @param tipoIdentificacionPersonaAdendaIngreso the tipoIdentificacionPersonaAdendaIngreso to set
     */
    public void setTipoIdentificacionPersonaAdendaIngreso(int tipoIdentificacionPersonaAdendaIngreso) {
        this.tipoIdentificacionPersonaAdendaIngreso = tipoIdentificacionPersonaAdendaIngreso;
    }

    /**
     * @return the numeroIdentificacionPersonaAdendaIngreso
     */
    public String getNumeroIdentificacionPersonaAdendaIngreso() {
        return numeroIdentificacionPersonaAdendaIngreso;
    }

    /**
     * @param numeroIdentificacionPersonaAdendaIngreso the numeroIdentificacionPersonaAdendaIngreso to set
     */
    public void setNumeroIdentificacionPersonaAdendaIngreso(String numeroIdentificacionPersonaAdendaIngreso) {
        this.numeroIdentificacionPersonaAdendaIngreso = numeroIdentificacionPersonaAdendaIngreso;
    }

    /**
     * @return the documentoAdendaIngreso
     */
    public MultipartFile getDocumentoAdendaIngreso() {
        return documentoAdendaIngreso;
    }

    /**
     * @param documentoAdendaIngreso the documentoAdendaIngreso to set
     */
    public void setDocumentoAdendaIngreso(MultipartFile documentoAdendaIngreso) {
        this.documentoAdendaIngreso = documentoAdendaIngreso;
    }
}
