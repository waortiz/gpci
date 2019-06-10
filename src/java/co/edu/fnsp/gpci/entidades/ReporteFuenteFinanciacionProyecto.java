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
    private String fuenteFinanciacionPrincipal;

    private long montoFrescos;
    private String montoFrescosFormateado;
    private long montoEspecies;
    private String montoEspeciesFormateado;
    private String totalRecursosFormateado;
    
    private String fuenteFinanciacionSecundaria;
    private String tipoFuenteFinanciacionSecundaria;

    private Long montoFrescosFuenteFinanciacionSecundaria;
    private String montoFrescosFuenteFinanciacionSecundariaFormateado;
    private Long montoEspeciesFuenteFinanciacionSecundaria;
    private String montoEspeciesFuenteFinanciacionSecundariaFormateado;
    private String totalRecursosFuenteFinanciacionSecundariaFormateado;

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
     * @return the fuenteFinanciacionPrincipal
     */
    public String getFuenteFinanciacionPrincipal() {
        return fuenteFinanciacionPrincipal;
    }

    /**
     * @param fuenteFinanciacionPrincipal the fuenteFinanciacionPrincipal to set
     */
    public void setFuenteFinanciacionPrincipal(String fuenteFinanciacionPrincipal) {
        this.fuenteFinanciacionPrincipal = fuenteFinanciacionPrincipal;
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
     * @return the fuenteFinanciacionSecundaria
     */
    public String getFuenteFinanciacionSecundaria() {
        return fuenteFinanciacionSecundaria;
    }

    /**
     * @param fuenteFinanciacionSecundaria the fuenteFinanciacionSecundaria to set
     */
    public void setFuenteFinanciacionSecundaria(String fuenteFinanciacionSecundaria) {
        this.fuenteFinanciacionSecundaria = fuenteFinanciacionSecundaria;
    }

    /**
     * @return the tipoFuenteFinanciacionSecundaria
     */
    public String getTipoFuenteFinanciacionSecundaria() {
        return tipoFuenteFinanciacionSecundaria;
    }

    /**
     * @param tipoFuenteFinanciacionSecundaria the tipoFuenteFinanciacionSecundaria to set
     */
    public void setTipoFuenteFinanciacionSecundaria(String tipoFuenteFinanciacionSecundaria) {
        this.tipoFuenteFinanciacionSecundaria = tipoFuenteFinanciacionSecundaria;
    }

    /**
     * @return the montoFrescosFuenteFinanciacionSecundaria
     */
    public Long getMontoFrescosFuenteFinanciacionSecundaria() {
        return montoFrescosFuenteFinanciacionSecundaria;
    }

    /**
     * @param montoFrescosFuenteFinanciacionSecundaria the montoFrescosFuenteFinanciacionSecundaria to set
     */
    public void setMontoFrescosFuenteFinanciacionSecundaria(Long montoFrescosFuenteFinanciacionSecundaria) {
        this.montoFrescosFuenteFinanciacionSecundaria = montoFrescosFuenteFinanciacionSecundaria;
    }

    /**
     * @return the montoFrescosFuenteFinanciacionSecundariaFormateado
     */
    public String getMontoFrescosFuenteFinanciacionSecundariaFormateado() {
        return montoFrescosFuenteFinanciacionSecundariaFormateado;
    }

    /**
     * @param montoFrescosFuenteFinanciacionSecundariaFormateado the montoFrescosFuenteFinanciacionSecundariaFormateado to set
     */
    public void setMontoFrescosFuenteFinanciacionSecundariaFormateado(String montoFrescosFuenteFinanciacionSecundariaFormateado) {
        this.montoFrescosFuenteFinanciacionSecundariaFormateado = montoFrescosFuenteFinanciacionSecundariaFormateado;
    }

    /**
     * @return the montoEspeciesFuenteFinanciacionSecundaria
     */
    public Long getMontoEspeciesFuenteFinanciacionSecundaria() {
        return montoEspeciesFuenteFinanciacionSecundaria;
    }

    /**
     * @param montoEspeciesFuenteFinanciacionSecundaria the montoEspeciesFuenteFinanciacionSecundaria to set
     */
    public void setMontoEspeciesFuenteFinanciacionSecundaria(Long montoEspeciesFuenteFinanciacionSecundaria) {
        this.montoEspeciesFuenteFinanciacionSecundaria = montoEspeciesFuenteFinanciacionSecundaria;
    }

    /**
     * @return the montoEspeciesFuenteFinanciacionSecundariaFormateado
     */
    public String getMontoEspeciesFuenteFinanciacionSecundariaFormateado() {
        return montoEspeciesFuenteFinanciacionSecundariaFormateado;
    }

    /**
     * @param montoEspeciesFuenteFinanciacionSecundariaFormateado the montoEspeciesFuenteFinanciacionSecundariaFormateado to set
     */
    public void setMontoEspeciesFuenteFinanciacionSecundariaFormateado(String montoEspeciesFuenteFinanciacionSecundariaFormateado) {
        this.montoEspeciesFuenteFinanciacionSecundariaFormateado = montoEspeciesFuenteFinanciacionSecundariaFormateado;
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
     * @return the totalRecursosFuenteFinanciacionSecundariaFormateado
     */
    public String getTotalRecursosFuenteFinanciacionSecundariaFormateado() {
        return totalRecursosFuenteFinanciacionSecundariaFormateado;
    }

    /**
     * @param totalRecursosFuenteFinanciacionSecundariaFormateado the totalRecursosFuenteFinanciacionSecundariaFormateado to set
     */
    public void setTotalRecursosFuenteFinanciacionSecundariaFormateado(String totalRecursosFuenteFinanciacionSecundariaFormateado) {
        this.totalRecursosFuenteFinanciacionSecundariaFormateado = totalRecursosFuenteFinanciacionSecundariaFormateado;
    }
}
