/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.repositorios;

import co.edu.fnsp.gpci.entidades.Menu;
import java.util.List;

/**
 *
 * @author William
 */
public interface IRepositorioMenu {
   List<Menu> obtenerItemsMenu(int idUsuario);
}
