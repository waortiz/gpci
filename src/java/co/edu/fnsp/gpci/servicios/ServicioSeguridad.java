/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.servicios;

import co.edu.fnsp.gpci.entidades.Usuario;
import co.edu.fnsp.gpci.repositorios.IRepositorioSeguridad;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author William
 */

@Service("servicioSeguridad")
public class ServicioSeguridad implements IServicioSeguridad {
    @Autowired
    private IRepositorioSeguridad repositorioSeguridad;
        
    @Override
    public Usuario obtenerUsuario(String nombreUsuario) {
        return repositorioSeguridad.obtenerUsuario(nombreUsuario);
    }

    @Override
    public void crearUsuario(Usuario usuario) {
        repositorioSeguridad.crearUsuario(usuario);
    }
    
}
