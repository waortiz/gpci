/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.entidadesVista;

import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author William
 */
public class CumplimientoAlertaAvalProyecto {

    private long idProyecto;
    private long idCumplimientoAlertaAvalProyecto;
    private long alertaAvalProyecto;
    private String fechaActaCumplimientoAlertaAvalProyecto;
    private String fechaActaCumplimientoAlertaAvalProyectoFormateada;
    private String numeroActaCumplimientoAlertaAvalProyecto;
    private MultipartFile documentoCumplimientoAlertaAvalProyecto;

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
     * @return the idCumplimientoAlertaAvalProyecto
     */
    public long getIdCumplimientoAlertaAvalProyecto() {
        return idCumplimientoAlertaAvalProyecto;
    }

    /**
     * @param idCumplimientoAlertaAvalProyecto the idCumplimientoAlertaAvalProyecto to set
     */
    public void setIdCumplimientoAlertaAvalProyecto(long idCumplimientoAlertaAvalProyecto) {
        this.idCumplimientoAlertaAvalProyecto = idCumplimientoAlertaAvalProyecto;
    }

    /**
     * @return the documentoCumplimientoAlertaAvalProyecto
     */
    public MultipartFile getDocumentoCumplimientoAlertaAvalProyecto() {
        return documentoCumplimientoAlertaAvalProyecto;
    }

    /**
     * @param documentoCumplimientoAlertaAvalProyecto the documentoCumplimientoAlertaAvalProyecto to set
     */
    public void setDocumentoCumplimientoAlertaAvalProyecto(MultipartFile documentoCumplimientoAlertaAvalProyecto) {
        this.documentoCumplimientoAlertaAvalProyecto = documentoCumplimientoAlertaAvalProyecto;
    }

    /**
     * @return the fechaActaCumplimientoAlertaAvalProyecto
     */
    public String getFechaActaCumplimientoAlertaAvalProyecto() {
        return fechaActaCumplimientoAlertaAvalProyecto;
    }

    /**
     * @param fechaActaCumplimientoAlertaAvalProyecto the fechaActaCumplimientoAlertaAvalProyecto to set
     */
    public void setFechaActaCumplimientoAlertaAvalProyecto(String fechaActaCumplimientoAlertaAvalProyecto) {
        this.fechaActaCumplimientoAlertaAvalProyecto = fechaActaCumplimientoAlertaAvalProyecto;
    }

    /**
     * @return the fechaActaCumplimientoAlertaAvalProyectoFormateada
     */
    public String getFechaActaCumplimientoAlertaAvalProyectoFormateada() {
        return fechaActaCumplimientoAlertaAvalProyectoFormateada;
    }

    /**
     * @param fechaActaCumplimientoAlertaAvalProyectoFormateada the fechaActaCumplimientoAlertaAvalProyectoFormateada to set
     */
    public void setFechaActaCumplimientoAlertaAvalProyectoFormateada(String fechaActaCumplimientoAlertaAvalProyectoFormateada) {
        this.fechaActaCumplimientoAlertaAvalProyectoFormateada = fechaActaCumplimientoAlertaAvalProyectoFormateada;
    }

    /**
     * @return the numeroActaCumplimientoAlertaAvalProyecto
     */
    public String getNumeroActaCumplimientoAlertaAvalProyecto() {
        return numeroActaCumplimientoAlertaAvalProyecto;
    }

    /**
     * @param numeroActaCumplimientoAlertaAvalProyecto the numeroActaCumplimientoAlertaAvalProyecto to set
     */
    public void setNumeroActaCumplimientoAlertaAvalProyecto(String numeroActaCumplimientoAlertaAvalProyecto) {
        this.numeroActaCumplimientoAlertaAvalProyecto = numeroActaCumplimientoAlertaAvalProyecto;
    }

    /**
     * @return the alertaAvalProyecto
     */
    public long getAlertaAvalProyecto() {
        return alertaAvalProyecto;
    }

    /**
     * @param alertaAvalProyecto the alertaAvalProyecto to set
     */
    public void setAlertaAvalProyecto(long alertaAvalProyecto) {
        this.alertaAvalProyecto = alertaAvalProyecto;
    }
   
}
