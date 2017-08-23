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
public class ProyectoProfesor {

    private String nombreCompletoProyecto;
    private Date fechaInicio;
    private Date fechaFinalizacion;
    private String rol;
    private double porcentajePI;
    private int horasSemana;

    /**
     * @return the nombreCompletoProyecto
     */
    public String getNombreCompletoProyecto() {
        return nombreCompletoProyecto;
    }

    /**
     * @param nombreCompletoProyecto the nombreCompletoProyecto to set
     */
    public void setNombreCompletoProyecto(String nombreCompletoProyecto) {
        this.nombreCompletoProyecto = nombreCompletoProyecto;
    }

    /**
     * @return the fechaInicio
     */
    public Date getFechaInicio() {
        return fechaInicio;
    }

    /**
     * @param fechaInicio the fechaInicio to set
     */
    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    /**
     * @return the fechaFinalizacion
     */
    public Date getFechaFinalizacion() {
        return fechaFinalizacion;
    }

    /**
     * @param fechaFinalizacion the fechaFinalizacion to set
     */
    public void setFechaFinalizacion(Date fechaFinalizacion) {
        this.fechaFinalizacion = fechaFinalizacion;
    }

    /**
     * @return the rol
     */
    public String getRol() {
        return rol;
    }

    /**
     * @param rol the rol to set
     */
    public void setRol(String rol) {
        this.rol = rol;
    }

    /**
     * @return the porcentajePI
     */
    public double getPorcentajePI() {
        return porcentajePI;
    }

    /**
     * @param porcentajePI the porcentajePI to set
     */
    public void setPorcentajePI(double porcentajePI) {
        this.porcentajePI = porcentajePI;
    }

    /**
     * @return the horasSemana
     */
    public int getHorasSemana() {
        return horasSemana;
    }

    /**
     * @param horasSemana the horasSemana to set
     */
    public void setHorasSemana(int horasSemana) {
        this.horasSemana = horasSemana;
    }

}
