/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.repositorios;

import co.edu.fnsp.gpci.entidades.ItemMenu;
import co.edu.fnsp.gpci.entidades.ObjetivoEspecifico;
import co.edu.fnsp.gpci.entidades.Privilegio;
import co.edu.fnsp.gpci.entidades.Usuario;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Service;

/**
 *
 * @author William
 */
@Service("repositorioSeguridad")
public class RepositorioSeguridad implements IRepositorioSeguridad {

    private SimpleJdbcCall obtenerUsuario;
    private SimpleJdbcCall ingresarUsuario;
    private SimpleJdbcCall obtenerPrivilegiosUsuario;
    
    @Autowired
    public void setDataSource(DataSource dataSource) {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        jdbcTemplate.setResultsMapCaseInsensitive(true);
        this.obtenerUsuario = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerUsuario");
        this.ingresarUsuario = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarUsuario");
        this.obtenerPrivilegiosUsuario = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerPrivilegiosUsuario").
        returningResultSet("privilegios", BeanPropertyRowMapper.newInstance(Privilegio.class));
    }

    @Override
    public Usuario obtenerUsuario(String nombreUsuario) {
        Usuario usuario = null;
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varNombreUsuario", nombreUsuario);

        Map resultado = obtenerUsuario.execute(parametros);
        if (resultado.get("varIdUsuario") != null) {
            usuario = new Usuario();
            usuario.setNombres((String) resultado.get("varNombres"));
            usuario.setApellidos((String) resultado.get("varApellidos"));
            usuario.setClave((String) resultado.get("varClave"));
            usuario.setCorreoElectronico((String) resultado.get("varCorreoElectronico"));
            usuario.setIdUsuario(Integer.parseInt(resultado.get("varIdUsuario").toString()));
            
            MapSqlParameterSource parametrosPrivilegios = new MapSqlParameterSource();
            parametrosPrivilegios.addValue("varIdUsuario", usuario.getIdUsuario());
            Map resultadoPrivilegios = obtenerPrivilegiosUsuario.execute(parametrosPrivilegios);
            ArrayList<Privilegio> privilegios = (ArrayList<Privilegio>) resultadoPrivilegios.get("privilegios");
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
        ingresarUsuario.execute(parametros);
    }

}
