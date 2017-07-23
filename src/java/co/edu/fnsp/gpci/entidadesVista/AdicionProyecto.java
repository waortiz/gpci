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
public class AdicionProyecto {

    private long idProyecto;
    private long idAdicion;
    private long montoAdicion;
    private String fechaAdicion;
    private MultipartFile documentoAdicion;

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
     * @return the idAdicion
     */
    public long getIdAdicion() {
        return idAdicion;
    }

    /**
     * @param idAdicion the idAdicion to set
     */
    public void setIdAdicion(long idAdicion) {
        this.idAdicion = idAdicion;
    }

    /**
     * @return the documentoAdicion
     */
    public MultipartFile getDocumentoAdicion() {
        return documentoAdicion;
    }

    /**
     * @param documentoAdicion the documentoAdicion to set
     */
    public void setDocumentoAdicion(MultipartFile documentoAdicion) {
        this.documentoAdicion = documentoAdicion;
    }

    /**
     * @return the montoAdicion
     */
    public long getMontoAdicion() {
        return montoAdicion;
    }

    /**
     * @param montoAdicion the montoAdicion to set
     */
    public void setMontoAdicion(long montoAdicion) {
        this.montoAdicion = montoAdicion;
    }

    /**
     * @return the fechaAdicion
     */
    public String getFechaAdicion() {
        return fechaAdicion;
    }

    /**
     * @param fechaAdicion the fechaAdicion to set
     */
    public void setFechaAdicion(String fechaAdicion) {
        this.fechaAdicion = fechaAdicion;
    }
}
