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
import co.edu.fnsp.gpci.entidades.Profesor;
import co.edu.fnsp.gpci.entidades.ProfesorProyecto;
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
    private SimpleJdbcCall ingresarProfesorProyecto;
    private SimpleJdbcCall actualizarProfesorProyecto;
    private SimpleJdbcCall eliminarProfesorProyecto;
    private SimpleJdbcCall actualizarProyecto;
    private SimpleJdbcCall obtenerProyecto;
    private SimpleJdbcCall obtenerProfesor;
    private SimpleJdbcCall obtenerProyectos;
    private SimpleJdbcCall obtenerObjetivosEspecificosProyecto;
    private SimpleJdbcCall obtenerProfesoresProyecto;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        jdbcTemplate.setResultsMapCaseInsensitive(true);

        this.ingresarProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarProyecto");
        this.ingresarObjetivoEspecificoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarObjetivoEspecificoProyecto");
        this.eliminarObjetivoEspecificoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("EliminarObjetivoEspecificoProyecto");
        this.actualizarObjetivoEspecificoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarObjetivoEspecificoProyecto");
        this.ingresarProfesorProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarProfesorProyecto");
        this.eliminarProfesorProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("EliminarProfesorProyecto");
        this.actualizarProfesorProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarProfesorProyecto");
        this.actualizarProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarProyecto");
        this.obtenerProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerProyecto");
        this.obtenerProfesor = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerProfesor");
        this.obtenerProyectos = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerProyectos").returningResultSet("proyectos", BeanPropertyRowMapper.newInstance(ReporteProyecto.class));
        this.obtenerObjetivosEspecificosProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerObjetivosEspecificosProyecto").returningResultSet("objetivosEspecificosProyecto", BeanPropertyRowMapper.newInstance(ObjetivoEspecifico.class));
        this.obtenerProfesoresProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerProfesoresProyecto").returningResultSet("obtenerProfesoresProyecto", BeanPropertyRowMapper.newInstance(co.edu.fnsp.gpci.entidadesConsulta.ProfesorProyecto.class));
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

        MapSqlParameterSource parametrosProfesorProyecto = new MapSqlParameterSource();
        parametrosProfesorProyecto.addValue("varIdProyecto", idProyecto);
        for (ProfesorProyecto profesorProyecto : proyecto.getProfesoresProyecto()) {
            parametrosProfesorProyecto.addValue("varCodigoVinculacionUdeA", profesorProyecto.getCodigoVinculacionUdeA());
            parametrosProfesorProyecto.addValue("varIdFacultad", profesorProyecto.getFacultad().getIdFacultad());
            parametrosProfesorProyecto.addValue("varHorasSemana", profesorProyecto.getHorasSemana());
            parametrosProfesorProyecto.addValue("varHorasSemanaFueraPlan", profesorProyecto.getHorasSemanaFueraPlan());
            parametrosProfesorProyecto.addValue("varMesesDedicados", profesorProyecto.getMesesDedicados());
            parametrosProfesorProyecto.addValue("varMesesFueraPlan", profesorProyecto.getMesesFueraPlan());
            parametrosProfesorProyecto.addValue("varPorcentajePI", profesorProyecto.getPorcentajePI());
            parametrosProfesorProyecto.addValue("varIdRol", profesorProyecto.getRol().getIdRol());
            parametrosProfesorProyecto.addValue("varApellidos", profesorProyecto.getProfesor().getApellidos());
            parametrosProfesorProyecto.addValue("varContacto", profesorProyecto.getProfesor().getContacto());
            parametrosProfesorProyecto.addValue("varCorreoElectronico", profesorProyecto.getProfesor().getCorreoElectronico());
            parametrosProfesorProyecto.addValue("varNombres", profesorProyecto.getProfesor().getNombres());
            parametrosProfesorProyecto.addValue("varNumeroIdentificacion", profesorProyecto.getProfesor().getNumeroIdentificacion());
            parametrosProfesorProyecto.addValue("varIdTipoIdentificacion", profesorProyecto.getProfesor().getTipoIdentificacion().getIdTipoIdentificacion());
            ingresarProfesorProyecto.execute(parametrosProfesorProyecto);
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

        this.ActualizarObjetivosEspecificos(proyecto);
        this.ActualizarProfesoresProyecto(proyecto);
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

    private void ActualizarObjetivosEspecificos(Proyecto proyecto) {
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

    private void ActualizarProfesoresProyecto(Proyecto proyecto) {
        MapSqlParameterSource parametrosConsultaProfesoresProyecto = new MapSqlParameterSource();
        parametrosConsultaProfesoresProyecto.addValue("varIdProyecto", proyecto.getIdProyecto());
        Map resultadoProfesores = obtenerProfesoresProyecto.execute(parametrosConsultaProfesoresProyecto);
        ArrayList<co.edu.fnsp.gpci.entidadesConsulta.ProfesorProyecto> profesoresActuales = (ArrayList<co.edu.fnsp.gpci.entidadesConsulta.ProfesorProyecto>) resultadoProfesores.get("profesoresProyecto");

        MapSqlParameterSource parametrosEliminacionProfesorProyecto = new MapSqlParameterSource();
        MapSqlParameterSource parametrosActualizacionProfesorProyecto = new MapSqlParameterSource();
        for (co.edu.fnsp.gpci.entidadesConsulta.ProfesorProyecto profesorProyectoActual : profesoresActuales) {
            ProfesorProyecto profesorProyectoModificado = null;
            for (ProfesorProyecto profesorProyecto : proyecto.getProfesoresProyecto()) {
                if (profesorProyecto.getProfesor().getIdProfesor() == profesorProyectoActual.getIdProfesor()) {
                    profesorProyectoModificado = profesorProyecto;
                    break;
                }
            }
            if (profesorProyectoModificado == null) {
                parametrosEliminacionProfesorProyecto.addValue("varIdProyecto", proyecto.getIdProyecto());
                parametrosEliminacionProfesorProyecto.addValue("varIdProfesor", profesorProyectoActual.getIdProfesor());
                eliminarProfesorProyecto.execute(parametrosEliminacionProfesorProyecto);
            } else {
                parametrosActualizacionProfesorProyecto.addValue("varIdProyecto", proyecto.getIdProyecto());
                parametrosActualizacionProfesorProyecto.addValue("varIdProfesor", profesorProyectoModificado.getProfesor().getIdProfesor());
                parametrosActualizacionProfesorProyecto.addValue("varCodigoVinculacionUdeA", profesorProyectoModificado.getCodigoVinculacionUdeA());
                parametrosActualizacionProfesorProyecto.addValue("varIdFacultad", profesorProyectoModificado.getFacultad().getIdFacultad());
                parametrosActualizacionProfesorProyecto.addValue("varHorasSemana", profesorProyectoModificado.getHorasSemana());
                parametrosActualizacionProfesorProyecto.addValue("varHorasSemanaFueraPlan", profesorProyectoModificado.getHorasSemanaFueraPlan());
                parametrosActualizacionProfesorProyecto.addValue("varMesesDedicados", profesorProyectoModificado.getMesesDedicados());
                parametrosActualizacionProfesorProyecto.addValue("varMesesFueraPlan", profesorProyectoModificado.getMesesFueraPlan());
                parametrosActualizacionProfesorProyecto.addValue("varPorcentajePI", profesorProyectoModificado.getPorcentajePI());
                parametrosActualizacionProfesorProyecto.addValue("varIdRol", profesorProyectoModificado.getRol().getIdRol());
                parametrosActualizacionProfesorProyecto.addValue("varApellidos", profesorProyectoModificado.getProfesor().getApellidos());
                parametrosActualizacionProfesorProyecto.addValue("varContacto", profesorProyectoModificado.getProfesor().getContacto());
                parametrosActualizacionProfesorProyecto.addValue("varCorreoElectronico", profesorProyectoModificado.getProfesor().getCorreoElectronico());
                parametrosActualizacionProfesorProyecto.addValue("varNombres", profesorProyectoModificado.getProfesor().getNombres());
                parametrosActualizacionProfesorProyecto.addValue("varNumeroIdentificacion", profesorProyectoModificado.getProfesor().getNumeroIdentificacion());
                parametrosActualizacionProfesorProyecto.addValue("varIdTipoIdentificacion", profesorProyectoModificado.getProfesor().getTipoIdentificacion().getIdTipoIdentificacion());
                actualizarProfesorProyecto.execute(parametrosActualizacionProfesorProyecto);
            }
        }

        MapSqlParameterSource parametrosIngresoProfesorProyecto = new MapSqlParameterSource();
        parametrosIngresoProfesorProyecto.addValue("varIdProyecto", proyecto.getIdProyecto());
        for (ProfesorProyecto profesorProyecto : proyecto.getProfesoresProyecto()) {
            if (profesorProyecto.getProfesor().getIdProfesor() == 0) {
                parametrosIngresoProfesorProyecto.addValue("varCodigoVinculacionUdeA", profesorProyecto.getCodigoVinculacionUdeA());
                parametrosIngresoProfesorProyecto.addValue("varIdFacultad", profesorProyecto.getFacultad().getIdFacultad());
                parametrosIngresoProfesorProyecto.addValue("varHorasSemana", profesorProyecto.getHorasSemana());
                parametrosIngresoProfesorProyecto.addValue("varHorasSemanaFueraPlan", profesorProyecto.getHorasSemanaFueraPlan());
                parametrosIngresoProfesorProyecto.addValue("varMesesDedicados", profesorProyecto.getMesesDedicados());
                parametrosIngresoProfesorProyecto.addValue("varMesesFueraPlan", profesorProyecto.getMesesFueraPlan());
                parametrosIngresoProfesorProyecto.addValue("varPorcentajePI", profesorProyecto.getPorcentajePI());
                parametrosIngresoProfesorProyecto.addValue("varIdRol", profesorProyecto.getRol().getIdRol());
                parametrosIngresoProfesorProyecto.addValue("varApellidos", profesorProyecto.getProfesor().getApellidos());
                parametrosIngresoProfesorProyecto.addValue("varContacto", profesorProyecto.getProfesor().getContacto());
                parametrosIngresoProfesorProyecto.addValue("varCorreoElectronico", profesorProyecto.getProfesor().getCorreoElectronico());
                parametrosIngresoProfesorProyecto.addValue("varNombres", profesorProyecto.getProfesor().getNombres());
                parametrosIngresoProfesorProyecto.addValue("varNumeroIdentificacion", profesorProyecto.getProfesor().getNumeroIdentificacion());
                parametrosIngresoProfesorProyecto.addValue("varIdTipoIdentificacion", profesorProyecto.getProfesor().getTipoIdentificacion().getIdTipoIdentificacion());
                ingresarProfesorProyecto.execute(parametrosIngresoProfesorProyecto);
            }
        }
    }

    @Override
    public Profesor obtenerProfesor(long numeroIdentificacion, int idTipoIdentificacion) {
        Profesor profesor = null;
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varNumeroIdentificacion", numeroIdentificacion);
        parametros.addValue("varIdTipoIdentificacion", idTipoIdentificacion);
        Map resultado = obtenerProfesor.execute(parametros);

        if (resultado.get("varIdProfesor") != null) {
            profesor = new Profesor();
            profesor.setNombres((String) resultado.get("varNombres"));
            profesor.setApellidos((String) resultado.get("varApellidos"));
            profesor.setContacto((String) resultado.get("varContacto"));
            profesor.setCorreoElectronico((String) resultado.get("varCorreoElectronico"));
        }

        return profesor;
    }
}
