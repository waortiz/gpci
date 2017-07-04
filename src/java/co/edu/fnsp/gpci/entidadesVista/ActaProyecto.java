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
    private String nombre;
    private String observaciones;
    private MultipartFile archivo;
    
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
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
    * @return the observaciones
    */
    public String getObservaciones() {
        return observaciones;
    }

    /**
     * @param observaciones the observaciones to set
     */
    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
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
    * @return the archivo
    */
    public MultipartFile getArchivo() {
        return archivo;
    }

    /**
     * @param archivo the archivo to set
     */
    public void setArchivo(MultipartFile archivo) {
        this.archivo = archivo;
    }
}
