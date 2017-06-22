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
public class GrupoInvestigacion {

    /**
     * @return the idGrupoInvestigacion
     */
    public int getIdGrupoInvestigacion() {
        return idGrupoInvestigacion;
    }

    /**
     * @param idGrupoInvestigacion the idGrupoInvestigacion to set
     */
    public void setIdGrupoInvestigacion(int idGrupoInvestigacion) {
        this.idGrupoInvestigacion = idGrupoInvestigacion;
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
    private int idGrupoInvestigacion;
    private String nombre;

    @Override
    public String toString() {
        return "GrupoInvestigacion [id=" + idGrupoInvestigacion + ", name=" + nombre + "]";
    }
}
