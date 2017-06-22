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
public class ObjetivoEspecifico {

    /**
     * @return the idObjetivoEspecifico
     */
    public int getIdObjetivoEspecifico() {
        return idObjetivoEspecifico;
    }

    /**
     * @param idObjetivoEspecifico the idObjetivoEspecifico to set
     */
    public void setIdObjetivoEspecifico(int idObjetivoEspecifico) {
        this.idObjetivoEspecifico = idObjetivoEspecifico;
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
    private int idObjetivoEspecifico;
    private long idProyecto;
    private String descripcion;
}
