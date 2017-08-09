/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.repositorios;

import co.edu.fnsp.gpci.entidades.AlertaAvalProyecto;
import co.edu.fnsp.gpci.entidades.AreaTematica;
import co.edu.fnsp.gpci.entidades.CompromisoProyecto;
import co.edu.fnsp.gpci.entidades.EntidadInternacionalProyecto;
import co.edu.fnsp.gpci.entidades.GrupoInvestigacion;
import co.edu.fnsp.gpci.entidades.ObjetivoEspecifico;
import co.edu.fnsp.gpci.entidades.PersonalExterno;
import co.edu.fnsp.gpci.entidades.Profesor;
import co.edu.fnsp.gpci.entidades.Proyecto;
import co.edu.fnsp.gpci.entidades.ReporteProyecto;
import co.edu.fnsp.gpci.entidades.TipoProyecto;
import co.edu.fnsp.gpci.entidades.Estudiante;
import co.edu.fnsp.gpci.entidades.EstudianteProyecto;
import co.edu.fnsp.gpci.entidades.FuenteFinanciacionProyecto;
import co.edu.fnsp.gpci.entidades.PersonalExternoProyecto;
import co.edu.fnsp.gpci.entidades.ProfesorProyecto;
import co.edu.fnsp.gpci.entidades.ReporteIntegranteProyecto;
import java.util.ArrayList;
import java.util.Date;
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
@Repository("repositorioReporte")
public class RepositorioReporte implements IRepositorioReporte {

    private SimpleJdbcCall obtenerIntegrantesProyectos;
    @Autowired
    public void setDataSource(DataSource dataSource) {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        jdbcTemplate.setResultsMapCaseInsensitive(true);

        this.obtenerIntegrantesProyectos = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerIntegrantesProyectos").returningResultSet("proyectos", BeanPropertyRowMapper.newInstance(ReporteIntegranteProyecto.class));

    }

    @Override
    public ArrayList<ReporteIntegranteProyecto> obtenerIntegrantesProyectos() {
        MapSqlParameterSource parametros = new MapSqlParameterSource();

        Map resultado = obtenerIntegrantesProyectos.execute(parametros);
        ArrayList<ReporteIntegranteProyecto> proyectos = (ArrayList<ReporteIntegranteProyecto>) resultado.get("proyectos");

        return proyectos;
    }
 }
