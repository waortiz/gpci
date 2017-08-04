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
public class ProrrogaProyecto {

    private long idProrroga;
    private String descripcion;
    private Date fechaActa; 
    private String fechaActaFormateada;
    private String numeroActa;
    private Date fechaActaCODI;
    private String fechaActaCODIFormateada;
    private String numeroActaCODI;
    private int mesesAprobados;
    private long montoAprobado;
    private String montoAprobadoFormateado;

    /**
     * @return the idProrroga
     */
    public long getIdProrroga() {
        return idProrroga;
    }

    /**
     * @param idProrroga the idProrroga to set
     */
    public void setIdProrroga(long idProrroga) {
        this.idProrroga = idProrroga;
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
     * @return the mesesAprobados
     */
    public int getMesesAprobados() {
        return mesesAprobados;
    }

    /**
     * @param mesesAprobados the mesesAprobados to set
     */
    public void setMesesAprobados(int mesesAprobados) {
        this.mesesAprobados = mesesAprobados;
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
     * @return the fechaActaCODI
     */
    public Date getFechaActaCODI() {
        return fechaActaCODI;
    }

    /**
     * @param fechaActaCODI the fechaActaCODI to set
     */
    public void setFechaActaCODI(Date fechaActaCODI) {
        this.fechaActaCODI = fechaActaCODI;
    }

    /**
     * @return the fechaActaCODIFormateada
     */
    public String getFechaActaCODIFormateada() {
        return fechaActaCODIFormateada;
    }

    /**
     * @param fechaActaCODIFormateada the fechaActaCODIFormateada to set
     */
    public void setFechaActaCODIFormateada(String fechaActaCODIFormateada) {
        this.fechaActaCODIFormateada = fechaActaCODIFormateada;
    }

    /**
     * @return the numeroActaCODI
     */
    public String getNumeroActaCODI() {
        return numeroActaCODI;
    }

    /**
     * @param numeroActaCODI the numeroActaCODI to set
     */
    public void setNumeroActaCODI(String numeroActaCODI) {
        this.numeroActaCODI = numeroActaCODI;
    }

    /**
     * @return the montoAprobado
     */
    public long getMontoAprobado() {
        return montoAprobado;
    }

    /**
     * @param montoAprobado the montoAprobado to set
     */
    public void setMontoAprobado(long montoAprobado) {
        this.montoAprobado = montoAprobado;
    }

    /**
     * @return the montoAprobadoFormateado
     */
    public String getMontoAprobadoFormateado() {
        return montoAprobadoFormateado;
    }

    /**
     * @param montoAprobadoFormateado the montoAprobadoFormateado to set
     */
    public void setMontoAprobadoFormateado(String montoAprobadoFormateado) {
        this.montoAprobadoFormateado = montoAprobadoFormateado;
    }
}
