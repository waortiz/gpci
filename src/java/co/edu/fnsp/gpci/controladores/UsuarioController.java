/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.controladores;

import co.edu.fnsp.gpci.entidades.Usuario;
import co.edu.fnsp.gpci.servicios.ServicioSeguridad;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author William
 */

@Controller
@RequestMapping(value = "/usuario")
public class UsuarioController {

    @Autowired
    private ServicioSeguridad servicioSeguridad;
    
    @RequestMapping(value = "/crear", method = RequestMethod.POST)
    public String crearUsuario(@ModelAttribute(value = "usuario") Usuario usuario, Model model) {
        
        servicioSeguridad.crearUsuario(usuario);
        
        return "/login";
    }
}
