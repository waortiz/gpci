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
public class ActaProyecto {

    /**
     * @return the documentoActa
     */
    public MultipartFile getDocumentoActa() {
        return documentoActa;
    }

    /**
     * @param documentoActa the documentoActa to set
     */
    public void setDocumentoActa(MultipartFile documentoActa) {
        this.documentoActa = documentoActa;
    }

    private long idActa;
    private long idProyecto;
    private String nombreActa;
    private String observacionesActa;
    private MultipartFile documentoActa;
            
    /**
     * @return the idActa
     */
    public long getIdActa() {
        return idActa;
    }

    /**
     * @param idActa the idActa to set
     */
    public void setIdActa(long idActa) {
        this.idActa = idActa;
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
     * @return the nombreActa
     */
    public String getNombreActa() {
        return nombreActa;
    }

    /**
     * @param nombreActa the nombreActa to set
     */
    public void setNombreActa(String nombreActa) {
        this.nombreActa = nombreActa;
    }

    /**
     * @return the observacionesActa
     */
    public String getObservacionesActa() {
        return observacionesActa;
    }

    /**
     * @param observacionesActa the observacionesActa to set
     */
    public void setObservacionesActa(String observacionesActa) {
        this.observacionesActa = observacionesActa;
    }
}
