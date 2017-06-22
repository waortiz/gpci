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
public class AlertaAval {

    private long idAlertaAval;
    private long idProyecto;
    private int numeroActaComiteInv;
    private Date fechaAprobacion;
    private short tipoAval;

    /**
     * @return the idAlertaAval
     */
    public long getIdAlertaAval() {
        return idAlertaAval;
    }

    /**
     * @param idAlertaAval the idAlertaAval to set
     */
    public void setIdAlertaAval(long idAlertaAval) {
        this.idAlertaAval = idAlertaAval;
    }

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
     * @return the numeroActaComiteInv
     */
    public int getNumeroActaComiteInv() {
        return numeroActaComiteInv;
    }

    /**
     * @param numeroActaComiteInv the numeroActaComiteInv to set
     */
    public void setNumeroActaComiteInv(int numeroActaComiteInv) {
        this.numeroActaComiteInv = numeroActaComiteInv;
    }

    /**
     * @return the fechaAprobacion
     */
    public Date getFechaAprobacion() {
        return fechaAprobacion;
    }

    /**
     * @param fechaAprobacion the fechaAprobacion to set
     */
    public void setFechaAprobacion(Date fechaAprobacion) {
        this.fechaAprobacion = fechaAprobacion;
    }

    /**
     * @return the tipoAval
     */
    public short getTipoAval() {
        return tipoAval;
    }

    /**
     * @param tipoAval the tipoAval to set
     */
    public void setTipoAval(short tipoAval) {
        this.tipoAval = tipoAval;
    }

}
