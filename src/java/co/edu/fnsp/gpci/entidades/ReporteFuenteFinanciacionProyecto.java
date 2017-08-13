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
    private String fuenteFinanciacion;
    private String tipoFuenteFinanciacion;
    private long monto;
    private String montoFormateado;
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
    
}
