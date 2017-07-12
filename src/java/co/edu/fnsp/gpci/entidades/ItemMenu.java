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
public class ItemMenu {



    private int idMenu;
    private String nombre;
    private int nivel;
    private int padre;
    private String nombreDestino;
    private String urlDestino;
    private String imagen;

    /**
     * @return the idMenu
     */
    public int getIdMenu() {
        return idMenu;
    }

    /**
     * @param idMenu the idMenu to set
     */
    public void setIdMenu(int idMenu) {
        this.idMenu = idMenu;
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
     * @return the nivel
     */
    public int getNivel() {
        return nivel;
    }

    /**
     * @param nivel the nivel to set
     */
    public void setNivel(int nivel) {
        this.nivel = nivel;
    }

    /**
     * @return the padre
     */
    public int getPadre() {
        return padre;
    }

    /**
     * @param padre the padre to set
     */
    public void setPadre(int padre) {
        this.padre = padre;
    }

    /**
     * @return the imagen
     */
    public String getImagen() {
        return imagen;
    }

    /**
     * @param imagen the imagen to set
     */
    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    /**
     * @return the nombreDestino
     */
    public String getNombreDestino() {
        return nombreDestino;
    }

    /**
     * @param nombreDestino the nombreDestino to set
     */
    public void setNombreDestino(String nombreDestino) {
        this.nombreDestino = nombreDestino;
    }

    /**
     * @return the urlDestino
     */
    public String getUrlDestino() {
        return urlDestino;
    }

    /**
     * @param urlDestino the urlDestino to set
     */
    public void setUrlDestino(String urlDestino) {
        this.urlDestino = urlDestino;
    }
}
