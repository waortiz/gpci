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
public class ProfesorProyecto {

    private long idProfesor;
    private String descripcionTipoIdentificacion;
    private int idTipoIdentificacion;
    private String nombres;
    private String apellidos;
    private long numeroIdentificacion;
    private String correoElectronico;
    private String contacto;
    private String descripcionRol;
    private int idRol;
    private String descripcionFacultad;
    private int idFacultad;
    private String codigoVinculacionUdeA;
    private boolean cartaCesionDerechosPatrimonio;
    private double porcentajePI;
    private int horasSemana;
    private int mesesDedicados;
    private int horasSemanaFueraPlan;
    private int mesesFueraPlan;
    
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
     * @return the idFacultad
     */
    public int getIdFacultad() {
        return idFacultad;
    }

    /**
     * @param idFacultad the idFacultad to set
     */
    public void setIdFacultad(int idFacultad) {
        this.idFacultad = idFacultad;
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
     * @return the codigoVinculacionUdeA
     */
    public String getCodigoVinculacionUdeA() {
        return codigoVinculacionUdeA;
    }

    /**
     * @param codigoVinculacionUdeA the codigoVinculacionUdeA to set
     */
    public void setCodigoVinculacionUdeA(String codigoVinculacionUdeA) {
        this.codigoVinculacionUdeA = codigoVinculacionUdeA;
    }

    /**
     * @return the cartaCesionDerechosPatrimonio
     */
    public boolean isCartaCesionDerechosPatrimonio() {
        return cartaCesionDerechosPatrimonio;
    }

    /**
     * @param cartaCesionDerechosPatrimonio the cartaCesionDerechosPatrimonio to set
     */
    public void setCartaCesionDerechosPatrimonio(boolean cartaCesionDerechosPatrimonio) {
        this.cartaCesionDerechosPatrimonio = cartaCesionDerechosPatrimonio;
    }

    /**
     * @return the porcentajePI
     */
    public double getPorcentajePI() {
        return porcentajePI;
    }

    /**
     * @param porcentajePI the porcentajePI to set
     */
    public void setPorcentajePI(double porcentajePI) {
        this.porcentajePI = porcentajePI;
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
     * @return the horasSemanaFueraPlan
     */
    public int getHorasSemanaFueraPlan() {
        return horasSemanaFueraPlan;
    }

    /**
     * @param horasSemanaFueraPlan the horasSemanaFueraPlan to set
     */
    public void setHorasSemanaFueraPlan(int horasSemanaFueraPlan) {
        this.horasSemanaFueraPlan = horasSemanaFueraPlan;
    }

    /**
     * @return the mesesFueraPlan
     */
    public int getMesesFueraPlan() {
        return mesesFueraPlan;
    }

    /**
     * @param mesesFueraPlan the mesesFueraPlan to set
     */
    public void setMesesFueraPlan(int mesesFueraPlan) {
        this.mesesFueraPlan = mesesFueraPlan;
    }

    /**
     * @return the idProfesor
     */
    public long getIdProfesor() {
        return idProfesor;
    }

    /**
     * @param idProfesor the idProfesor to set
     */
    public void setIdProfesor(long idProfesor) {
        this.idProfesor = idProfesor;
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
     * @return the descripcionTipoIdentificacion
     */
    public String getDescripcionTipoIdentificacion() {
        return descripcionTipoIdentificacion;
    }

    /**
     * @param descripcionTipoIdentificacion the descripcionTipoIdentificacion to set
     */
    public void setDescripcionTipoIdentificacion(String descripcionTipoIdentificacion) {
        this.descripcionTipoIdentificacion = descripcionTipoIdentificacion;
    }

    /**
     * @return the descripcionFacultad
     */
    public String getDescripcionFacultad() {
        return descripcionFacultad;
    }

    /**
     * @param descripcionFacultad the descripcionFacultad to set
     */
    public void setDescripcionFacultad(String descripcionFacultad) {
        this.descripcionFacultad = descripcionFacultad;
    }
}
