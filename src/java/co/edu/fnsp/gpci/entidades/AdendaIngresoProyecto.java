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
public class AdendaIngresoProyecto {

    private long idAdenda;
    private long idPersona;
    private Date fechaIngreso;
    private String fechaIngresoFormateada;
    private Date fechaActa;
    private String fechaActaFormateada;
    private String numeroActa;
    private String nombreTipoIdentificacionPersona;
    private int idTipoPersona;
    private String nombreTipoPersona;
    private int idTipoIdentificacionPersona;
    private String numeroIdentificacionPersona;
    private String nombresPersona;
    private String apellidosPersona;

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
     * @return the fechaIngreso
     */
    public Date getFechaIngreso() {
        return fechaIngreso;
    }

    /**
     * @param fechaIngreso the fechaIngreso to set
     */
    public void setFechaIngreso(Date fechaIngreso) {
        this.fechaIngreso = fechaIngreso;
    }

    /**
     * @return the fechaIngresoFormateada
     */
    public String getFechaIngresoFormateada() {
        return fechaIngresoFormateada;
    }

    /**
     * @param fechaIngresoFormateada the fechaIngresoFormateada to set
     */
    public void setFechaIngresoFormateada(String fechaIngresoFormateada) {
        this.fechaIngresoFormateada = fechaIngresoFormateada;
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
     * @return the numeroIdentificacionPersona
     */
    public String getNumeroIdentificacionPersona() {
        return numeroIdentificacionPersona;
    }

    /**
     * @param numeroIdentificacionPersona the numeroIdentificacionPersona to set
     */
    public void setNumeroIdentificacionPersona(String numeroIdentificacionPersona) {
        this.numeroIdentificacionPersona = numeroIdentificacionPersona;
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

}
