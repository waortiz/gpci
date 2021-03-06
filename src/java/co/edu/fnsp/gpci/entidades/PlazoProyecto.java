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
public class PlazoProyecto {

    private long idPlazo;
    private String descripcion;
    private Date fechaActa;
    private String fechaActaFormateada;
    private String numeroActa;
    private Date fechaActaCODI;
    private String fechaActaCODIFormateada;
    private String numeroActaCODI;
    private int mesesAprobados;

    /**
     * @return the idPlazo
     */
    public long getIdPlazo() {
        return idPlazo;
    }

    /**
     * @param idPlazo the idPlazo to set
     */
    public void setIdPlazo(long idPlazo) {
        this.idPlazo = idPlazo;
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
}
