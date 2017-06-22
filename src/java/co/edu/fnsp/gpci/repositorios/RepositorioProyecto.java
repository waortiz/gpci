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
import co.edu.fnsp.gpci.entidades.GrupoInvestigacion;
import co.edu.fnsp.gpci.entidades.ObjetivoEspecifico;
import co.edu.fnsp.gpci.entidades.Proyecto;
import co.edu.fnsp.gpci.entidades.ReporteProyecto;
import co.edu.fnsp.gpci.entidades.RiesgoEtico;
import co.edu.fnsp.gpci.entidades.TipoContrato;
import co.edu.fnsp.gpci.entidades.TipoProyecto;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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
@Service("repositorioProyecto")
public class RepositorioProyecto implements IRepositorioProyecto {

    private SimpleJdbcCall ingresarProyecto;
    private SimpleJdbcCall ingresarObjetivoEspecificoProyecto;
    private SimpleJdbcCall actualizarObjetivoEspecificoProyecto;
    private SimpleJdbcCall eliminarObjetivoEspecificoProyecto;
    private SimpleJdbcCall actualizarProyecto;
    private SimpleJdbcCall obtenerProyecto;
    private SimpleJdbcCall obtenerProyectos;
    private SimpleJdbcCall obtenerObjetivosEspecificosProyecto;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        jdbcTemplate.setResultsMapCaseInsensitive(true);

        this.ingresarProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarProyecto");
        this.ingresarObjetivoEspecificoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarObjetivoEspecificoProyecto");
        this.eliminarObjetivoEspecificoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("EliminarObjetivoEspecificoProyecto");
        this.actualizarObjetivoEspecificoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarObjetivoEspecificoProyecto");
        this.actualizarProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarProyecto");
        this.obtenerProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerProyecto");
        this.obtenerProyectos = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerProyectos").
                returningResultSet("proyectos", BeanPropertyRowMapper.newInstance(ReporteProyecto.class));
        this.obtenerObjetivosEspecificosProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerObjetivosEspecificosProyecto").
                returningResultSet("objetivosEspecificosProyecto", BeanPropertyRowMapper.newInstance(ObjetivoEspecifico.class));
    }

    @Override
    public void ingresarProyecto(Proyecto proyecto) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varNombreCortoProyecto", proyecto.getNombreCortoProyecto());
        parametros.addValue("varNombreCompletoProyecto", proyecto.getNombreCompletoProyecto());
        parametros.addValue("varFechaInicio", proyecto.getFechaInicio());
        parametros.addValue("varFechaFinalizacion", proyecto.getFechaFinalizacion());
        parametros.addValue("varIdAreaTematica", proyecto.getAreaTematica().getIdAreaTematica());
        parametros.addValue("varIngresadoSIGEP", proyecto.isIngresadoSIGEP());
        parametros.addValue("varIngresadoSIU", proyecto.isIngresadoSIU());
        parametros.addValue("varIngresadoSIIU", proyecto.isIngresadoSIIU());
        parametros.addValue("varCodigoSIIU", proyecto.getCodigoSIIU());
        parametros.addValue("varCodigoCOLCIENCIAS", proyecto.getCodigoCOLCIENCIAS());
        parametros.addValue("varCodigoSIU", proyecto.getCodigoSIU());
        parametros.addValue("varCodigo", proyecto.getCodigo());
        parametros.addValue("varParticipacionInternacional", proyecto.isParticipacionInternacional());
        parametros.addValue("varIdTipoProyecto", proyecto.getTipoProyecto().getIdTipoProyecto());
        parametros.addValue("varIdGrupoInvestigacion", proyecto.getGrupoInvestigacion().getIdGrupoInvestigacion());
        parametros.addValue("varIdRiesgoEtico", proyecto.getRiesgoEtico().getIdRiesgoEtico());
        parametros.addValue("varIdTipoContrato", proyecto.getTipoContrato().getIdTipoContrato());
        parametros.addValue("varIdEnfoqueMetodologico", proyecto.getEnfoqueMetodologico().getIdEnfoqueMetodologico());
        parametros.addValue("varIdConvocatoria", proyecto.getConvocatoria().getIdConvocatoria());
        parametros.addValue("varObjetivoGeneral", proyecto.getObjetivoGeneral());
        parametros.addValue("varIdEstado", proyecto.getEstado().getIdEstadoProyecto());
        parametros.addValue("varidUsuarioCreacion", proyecto.getUsuarioCreacion().getIdUsuario());
        Map resultado = ingresarProyecto.execute(parametros);

        long idProyecto = (long) resultado.get("varIdProyecto");
        MapSqlParameterSource parametrosObjetivoEspecifico = new MapSqlParameterSource();
        parametrosObjetivoEspecifico.addValue("varIdProyecto", idProyecto);
        for (ObjetivoEspecifico objetivo : proyecto.getObjetivosEspecificos()) {
            parametrosObjetivoEspecifico.addValue("varDescripcion", objetivo.getDescripcion());
            ingresarObjetivoEspecificoProyecto.execute(parametrosObjetivoEspecifico);
        }
    }

    @Override
    public void actualizarProyecto(Proyecto proyecto) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdProyecto", proyecto.getIdProyecto());
        parametros.addValue("varNombreCortoProyecto", proyecto.getNombreCortoProyecto());
        parametros.addValue("varNombreCompletoProyecto", proyecto.getNombreCompletoProyecto());
        parametros.addValue("varFechaInicio", proyecto.getFechaInicio());
        parametros.addValue("varFechaFinalizacion", proyecto.getFechaFinalizacion());
        parametros.addValue("varIdAreaTematica", proyecto.getAreaTematica().getIdAreaTematica());
        parametros.addValue("varIngresadoSIGEP", proyecto.isIngresadoSIGEP());
        parametros.addValue("varIngresadoSIU", proyecto.isIngresadoSIU());
        parametros.addValue("varIngresadoSIIU", proyecto.isIngresadoSIIU());
        parametros.addValue("varCodigoSIIU", proyecto.getCodigoSIIU());
        parametros.addValue("varCodigoCOLCIENCIAS", proyecto.getCodigoCOLCIENCIAS());
        parametros.addValue("varCodigoSIU", proyecto.getCodigoSIU());
        parametros.addValue("varCodigo", proyecto.getCodigo());
        parametros.addValue("varParticipacionInternacional", proyecto.isParticipacionInternacional());
        parametros.addValue("varIdTipoProyecto", proyecto.getTipoProyecto().getIdTipoProyecto());
        parametros.addValue("varIdGrupoInvestigacion", proyecto.getGrupoInvestigacion().getIdGrupoInvestigacion());
        parametros.addValue("varIdRiesgoEtico", proyecto.getRiesgoEtico().getIdRiesgoEtico());
        parametros.addValue("varIdTipoContrato", proyecto.getTipoContrato().getIdTipoContrato());
        parametros.addValue("varIdEnfoqueMetodologico", proyecto.getEnfoqueMetodologico().getIdEnfoqueMetodologico());
        parametros.addValue("varIdConvocatoria", proyecto.getConvocatoria().getIdConvocatoria());
        parametros.addValue("varIdEstado", proyecto.getEstado().getIdEstadoProyecto());
        parametros.addValue("varObjetivoGeneral", proyecto.getObjetivoGeneral());

        actualizarProyecto.execute(parametros);

        MapSqlParameterSource parametrosConsultaObjetivosEspecificos = new MapSqlParameterSource();
        parametrosConsultaObjetivosEspecificos.addValue("varIdProyecto", proyecto.getIdProyecto());
        Map resultadoObjetivos = obtenerObjetivosEspecificosProyecto.execute(parametrosConsultaObjetivosEspecificos);
        ArrayList<ObjetivoEspecifico> objetivosEspecificosActuales = (ArrayList<ObjetivoEspecifico>) resultadoObjetivos.get("objetivosEspecificosProyecto");

        MapSqlParameterSource parametrosEliminacionObjetivoEspecifico = new MapSqlParameterSource();
        MapSqlParameterSource parametrosActualizacionObjetivoEspecifico = new MapSqlParameterSource();
        for (ObjetivoEspecifico objetivoActual : objetivosEspecificosActuales) {
            ObjetivoEspecifico objetivoModificado = null;
            for (ObjetivoEspecifico objetivo : proyecto.getObjetivosEspecificos()) {
                if (objetivo.getIdObjetivoEspecifico() == objetivoActual.getIdObjetivoEspecifico()) {
                    objetivoModificado = objetivo;
                    break;
                }
            }
            if (objetivoModificado == null) {
                parametrosEliminacionObjetivoEspecifico.addValue("varIdObjetivoEspecificoProyecto", objetivoActual.getIdObjetivoEspecifico());
                eliminarObjetivoEspecificoProyecto.execute(parametrosEliminacionObjetivoEspecifico);
            } else {
                parametrosActualizacionObjetivoEspecifico.addValue("varIdObjetivoEspecificoProyecto", objetivoModificado.getIdObjetivoEspecifico());
                parametrosActualizacionObjetivoEspecifico.addValue("varDescripcion", objetivoModificado.getDescripcion());
                actualizarObjetivoEspecificoProyecto.execute(parametrosActualizacionObjetivoEspecifico);
            }
        }
        
        MapSqlParameterSource parametrosIngresoObjetivoEspecifico = new MapSqlParameterSource();
        parametrosIngresoObjetivoEspecifico.addValue("varIdProyecto", proyecto.getIdProyecto());
        for (ObjetivoEspecifico objetivo : proyecto.getObjetivosEspecificos()) {
            if (objetivo.getIdObjetivoEspecifico() == 0) {
                parametrosIngresoObjetivoEspecifico.addValue("varDescripcion", objetivo.getDescripcion());
                ingresarObjetivoEspecificoProyecto.execute(parametrosIngresoObjetivoEspecifico);
            }
        }
    }

    @Override
    public Proyecto obtenerProyecto(long idProyecto) {
        Proyecto proyecto = new Proyecto();
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdProyecto", idProyecto);

        Map resultado = obtenerProyecto.execute(parametros);

        proyecto.setIdProyecto(idProyecto);
        proyecto.setNombreCortoProyecto((String) resultado.get("varNombreCortoProyecto"));
        proyecto.setNombreCompletoProyecto((String) resultado.get("varNombreCompletoProyecto"));
        proyecto.setFechaInicio((Date) resultado.get("varFechaInicio"));
        proyecto.setFechaFinalizacion((Date) resultado.get("varFechaFinalizacion"));
        proyecto.setAreaTematica(new AreaTematica());
        proyecto.getAreaTematica().setIdAreaTematica((int) resultado.get("varIdAreaTematica"));
        proyecto.getAreaTematica().setNombre((String) resultado.get("varAreaTematica"));
        proyecto.setIngresadoSIGEP((boolean) resultado.get("varIngresadoSIGEP"));
        proyecto.setIngresadoSIU((boolean) resultado.get("varIngresadoSIU"));
        proyecto.setCodigoSIIU((String) resultado.get("varCodigoSIIU"));
        proyecto.setCodigoCOLCIENCIAS((String) resultado.get("varCodigoCOLCIENCIAS"));
        proyecto.setCodigoSIU((String) resultado.get("varCodigoSIU"));
        proyecto.setCodigo((String) resultado.get("varCodigo"));
        proyecto.setParticipacionInternacional((boolean) resultado.get("varParticipacionInternacional"));
        proyecto.setTipoProyecto(new TipoProyecto());
        proyecto.getTipoProyecto().setIdTipoProyecto((int) resultado.get("varIdTipoProyecto"));
        proyecto.getTipoProyecto().setNombre((String) resultado.get("varTipoProyecto"));
        proyecto.setGrupoInvestigacion(new GrupoInvestigacion());
        proyecto.getGrupoInvestigacion().setIdGrupoInvestigacion((int) resultado.get("varIdGrupoInvestigacion"));
        proyecto.getGrupoInvestigacion().setNombre((String) resultado.get("varGrupoInvestigacion"));
        proyecto.setRiesgoEtico(new RiesgoEtico());
        proyecto.getRiesgoEtico().setIdRiesgoEtico((int) resultado.get("varIdRiesgoEtico"));
        proyecto.getRiesgoEtico().setNombre((String) resultado.get("varRiesgoEtico"));
        proyecto.setTipoContrato(new TipoContrato());
        proyecto.getTipoContrato().setIdTipoContrato((int) resultado.get("varIdTipoContrato"));
        proyecto.getTipoContrato().setNombre((String) resultado.get("varTipoContrato"));
        proyecto.setEnfoqueMetodologico(new EnfoqueMetodologico());
        proyecto.getEnfoqueMetodologico().setIdEnfoqueMetodologico((int) resultado.get("varIdEnfoqueMetodologico"));
        proyecto.getEnfoqueMetodologico().setNombre((String) resultado.get("varEnfoqueMetodologico"));
        proyecto.setConvocatoria(new Convocatoria());
        proyecto.getConvocatoria().setIdConvocatoria((int) resultado.get("varIdConvocatoria"));
        proyecto.getConvocatoria().setNombre((String) resultado.get("varConvocatoria"));
        proyecto.setObjetivoGeneral((String) resultado.get("varObjetivoGeneral"));
        proyecto.setEstado(new EstadoProyecto());
        proyecto.getEstado().setIdEstadoProyecto((int) resultado.get("varIdEstado"));
        proyecto.getEstado().setNombre((String) resultado.get("varEstado"));

        Map resultadoObjetivos = obtenerObjetivosEspecificosProyecto.execute(parametros);
        ArrayList<ObjetivoEspecifico> objetivosEspecificos = (ArrayList<ObjetivoEspecifico>) resultadoObjetivos.get("objetivosEspecificosProyecto");
        proyecto.setObjetivosEspecificos(objetivosEspecificos);

        return proyecto;
    }

    @Override
    public ArrayList<ReporteProyecto> obtenerProyectos() {
        Map resultado = obtenerProyectos.execute(new HashMap<>());
        ArrayList<ReporteProyecto> proyectos = (ArrayList<ReporteProyecto>) resultado.get("proyectos");

        return proyectos;
    }

}
