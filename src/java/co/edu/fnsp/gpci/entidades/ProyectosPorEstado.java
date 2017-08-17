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
public class ProyectosPorEstado {

    private int cantidadProyectosEjecucion;
    private int cantidadProyectosFinalizados;
    private int cantidadProyectosAtrasados;
    private int cantidadProyectosCancelados;
    private int cantidadProyectosTrasladados;

    /**
     * @return the cantidadProyectosEjecucion
     */
    public int getCantidadProyectosEjecucion() {
        return cantidadProyectosEjecucion;
    }

    /**
     * @param cantidadProyectosEjecucion the cantidadProyectosEjecucion to set
     */
    public void setCantidadProyectosEjecucion(int cantidadProyectosEjecucion) {
        this.cantidadProyectosEjecucion = cantidadProyectosEjecucion;
    }

    /**
     * @return the cantidadProyectosFinalizados
     */
    public int getCantidadProyectosFinalizados() {
        return cantidadProyectosFinalizados;
    }

    /**
     * @param cantidadProyectosFinalizados the cantidadProyectosFinalizados to set
     */
    public void setCantidadProyectosFinalizados(int cantidadProyectosFinalizados) {
        this.cantidadProyectosFinalizados = cantidadProyectosFinalizados;
    }

    /**
     * @return the cantidadProyectosAtrasados
     */
    public int getCantidadProyectosAtrasados() {
        return cantidadProyectosAtrasados;
    }

    /**
     * @param cantidadProyectosAtrasados the cantidadProyectosAtrasados to set
     */
    public void setCantidadProyectosAtrasados(int cantidadProyectosAtrasados) {
        this.cantidadProyectosAtrasados = cantidadProyectosAtrasados;
    }

    /**
     * @return the cantidadProyectosCancelados
     */
    public int getCantidadProyectosCancelados() {
        return cantidadProyectosCancelados;
    }

    /**
     * @param cantidadProyectosCancelados the cantidadProyectosCancelados to set
     */
    public void setCantidadProyectosCancelados(int cantidadProyectosCancelados) {
        this.cantidadProyectosCancelados = cantidadProyectosCancelados;
    }

    /**
     * @return the cantidadProyectosTrasladados
     */
    public int getCantidadProyectosTrasladados() {
        return cantidadProyectosTrasladados;
    }

    /**
     * @param cantidadProyectosTrasladados the cantidadProyectosTrasladados to set
     */
    public void setCantidadProyectosTrasladados(int cantidadProyectosTrasladados) {
        this.cantidadProyectosTrasladados = cantidadProyectosTrasladados;
    }
    
}
