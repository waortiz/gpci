/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.entidades;

import co.edu.fnsp.gpci.utils.Util;
import java.util.Date;

/**
 *
 * @author William
 */
public class AdicionProyecto {

     private long idAdicion;
     private double monto;
     private Date fecha;
     private String fechaFormateada;

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
    public double getMonto() {
        return monto;
    }

    /**
     * @param monto the monto to set
     */
    public void setMonto(double monto) {
        this.monto = monto;
    }

    /**
     * @return the fecha
     */
    public Date getFecha() {
        return fecha;
    }

    /**
     * @param fecha the fecha to set
     */
    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
    
    /**
     * @return the fechaFormateada
     */
    public String getFechaFormateada() {
        return Util.formatter.format(fecha);
    }

    /**
     * @param fechaFormateada the fechaFormateada to set
     */
    public void setFechaFormateada(String fechaFormateada) {
        this.fechaFormateada = fechaFormateada;
    }
   
}
