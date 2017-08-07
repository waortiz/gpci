/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.utilidades;

import java.util.List;

/**
 *
 * @author William
 */
public class Menu {

    public static String obtenerMenu(List<co.edu.fnsp.gpci.entidades.OpcionMenu> opcionesMenu) {
        StringBuilder sb = new StringBuilder();
        for (co.edu.fnsp.gpci.entidades.OpcionMenu opcionMenu : opcionesMenu) {
            if (opcionMenu.getNivel() == 1) {
                sb.append("<li>");
                sb.append("<a href='#'").append(opcionMenu.getUrl() != null ? " onclick=\"abrirOpcion('" + opcionMenu.getUrl() + "'); return false;\"" : "").append("><i class=\"").append(opcionMenu.getCss()).append("\"></i>");
                sb.append(opcionMenu.getNombre());
                sb.append("</a>");
                String items = obtenerOpcionesMenu(2, opcionMenu.getIdOpcionMenu(), opcionesMenu);
                if (items.length() > 0) {
                    sb.append("<ul>");
                    sb.append(items);
                    sb.append("</ul>");
                }
                sb.append("</li>");
            }
        }

        return sb.toString();
    }

    /**
     *
     * @param nivel el nivel en el que debe buscar
     * @param padre el padre que debe buscar
     * @param opcionesMenu
     * @return el javascript a agregar
     */
    public static String obtenerOpcionesMenu(int nivel, int padre, List<co.edu.fnsp.gpci.entidades.OpcionMenu> opcionesMenu) {
        co.edu.fnsp.gpci.entidades.OpcionMenu opcionMenu;
        StringBuilder r = new StringBuilder();
        for (int i = 0; i < opcionesMenu.size(); i++) {
            opcionMenu = opcionesMenu.get(i);
            if (opcionMenu.isVisible() && opcionMenu.getNivel() == nivel && opcionMenu.getIdPadre() == padre) {
                r.append("<li><a href='#'").append(opcionMenu.getUrl() != null ? " onclick=\"abrirOpcion('" + opcionMenu.getUrl() + "'); return false;\"" : "").append(">").append(opcionMenu.getNombre()).append("</a></li>");
            }
        }

        return r.toString();
    }
}
