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
public class PersonalExternoProyecto {

    /**
     * @return the idPersonalExterno
     */
    public long getIdPersonalExterno() {
        return idPersonalExterno;
    }

    /**
     * @param idPersonalExterno the idPersonalExterno to set
     */
    public void setIdPersonalExterno(long idPersonalExterno) {
        this.idPersonalExterno = idPersonalExterno;
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

    /**
     * @return the porcentajePropiedadIntelectual
     */
    public double getPorcentajePropiedadIntelectual() {
        return porcentajePropiedadIntelectual;
    }

    /**
     * @param porcentajePropiedadIntelectual the porcentajePropiedadIntelectual to set
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
    private long idPersonalExterno;
    private long idProyecto;
    private Rol rol;
    private double porcentajePropiedadIntelectual;
    private int horasSemana;
    private int mesesDedicados;
    private boolean cartaCesionDerechosPatrimonio;
}
