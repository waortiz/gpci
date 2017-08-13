/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.servicios;

import co.edu.fnsp.gpci.entidades.OpcionMenu;
import co.edu.fnsp.gpci.repositorios.IRepositorioMenu;
import java.util.ArrayList;
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
    public ArrayList<OpcionMenu> obtenerOpcionesMenuUsuario(long idUsuario) {
        return repositorioMenu.obtenerOpcionesMenuUsuario(idUsuario);
    }

    @Override
    public void actualizarOpcionesMenuPrivilegio(long idPrivilegio, ArrayList<OpcionMenu> opcionesMenu) {
        repositorioMenu.actualizarOpcionesMenuPrivilegio(idPrivilegio, opcionesMenu);
    }

    @Override
    public ArrayList<OpcionMenu> obtenerOpcionesMenu() {
        return repositorioMenu.obtenerOpcionesMenu();
    }

}
