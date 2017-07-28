/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.controladores;

import co.edu.fnsp.gpci.entidades.OpcionMenu;
import co.edu.fnsp.gpci.entidades.Privilegio;
import co.edu.fnsp.gpci.servicios.IServicioMenu;
import co.edu.fnsp.gpci.servicios.IServicioSeguridad;
import java.util.ArrayList;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomCollectionEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author William
 */
@Controller
@RequestMapping(value = "/privilegios")
public class PrivilegioController {

    private static final Logger logger = LogManager.getLogger(PrivilegioController.class.getName());

    @Autowired
    private IServicioSeguridad servicioSeguridad;

    @Autowired
    private IServicioMenu servicioMenu;

    @RequestMapping(value = "/crear", method = RequestMethod.GET)
    public String mostrarCreacionPrivilegio(Model model) {
        ArrayList<OpcionMenu> opcionesMenu = servicioMenu.obtenerOpcionesMenu();
        model.addAttribute("opcionesMenuPorAsignar", opcionesMenu);
        model.addAttribute("opcionesMenuAsignados",new ArrayList<>());
        model.addAttribute("privilegio", new Privilegio());

        return "privilegios/crear";
    }

    @RequestMapping(value = "/crear", method = RequestMethod.POST)
    public @ResponseBody
    String crearUsuario(@ModelAttribute(value = "privilegio") Privilegio privilegio, Model model) {
        String mensaje = "";
        try {
            servicioSeguridad.crearPrivilegio(privilegio);
        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return mensaje;
    }

    @RequestMapping(value = "/editar/{idPrivilegio}", method = RequestMethod.GET)
    public String mostrarEdicionPrivilegio(@PathVariable int idPrivilegio, Model model) {
        Privilegio privilegio = servicioSeguridad.obtenerPrivilegio(idPrivilegio);
        ArrayList<OpcionMenu> opcionesMenu = servicioMenu.obtenerOpcionesMenu();
        ArrayList<OpcionMenu> opcionesMenuPorAsignar = new ArrayList<>();
        for (OpcionMenu opcionMenu : opcionesMenu) {
            boolean existe = false;
            for (OpcionMenu opcionMenuAsignado : privilegio.getOpcionesMenu()) {
                if (opcionMenu.getIdOpcionMenu() == opcionMenuAsignado.getIdOpcionMenu()) {
                    existe = true;
                    break;
                }
            }
            if (!existe) {
                opcionesMenuPorAsignar.add(opcionMenu);
            }
        }

        model.addAttribute("opcionesMenuPorAsignar", opcionesMenuPorAsignar);
        model.addAttribute("opcionesMenuAsignados", privilegio.getOpcionesMenu());
        model.addAttribute("privilegio", privilegio);

        return "privilegios/crear";
    }

    @RequestMapping(value = "/eliminar/{idPrivilegio}", method = RequestMethod.GET)
    public String eliminarPrivilegio(@PathVariable int idPrivilegio, Model model) {
        try {
            servicioSeguridad.eliminarPrivilegio(idPrivilegio);
            model.addAttribute("mensaje", "Privilegio eliminado exitosamente");
        } catch (Exception exc) {
            logger.error(exc);
            model.addAttribute("mensajeError", "No se puedo eliminar el privilegio");
        }
        model.addAttribute("privilegios", servicioSeguridad.obtenerPrivilegios());

        return "privilegios/privilegios";
    }

    @RequestMapping(value = "/privilegios", method = RequestMethod.GET)
    public String obtenerUsuarios(Model model) {

        ArrayList<Privilegio> privilegios = servicioSeguridad.obtenerPrivilegios();
        model.addAttribute("privilegios", privilegios);

        return "privilegios/privilegios";
    }

    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(ArrayList.class, "opcionesMenu", new CustomCollectionEditor(ArrayList.class) {

            @Override
            protected Object convertElement(Object element) {
                OpcionMenu opcionMenu = new OpcionMenu();
                if (element instanceof String && !((String) element).equals("")) {
                    try {
                        opcionMenu.setIdOpcionMenu(Integer.parseInt((String) element));
                    } catch (NumberFormatException e) {

                    }
                } else if (element instanceof Integer) {
                    try {
                        opcionMenu.setIdOpcionMenu((int) element);
                    } catch (Exception e) {

                    }
                }

                return opcionMenu;
            }
        });
    }
}
