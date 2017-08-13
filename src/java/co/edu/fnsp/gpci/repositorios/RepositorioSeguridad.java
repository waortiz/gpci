/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.repositorios;

import co.edu.fnsp.gpci.entidades.OpcionMenu;
import co.edu.fnsp.gpci.entidades.Privilegio;
import co.edu.fnsp.gpci.entidades.Usuario;
import java.util.ArrayList;
import java.util.Map;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

/**
 *
 * @author William
 */
@Repository("repositorioSeguridad")
public class RepositorioSeguridad implements IRepositorioSeguridad {

    private SimpleJdbcCall obtenerUsuario;
    private SimpleJdbcCall obtenerUsuarioPorId;
    private SimpleJdbcCall obtenerClaveUsuario;
    private SimpleJdbcCall obtenerUsuarios;
    private SimpleJdbcCall ingresarUsuario;
    private SimpleJdbcCall actualizarUsuario;
    private SimpleJdbcCall actualizarClaveUsuario;
    private SimpleJdbcCall obtenerOpcionesMenuUsuario;

    private SimpleJdbcCall obtenerPrivilegios;
    private SimpleJdbcCall obtenerPrivilegiosUsuario;
    private SimpleJdbcCall ingresarPrivilegioUsuario;
    private SimpleJdbcCall eliminarPrivilegioUsuario;

    private SimpleJdbcCall obtenerPrivilegio;
    private SimpleJdbcCall obtenerPrivilegioPorCodigo;
    private SimpleJdbcCall ingresarPrivilegio;
    private SimpleJdbcCall eliminarPrivilegio;
    private SimpleJdbcCall actualizarPrivilegio;
    private SimpleJdbcCall obtenerOpcionesMenuPrivilegio;
    private SimpleJdbcCall ingresarOpcionMenuPrivilegio;
    private SimpleJdbcCall eliminarOpcionMenuPrivilegio;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        jdbcTemplate.setResultsMapCaseInsensitive(true);
        this.obtenerUsuario = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerUsuario");
        this.obtenerUsuarioPorId = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerUsuarioPorId");
        this.obtenerClaveUsuario = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerClaveUsuario");
        this.ingresarUsuario = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarUsuario");
        this.actualizarUsuario = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarUsuario");
        this.actualizarClaveUsuario = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarClaveUsuario");
        this.obtenerUsuarios = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerUsuarios").
                returningResultSet("usuarios", BeanPropertyRowMapper.newInstance(Usuario.class));

        this.ingresarPrivilegioUsuario = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarPrivilegioUsuario");
        this.eliminarPrivilegioUsuario = new SimpleJdbcCall(jdbcTemplate).withProcedureName("EliminarPrivilegioUsuario");
        this.obtenerPrivilegiosUsuario = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerPrivilegiosUsuario").
                returningResultSet("privilegiosUsuario", BeanPropertyRowMapper.newInstance(Privilegio.class));

        this.obtenerPrivilegios = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerPrivilegios").
                returningResultSet("privilegios", BeanPropertyRowMapper.newInstance(Privilegio.class));
        this.obtenerPrivilegio = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerPrivilegio");
        this.obtenerPrivilegioPorCodigo = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerPrivilegioPorCodigo");
        this.ingresarPrivilegio = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarPrivilegio");
        this.eliminarPrivilegio = new SimpleJdbcCall(jdbcTemplate).withProcedureName("EliminarPrivilegio");
        this.actualizarPrivilegio = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarPrivilegio");

        this.ingresarOpcionMenuPrivilegio = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarOpcionMenuPrivilegio");
        this.eliminarOpcionMenuPrivilegio = new SimpleJdbcCall(jdbcTemplate).withProcedureName("EliminarOpcionMenuPrivilegio");
        this.obtenerOpcionesMenuPrivilegio = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerOpcionesMenuPrivilegio").
                returningResultSet("opcionesMenu", BeanPropertyRowMapper.newInstance(OpcionMenu.class));

        this.obtenerOpcionesMenuUsuario = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerOpcionesMenuUsuario").
                returningResultSet("opcionesMenu", BeanPropertyRowMapper.newInstance(OpcionMenu.class));
    }

    @Override
    public Usuario obtenerUsuario(String nombreUsuario) {
        Usuario usuario = null;
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varNombreUsuario", nombreUsuario);

        Map resultado = obtenerUsuario.execute(parametros);
        if (resultado.get("varIdUsuario") != null) {
            usuario = new Usuario();
            usuario.setNombreUsuario(nombreUsuario);
            usuario.setNombres((String) resultado.get("varNombres"));
            usuario.setApellidos((String) resultado.get("varApellidos"));
            usuario.setClave((String) resultado.get("varClave"));
            usuario.setCorreoElectronico((String) resultado.get("varCorreoElectronico"));
            usuario.setIdUsuario(Integer.parseInt(resultado.get("varIdUsuario").toString()));

            MapSqlParameterSource parametrosPrivilegios = new MapSqlParameterSource();
            parametrosPrivilegios.addValue("varIdUsuario", usuario.getIdUsuario());
            Map resultadoPrivilegios = obtenerPrivilegiosUsuario.execute(parametrosPrivilegios);
            ArrayList<Privilegio> privilegios = (ArrayList<Privilegio>) resultadoPrivilegios.get("privilegiosUsuario");
            usuario.setPrivilegios(privilegios);

            MapSqlParameterSource parametrosOpcionesMenu = new MapSqlParameterSource();
            parametrosOpcionesMenu.addValue("varIdUsuario", usuario.getIdUsuario());
            Map resultadoOpcionesMenu = obtenerOpcionesMenuUsuario.execute(parametrosOpcionesMenu);
            ArrayList<OpcionMenu> opcionesMenu = (ArrayList<OpcionMenu>) resultadoOpcionesMenu.get("opcionesMenu");
            usuario.setOpcionesMenu(opcionesMenu);
        }

        return usuario;
    }

    @Override
    public Usuario obtenerUsuario(long idUsuario) {
        Usuario usuario = null;
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdUsuario", idUsuario);

        Map resultado = obtenerUsuarioPorId.execute(parametros);
        if (resultado.get("varNombreUsuario") != null) {
            usuario = new Usuario();
            usuario.setNombres((String) resultado.get("varNombres"));
            usuario.setApellidos((String) resultado.get("varApellidos"));
            usuario.setClave((String) resultado.get("varClave"));
            usuario.setCorreoElectronico((String) resultado.get("varCorreoElectronico"));
            usuario.setIdUsuario(idUsuario);
            usuario.setNombreUsuario(resultado.get("varNombreUsuario").toString());

            MapSqlParameterSource parametrosPrivilegios = new MapSqlParameterSource();
            parametrosPrivilegios.addValue("varIdUsuario", usuario.getIdUsuario());
            Map resultadoPrivilegios = obtenerPrivilegiosUsuario.execute(parametrosPrivilegios);
            ArrayList<Privilegio> privilegios = (ArrayList<Privilegio>) resultadoPrivilegios.get("privilegiosUsuario");
            usuario.setPrivilegios(privilegios);
        }

        return usuario;
    }

    @Override
    public void crearUsuario(Usuario usuario) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varNombreUsuario", usuario.getNombreUsuario());
        parametros.addValue("varClave", usuario.getClave());
        parametros.addValue("varNombres", usuario.getNombres());
        parametros.addValue("varApellidos", usuario.getApellidos());
        parametros.addValue("varCorreoElectronico", usuario.getCorreoElectronico());
        Map resultado = ingresarUsuario.execute(parametros);
        long idUsuario = (long) resultado.get("varIdUsuario");

        MapSqlParameterSource parametrosIngresoPrivilegio = new MapSqlParameterSource();
        parametrosIngresoPrivilegio.addValue("varIdUsuario", idUsuario);
        for (Privilegio privilegio : usuario.getPrivilegios()) {
            parametrosIngresoPrivilegio.addValue("varIdPrivilegio", privilegio.getIdPrivilegio());
            ingresarPrivilegioUsuario.execute(parametrosIngresoPrivilegio);
        }
    }

    @Override
    public void actualizarUsuario(Usuario usuario) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varNombreUsuario", usuario.getNombreUsuario());
        parametros.addValue("varIdUsuario", usuario.getIdUsuario());
        parametros.addValue("varNombres", usuario.getNombres());
        parametros.addValue("varApellidos", usuario.getApellidos());
        parametros.addValue("varCorreoElectronico", usuario.getCorreoElectronico());
        actualizarUsuario.execute(parametros);
    }

    @Override
    public void actualizarClaveUsuario(long idUsuario, String clave) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdUsuario", idUsuario);
        parametros.addValue("varClave", clave);
        actualizarClaveUsuario.execute(parametros);
    }

    @Override
    public ArrayList<Usuario> obtenerUsuarios() {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        Map resultado = obtenerUsuarios.execute(parametros);
        ArrayList<Usuario> usuarios = (ArrayList<Usuario>) resultado.get("usuarios");

        return usuarios;
    }

    @Override
    public ArrayList<Privilegio> obtenerPrivilegios() {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        Map resultado = obtenerPrivilegios.execute(parametros);
        ArrayList<Privilegio> privilegios = (ArrayList<Privilegio>) resultado.get("privilegios");

        return privilegios;
    }

    @Override
    public void actualizarPrivilegiosUsuario(long idUsuario, ArrayList<Privilegio> privilegios) {
        MapSqlParameterSource parametrosConsultaPrivilegios = new MapSqlParameterSource();
        parametrosConsultaPrivilegios.addValue("varIdUsuario", idUsuario);
        Map resultadoPrivilegios = obtenerPrivilegiosUsuario.execute(parametrosConsultaPrivilegios);
        ArrayList<Privilegio> privilegiosActuales = (ArrayList<Privilegio>) resultadoPrivilegios.get("privilegiosUsuario");

        MapSqlParameterSource parametrosEliminacionPrivilegio = new MapSqlParameterSource();
        parametrosEliminacionPrivilegio.addValue("varIdUsuario", idUsuario);
        for (Privilegio privilegioActual : privilegiosActuales) {
            boolean privilegioExiste = false;
            for (Privilegio privilegio : privilegios) {
                if (privilegio.getIdPrivilegio() == privilegioActual.getIdPrivilegio()) {
                    privilegioExiste = true;
                    break;
                }
            }
            if (!privilegioExiste) {
                parametrosEliminacionPrivilegio.addValue("varIdPrivilegio", privilegioActual.getIdPrivilegio());
                eliminarPrivilegioUsuario.execute(parametrosEliminacionPrivilegio);
            }
        }

        MapSqlParameterSource parametrosIngresoPrivilegio = new MapSqlParameterSource();
        parametrosIngresoPrivilegio.addValue("varIdUsuario", idUsuario);
        for (Privilegio privilegio : privilegios) {
            boolean privilegioExiste = false;
            for (Privilegio privilegioActual : privilegiosActuales) {
                if (privilegio.getIdPrivilegio() == privilegioActual.getIdPrivilegio()) {
                    privilegioExiste = true;
                    break;
                }
            }
            if (!privilegioExiste) {
                parametrosIngresoPrivilegio.addValue("varIdPrivilegio", privilegio.getIdPrivilegio());
                ingresarPrivilegioUsuario.execute(parametrosIngresoPrivilegio);
            }
        }
    }

    @Override
    public String obtenerClaveUsuario(long idUsuario) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdUsuario", idUsuario);
        Map resultado = obtenerClaveUsuario.execute(parametros);
        String clave = (String) resultado.get("varClave");

        return clave;
    }

    @Override
    public ArrayList<Privilegio> obtenerPrivilegiosUsuario(long idUsuario) {
        MapSqlParameterSource parametrosPrivilegios = new MapSqlParameterSource();
        parametrosPrivilegios.addValue("varIdUsuario", idUsuario);
        Map resultadoPrivilegios = obtenerPrivilegiosUsuario.execute(parametrosPrivilegios);
        ArrayList<Privilegio> privilegios = (ArrayList<Privilegio>) resultadoPrivilegios.get("privilegiosUsuario");

        return privilegios;
    }

    @Override
    public void crearPrivilegio(Privilegio privilegio) {
        if (privilegio.getIdPrivilegio() == 0) {
            MapSqlParameterSource parametrosIngresoPrivilegio = new MapSqlParameterSource();
            parametrosIngresoPrivilegio.addValue("varCodigo", privilegio.getCodigo());
            parametrosIngresoPrivilegio.addValue("varNombre", privilegio.getNombre());
            Map resultado = ingresarPrivilegio.execute(parametrosIngresoPrivilegio);
            privilegio.setIdPrivilegio((int) resultado.get("varIdPrivilegio"));
        } else {
            MapSqlParameterSource parametrosActualizacionPrivilegio = new MapSqlParameterSource();
            parametrosActualizacionPrivilegio.addValue("varIdPrivilegio", privilegio.getIdPrivilegio());
            parametrosActualizacionPrivilegio.addValue("varCodigo", privilegio.getCodigo());
            parametrosActualizacionPrivilegio.addValue("varNombre", privilegio.getNombre());
            actualizarPrivilegio.execute(parametrosActualizacionPrivilegio);
        }

        actualizarOpcionesMenuPrivilegio(privilegio.getIdPrivilegio(), privilegio.getOpcionesMenu());
    }

    @Override
    public Privilegio obtenerPrivilegio(int idPrivilegio) {
        Privilegio privilegio = null;
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdPrivilegio", idPrivilegio);

        Map resultado = obtenerPrivilegio.execute(parametros);
        if (resultado.get("varCodigo") != null) {
            privilegio = new Privilegio();
            privilegio.setIdPrivilegio(idPrivilegio);
            privilegio.setNombre((String) resultado.get("varNombre"));
            privilegio.setCodigo((String) resultado.get("varCodigo"));

            MapSqlParameterSource parametrosConsultaOpcionesMenu = new MapSqlParameterSource();
            parametrosConsultaOpcionesMenu.addValue("varIdPrivilegio", idPrivilegio);
            Map resultadoOpcionesMenu = obtenerOpcionesMenuPrivilegio.execute(parametrosConsultaOpcionesMenu);
            ArrayList<OpcionMenu> opcionesMenu = (ArrayList<OpcionMenu>) resultadoOpcionesMenu.get("opcionesMenu");
            privilegio.setOpcionesMenu(opcionesMenu);
        }

        return privilegio;
    }

    @Override
    public boolean existePrivilegio(String codigo) {
        boolean existe = false;
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varCodigo", codigo);

        Map resultado = obtenerPrivilegioPorCodigo.execute(parametros);
        if (resultado.get("varIdPrivilegio") != null) {
            existe = true;
        }

        return existe;
    }

    @Override
    public void eliminarPrivilegio(int idPrivilegio) {
        MapSqlParameterSource parametrosEliminacionPrivilegio = new MapSqlParameterSource();
        parametrosEliminacionPrivilegio.addValue("varIdPrivilegio", idPrivilegio);
        eliminarPrivilegio.execute(parametrosEliminacionPrivilegio);
    }

    private void actualizarOpcionesMenuPrivilegio(long idPrivilegio, ArrayList<OpcionMenu> opcionesMenu) {
        MapSqlParameterSource parametrosConsultaOpcionesMenu = new MapSqlParameterSource();
        parametrosConsultaOpcionesMenu.addValue("varIdPrivilegio", idPrivilegio);
        Map resultadoOpcionesMenu = obtenerOpcionesMenuPrivilegio.execute(parametrosConsultaOpcionesMenu);
        ArrayList<OpcionMenu> opcionesMenuActuales = (ArrayList<OpcionMenu>) resultadoOpcionesMenu.get("opcionesMenu");

        MapSqlParameterSource parametrosEliminacionOpcionMenu = new MapSqlParameterSource();
        parametrosEliminacionOpcionMenu.addValue("varIdPrivilegio", idPrivilegio);
        for (OpcionMenu opcionMenuActual : opcionesMenuActuales) {
            boolean opcionMenuExiste = false;
            for (OpcionMenu opcionMenu : opcionesMenu) {
                if (opcionMenu.getIdOpcionMenu() == opcionMenuActual.getIdOpcionMenu()) {
                    opcionMenuExiste = true;
                    break;
                }
            }
            if (!opcionMenuExiste) {
                parametrosEliminacionOpcionMenu.addValue("varIdOpcionMenu", opcionMenuActual.getIdOpcionMenu());
                eliminarOpcionMenuPrivilegio.execute(parametrosEliminacionOpcionMenu);
            }
        }

        MapSqlParameterSource parametrosIngresoOpcionMenu = new MapSqlParameterSource();
        parametrosIngresoOpcionMenu.addValue("varIdPrivilegio", idPrivilegio);
        for (OpcionMenu opcionMenu : opcionesMenu) {
            boolean opcionMenuExiste = false;
            for (OpcionMenu opcionMenuActual : opcionesMenuActuales) {
                if (opcionMenu.getIdOpcionMenu() == opcionMenuActual.getIdOpcionMenu()) {
                    opcionMenuExiste = true;
                    break;
                }
            }
            if (!opcionMenuExiste) {
                parametrosIngresoOpcionMenu.addValue("varIdOpcionMenu", opcionMenu.getIdOpcionMenu());
                ingresarOpcionMenuPrivilegio.execute(parametrosIngresoOpcionMenu);
            }
        }
    }
}
