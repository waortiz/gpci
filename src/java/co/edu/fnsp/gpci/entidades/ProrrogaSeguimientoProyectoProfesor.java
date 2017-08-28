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
public class ProrrogaSeguimientoProyectoProfesor {

    private int mesesAprobados;
    private Date fechaFin;
    private long monto;
    private String montoFormateado;

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
     * @return the fechaFin
     */
    public Date getFechaFin() {
        return fechaFin;
    }

    /**
     * @param fechaFin the fechaFin to set
     */
    public void setFechaFin(Date fechaFin) {
        this.fechaFin = fechaFin;
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
     * @return the montoFormateado
     */
    public String getMontoFormateado() {
        return montoFormateado;
    }

    /**
     * @param montoFormateado the montoFormateado to set
     */
    public void setMontoFormateado(String montoFormateado) {
        this.montoFormateado = montoFormateado;
    }    
    
}
