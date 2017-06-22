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
public class Presupuesto {

    /**
     * @return the idPresupuesto
     */
    public long getIdPresupuesto() {
        return idPresupuesto;
    }

    /**
     * @param idPresupuesto the idPresupuesto to set
     */
    public void setIdPresupuesto(long idPresupuesto) {
        this.idPresupuesto = idPresupuesto;
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
     * @return the recursosEspecie
     */
    public double getRecursosEspecie() {
        return recursosEspecie;
    }

    /**
     * @param recursosEspecie the recursosEspecie to set
     */
    public void setRecursosEspecie(double recursosEspecie) {
        this.recursosEspecie = recursosEspecie;
    }

    /**
     * @return the recursosFrescos
     */
    public double getRecursosFrescos() {
        return recursosFrescos;
    }

    /**
     * @param recursosFrescos the recursosFrescos to set
     */
    public void setRecursosFrescos(double recursosFrescos) {
        this.recursosFrescos = recursosFrescos;
    }
    
    private long idPresupuesto;
    private long idProyecto;
    private FuenteFinanciacion fuenteFinanciacion;
    private TipoFuentePresupuesto tipoFuentePresupuesto;
    private double recursosEspecie;
    private double recursosFrescos;
}
