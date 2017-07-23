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
public class AdendaProyecto {

    private long idProyecto;
    private long idAdenda;
    private String modificacionAdenda;
    private String fechaAdenda;
    private MultipartFile documentoAdenda;

    /**
     * @return the documentoAdenda
     */
    public MultipartFile getDocumentoAdenda() {
        return documentoAdenda;
    }

    /**
     * @param documentoAdenda the documentoAdenda to set
     */
    public void setDocumentoAdenda(MultipartFile documentoAdenda) {
        this.documentoAdenda = documentoAdenda;
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
     * @return the idAdenda
     */
    public long getIdAdenda() {
        return idAdenda;
    }

    /**
     * @param idAdenda the idAdenda to set
     */
    public void setIdAdenda(long idAdenda) {
        this.idAdenda = idAdenda;
    }
        
    /**
     * @return the modificacionAdenda
     */
    public String getModificacionAdenda() {
        return modificacionAdenda;
    }

    /**
     * @param modificacionAdenda the modificacionAdenda to set
     */
    public void setModificacionAdenda(String modificacionAdenda) {
        this.modificacionAdenda = modificacionAdenda;
    }

    /**
     * @return the fechaAdenda
     */
    public String getFechaAdenda() {
        return fechaAdenda;
    }

    /**
     * @param fechaAdenda the fechaAdenda to set
     */
    public void setFechaAdenda(String fechaAdenda) {
        this.fechaAdenda = fechaAdenda;
    }
}
