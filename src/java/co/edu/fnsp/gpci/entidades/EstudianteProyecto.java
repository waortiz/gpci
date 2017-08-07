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
public class EstudianteProyecto {

    private long idEstudiante;
    private String descripcionTipoIdentificacion;
    private int idTipoIdentificacion;
    private String nombres;
    private String apellidos;
    private int idTipoEstudiante;
    private String descripcionTipoEstudiante;
    private long numeroIdentificacion;
    private String correoElectronico;
    private String contacto;
    private long idProyecto;
    private int idPrograma;
    private String descripcionPrograma;
    private int idRol;
    private String descripcionRol;
    private double porcentajePropiedadIntelectual;
    private int horasSemana;
    private int mesesDedicados;
    private String semestre;

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
     * @return the descripcionTipoIdentificacion
     */
    public String getDescripcionTipoIdentificacion() {
        return descripcionTipoIdentificacion;
    }

    /**
     * @param descripcionTipoIdentificacion the descripcionTipoIdentificacion to
     * set
     */
    public void setDescripcionTipoIdentificacion(String descripcionTipoIdentificacion) {
        this.descripcionTipoIdentificacion = descripcionTipoIdentificacion;
    }

    /**
     * @return the idTipoIdentificacion
     */
    public int getIdTipoIdentificacion() {
        return idTipoIdentificacion;
    }

    /**
     * @param idTipoIdentificacion the idTipoIdentificacion to set
     */
    public void setIdTipoIdentificacion(int idTipoIdentificacion) {
        this.idTipoIdentificacion = idTipoIdentificacion;
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
     * @return the idPrograma
     */
    public int getIdPrograma() {
        return idPrograma;
    }

    /**
     * @param idPrograma the idPrograma to set
     */
    public void setIdPrograma(int idPrograma) {
        this.idPrograma = idPrograma;
    }

    /**
     * @return the descripcionPrograma
     */
    public String getDescripcionPrograma() {
        return descripcionPrograma;
    }

    /**
     * @param descripcionPrograma the descripcionPrograma to set
     */
    public void setDescripcionPrograma(String descripcionPrograma) {
        this.descripcionPrograma = descripcionPrograma;
    }

    /**
     * @return the idRol
     */
    public int getIdRol() {
        return idRol;
    }

    /**
     * @param idRol the idRol to set
     */
    public void setIdRol(int idRol) {
        this.idRol = idRol;
    }

    /**
     * @return the descripcionRol
     */
    public String getDescripcionRol() {
        return descripcionRol;
    }

    /**
     * @param descripcionRol the descripcionRol to set
     */
    public void setDescripcionRol(String descripcionRol) {
        this.descripcionRol = descripcionRol;
    }

    /**
     * @return the porcentajePropiedadIntelectual
     */
    public double getPorcentajePropiedadIntelectual() {
        return porcentajePropiedadIntelectual;
    }

    /**
     * @param porcentajePropiedadIntelectual the porcentajePropiedadIntelectual
     * to set
     */
    public void setPorcentajePropiedadIntelectual(double porcentajePropiedadIntelectual) {
        this.porcentajePropiedadIntelectual = porcentajePropiedadIntelectual;
    }

    /**
     * @return the horasSemana
     */
    public int getHorasSemana() {
        return horasSemana;
    }

    /**
     * @param horasSemana the horasSemana to set
     */
    public void setHorasSemana(int horasSemana) {
        this.horasSemana = horasSemana;
    }

    /**
     * @return the mesesDedicados
     */
    public int getMesesDedicados() {
        return mesesDedicados;
    }

    /**
     * @param mesesDedicados the mesesDedicados to set
     */
    public void setMesesDedicados(int mesesDedicados) {
        this.mesesDedicados = mesesDedicados;
    }

    /**
     * @return the semestre
     */
    public String getSemestre() {
        if(semestre == null)
            return "";
        
        return semestre;
    }

    /**
     * @param semestre the semestre to set
     */
    public void setSemestre(String semestre) {
        this.semestre = semestre;
    }
}
