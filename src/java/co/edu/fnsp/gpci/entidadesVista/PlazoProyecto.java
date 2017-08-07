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
public class PlazoProyecto {

    private long idProyecto;
    private long idPlazo;
    private String descripcionPlazo;
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date fechaActaPlazo;
    private String numeroActaPlazo;
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date fechaActaCODIPlazo;
    private String numeroActaCODIPlazo;
    private int mesesAprobadosPlazo;
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
     * @return the numeroActaPlazo
     */
    public String getNumeroActaPlazo() {
        return numeroActaPlazo;
    }

    /**
     * @param numeroActaPlazo the numeroActaPlazo to set
     */
    public void setNumeroActaPlazo(String numeroActaPlazo) {
        this.numeroActaPlazo = numeroActaPlazo;
    }

    /**
     * @return the numeroActaCODIPlazo
     */
    public String getNumeroActaCODIPlazo() {
        return numeroActaCODIPlazo;
    }

    /**
     * @param numeroActaCODIPlazo the numeroActaCODIPlazo to set
     */
    public void setNumeroActaCODIPlazo(String numeroActaCODIPlazo) {
        this.numeroActaCODIPlazo = numeroActaCODIPlazo;
    }

    /**
     * @return the fechaActaPlazo
     */
    public Date getFechaActaPlazo() {
        return fechaActaPlazo;
    }

    /**
     * @param fechaActaPlazo the fechaActaPlazo to set
     */
    public void setFechaActaPlazo(Date fechaActaPlazo) {
        this.fechaActaPlazo = fechaActaPlazo;
    }

    /**
     * @return the fechaActaCODIPlazo
     */
    public Date getFechaActaCODIPlazo() {
        return fechaActaCODIPlazo;
    }

    /**
     * @param fechaActaCODIPlazo the fechaActaCODIPlazo to set
     */
    public void setFechaActaCODIPlazo(Date fechaActaCODIPlazo) {
        this.fechaActaCODIPlazo = fechaActaCODIPlazo;
    }
}
