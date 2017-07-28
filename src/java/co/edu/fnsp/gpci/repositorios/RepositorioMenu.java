/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.repositorios;

import co.edu.fnsp.gpci.entidades.OpcionMenu;
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
@Repository("repositorioMenu")
public class RepositorioMenu implements IRepositorioMenu {
    private SimpleJdbcCall obtenerOpcionesMenu;
    private SimpleJdbcCall obtenerOpcionesMenuUsuario;
    private SimpleJdbcCall obtenerOpcionesMenuPrivilegio;
    private SimpleJdbcCall ingresarOpcionMenuPrivilegio;
    private SimpleJdbcCall eliminarOpcionMenuPrivilegio;
    
    @Autowired
    public void setDataSource(DataSource dataSource) {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        jdbcTemplate.setResultsMapCaseInsensitive(true);

        this.obtenerOpcionesMenuUsuario = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerOpcionesMenuUsuario").
                returningResultSet("opcionesMenu", BeanPropertyRowMapper.newInstance(OpcionMenu.class));
        this.ingresarOpcionMenuPrivilegio = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarOpcionMenuPrivilegio");
        this.eliminarOpcionMenuPrivilegio = new SimpleJdbcCall(jdbcTemplate).withProcedureName("EliminarOpcionMenuPrivilegio");
        this.obtenerOpcionesMenu = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerOpcionesMenuConUrl").
                returningResultSet("opcionesMenu", BeanPropertyRowMapper.newInstance(OpcionMenu.class));        
        this.obtenerOpcionesMenuPrivilegio = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerOpcionesMenuPrivilegio").
                returningResultSet("opcionesMenu", BeanPropertyRowMapper.newInstance(OpcionMenu.class));        
    }
    
   @Override
   public ArrayList<OpcionMenu> obtenerOpcionesMenuUsuario(long idUsuario) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdUsuario", idUsuario);
        Map resultado = obtenerOpcionesMenuUsuario.execute(parametros);
        ArrayList<OpcionMenu> opcionesMenu = (ArrayList<OpcionMenu>) resultado.get("opcionesMenu");

        return opcionesMenu;
   }

   @Override
   public ArrayList<OpcionMenu> obtenerOpcionesMenu() {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        Map resultado = obtenerOpcionesMenu.execute(parametros);
        ArrayList<OpcionMenu> opcionesMenu = (ArrayList<OpcionMenu>) resultado.get("opcionesMenu");

        return opcionesMenu;
   }   

   @Override
   public ArrayList<OpcionMenu> obtenerOpcionesMenuPrivilegio(int idPrivilegio) {
        MapSqlParameterSource parametrosConsultaOpcionesMenu = new MapSqlParameterSource();
        parametrosConsultaOpcionesMenu.addValue("varIdPrivilegio", idPrivilegio);
        Map resultadoOpcionesMenu= obtenerOpcionesMenuPrivilegio.execute(parametrosConsultaOpcionesMenu);
        ArrayList<OpcionMenu> opcionesMenu = (ArrayList<OpcionMenu>) resultadoOpcionesMenu.get("opcionesMenu");

        return opcionesMenu;
   }
   
   @Override
    public void actualizarOpcionesMenuPrivilegio(long idPrivilegio, ArrayList<OpcionMenu> opcionesMenu) {
        MapSqlParameterSource parametrosConsultaOpcionesMenu = new MapSqlParameterSource();
        parametrosConsultaOpcionesMenu.addValue("varIdPrivilegio", idPrivilegio);
        Map resultadoOpcionesMenu= obtenerOpcionesMenuPrivilegio.execute(parametrosConsultaOpcionesMenu);
        ArrayList<OpcionMenu> opcionesMenuActuales = (ArrayList<OpcionMenu>) resultadoOpcionesMenu.get("opcionesMenu");

        MapSqlParameterSource parametrosEliminacionOpcionMenu = new MapSqlParameterSource();
        parametrosEliminacionOpcionMenu.addValue("varIdPrivilegio", idPrivilegio);
        for (OpcionMenu opcionMenuActual : opcionesMenuActuales) {
            boolean opcionMenuExiste = false;
            for (OpcionMenu opcionMenu : opcionesMenu) {
                if (opcionMenu.getIdOpcionMenu()== opcionMenuActual.getIdOpcionMenu()) {
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
