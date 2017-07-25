/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.repositorios;

import co.edu.fnsp.gpci.entidades.Privilegio;
import co.edu.fnsp.gpci.entidades.TipoPrivilegio;
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

    private SimpleJdbcCall obtenerPrivilegios;
    private SimpleJdbcCall obtenerPrivilegiosUsuario;
    private SimpleJdbcCall ingresarPrivilegioUsuario;
    private SimpleJdbcCall eliminarPrivilegioUsuario;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        jdbcTemplate.setResultsMapCaseInsensitive(true);
        this.obtenerUsuario = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerUsuario");
        this.obtenerUsuarioPorId = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerUsuarioPorId");
        this.obtenerClaveUsuario = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerClaveUsuario");
        this.ingresarUsuario = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarUsuario");
        this.actualizarUsuario = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarUsuario");
        this.obtenerUsuarios = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerUsuarios").
                returningResultSet("usuarios", BeanPropertyRowMapper.newInstance(Usuario.class));

        this.ingresarPrivilegioUsuario = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarPrivilegioUsuario");
        this.eliminarPrivilegioUsuario = new SimpleJdbcCall(jdbcTemplate).withProcedureName("EliminarPrivilegioUsuario");
        this.obtenerPrivilegios = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerPrivilegios").
                returningResultSet("privilegios", BeanPropertyRowMapper.newInstance(Privilegio.class));
        this.obtenerPrivilegiosUsuario = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerPrivilegiosUsuario").
                returningResultSet("privilegiosUsuario", BeanPropertyRowMapper.newInstance(Privilegio.class));
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
        
        if(usuario.getPrivilegios() == null || usuario.getPrivilegios().isEmpty()) {
            Privilegio privilegio = new Privilegio();
            privilegio.setIdPrivilegio(TipoPrivilegio.USUARIOS_CI.getIdPrivilegio());
            usuario.setPrivilegios(new ArrayList<>());
            usuario.getPrivilegios().add(privilegio);
        }
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

}
