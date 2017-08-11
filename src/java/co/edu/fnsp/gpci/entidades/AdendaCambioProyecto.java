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
public class AdendaCambioProyecto {

    private long idAdenda;
    private long idPersona;
    private long idPersonaAnterior;
    private Date fechaActa;
    private String fechaActaFormateada;
    private String numeroActa;
    private Date fechaCambio;
    private String fechaCambioFormateada;
    private int idTipoPersona;
    private String nombreTipoPersona;

    private int idTipoIdentificacionPersonaAnterior;
    private String nombreTipoIdentificacionPersonaAnterior;
    private long numeroIdentificacionPersonaAnterior;
    private String nombresPersonaAnterior;
    private String apellidosPersonaAnterior;

    private int idTipoIdentificacionPersona;
    private String nombreTipoIdentificacionPersona;
    private long numeroIdentificacionPersona;
    private String nombresPersona;
    private String apellidosPersona;
    private String nombreRol;
    private int idRol;
    private String observaciones;

    /**
     * @return the idPersonaAnterior
     */
    public long getIdPersonaAnterior() {
        return idPersonaAnterior;
    }

    /**
     * @param idPersonaAnterior the idPersonaAnterior to set
     */
    public void setIdPersonaAnterior(long idPersonaAnterior) {
        this.idPersonaAnterior = idPersonaAnterior;
    }

    /**
     * @return the idPersona
     */
    public long getIdPersona() {
        return idPersona;
    }

    /**
     * @param idPersona the idPersona to set
     */
    public void setIdPersona(long idPersona) {
        this.idPersona = idPersona;
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
     * @return the fechaCambio
     */
    public Date getFechaCambio() {
        return fechaCambio;
    }

    /**
     * @param fechaCambio the fechaCambio to set
     */
    public void setFechaCambio(Date fechaCambio) {
        this.fechaCambio = fechaCambio;
    }

    /**
     * @return the fechaCambioFormateada
     */
    public String getFechaCambioFormateada() {
        return fechaCambioFormateada;
    }

    /**
     * @param fechaCambioFormateada the fechaCambioFormateada to set
     */
    public void setFechaCambioFormateada(String fechaCambioFormateada) {
        this.fechaCambioFormateada = fechaCambioFormateada;
    }

    /**
     * @return the nombreTipoIdentificacionPersona
     */
    public String getNombreTipoIdentificacionPersona() {
        return nombreTipoIdentificacionPersona;
    }

    /**
     * @param nombreTipoIdentificacionPersona the
     * nombreTipoIdentificacionPersona to set
     */
    public void setNombreTipoIdentificacionPersona(String nombreTipoIdentificacionPersona) {
        this.nombreTipoIdentificacionPersona = nombreTipoIdentificacionPersona;
    }

    /**
     * @return the idTipoPersona
     */
    public int getIdTipoPersona() {
        return idTipoPersona;
    }

    /**
     * @param idTipoPersona the idTipoPersona to set
     */
    public void setIdTipoPersona(int idTipoPersona) {
        this.idTipoPersona = idTipoPersona;
    }

    /**
     * @return the nombreTipoPersona
     */
    public String getNombreTipoPersona() {
        return nombreTipoPersona;
    }

    /**
     * @param nombreTipoPersona the nombreTipoPersona to set
     */
    public void setNombreTipoPersona(String nombreTipoPersona) {
        this.nombreTipoPersona = nombreTipoPersona;
    }

    /**
     * @return the idTipoIdentificacionPersona
     */
    public int getIdTipoIdentificacionPersona() {
        return idTipoIdentificacionPersona;
    }

    /**
     * @param idTipoIdentificacionPersona the idTipoIdentificacionPersona to set
     */
    public void setIdTipoIdentificacionPersona(int idTipoIdentificacionPersona) {
        this.idTipoIdentificacionPersona = idTipoIdentificacionPersona;
    }

    /**
     * @return the numeroIdentificacionPersona
     */
    public long getNumeroIdentificacionPersona() {
        return numeroIdentificacionPersona;
    }

    /**
     * @param numeroIdentificacionPersona the numeroIdentificacionPersona to set
     */
    public void setNumeroIdentificacionPersona(long numeroIdentificacionPersona) {
        this.numeroIdentificacionPersona = numeroIdentificacionPersona;
    }

    /**
     * @return the nombresPersona
     */
    public String getNombresPersona() {
        return nombresPersona;
    }

    /**
     * @param nombresPersona the nombresPersona to set
     */
    public void setNombresPersona(String nombresPersona) {
        this.nombresPersona = nombresPersona;
    }

    /**
     * @return the apellidosPersona
     */
    public String getApellidosPersona() {
        return apellidosPersona;
    }

    /**
     * @param apellidosPersona the apellidosPersona to set
     */
    public void setApellidosPersona(String apellidosPersona) {
        this.apellidosPersona = apellidosPersona;
    }

    /**
     * @return the nombreRol
     */
    public String getNombreRol() {
        return nombreRol;
    }

    /**
     * @param nombreRol the nombreRol to set
     */
    public void setNombreRol(String nombreRol) {
        this.nombreRol = nombreRol;
    }

    /**
     * @return the idRol
     */
    public int getIdRol() {
        return idRol;
    }

    /**
     * @param idRol the idRol to set
     */
    public void setIdRol(int idRol) {
        this.idRol = idRol;
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
     * @return the idTipoIdentificacionPersonaAnterior
     */
    public int getIdTipoIdentificacionPersonaAnterior() {
        return idTipoIdentificacionPersonaAnterior;
    }

    /**
     * @param idTipoIdentificacionPersonaAnterior the idTipoIdentificacionPersonaAnterior to set
     */
    public void setIdTipoIdentificacionPersonaAnterior(int idTipoIdentificacionPersonaAnterior) {
        this.idTipoIdentificacionPersonaAnterior = idTipoIdentificacionPersonaAnterior;
    }

    /**
     * @return the numeroIdentificacionPersonaAnterior
     */
    public long getNumeroIdentificacionPersonaAnterior() {
        return numeroIdentificacionPersonaAnterior;
    }

    /**
     * @param numeroIdentificacionPersonaAnterior the numeroIdentificacionPersonaAnterior to set
     */
    public void setNumeroIdentificacionPersonaAnterior(long numeroIdentificacionPersonaAnterior) {
        this.numeroIdentificacionPersonaAnterior = numeroIdentificacionPersonaAnterior;
    }

    /**
     * @return the nombresPersonaAnterior
     */
    public String getNombresPersonaAnterior() {
        return nombresPersonaAnterior;
    }

    /**
     * @param nombresPersonaAnterior the nombresPersonaAnterior to set
     */
    public void setNombresPersonaAnterior(String nombresPersonaAnterior) {
        this.nombresPersonaAnterior = nombresPersonaAnterior;
    }

    /**
     * @return the apellidosPersonaAnterior
     */
    public String getApellidosPersonaAnterior() {
        return apellidosPersonaAnterior;
    }

    /**
     * @param apellidosPersonaAnterior the apellidosPersonaAnterior to set
     */
    public void setApellidosPersonaAnterior(String apellidosPersonaAnterior) {
        this.apellidosPersonaAnterior = apellidosPersonaAnterior;
    }

    /**
     * @return the nombreTipoIdentificacionPersonaAnterior
     */
    public String getNombreTipoIdentificacionPersonaAnterior() {
        return nombreTipoIdentificacionPersonaAnterior;
    }

    /**
     * @param nombreTipoIdentificacionPersonaAnterior the nombreTipoIdentificacionPersonaAnterior to set
     */
    public void setNombreTipoIdentificacionPersonaAnterior(String nombreTipoIdentificacionPersonaAnterior) {
        this.nombreTipoIdentificacionPersonaAnterior = nombreTipoIdentificacionPersonaAnterior;
    }
}
