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
public class OpcionMenu {

    private int idOpcionMenu;
    private String nombre;
    private int nivel;
    private int idPadre;
    private String url;
    private String css;

    /**
     * @return the idOpcionMenu
     */
    public int getIdOpcionMenu() {
        return idOpcionMenu;
    }

    /**
     * @param idOpcionMenu the idOpcionMenu to set
     */
    public void setIdOpcionMenu(int idOpcionMenu) {
        this.idOpcionMenu = idOpcionMenu;
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
     * @return the idPadre
     */
    public int getIdPadre() {
        return idPadre;
    }

    /**
     * @param idPadre the idPadre to set
     */
    public void setIdPadre(int idPadre) {
        this.idPadre = idPadre;
    }

    /**
     * @return the url
     */
    public String getUrl() {
        return url;
    }

    /**
     * @param url the url to set
     */
    public void setUrl(String url) {
        this.url = url;
    }

    /**
     * @return the css
     */
    public String getCss() {
        return css;
    }

    /**
     * @param css the css to set
     */
    public void setCss(String css) {
        this.css = css;
    }
}
