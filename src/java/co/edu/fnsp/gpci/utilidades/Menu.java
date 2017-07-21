/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.utilidades;

import java.util.List;
import org.apache.tiles.request.Request;

/**
 *
 * @author William
 */
public class Menu {

    public static String obtenerOpcionesMenu(List<co.edu.fnsp.gpci.entidades.Menu> menu) {
        StringBuilder sb = new StringBuilder();
        for (co.edu.fnsp.gpci.entidades.Menu m : menu) {
            if (m.getNivel() == 1) {
                sb.append("<li>");
                sb.append("<a href='#'").append(m.getUrl() != null ? " onclick=\"abrirOpcion('" + m.getUrl() + "'); return false;\"" : "").append("'><i class=\"").append(m.getCss()).append("\"></i>");
                sb.append(m.getNombre());
                sb.append("</a>");
                String items = obtenerItems(2, m.getIdMenu(), menu);
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
     * @param menu
     * @return el javascript a agregar
     */
    public static String obtenerItems(int nivel, int padre, List<co.edu.fnsp.gpci.entidades.Menu> menu) {
        co.edu.fnsp.gpci.entidades.Menu m;
        StringBuilder r = new StringBuilder();
        for (int i = 0; i < menu.size(); i++) {
            m = menu.get(i);
            if (m.getNivel() == nivel && m.getIdPadre() == padre) {
                r.append("<li><a href='#'").append(m.getUrl() != null ? " onclick=\"abrirOpcion('" + m.getUrl() + "'); return false;\"" : "").append("'>").append(m.getNombre()).append("</a></li>");
            }
        }

        return r.toString();
    }
    
    public static String obtenerMenuHome() {
        return "<li><a href='#' onclick=\"abrirOpcion('index'); return false;\"><i class=\"fa fa-user fa-fw\"></i>Home</a></li>";
    }
}
