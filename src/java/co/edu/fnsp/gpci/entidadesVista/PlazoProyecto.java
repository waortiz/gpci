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
public class PlazoProyecto {

    private long idProyecto;
    private long idPlazo;
    private String descripcionPlazo;
    private int mesesAprobadosPlazo;
    private String fechaPlazo;
    private MultipartFile documentoPlazo;
    
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
     * @return the idPlazo
     */
    public long getIdPlazo() {
        return idPlazo;
    }

    /**
     * @param idPlazo the idPlazo to set
     */
    public void setIdPlazo(long idPlazo) {
        this.idPlazo = idPlazo;
    }

    /**
     * @return the descripcionPlazo
     */
    public String getDescripcionPlazo() {
        return descripcionPlazo;
    }

    /**
     * @param descripcionPlazo the descripcionPlazo to set
     */
    public void setDescripcionPlazo(String descripcionPlazo) {
        this.descripcionPlazo = descripcionPlazo;
    }

    /**
     * @return the mesesAprobadosPlazo
     */
    public int getMesesAprobadosPlazo() {
        return mesesAprobadosPlazo;
    }

    /**
     * @param mesesAprobadosPlazo the mesesAprobadosPlazo to set
     */
    public void setMesesAprobadosPlazo(int mesesAprobadosPlazo) {
        this.mesesAprobadosPlazo = mesesAprobadosPlazo;
    }

    /**
     * @return the documentoPlazo
     */
    public MultipartFile getDocumentoPlazo() {
        return documentoPlazo;
    }

    /**
     * @param documentoPlazo the documentoPlazo to set
     */
    public void setDocumentoPlazo(MultipartFile documentoPlazo) {
        this.documentoPlazo = documentoPlazo;
    }

    /**
     * @return the fechaPlazo
     */
    public String getFechaPlazo() {
        return fechaPlazo;
    }

    /**
     * @param fechaPlazo the fechaPlazo to set
     */
    public void setFechaPlazo(String fechaPlazo) {
        this.fechaPlazo = fechaPlazo;
    }
}
