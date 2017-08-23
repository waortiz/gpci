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
public class ReporteProfesorProyecto {

    private String nombreCompletoProyecto;
    private String codigo;
    private long numeroIdentificacion;
    private String nombreProfesor;
    private String horasSemana;
    private int horasSemanaFueraPlan;
    private Date fechaInicio;
    private Date fechaFinalizacion;
    private String fechaInicioFormateada;
    private String fechaFinalizacionFormateada;
    private int plazos;
    private int prorrogas;
    private String rol;
    private String estadoProyecto;

    /**
     * @return the codigo
     */
    public String getCodigo() {
        return codigo;
    }

    /**
     * @param codigo the codigo to set
     */
    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    /**
     * @return the numeroIdentificacion
     */
    public long getNumeroIdentificacion() {
        return numeroIdentificacion;
    }

    /**
     * @param numeroIdentificacion the numeroIdentificacion to set
     */
    public void setNumeroIdentificacion(long numeroIdentificacion) {
        this.numeroIdentificacion = numeroIdentificacion;
    }

    /**
     * @return the nombreProfesor
     */
    public String getNombreProfesor() {
        return nombreProfesor;
    }

    /**
     * @param nombreProfesor the nombreProfesor to set
     */
    public void setNombreProfesor(String nombreProfesor) {
        this.nombreProfesor = nombreProfesor;
    }

    /**
     * @return the horasSemana
     */
    public String getHorasSemana() {
        return horasSemana;
    }

    /**
     * @param horasSemana the horasSemana to set
     */
    public void setHorasSemana(String horasSemana) {
        this.horasSemana = horasSemana;
    }

    /**
     * @return the horasSemanaFueraPlan
     */
    public int getHorasSemanaFueraPlan() {
        return horasSemanaFueraPlan;
    }

    /**
     * @param horasSemanaFueraPlan the horasSemanaFueraPlan to set
     */
    public void setHorasSemanaFueraPlan(int horasSemanaFueraPlan) {
        this.horasSemanaFueraPlan = horasSemanaFueraPlan;
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
     * @return the plazos
     */
    public int getPlazos() {
        return plazos;
    }

    /**
     * @param plazos the plazos to set
     */
    public void setPlazos(int plazos) {
        this.plazos = plazos;
    }

    /**
     * @return the prorrogas
     */
    public int getProrrogas() {
        return prorrogas;
    }

    /**
     * @param prorrogas the prorrogas to set
     */
    public void setProrrogas(int prorrogas) {
        this.prorrogas = prorrogas;
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
     * @return the fechaInicioFormateada
     */
    public String getFechaInicioFormateada() {
        return fechaInicioFormateada;
    }

    /**
     * @param fechaInicioFormateada the fechaInicioFormateada to set
     */
    public void setFechaInicioFormateada(String fechaInicioFormateada) {
        this.fechaInicioFormateada = fechaInicioFormateada;
    }

    /**
     * @return the fechaFinalizacionFormateada
     */
    public String getFechaFinalizacionFormateada() {
        return fechaFinalizacionFormateada;
    }

    /**
     * @param fechaFinalizacionFormateada the fechaFinalizacionFormateada to set
     */
    public void setFechaFinalizacionFormateada(String fechaFinalizacionFormateada) {
        this.fechaFinalizacionFormateada = fechaFinalizacionFormateada;
    }

    /**
     * @return the estadoProyecto
     */
    public String getEstadoProyecto() {
        return estadoProyecto;
    }

    /**
     * @param estadoProyecto the estadoProyecto to set
     */
    public void setEstadoProyecto(String estadoProyecto) {
        this.estadoProyecto = estadoProyecto;
    }

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
}
