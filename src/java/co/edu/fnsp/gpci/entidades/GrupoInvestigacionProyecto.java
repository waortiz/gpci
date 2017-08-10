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
public class GrupoInvestigacionProyecto {

    private int idGrupoInvestigacion;
    private String nombre;
    private boolean principal;

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

    /**
     * @return the principal
     */
    public boolean isPrincipal() {
        return principal;
    }

    /**
     * @param principal the principal to set
     */
    public void setPrincipal(boolean principal) {
        this.principal = principal;
    }
    
}
