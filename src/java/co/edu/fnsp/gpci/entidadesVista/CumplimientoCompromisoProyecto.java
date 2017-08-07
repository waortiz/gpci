/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.entidadesVista;

import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author William
 */
public class CumplimientoCompromisoProyecto {

    private long idProyecto;
    private long idCumplimientoCompromisoProyecto;
    private long compromisoProyecto;
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date fechaActaCumplimientoCompromisoProyecto;
    private String numeroActaCumplimientoCompromisoProyecto;
    private String fechaActaCumplimientoCompromisoProyectoFormateada;
    private MultipartFile documentoCumplimientoCompromisoProyecto;

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
     * @return the idCumplimientoCompromisoProyecto
     */
    public long getIdCumplimientoCompromisoProyecto() {
        return idCumplimientoCompromisoProyecto;
    }

    /**
     * @param idCumplimientoCompromisoProyecto the idCumplimientoCompromisoProyecto to set
     */
    public void setIdCumplimientoCompromisoProyecto(long idCumplimientoCompromisoProyecto) {
        this.idCumplimientoCompromisoProyecto = idCumplimientoCompromisoProyecto;
    }

    /**
     * @return the compromisoProyecto
     */
    public long getCompromisoProyecto() {
        return compromisoProyecto;
    }

    /**
     * @param compromisoProyecto the compromisoProyecto to set
     */
    public void setCompromisoProyecto(long compromisoProyecto) {
        this.compromisoProyecto = compromisoProyecto;
    }

    /**
     * @return the fechaActaCumplimientoCompromisoProyecto
     */
    public Date getFechaActaCumplimientoCompromisoProyecto() {
        return fechaActaCumplimientoCompromisoProyecto;
    }

    /**
     * @param fechaActaCumplimientoCompromisoProyecto the fechaActaCumplimientoCompromisoProyecto to set
     */
    public void setFechaActaCumplimientoCompromisoProyecto(Date fechaActaCumplimientoCompromisoProyecto) {
        this.fechaActaCumplimientoCompromisoProyecto = fechaActaCumplimientoCompromisoProyecto;
    }

    /**
     * @return the numeroActaCumplimientoCompromisoProyecto
     */
    public String getNumeroActaCumplimientoCompromisoProyecto() {
        return numeroActaCumplimientoCompromisoProyecto;
    }

    /**
     * @param numeroActaCumplimientoCompromisoProyecto the numeroActaCumplimientoCompromisoProyecto to set
     */
    public void setNumeroActaCumplimientoCompromisoProyecto(String numeroActaCumplimientoCompromisoProyecto) {
        this.numeroActaCumplimientoCompromisoProyecto = numeroActaCumplimientoCompromisoProyecto;
    }

    /**
     * @return the fechaActaCumplimientoCompromisoProyectoFormateada
     */
    public String getFechaActaCumplimientoCompromisoProyectoFormateada() {
        return fechaActaCumplimientoCompromisoProyectoFormateada;
    }

    /**
     * @param fechaActaCumplimientoCompromisoProyectoFormateada the fechaActaCumplimientoCompromisoProyectoFormateada to set
     */
    public void setFechaActaCumplimientoCompromisoProyectoFormateada(String fechaActaCumplimientoCompromisoProyectoFormateada) {
        this.fechaActaCumplimientoCompromisoProyectoFormateada = fechaActaCumplimientoCompromisoProyectoFormateada;
    }

    /**
     * @return the documentoCumplimientoCompromisoProyecto
     */
    public MultipartFile getDocumentoCumplimientoCompromisoProyecto() {
        return documentoCumplimientoCompromisoProyecto;
    }

    /**
     * @param documentoCumplimientoCompromisoProyecto the documentoCumplimientoCompromisoProyecto to set
     */
    public void setDocumentoCumplimientoCompromisoProyecto(MultipartFile documentoCumplimientoCompromisoProyecto) {
        this.documentoCumplimientoCompromisoProyecto = documentoCumplimientoCompromisoProyecto;
    }
}
