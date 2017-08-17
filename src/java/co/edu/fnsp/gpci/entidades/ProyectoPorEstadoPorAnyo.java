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
public class ProyectoPorEstadoPorAnyo {

    private int anyo;
    private int ejecucion;
    private int finalizados;
    private int atrasados;
    private int cancelados;
    private int trasladados;

    /**
     * @return the anyo
     */
    public int getAnyo() {
        return anyo;
    }

    /**
     * @param anyo the anyo to set
     */
    public void setAnyo(int anyo) {
        this.anyo = anyo;
    }

    /**
     * @return the ejecucion
     */
    public int getEjecucion() {
        return ejecucion;
    }

    /**
     * @param ejecucion the ejecucion to set
     */
    public void setEjecucion(int ejecucion) {
        this.ejecucion = ejecucion;
    }

    /**
     * @return the finalizados
     */
    public int getFinalizados() {
        return finalizados;
    }

    /**
     * @param finalizados the finalizados to set
     */
    public void setFinalizados(int finalizados) {
        this.finalizados = finalizados;
    }

    /**
     * @return the atrasados
     */
    public int getAtrasados() {
        return atrasados;
    }

    /**
     * @param atrasados the atrasados to set
     */
    public void setAtrasados(int atrasados) {
        this.atrasados = atrasados;
    }

    /**
     * @return the cancelados
     */
    public int getCancelados() {
        return cancelados;
    }

    /**
     * @param cancelados the cancelados to set
     */
    public void setCancelados(int cancelados) {
        this.cancelados = cancelados;
    }

    /**
     * @return the trasladados
     */
    public int getTrasladados() {
        return trasladados;
    }

    /**
     * @param trasladados the trasladados to set
     */
    public void setTrasladados(int trasladados) {
        this.trasladados = trasladados;
    }
    
}
