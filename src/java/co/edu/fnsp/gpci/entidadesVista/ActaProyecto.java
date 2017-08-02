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
    private long idActa;
    private long idProyecto;
    private int idTipoActa;
    private String numeroActa;
    private String fechaActa;
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

    /**
     * @return the idTipoActa
     */
    public int getIdTipoActa() {
        return idTipoActa;
    }

    /**
     * @param idTipoActa the idTipoActa to set
     */
    public void setIdTipoActa(int idTipoActa) {
        this.idTipoActa = idTipoActa;
    }

    /**
     * @return the fechaActa
     */
    public String getFechaActa() {
        return fechaActa;
    }

    /**
     * @param fechaActa the fechaActa to set
     */
    public void setFechaActa(String fechaActa) {
        this.fechaActa = fechaActa;
    }
    
    /**
     * @return the numeroActa
     */
    public String getNumeroActa() {
        return numeroActa;
    }

    /**
     * @param numeroActa the numeroActa to set
     */
    public void setNumeroActa(String numeroActa) {
        this.numeroActa = numeroActa;
    }    
}
