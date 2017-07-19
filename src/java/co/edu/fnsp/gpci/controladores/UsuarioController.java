/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.controladores;

import co.edu.fnsp.gpci.entidades.Usuario;
import co.edu.fnsp.gpci.servicios.IServicioSeguridad;
import co.edu.fnsp.gpci.servicios.ServicioSeguridad;
import co.edu.fnsp.gpci.utilidades.Mail;
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

    @Autowired
    private IServicioSeguridad servicioSeguridad;

    @Autowired
    private Mail mail;

    @RequestMapping(value = "/crear", method = RequestMethod.POST)
    public @ResponseBody
    String crearUsuario(@ModelAttribute(value = "usuario") Usuario usuario, Model model) {
        String mensaje = "";

        try {
            servicioSeguridad.crearUsuario(usuario);
            mensaje = "Usuario creado exitosamente";
        } catch (Exception exc) {
            mensaje = "Error al crear el usuario: " + exc.getMessage();
        }

        return mensaje;
    }

    @RequestMapping(value = "/recuperarClave", method = RequestMethod.POST)
    public @ResponseBody
    String recuperarClave(@ModelAttribute(value = "recuperacionClave") Usuario usuario, Model model) {
        String mensaje = "";
        Usuario usuarioActual = servicioSeguridad.obtenerUsuario(usuario.getNombreUsuario());
        if (usuarioActual != null) {
            try {
                mail.sendMail(usuarioActual.getCorreoElectronico(), "Clave Ingreso Sistema", "Para ingresar al sistema utilice como clave <b>" + usuarioActual.getClave() + "</b>");
                mensaje = "La clave ha sido enviada a su correo electrónico";
            } catch (Exception exc) {
                mensaje = "Error al enviar el correo electrónico: " + exc.getMessage();
            }
        } else {
            mensaje = "El usuario no existe. por favor verifique";
        }

        return mensaje;
    }
}
