/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.repositorios;

import co.edu.fnsp.gpci.entidades.AreaTematica;
import co.edu.fnsp.gpci.entidades.Convocatoria;
import co.edu.fnsp.gpci.entidades.EnfoqueMetodologico;
import co.edu.fnsp.gpci.entidades.EstadoProyecto;
import co.edu.fnsp.gpci.entidades.Facultad;
import co.edu.fnsp.gpci.entidades.FuenteFinanciacion;
import co.edu.fnsp.gpci.entidades.GrupoInvestigacion;
import co.edu.fnsp.gpci.entidades.Programa;
import co.edu.fnsp.gpci.entidades.RiesgoEtico;
import co.edu.fnsp.gpci.entidades.Rol;
import co.edu.fnsp.gpci.entidades.TipoActa;
import co.edu.fnsp.gpci.entidades.TipoAval;
import co.edu.fnsp.gpci.entidades.TipoCompromiso;
import co.edu.fnsp.gpci.entidades.TipoContrato;
import co.edu.fnsp.gpci.entidades.TipoEstudiante;
import co.edu.fnsp.gpci.entidades.TipoFuenteFinanciacionProyecto;
import co.edu.fnsp.gpci.entidades.TipoIdentificacion;
import co.edu.fnsp.gpci.entidades.TipoPersona;
import co.edu.fnsp.gpci.entidades.TipoProyecto;
import co.edu.fnsp.gpci.entidades.TipoVinculacion;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
@Repository("repositorioMaestro")
public class RepositorioMaestro implements IRepositorioMaestro {

    private SimpleJdbcCall obtenerAreasTematicas;
    private SimpleJdbcCall ingresarAreaTematica;
    private SimpleJdbcCall obtenerTiposProyecto;
    private SimpleJdbcCall obtenerGruposInvestigacion;
    private SimpleJdbcCall obtenerRiesgosEticos;
    private SimpleJdbcCall obtenerTiposContrato;
    private SimpleJdbcCall obtenerEnfoquesMetodologicos;
    private SimpleJdbcCall obtenerConvocatorias;
    private SimpleJdbcCall ingresarConvocatoria;
    private SimpleJdbcCall obtenerEstadosProyecto;
    private SimpleJdbcCall obtenerTiposIdentificacion;
    private SimpleJdbcCall obtenerRoles;
    private SimpleJdbcCall obtenerFacultades;
    private SimpleJdbcCall obtenerTiposEstudiante;
    private SimpleJdbcCall obtenerTiposActa;
    private SimpleJdbcCall obtenerProgramas;
    private SimpleJdbcCall obtenerFuentesFinanciacion;
    private SimpleJdbcCall obtenerTiposFuentesFinanciacionProyecto;
    private SimpleJdbcCall obtenerTiposPersona;
    private SimpleJdbcCall obtenerTiposCompromiso;
    private SimpleJdbcCall obtenerTiposAval;
    private SimpleJdbcCall obtenerTiposVinculacion;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        jdbcTemplate.setResultsMapCaseInsensitive(true);

        this.ingresarAreaTematica = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarAreaTematica");
        this.obtenerAreasTematicas = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerAreasTematicas").
                returningResultSet("areasTematicas", BeanPropertyRowMapper.newInstance(AreaTematica.class));
        this.obtenerTiposProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerTiposProyecto").
                returningResultSet("tiposProyecto", BeanPropertyRowMapper.newInstance(TipoProyecto.class));
        this.obtenerGruposInvestigacion = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerGruposInvestigacion").
                returningResultSet("gruposInvestigacion", BeanPropertyRowMapper.newInstance(GrupoInvestigacion.class));
        this.obtenerRiesgosEticos = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerRiesgosEticos").
                returningResultSet("riesgosEticos", BeanPropertyRowMapper.newInstance(RiesgoEtico.class));
        this.obtenerTiposContrato = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerTiposContrato").
                returningResultSet("tiposContrato", BeanPropertyRowMapper.newInstance(TipoContrato.class));
        this.obtenerEnfoquesMetodologicos = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerEnfoquesMetodologicos").
                returningResultSet("enfoquesMetodologicos", BeanPropertyRowMapper.newInstance(EnfoqueMetodologico.class));
        this.ingresarConvocatoria = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarConvocatoria");
        this.obtenerConvocatorias = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerConvocatorias").
                returningResultSet("convocatorias", BeanPropertyRowMapper.newInstance(Convocatoria.class));
        this.obtenerEstadosProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerEstadosProyecto").
                returningResultSet("estadosProyecto", BeanPropertyRowMapper.newInstance(EstadoProyecto.class));
        this.obtenerTiposIdentificacion = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerTiposIdentificacion").
                returningResultSet("tiposIdentificacion", BeanPropertyRowMapper.newInstance(TipoIdentificacion.class));
        this.obtenerRoles = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerRoles").
                returningResultSet("roles", BeanPropertyRowMapper.newInstance(Rol.class));
        this.obtenerFacultades = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerFacultades").
                returningResultSet("facultades", BeanPropertyRowMapper.newInstance(Facultad.class));
        this.obtenerTiposEstudiante = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerTiposEstudiante").
                returningResultSet("tiposEstudiante", BeanPropertyRowMapper.newInstance(TipoEstudiante.class));
        this.obtenerProgramas = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerProgramas").
                returningResultSet("programas", BeanPropertyRowMapper.newInstance(Programa.class));
        this.obtenerTiposActa = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerTiposActa").
                returningResultSet("tiposActa", BeanPropertyRowMapper.newInstance(TipoActa.class));
        this.obtenerFuentesFinanciacion = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerFuentesFinanciacion").
                returningResultSet("fuentesFinanciacion", BeanPropertyRowMapper.newInstance(FuenteFinanciacion.class));
        this.obtenerTiposFuentesFinanciacionProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerTiposFuentesFinanciacionProyecto").
                returningResultSet("tiposFuenteFinanciacionProyecto", BeanPropertyRowMapper.newInstance(TipoFuenteFinanciacionProyecto.class));
        this.obtenerTiposPersona = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerTiposPersona").
                returningResultSet("tiposPersona", BeanPropertyRowMapper.newInstance(TipoPersona.class));
        this.obtenerTiposCompromiso = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerTiposCompromiso").
                returningResultSet("tiposCompromiso", BeanPropertyRowMapper.newInstance(TipoCompromiso.class));
        this.obtenerTiposAval = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerTiposAval").
                returningResultSet("tiposAval", BeanPropertyRowMapper.newInstance(TipoAval.class));
        this.obtenerTiposVinculacion = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerTiposVinculacion").
                returningResultSet("tiposVinculacion", BeanPropertyRowMapper.newInstance(TipoVinculacion.class));
    }

    @Override
    public List<AreaTematica> obtenerAreasTematicas() {
        Map resultado = obtenerAreasTematicas.execute(new HashMap<>());
        List<AreaTematica> areasTematicas = (ArrayList<AreaTematica>) resultado.get("areasTematicas");

        return areasTematicas;
    }

    @Override
    public List<TipoProyecto> obtenerTiposProyecto() {
        Map resultado = obtenerTiposProyecto.execute(new HashMap<>());
        List<TipoProyecto> tiposProyecto = (ArrayList<TipoProyecto>) resultado.get("tiposProyecto");

        return tiposProyecto;
    }

    @Override
    public List<GrupoInvestigacion> obtenerGruposInvestigacion() {
        Map resultado = obtenerGruposInvestigacion.execute(new HashMap<>());
        List<GrupoInvestigacion> gruposInvestigacion = (ArrayList<GrupoInvestigacion>) resultado.get("gruposInvestigacion");

        return gruposInvestigacion;
    }

    @Override
    public List<RiesgoEtico> obtenerRiesgosEtico() {
        Map resultado = obtenerRiesgosEticos.execute(new HashMap<>());
        List<RiesgoEtico> riesgosEtico = (ArrayList<RiesgoEtico>) resultado.get("riesgosEticos");

        return riesgosEtico;
    }

    @Override
    public List<TipoContrato> obtenerTiposContrato() {
        Map resultado = obtenerTiposContrato.execute(new HashMap<>());
        List<TipoContrato> tiposContrato = (ArrayList<TipoContrato>) resultado.get("tiposContrato");

        return tiposContrato;
    }

    @Override
    public List<EnfoqueMetodologico> obtenerEnfoquesMetodologicos() {
        Map resultado = obtenerEnfoquesMetodologicos.execute(new HashMap<>());
        List<EnfoqueMetodologico> enfoquesMetodologicos = (ArrayList<EnfoqueMetodologico>) resultado.get("enfoquesMetodologicos");

        return enfoquesMetodologicos;
    }

    @Override
    public List<Convocatoria> obtenerConvocatorias() {
        Map resultado = obtenerConvocatorias.execute(new HashMap<>());
        List<Convocatoria> convocatorias = (ArrayList<Convocatoria>) resultado.get("convocatorias");

        return convocatorias;
    }

    @Override
    public List<EstadoProyecto> obtenerEstadosProyecto() {
        Map resultado = obtenerEstadosProyecto.execute(new HashMap<>());
        List<EstadoProyecto> estadosProyecto = (ArrayList<EstadoProyecto>) resultado.get("estadosProyecto");

        return estadosProyecto;
    }

    @Override
    public List<TipoIdentificacion> obtenerTiposIdentificacion() {
        Map resultado = obtenerTiposIdentificacion.execute(new HashMap<>());
        List<TipoIdentificacion> tiposIdentificacion = (ArrayList<TipoIdentificacion>) resultado.get("tiposIdentificacion");

        return tiposIdentificacion;
    }

    @Override
    public List<Rol> obtenerRoles() {
        Map resultado = obtenerRoles.execute(new HashMap<>());
        List<Rol> roles = (ArrayList<Rol>) resultado.get("roles");

        return roles;
    }

    @Override
    public List<Facultad> obtenerFacultades() {
        Map resultado = obtenerFacultades.execute(new HashMap<>());
        List<Facultad> facultades = (ArrayList<Facultad>) resultado.get("facultades");

        return facultades;
    }

    @Override
    public List<TipoEstudiante> obtenerTiposEstudiante() {
        Map resultado = obtenerTiposEstudiante.execute(new HashMap<>());
        List<TipoEstudiante> tiposEstudiante = (ArrayList<TipoEstudiante>) resultado.get("tiposEstudiante");

        return tiposEstudiante;
    }

    @Override
    public List<Programa> obtenerProgramas() {
        Map resultado = obtenerProgramas.execute(new HashMap<>());
        List<Programa> programas = (ArrayList<Programa>) resultado.get("programas");

        return programas;
    }

    @Override
    public List<TipoActa> obtenerTiposActa() {
        Map resultado = obtenerTiposActa.execute(new HashMap<>());
        List<TipoActa> tiposActa = (ArrayList<TipoActa>) resultado.get("tiposActa");

        return tiposActa;
    }

    @Override
    public List<TipoFuenteFinanciacionProyecto> obtenerTiposFuenteFinanciacionProyecto() {
        Map resultado = obtenerTiposFuentesFinanciacionProyecto.execute(new HashMap<>());
        List<TipoFuenteFinanciacionProyecto> tiposFuenteFinanciacionProyecto = (ArrayList<TipoFuenteFinanciacionProyecto>) resultado.get("tiposFuenteFinanciacionProyecto");

        return tiposFuenteFinanciacionProyecto;
    }

    @Override
    public List<FuenteFinanciacion> obtenerFuentesFinanciacion() {
        Map resultado = obtenerFuentesFinanciacion.execute(new HashMap<>());
        List<FuenteFinanciacion> fuentesFinanciacion = (ArrayList<FuenteFinanciacion>) resultado.get("fuentesFinanciacion");

        return fuentesFinanciacion;
    }

    @Override
    public List<TipoPersona> obtenerTiposPersona() {
        Map resultado = obtenerTiposPersona.execute(new HashMap<>());
        List<TipoPersona> tiposPersona = (ArrayList<TipoPersona>) resultado.get("tiposPersona");

        return tiposPersona;
    }

    @Override
    public List<TipoCompromiso> obtenerTiposCompromiso() {
        Map resultado = obtenerTiposCompromiso.execute(new HashMap<>());
        List<TipoCompromiso> tiposCompromiso = (ArrayList<TipoCompromiso>) resultado.get("tiposCompromiso");

        return tiposCompromiso;
    }

    @Override
    public List<TipoAval> obtenerTiposAval() {
        Map resultado = obtenerTiposAval.execute(new HashMap<>());
        List<TipoAval> tiposAval = (ArrayList<TipoAval>) resultado.get("tiposAval");

        return tiposAval;
    }

    @Override
    public List<TipoVinculacion> obtenerTiposVinculacion() {
        Map resultado = obtenerTiposVinculacion.execute(new HashMap<>());
        List<TipoVinculacion> tiposVinculacion = (ArrayList<TipoVinculacion>) resultado.get("tiposVinculacion");

        return tiposVinculacion;
    }

    @Override
    public int ingresarConvocatoria(Convocatoria convocatoria) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varNombre", convocatoria.getNombre());
        Map resultado = ingresarConvocatoria.execute(parametros);

        int idConvocatoria = (int) resultado.get("varIdConvocatoria");

        return idConvocatoria;
    }

    @Override
    public int ingresarAreaTematica(AreaTematica areaTematica) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varNombre", areaTematica.getNombre());
        Map resultado = ingresarAreaTematica.execute(parametros);

        int idAreaTematica = (int) resultado.get("varIdAreaTematica");

        return idAreaTematica;
    }
}
