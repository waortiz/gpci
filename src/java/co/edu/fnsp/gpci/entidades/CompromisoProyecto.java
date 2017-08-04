/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.entidades;

/**
 *
 * @author William
 */
public class CompromisoProyecto {

    private int idCompromisoProyecto;
    private String descripcion;
    private String nombreTipoCompromiso;
    private int idTipoCompromiso;
    
    /**
     * @return the idCompromisoProyecto
     */
    public int getIdCompromisoProyecto() {
        return idCompromisoProyecto;
    }

    /**
     * @param idCompromisoProyecto the idCompromisoProyecto to set
     */
    public void setIdCompromisoProyecto(int idCompromisoProyecto) {
        this.idCompromisoProyecto = idCompromisoProyecto;
    }

    /**
     * @return the descripcion
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * @param descripcion the descripcion to set
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    /**
     * @return the nombreTipoCompromiso
     */
    public String getNombreTipoCompromiso() {
        return nombreTipoCompromiso;
    }

    /**
     * @param nombreTipoCompromiso the nombreTipoCompromiso to set
     */
    public void setNombreTipoCompromiso(String nombreTipoCompromiso) {
        this.nombreTipoCompromiso = nombreTipoCompromiso;
    }

    /**
     * @return the idTipoCompromiso
     */
    public int getIdTipoCompromiso() {
        return idTipoCompromiso;
    }

    /**
     * @param idTipoCompromiso the idTipoCompromiso to set
     */
    public void setIdTipoCompromiso(int idTipoCompromiso) {
        this.idTipoCompromiso = idTipoCompromiso;
    }
   
}
