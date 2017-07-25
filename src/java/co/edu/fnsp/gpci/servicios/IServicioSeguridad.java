/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.servicios;

import co.edu.fnsp.gpci.entidades.Privilegio;
import co.edu.fnsp.gpci.entidades.Usuario;
import java.util.ArrayList;

/**
 *
 * @author William
 */
public interface IServicioSeguridad {
    Usuario obtenerUsuario(String nombreUsuario);
    Usuario obtenerUsuario(long idUsuario);
    void crearUsuario(Usuario usuario);
    void actualizarUsuario(Usuario usuario);
    void actualizarClaveUsuario(long idUsuario, String claveAnterior, String nuevaClave);
    ArrayList<Privilegio> obtenerPrivilegios();
    ArrayList<Privilegio> obtenerPrivilegiosUsuario(long idUsuario);
    ArrayList<Usuario> obtenerUsuarios();
    void actualizarPrivilegiosUsuario(long idUsuario, ArrayList<Privilegio> privilegios);
}
