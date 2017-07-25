/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.servicios;

import co.edu.fnsp.gpci.entidades.Privilegio;
import co.edu.fnsp.gpci.entidades.Usuario;
import co.edu.fnsp.gpci.repositorios.IRepositorioSeguridad;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

/**
 *
 * @author William
 */
@Service("servicioSeguridad")
public class ServicioSeguridad implements IServicioSeguridad {

    @Autowired
    private IRepositorioSeguridad repositorioSeguridad;

    @Autowired
    private PlatformTransactionManager transactionManager;

    @Override
    public Usuario obtenerUsuario(String nombreUsuario) {
        return repositorioSeguridad.obtenerUsuario(nombreUsuario);
    }

    @Override
    public Usuario obtenerUsuario(long idUsuario) {
        return repositorioSeguridad.obtenerUsuario(idUsuario);
    }

    @Override
    public void crearUsuario(Usuario usuario) {
        TransactionDefinition txDef = new DefaultTransactionDefinition();
        TransactionStatus txStatus = transactionManager.getTransaction(txDef);
        try {
            repositorioSeguridad.crearUsuario(usuario);
            transactionManager.commit(txStatus);
        } catch (Exception exc) {
            transactionManager.rollback(txStatus);
            throw exc;
        }
    }

    @Override
    public void actualizarUsuario(Usuario usuario) {
        repositorioSeguridad.actualizarUsuario(usuario);
    }

    @Override
    public void actualizarClaveUsuario(long idUsuario, String claveAnterior, String nuevaClave) {
        String clave = repositorioSeguridad.obtenerClaveUsuario(idUsuario);
        if (clave.equals(claveAnterior)) {
            repositorioSeguridad.actualizarClaveUsuario(idUsuario, nuevaClave);
        } else {
            throw new BadCredentialsException("La clave anterior del usuario no es correcta.");
        }
    }

    @Override
    public ArrayList<Privilegio> obtenerPrivilegios() {
        return repositorioSeguridad.obtenerPrivilegios();
    }

    @Override
    public ArrayList<Usuario> obtenerUsuarios() {
        return repositorioSeguridad.obtenerUsuarios();
    }

    @Override
    public void actualizarPrivilegiosUsuario(long idUsuario, ArrayList<Privilegio> privilegios) {
        repositorioSeguridad.actualizarPrivilegiosUsuario(idUsuario, privilegios);
    }

    @Override
    public ArrayList<Privilegio> obtenerPrivilegiosUsuario(long idUsuario) {
        return repositorioSeguridad.obtenerPrivilegiosUsuario(idUsuario);
    }

}
