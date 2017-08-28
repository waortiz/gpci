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
public class SeguimientoProyecto {

    private long idProyecto;
    private String nombreCompletoProyecto;
    private String codigoProyecto;
    private String estadoProyecto;
    private String investigadorPrincipal;
    private String numeroActaInicio;
    private Date fechaInicio;
    private Date fechaFinalizacion;
    private int horasPlanTrabajo;
    private int horasFueraPlanTrabajo;
    private List<PlazoSeguimientoProyecto> plazos;
    private List<ProrrogaSeguimientoProyecto> prorrogas;
    private List<CompromisoSeguimientoProyecto> compromisos;

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
     * @return the investigadorPrincipal
     */
    public String getInvestigadorPrincipal() {
        return investigadorPrincipal;
    }

    /**
     * @param investigadorPrincipal the investigadorPrincipal to set
     */
    public void setInvestigadorPrincipal(String investigadorPrincipal) {
        this.investigadorPrincipal = investigadorPrincipal;
    }

    /**
     * @return the numeroActaInicio
     */
    public String getNumeroActaInicio() {
        return numeroActaInicio;
    }

    /**
     * @param numeroActaInicio the numeroActaInicio to set
     */
    public void setNumeroActaInicio(String numeroActaInicio) {
        this.numeroActaInicio = numeroActaInicio;
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
    public List<PlazoSeguimientoProyecto> getPlazos() {
        return plazos;
    }

    /**
     * @param plazos the plazos to set
     */
    public void setPlazos(List<PlazoSeguimientoProyecto> plazos) {
        this.plazos = plazos;
    }

    /**
     * @return the prorrogas
     */
    public List<ProrrogaSeguimientoProyecto> getProrrogas() {
        return prorrogas;
    }

    /**
     * @param prorrogas the prorrogas to set
     */
    public void setProrrogas(List<ProrrogaSeguimientoProyecto> prorrogas) {
        this.prorrogas = prorrogas;
    }

    /**
     * @return the compromisos
     */
    public List<CompromisoSeguimientoProyecto> getCompromisos() {
        return compromisos;
    }

    /**
     * @param compromisos the compromisos to set
     */
    public void setCompromisos(List<CompromisoSeguimientoProyecto> compromisos) {
        this.compromisos = compromisos;
    }
    
}
