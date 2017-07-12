/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.configuraciones;

import co.edu.fnsp.gpci.entidades.ItemMenu;
import co.edu.fnsp.gpci.entidades.Usuario;
import co.edu.fnsp.gpci.servicios.IServicioMenu;
import co.edu.fnsp.gpci.utilidades.Menu;
import java.util.List;
import org.apache.tiles.Attribute;
import org.apache.tiles.AttributeContext;
import org.apache.tiles.preparer.ViewPreparer;
import org.apache.tiles.request.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;

/**
 *
 * @author William
 */
public class MenuViewPreparer implements ViewPreparer {

    @Autowired
    private IServicioMenu servicioMenu;
    
    @Override
    public void execute(Request request, AttributeContext attributeContext) {
        Usuario usuario = (Usuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        List<ItemMenu> items = servicioMenu.obtenerItemsMenu( usuario.getIdUsuario());
        String javascriptMenu = Menu.obtenerJavascriptMenu(items);
        attributeContext.putAttribute("javascriptMenu", new Attribute(javascriptMenu));
    }
    
}
