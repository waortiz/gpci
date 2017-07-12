/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.utilidades;

import co.edu.fnsp.gpci.entidades.ItemMenu;
import java.util.List;

/**
 *
 * @author William
 */
public class Menu {

    public static String obtenerJavascriptMenu(List<ItemMenu> items) {
        StringBuilder sb = new StringBuilder();
        sb.append("var m = new Array();\r\n");
        int cuenta = 0;
        for (ItemMenu i : items) {
            if (i.getNivel() == 1) {
                sb.append("m[").append(cuenta).append("] = ");
                sb.append(obtenerConstructorMenuJavascript(i));
                sb.append(";\r\n");
                sb.append(buscarHijos(2, i.getIdMenu(), cuenta, items, "m[" + cuenta + "]"));
                cuenta++;
            } else {
                break;
            }
        }
        sb.append("\r\nfunction inicializar(){");
        sb.append("crearMenu(m);");
        sb.append("}\r\n");
        return sb.toString();
    }

    /**
     *
     * @param nivel el nivel en el que debe buscar
     * @param padre el padre que debe buscar
     * @param idx el idx en el que va
     * @param items
     * @param prefijo
     * @return el javascript a agregar
     */
    public static String buscarHijos(int nivel, int padre, int idx, List<ItemMenu> items, String prefijo) {
        int cuenta = 0;
        ItemMenu i;
        StringBuilder r = new StringBuilder();
        for (int j = idx; j < items.size(); j++) {
            i = items.get(j);
            if (i.getNivel() == nivel) { // el nivel del item igual al buscado
                if (i.getPadre() == padre) {
                    r.append(prefijo);
                    r.append(".add(");
                    r.append(obtenerConstructorMenuJavascript(i));
                    r.append(");\r\n");
                    r.append(buscarHijos(nivel + 1, i.getIdMenu(), j, items, prefijo + ".items[" + cuenta + "]"));
                    cuenta++;
                } else if (i.getPadre() > padre) {
                    break;// el padre del item es mayor que el buscado
                }
            } else if (i.getNivel() < nivel) {
                // el nivel del item es menor que el buscado
                
            } else {
                break;// el nivel del item es mayor que el buscado
            }
        }
        return r.toString();
    }

    public static String obtenerConstructorMenuJavascript(ItemMenu item) {
        StringBuilder sb = new StringBuilder();
        sb.append("new Item(\"");
        sb.append(item.getNombre());
        sb.append("\",");
        sb.append(item.getNombreDestino() == null ? "ETIQUETA" : "ENLACE");
        sb.append(",");
        sb.append(item.getNombreDestino() == null ? "null" : ("\"" + item.getUrlDestino() + "\""));
        sb.append(",");
        sb.append(item.getNombreDestino() == null ? "null" : ("\"" + item.getNombreDestino() + "\""));
        sb.append(",");
        sb.append(item.getImagen() == null ? "null" : ("\"" + item.getImagen() + "\""));
        sb.append(")");

        return sb.toString();
    }
}
