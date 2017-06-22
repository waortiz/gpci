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
public class ProfesorProyecto {

    /**
     * @return the rol
     */
    public Rol getRol() {
        return rol;
    }

    /**
     * @param rol the rol to set
     */
    public void setRol(Rol rol) {
        this.rol = rol;
    }

    private long idProfesor;
    private long idProyecto;
    private Rol rol;
    private Facultad facultad;
    private String codigoVinculacionUDEA;
    private boolean cartaCesionDerechosPatrimonio;
    private double porcentajePI;
    private int horasSemana;
    private int mesesDedicados;
    private int horasSemanaFueraPlan;
    private int mesesFueraPlan;

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
     * @return the codigoVinculacionUDEA
     */
    public String getCodigoVinculacionUDEA() {
        return codigoVinculacionUDEA;
    }

    /**
     * @param codigoVinculacionUDEA the codigoVinculacionUDEA to set
     */
    public void setCodigoVinculacionUDEA(String codigoVinculacionUDEA) {
        this.codigoVinculacionUDEA = codigoVinculacionUDEA;
    }

    /**
     * @return the cartaCesionDerechosPatrimonio
     */
    public boolean isCartaCesionDerechosPatrimonio() {
        return cartaCesionDerechosPatrimonio;
    }

    /**
     * @param cartaCesionDerechosPatrimonio the cartaCesionDerechosPatrimonio to
     * set
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
}
