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
public class Plazo {

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
     * @return the fechaAprobacion
     */
    public Date getFechaAprobacion() {
        return fechaAprobacion;
    }

    /**
     * @param fechaAprobacion the fechaAprobacion to set
     */
    public void setFechaAprobacion(Date fechaAprobacion) {
        this.fechaAprobacion = fechaAprobacion;
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
    private long idPlazo;
    private long idProyecto;
    private String descripcion;
    private Date fechaAprobacion;
    private int mesesAprobados;
}
