/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.entidades;

import java.util.Date;
import java.util.List;

/**
 *
 * @author William
 */
public class SeguimientoProyectoProfesor {

    private long idProyecto;
    private String nombreProfesor;
    private String numeroIdentificacion;
    private int cantidadProrrogas;
    private int cantidadPlazos;
    private int compromisosPendientes;
    private int compromisosEntregados;
    private String nombreCompletoProyecto;
    private String codigoProyecto;
    private Date fechaInicio;
    private Date fechaFinalizacion;
    private int horasPlanTrabajo;
    private int horasFueraPlanTrabajo;
    private List<PlazoSeguimientoProyectoProfesor> plazos;
    private List<ProrrogaSeguimientoProyectoProfesor> prorrogas;
    private List<CompromisoSeguimientoProyectoProfesor> compromisos;

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
     * @return the numeroIdentificacion
     */
    public String getNumeroIdentificacion() {
        return numeroIdentificacion;
    }

    /**
     * @param numeroIdentificacion the numeroIdentificacion to set
     */
    public void setNumeroIdentificacion(String numeroIdentificacion) {
        this.numeroIdentificacion = numeroIdentificacion;
    }

    /**
     * @return the cantidadProrrogas
     */
    public int getCantidadProrrogas() {
        return cantidadProrrogas;
    }

    /**
     * @param cantidadProrrogas the cantidadProrrogas to set
     */
    public void setCantidadProrrogas(int cantidadProrrogas) {
        this.cantidadProrrogas = cantidadProrrogas;
    }

    /**
     * @return the cantidadPlazos
     */
    public int getCantidadPlazos() {
        return cantidadPlazos;
    }

    /**
     * @param cantidadPlazos the cantidadPlazos to set
     */
    public void setCantidadPlazos(int cantidadPlazos) {
        this.cantidadPlazos = cantidadPlazos;
    }

    /**
     * @return the compromisosPendientes
     */
    public int getCompromisosPendientes() {
        return compromisosPendientes;
    }

    /**
     * @param compromisosPendientes the compromisosPendientes to set
     */
    public void setCompromisosPendientes(int compromisosPendientes) {
        this.compromisosPendientes = compromisosPendientes;
    }

    /**
     * @return the compromisosEntregados
     */
    public int getCompromisosEntregados() {
        return compromisosEntregados;
    }

    /**
     * @param compromisosEntregados the compromisosEntregados to set
     */
    public void setCompromisosEntregados(int compromisosEntregados) {
        this.compromisosEntregados = compromisosEntregados;
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

    /**
     * @return the codigoProyecto
     */
    public String getCodigoProyecto() {
        return codigoProyecto;
    }

    /**
     * @param codigoProyecto the codigoProyecto to set
     */
    public void setCodigoProyecto(String codigoProyecto) {
        this.codigoProyecto = codigoProyecto;
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
     * @return the horasPlanTrabajo
     */
    public int getHorasPlanTrabajo() {
        return horasPlanTrabajo;
    }

    /**
     * @param horasPlanTrabajo the horasPlanTrabajo to set
     */
    public void setHorasPlanTrabajo(int horasPlanTrabajo) {
        this.horasPlanTrabajo = horasPlanTrabajo;
    }

    /**
     * @return the horasFueraPlanTrabajo
     */
    public int getHorasFueraPlanTrabajo() {
        return horasFueraPlanTrabajo;
    }

    /**
     * @param horasFueraPlanTrabajo the horasFueraPlanTrabajo to set
     */
    public void setHorasFueraPlanTrabajo(int horasFueraPlanTrabajo) {
        this.horasFueraPlanTrabajo = horasFueraPlanTrabajo;
    }

    /**
     * @return the plazos
     */
    public List<PlazoSeguimientoProyectoProfesor> getPlazos() {
        return plazos;
    }

    /**
     * @param plazos the plazos to set
     */
    public void setPlazos(List<PlazoSeguimientoProyectoProfesor> plazos) {
        this.plazos = plazos;
    }

    /**
     * @return the prorrogas
     */
    public List<ProrrogaSeguimientoProyectoProfesor> getProrrogas() {
        return prorrogas;
    }

    /**
     * @param prorrogas the prorrogas to set
     */
    public void setProrrogas(List<ProrrogaSeguimientoProyectoProfesor> prorrogas) {
        this.prorrogas = prorrogas;
    }

    /**
     * @return the compromisos
     */
    public List<CompromisoSeguimientoProyectoProfesor> getCompromisos() {
        return compromisos;
    }

    /**
     * @param compromisos the compromisos to set
     */
    public void setCompromisos(List<CompromisoSeguimientoProyectoProfesor> compromisos) {
        this.compromisos = compromisos;
    }
    
}
