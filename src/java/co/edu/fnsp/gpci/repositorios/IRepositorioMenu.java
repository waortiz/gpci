/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.repositorios;

import co.edu.fnsp.gpci.entidades.OpcionMenu;
import java.util.ArrayList;

/**
 *
 * @author William
 */
public interface IRepositorioMenu {
   ArrayList<OpcionMenu> obtenerOpcionesMenuUsuario(long idUsuario);
   ArrayList<OpcionMenu> obtenerOpcionesMenuPrivilegio(int idPrivilegio);
   void actualizarOpcionesMenuPrivilegio(long idPrivilegio, ArrayList<OpcionMenu> opcionesMenu);
   ArrayList<OpcionMenu> obtenerOpcionesMenu();
}
