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
public class AdicionProyecto {

     private long idAdicion;
     private long monto;
     private String descripcion;
     private Date fechaActa; 
     private String fechaActaFormateada;
     private String numeroActa;
     private Date fechaActaCODI;
     private String fechaActaCODIFormateada;
     private String numeroActaCODI;

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
     * @return the monto
     */
    public long getMonto() {
        return monto;
    }

    /**
     * @param monto the monto to set
     */
    public void setMonto(long monto) {
        this.monto = monto;
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
   
}
