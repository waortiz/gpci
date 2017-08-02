/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.entidadesVista;

/**
 *
 * @author William
 */
public class FuenteFinanciacionProyecto {

    private long idFuenteFinanciacionProyecto;
    private int idFuenteFinanciacion;
    private String nombreFuenteFinanciacion;
    private int idTipoFuenteFinanciacionProyecto;
    private String nombreTipoFuenteFinanciacionProyecto;
    private long montoFrescos;
    private long montoEspecies;

    /**
     * @return the idFuenteFinanciacionProyecto
     */
    public long getIdFuenteFinanciacionProyecto() {
        return idFuenteFinanciacionProyecto;
    }

    /**
     * @param idFuenteFinanciacionProyecto the idFuenteFinanciacionProyecto to set
     */
    public void setIdFuenteFinanciacionProyecto(long idFuenteFinanciacionProyecto) {
        this.idFuenteFinanciacionProyecto = idFuenteFinanciacionProyecto;
    }

    /**
     * @return the idFuenteFinanciacion
     */
    public int getIdFuenteFinanciacion() {
        return idFuenteFinanciacion;
    }

    /**
     * @param idFuenteFinanciacion the idFuenteFinanciacion to set
     */
    public void setIdFuenteFinanciacion(int idFuenteFinanciacion) {
        this.idFuenteFinanciacion = idFuenteFinanciacion;
    }

    /**
     * @return the nombreFuenteFinanciacion
     */
    public String getNombreFuenteFinanciacion() {
        return nombreFuenteFinanciacion;
    }

    /**
     * @param nombreFuenteFinanciacion the nombreFuenteFinanciacion to set
     */
    public void setNombreFuenteFinanciacion(String nombreFuenteFinanciacion) {
        this.nombreFuenteFinanciacion = nombreFuenteFinanciacion;
    }
    

    /**
     * @return the idTipoFuenteFinanciacionProyecto
     */
    public int getIdTipoFuenteFinanciacionProyecto() {
        return idTipoFuenteFinanciacionProyecto;
    }

    /**
     * @param idTipoFuenteFinanciacionProyecto the idTipoFuenteFinanciacionProyecto to set
     */
    public void setIdTipoFuenteFinanciacionProyecto(int idTipoFuenteFinanciacionProyecto) {
        this.idTipoFuenteFinanciacionProyecto = idTipoFuenteFinanciacionProyecto;
    }

    /**
     * @return the nombreTipoFuenteFinanciacionProyecto
     */
    public String getNombreTipoFuenteFinanciacionProyecto() {
        return nombreTipoFuenteFinanciacionProyecto;
    }

    /**
     * @param nombreTipoFuenteFinanciacionProyecto the nombreTipoFuenteFinanciacionProyecto to set
     */
    public void setNombreTipoFuenteFinanciacionProyecto(String nombreTipoFuenteFinanciacionProyecto) {
        this.nombreTipoFuenteFinanciacionProyecto = nombreTipoFuenteFinanciacionProyecto;
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
}
