/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.entidades;

/**
 *
 * @author William
 */
public class ReporteFuenteFinanciacionProyecto {

    private int anyoCreacion;
    private String nombreCompletoProyecto;
    private String codigo;
    private String estadoProyecto;
    private String fuenteFinanciacion;

    private long montoFrescos;
    private String montoFrescosFormateado;
    private long montoEspecies;
    private String montoEspeciesFormateado;
    private String subtotalRecursosFormateado;
    private long subtotalRecursos;
    private long totalRecursos;
    private String totalRecursosFormateado;
    
    private String tipoFuenteFinanciacion;

    private long totalRecursosFuenteFinanciacion;
    private String totalRecursosFuenteFinanciacionFormateado;

    private String investigadorPrincipal;
    private String grupoInvestigacion;

    /**
     * @return the anyoCreacion
     */
    public int getAnyoCreacion() {
        return anyoCreacion;
    }

    /**
     * @param anyoCreacion the anyoCreacion to set
     */
    public void setAnyoCreacion(int anyoCreacion) {
        this.anyoCreacion = anyoCreacion;
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
     * @return the grupoInvestigacion
     */
    public String getGrupoInvestigacion() {
        return grupoInvestigacion;
    }

    /**
     * @param grupoInvestigacion the grupoInvestigacion to set
     */
    public void setGrupoInvestigacion(String grupoInvestigacion) {
        this.grupoInvestigacion = grupoInvestigacion;
    }

    /**
     * @return the montoFrescos
     */
    public long getMontoFrescos() {
        return montoFrescos;
    }

    /**
     * @param montoFrescos the montoFrescos to set
     */
    public void setMontoFrescos(long montoFrescos) {
        this.montoFrescos = montoFrescos;
    }

    /**
     * @return the montoFrescosFormateado
     */
    public String getMontoFrescosFormateado() {
        return montoFrescosFormateado;
    }

    /**
     * @param montoFrescosFormateado the montoFrescosFormateado to set
     */
    public void setMontoFrescosFormateado(String montoFrescosFormateado) {
        this.montoFrescosFormateado = montoFrescosFormateado;
    }

    /**
     * @return the montoEspecies
     */
    public long getMontoEspecies() {
        return montoEspecies;
    }

    /**
     * @param montoEspecies the montoEspecies to set
     */
    public void setMontoEspecies(long montoEspecies) {
        this.montoEspecies = montoEspecies;
    }

    /**
     * @return the montoEspeciesFormateado
     */
    public String getMontoEspeciesFormateado() {
        return montoEspeciesFormateado;
    }

    /**
     * @param montoEspeciesFormateado the montoEspeciesFormateado to set
     */
    public void setMontoEspeciesFormateado(String montoEspeciesFormateado) {
        this.montoEspeciesFormateado = montoEspeciesFormateado;
    }

    /**
     * @return the fuenteFinanciacion
     */
    public String getFuenteFinanciacion() {
        return fuenteFinanciacion;
    }

    /**
     * @param fuenteFinanciacion the fuenteFinanciacion to set
     */
    public void setFuenteFinanciacion(String fuenteFinanciacion) {
        this.fuenteFinanciacion = fuenteFinanciacion;
    }

    /**
     * @return the totalRecursosFormateado
     */
    public String getTotalRecursosFormateado() {
        return totalRecursosFormateado;
    }

    /**
     * @param totalRecursosFormateado the totalRecursosFormateado to set
     */
    public void setTotalRecursosFormateado(String totalRecursosFormateado) {
        this.totalRecursosFormateado = totalRecursosFormateado;
    }

    /**
     * @return the tipoFuenteFinanciacion
     */
    public String getTipoFuenteFinanciacion() {
        return tipoFuenteFinanciacion;
    }

    /**
     * @param tipoFuenteFinanciacion the tipoFuenteFinanciacion to set
     */
    public void setTipoFuenteFinanciacion(String tipoFuenteFinanciacion) {
        this.tipoFuenteFinanciacion = tipoFuenteFinanciacion;
    }

    /**
     * @return the totalRecursosFuenteFinanciacion
     */
    public long getTotalRecursosFuenteFinanciacion() {
        return totalRecursosFuenteFinanciacion;
    }

    /**
     * @param totalRecursosFuenteFinanciacion the totalRecursosFuenteFinanciacion to set
     */
    public void setTotalRecursosFuenteFinanciacion(long totalRecursosFuenteFinanciacion) {
        this.totalRecursosFuenteFinanciacion = totalRecursosFuenteFinanciacion;
    }

    /**
     * @return the totalRecursosFuenteFinanciacionFormateado
     */
    public String getTotalRecursosFuenteFinanciacionFormateado() {
        return totalRecursosFuenteFinanciacionFormateado;
    }

    /**
     * @param totalRecursosFuenteFinanciacionFormateado the totalRecursosFuenteFinanciacionFormateado to set
     */
    public void setTotalRecursosFuenteFinanciacionFormateado(String totalRecursosFuenteFinanciacionFormateado) {
        this.totalRecursosFuenteFinanciacionFormateado = totalRecursosFuenteFinanciacionFormateado;
    }

     /**
     * @return the totalRecursos
     */
    public long getTotalRecursos() {
        return totalRecursos;
    }

    /**
     * @param totalRecursos the totalRecursos to set
     */
    public void setTotalRecursos(long totalRecursos) {
        this.totalRecursos = totalRecursos;
    }

    /**
     * @return the subtotalRecursos
     */
    public long getSubtotalRecursos() {
        return subtotalRecursos;
    }

    /**
     * @param subtotalRecursos the subtotalRecursos to set
     */
    public void setSubtotalRecursos(long subtotalRecursos) {
        this.subtotalRecursos = subtotalRecursos;
    }

    /**
     * @return the subtotalRecursosFormateado
     */
    public String getSubtotalRecursosFormateado() {
        return subtotalRecursosFormateado;
    }

    /**
     * @param subtotalRecursosFormateado the subtotalRecursosFormateado to set
     */
    public void setSubtotalRecursosFormateado(String subtotalRecursosFormateado) {
        this.subtotalRecursosFormateado = subtotalRecursosFormateado;
    }
}
