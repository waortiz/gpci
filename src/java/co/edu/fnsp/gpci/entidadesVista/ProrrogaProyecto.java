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
public class ProrrogaProyecto {

    private long idProyecto;
    private long idProrroga;
    private String descripcionProrroga;
    private int mesesAprobadosProrroga;
    private MultipartFile documentoProrroga;
    
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
     * @return the idProrroga
     */
    public long getIdProrroga() {
        return idProrroga;
    }

    /**
     * @param idProrroga the idProrroga to set
     */
    public void setIdProrroga(long idProrroga) {
        this.idProrroga = idProrroga;
    }

    /**
     * @return the descripcionProrroga
     */
    public String getDescripcionProrroga() {
        return descripcionProrroga;
    }

    /**
     * @param descripcionProrroga the descripcionProrroga to set
     */
    public void setDescripcionProrroga(String descripcionProrroga) {
        this.descripcionProrroga = descripcionProrroga;
    }

    /**
     * @return the mesesAprobadosProrroga
     */
    public int getMesesAprobadosProrroga() {
        return mesesAprobadosProrroga;
    }

    /**
     * @param mesesAprobadosProrroga the mesesAprobadosProrroga to set
     */
    public void setMesesAprobadosProrroga(int mesesAprobadosProrroga) {
        this.mesesAprobadosProrroga = mesesAprobadosProrroga;
    }

    /**
     * @return the documentoProrroga
     */
    public MultipartFile getDocumentoProrroga() {
        return documentoProrroga;
    }

    /**
     * @param documentoProrroga the documentoProrroga to set
     */
    public void setDocumentoProrroga(MultipartFile documentoProrroga) {
        this.documentoProrroga = documentoProrroga;
    }
}
