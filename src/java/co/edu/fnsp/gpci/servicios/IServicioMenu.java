/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.servicios;

import co.edu.fnsp.gpci.entidades.ItemMenu;
import java.util.List;

/**
 *
 * @author William
 */
public interface IServicioMenu {
   List<ItemMenu> obtenerItemsMenu(int idUsuario);
}