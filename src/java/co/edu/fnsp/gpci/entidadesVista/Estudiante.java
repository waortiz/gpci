/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.entidadesVista;

/**
 *
 * @author William
 */
public class Estudiante {

    private long idEstudiante;
    private int idTipoIdentificacion;
    private String descripcionTipoIdentificacion;
    private String nombres;
    private String apellidos;
    private int idTipoEstudiante;
    private String descripcionTipoEstudiante;
    private long numeroIdentificacion;
    private String correoElectronico;
    private String contacto;

    /**
     * @return the idEstudiante
     */
    public long getIdEstudiante() {
        return idEstudiante;
    }

    /**
     * @param idEstudiante the idEstudiante to set
     */
    public void setIdEstudiante(long idEstudiante) {
        this.idEstudiante = idEstudiante;
    }

    /**
     * @return the nombres
     */
    public String getNombres() {
        return nombres;
    }

    /**
     * @param nombres the nombres to set
     */
    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    /**
     * @return the apellidos
     */
    public String getApellidos() {
        return apellidos;
    }

    /**
     * @param apellidos the apellidos to set
     */
    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    /**
     * @return the numeroIdentificacion
     */
    public long getNumeroIdentificacion() {
        return numeroIdentificacion;
    }

    /**
     * @param numeroIdentificacion the numeroIdentificacion to set
     */
    public void setNumeroIdentificacion(long numeroIdentificacion) {
        this.numeroIdentificacion = numeroIdentificacion;
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
    
        /**
     * @return the idTipoIdentificacion
     */
    public int getIdTipoIdentificacion() {
        return idTipoIdentificacion;
    }

    /**
     * @return the descripcionTipoIdentificacion
     */
    public String getDescripcionTipoIdentificacion() {
        return descripcionTipoIdentificacion;
    }

    /**
     * @return the idTipoEstudiante
     */
    public int getIdTipoEstudiante() {
        return idTipoEstudiante;
    }

    /**
     * @param idTipoEstudiante the idTipoEstudiante to set
     */
    public void setIdTipoEstudiante(int idTipoEstudiante) {
        this.idTipoEstudiante = idTipoEstudiante;
    }

    /**
     * @return the descripcionTipoEstudiante
     */
    public String getDescripcionTipoEstudiante() {
        return descripcionTipoEstudiante;
    }

    /**
     * @param descripcionTipoEstudiante the descripcionTipoEstudiante to set
     */
    public void setDescripcionTipoEstudiante(String descripcionTipoEstudiante) {
        this.descripcionTipoEstudiante = descripcionTipoEstudiante;
    }
}
