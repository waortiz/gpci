package co.edu.fnsp.gpci.controladores;

import co.edu.fnsp.gpci.entidades.Usuario;
import co.edu.fnsp.gpci.servicios.IServicioSeguridad;
import co.edu.fnsp.gpci.utilidades.Mail;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginController {
    @Autowired
    private IServicioSeguridad servicioSeguridad;

    @Autowired
    private Mail mail;
    
    @RequestMapping(value = {"/login"}, method = RequestMethod.GET)
    public String loginPage(ModelMap model) {

        return "login";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/login";
    }
    
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
