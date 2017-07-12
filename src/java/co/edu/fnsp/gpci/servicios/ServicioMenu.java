/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.servicios;

import co.edu.fnsp.gpci.entidades.ItemMenu;
import co.edu.fnsp.gpci.repositorios.IRepositorioMenu;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author William
 */

@Service("servicioMenu")
public class ServicioMenu implements IServicioMenu {
    @Autowired
    private IRepositorioMenu repositorioMenu;
   
    @Override
    public List<ItemMenu> obtenerItemsMenu(int idUsuario) {
       return repositorioMenu.obtenerItemsMenu(idUsuario);
   }
}
