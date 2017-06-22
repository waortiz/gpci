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
public class FuenteFinanciacion {

    /**
     * @return the idFuenteFinanciacion
     */
    public int getIdFuenteFinanciacion() {
        return idFuenteFinanciacion;
    }

    /**
     * @param idFuenteFinanciacion the idFuenteFinanciacion to set
     */
    public void setIdFuenteFinanciacion(int idFuenteFinanciacion) {
        this.idFuenteFinanciacion = idFuenteFinanciacion;
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
     * @return the correoElectronico
     */
    public String getCorreoElectronico() {
        return correoElectronico;
    }

    /**
     * @param correoElectronico the correoElectronico to set
     */
    public void setCorreoElectronico(String correoElectronico) {
        this.correoElectronico = correoElectronico;
    }

    /**
     * @return the contacto
     */
    public String getContacto() {
        return contacto;
    }

    /**
     * @param contacto the contacto to set
     */
    public void setContacto(String contacto) {
        this.contacto = contacto;
    }
    
    private int idFuenteFinanciacion;
    private String nombre;
    private String correoElectronico;
    private String contacto;
}
