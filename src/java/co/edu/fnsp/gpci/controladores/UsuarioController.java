/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.controladores;

import co.edu.fnsp.gpci.entidades.Usuario;
import co.edu.fnsp.gpci.entidadesVista.RecuperacionClave;
import co.edu.fnsp.gpci.servicios.IServicioSeguridad;
import co.edu.fnsp.gpci.utilidades.Mail;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author William
 */
@Controller
@RequestMapping(value = "/usuario")
public class UsuarioController {

    private static final Logger logger = LogManager.getLogger(UsuarioController.class.getName());

    @Autowired
    private IServicioSeguridad servicioSeguridad;

    @Autowired
    private Mail mail;

    @RequestMapping(value = "/crearUsuario", method = RequestMethod.POST)
    public @ResponseBody
    String crearUsuario(@ModelAttribute(value = "usuario") Usuario usuario, Model model) {
        String mensaje = "";
        try {
            Usuario usuarioActual = servicioSeguridad.obtenerUsuario(usuario.getNombreUsuario());
            if (usuarioActual == null) {
                servicioSeguridad.crearUsuario(usuario);
            } else {
                mensaje = "El usuario ya existe";
            }
        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return mensaje;
    }

    @RequestMapping(value = "/recuperarClave", method = RequestMethod.POST)
    public @ResponseBody
    String recuperarClave(@ModelAttribute(value = "recuperacionClave") RecuperacionClave recuperacionClave, Model model) {
        String mensaje = "";
        Usuario usuarioActual = servicioSeguridad.obtenerUsuario(recuperacionClave.getNombreUsuario());
        if (usuarioActual != null) {
            try {
                mail.sendMail(usuarioActual.getCorreoElectronico(), "Clave Ingreso Sistema", "Para ingresar al sistema utilice como clave <b>" + usuarioActual.getClave() + "</b>");
                mensaje = "La clave ha sido enviada a su correo electrónico";
            } catch (Exception exc) {
                logger.error(exc);
                throw exc;
            }
        } else {
            mensaje = "El usuario no existe. por favor verifique";
        }

        return mensaje;
    }
}
