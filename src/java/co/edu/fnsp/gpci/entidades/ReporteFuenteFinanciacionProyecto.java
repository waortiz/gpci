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
    private long monto;
    private String montoFormateado;
    private String fuenteFinanciacionSecundaria;
    private String tipoFuenteFinanciacionSecundaria;
    private Long montoFuenteFinanciacionSecundaria;
    private String montoFuenteFinanciacionSecundariaFormateado;
    private long montoTotal;
    private String montoTotalFormateado;
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

    /**
     * @return the montoTotal
     */
    public long getMontoTotal() {
        return montoTotal;
    }

    /**
     * @param montoTotal the montoTotal to set
     */
    public void setMontoTotal(long montoTotal) {
        this.montoTotal = montoTotal;
    }

    /**
     * @return the montoTotalFormateado
     */
    public String getMontoTotalFormateado() {
        return montoTotalFormateado;
    }

    /**
     * @param montoTotalFormateado the montoTotalFormateado to set
     */
    public void setMontoTotalFormateado(String montoTotalFormateado) {
        this.montoTotalFormateado = montoTotalFormateado;
    }


    /**
     * @return the montoFuenteFinanciacionSecundaria
     */
    public Long getMontoFuenteFinanciacionSecundaria() {
        return montoFuenteFinanciacionSecundaria;
    }

    /**
     * @param montoFuenteFinanciacionSecundaria the montoFuenteFinanciacionSecundaria to set
     */
    public void setMontoFuenteFinanciacionSecundaria(Long montoFuenteFinanciacionSecundaria) {
        this.montoFuenteFinanciacionSecundaria = montoFuenteFinanciacionSecundaria;
    }

    /**
     * @return the montoFuenteFinanciacionSecundariaFormateado
     */
    public String getMontoFuenteFinanciacionSecundariaFormateado() {
        return montoFuenteFinanciacionSecundariaFormateado;
    }

    /**
     * @param montoFuenteFinanciacionSecundariaFormateado the montoFuenteFinanciacionSecundariaFormateado to set
     */
    public void setMontoFuenteFinanciacionSecundariaFormateado(String montoFuenteFinanciacionSecundariaFormateado) {
        this.montoFuenteFinanciacionSecundariaFormateado = montoFuenteFinanciacionSecundariaFormateado;
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
    
}
