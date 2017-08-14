/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.repositorios;

import co.edu.fnsp.gpci.entidades.ReporteFuenteFinanciacionProyecto;
import co.edu.fnsp.gpci.entidades.ReporteIntegranteProyecto;
import co.edu.fnsp.gpci.entidades.ReporteProfesorProyecto;
import co.edu.fnsp.gpci.entidades.ReporteProyectoInscrito;
import co.edu.fnsp.gpci.entidades.ReporteProyectoPorGrupoInvestigacion;
import co.edu.fnsp.gpci.utilidades.Util;
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
@Repository("repositorioReporte")
public class RepositorioReporte implements IRepositorioReporte {

    private SimpleJdbcCall obtenerIntegrantesProyectos;
    private SimpleJdbcCall obtenerProyectosPorGrupoInvestigacion;
    private SimpleJdbcCall obtenerFuentesFinanciacionProyectos;
    private SimpleJdbcCall obtenerProyectosEjecucionAtrasadosProfesor;
    private SimpleJdbcCall obtenerProyectosProfesor;
    private SimpleJdbcCall obtenerProyectosInscritos;
    
    @Autowired
    public void setDataSource(DataSource dataSource) {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        jdbcTemplate.setResultsMapCaseInsensitive(true);

        this.obtenerIntegrantesProyectos = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerIntegrantesProyectos").returningResultSet("proyectos", BeanPropertyRowMapper.newInstance(ReporteIntegranteProyecto.class));
        this.obtenerProyectosPorGrupoInvestigacion = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerProyectosPorGrupoInvestigacion").returningResultSet("proyectos", BeanPropertyRowMapper.newInstance(ReporteProyectoPorGrupoInvestigacion.class));
        this.obtenerFuentesFinanciacionProyectos = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerFuentesFinanciacionProyectos").returningResultSet("proyectos", BeanPropertyRowMapper.newInstance(ReporteFuenteFinanciacionProyecto.class));
        this.obtenerProyectosEjecucionAtrasadosProfesor = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerProyectosEjecucionAtrasadosProfesor").returningResultSet("proyectos", BeanPropertyRowMapper.newInstance(ReporteProfesorProyecto.class));
        this.obtenerProyectosProfesor = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerProyectosProfesor").returningResultSet("proyectos", BeanPropertyRowMapper.newInstance(ReporteProfesorProyecto.class));
        this.obtenerProyectosInscritos = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerProyectosInscritos").returningResultSet("proyectos", BeanPropertyRowMapper.newInstance(ReporteProyectoInscrito.class));
    }

    @Override
    public ArrayList<ReporteIntegranteProyecto> obtenerIntegrantesProyectos() {
        MapSqlParameterSource parametros = new MapSqlParameterSource();

        Map resultado = obtenerIntegrantesProyectos.execute(parametros);
        ArrayList<ReporteIntegranteProyecto> proyectos = (ArrayList<ReporteIntegranteProyecto>) resultado.get("proyectos");

        return proyectos;
    }

    @Override
    public ArrayList<ReporteProyectoPorGrupoInvestigacion> obtenerProyectosPorGrupoInvestigacion() {
        MapSqlParameterSource parametros = new MapSqlParameterSource();

        Map resultado = obtenerProyectosPorGrupoInvestigacion.execute(parametros);
        ArrayList<ReporteProyectoPorGrupoInvestigacion> proyectos = (ArrayList<ReporteProyectoPorGrupoInvestigacion>) resultado.get("proyectos");

        return proyectos;    
    }

    @Override
    public ArrayList<ReporteFuenteFinanciacionProyecto> obtenerFuentesFinanciacionProyectos() {
        MapSqlParameterSource parametros = new MapSqlParameterSource();

        Map resultado = obtenerFuentesFinanciacionProyectos.execute(parametros);
        ArrayList<ReporteFuenteFinanciacionProyecto> proyectos = (ArrayList<ReporteFuenteFinanciacionProyecto>) resultado.get("proyectos");

        for(ReporteFuenteFinanciacionProyecto proyecto : proyectos) {
            proyecto.setMontoFormateado(Util.obtenerNumeroFormatoMoneda(proyecto.getMonto()));
            proyecto.setMontoTotalFormateado(Util.obtenerNumeroFormatoMoneda(proyecto.getMontoTotal()));
        }
        
        return proyectos;    
    }

    @Override
    public ArrayList<ReporteProfesorProyecto> obtenerProyectosEjecucionAtrasadosProfesor(long numeroIdentificacion) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varNumeroIdentificacion", numeroIdentificacion);

        Map resultado = obtenerProyectosEjecucionAtrasadosProfesor.execute(parametros);
        ArrayList<ReporteProfesorProyecto> proyectos = (ArrayList<ReporteProfesorProyecto>) resultado.get("proyectos");

        for(ReporteProfesorProyecto proyecto : proyectos) {
            proyecto.setFechaInicioFormateada(Util.obtenerFechaFormateada(proyecto.getFechaInicio()));
            proyecto.setFechaFinalizacionFormateada(Util.obtenerFechaFormateada(proyecto.getFechaFinalizacion()));
        }
        
        return proyectos;    
    }

    @Override
    public ArrayList<ReporteProfesorProyecto> obtenerProyectosProfesor(long numeroIdentificacion) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varNumeroIdentificacion", numeroIdentificacion);

        Map resultado = obtenerProyectosProfesor.execute(parametros);
        ArrayList<ReporteProfesorProyecto> proyectos = (ArrayList<ReporteProfesorProyecto>) resultado.get("proyectos");

        for(ReporteProfesorProyecto proyecto : proyectos) {
            proyecto.setFechaInicioFormateada(Util.obtenerFechaFormateada(proyecto.getFechaInicio()));
            proyecto.setFechaFinalizacionFormateada(Util.obtenerFechaFormateada(proyecto.getFechaFinalizacion()));
        }
        
        return proyectos;    
    }
    
    @Override
    public ArrayList<ReporteProyectoInscrito> obtenerProyectosInscritos() {
        MapSqlParameterSource parametros = new MapSqlParameterSource();

        Map resultado = obtenerProyectosInscritos.execute(parametros);
        ArrayList<ReporteProyectoInscrito> proyectos = (ArrayList<ReporteProyectoInscrito>) resultado.get("proyectos");

        return proyectos;    
    }

 }
