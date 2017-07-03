/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.repositorios;

import co.edu.fnsp.gpci.entidades.AreaTematica;
import co.edu.fnsp.gpci.entidades.CompromisoProyecto;
import co.edu.fnsp.gpci.entidades.ObjetivoEspecifico;
import co.edu.fnsp.gpci.entidades.PersonalExterno;
import co.edu.fnsp.gpci.entidades.Profesor;
import co.edu.fnsp.gpci.entidades.Proyecto;
import co.edu.fnsp.gpci.entidades.ReporteProyecto;
import co.edu.fnsp.gpci.entidades.TipoProyecto;
import co.edu.fnsp.gpci.entidadesVista.Estudiante;
import java.util.ArrayList;
import java.util.Date;
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
    private SimpleJdbcCall actualizarProyecto;
    private SimpleJdbcCall obtenerProyecto;
    private SimpleJdbcCall obtenerProyectos;

    private SimpleJdbcCall ingresarObjetivoEspecificoProyecto;
    private SimpleJdbcCall actualizarObjetivoEspecificoProyecto;
    private SimpleJdbcCall eliminarObjetivoEspecificoProyecto;
    private SimpleJdbcCall obtenerObjetivosEspecificosProyecto;

    private SimpleJdbcCall ingresarProfesorProyecto;
    private SimpleJdbcCall actualizarProfesorProyecto;
    private SimpleJdbcCall eliminarProfesorProyecto;
    private SimpleJdbcCall obtenerProfesoresProyecto;
    private SimpleJdbcCall obtenerProfesor;

    private SimpleJdbcCall ingresarEstudianteProyecto;
    private SimpleJdbcCall actualizarEstudianteProyecto;
    private SimpleJdbcCall eliminarEstudianteProyecto;
    private SimpleJdbcCall obtenerEstudiantesProyecto;
    private SimpleJdbcCall obtenerEstudiante;

    private SimpleJdbcCall ingresarPersonalExternoProyecto;
    private SimpleJdbcCall actualizarPersonalExternoProyecto;
    private SimpleJdbcCall eliminarPersonalExternoProyecto;
    private SimpleJdbcCall obtenerPersonalExternoProyecto;
    private SimpleJdbcCall obtenerPersonalExterno;

    private SimpleJdbcCall ingresarCompromisoProyecto;
    private SimpleJdbcCall actualizarCompromisoProyecto;
    private SimpleJdbcCall eliminarCompromisoProyecto;
    private SimpleJdbcCall obtenerCompromisosProyecto;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        jdbcTemplate.setResultsMapCaseInsensitive(true);

        this.ingresarProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarProyecto");
        this.actualizarProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarProyecto");
        this.obtenerProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerProyecto");
        this.obtenerProyectos = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerProyectos").returningResultSet("proyectos", BeanPropertyRowMapper.newInstance(ReporteProyecto.class));

        this.ingresarObjetivoEspecificoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarObjetivoEspecificoProyecto");
        this.eliminarObjetivoEspecificoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("EliminarObjetivoEspecificoProyecto");
        this.actualizarObjetivoEspecificoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarObjetivoEspecificoProyecto");
        this.obtenerObjetivosEspecificosProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerObjetivosEspecificosProyecto").returningResultSet("objetivosEspecificosProyecto", BeanPropertyRowMapper.newInstance(ObjetivoEspecifico.class));

        this.ingresarProfesorProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarProfesorProyecto");
        this.eliminarProfesorProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("EliminarProfesorProyecto");
        this.actualizarProfesorProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarProfesorProyecto");
        this.obtenerProfesor = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerProfesor");
        this.obtenerProfesoresProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerProfesoresProyecto").returningResultSet("profesoresProyecto", BeanPropertyRowMapper.newInstance(co.edu.fnsp.gpci.entidadesVista.ProfesorProyecto.class));

        this.ingresarPersonalExternoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarPersonalExternoProyecto");
        this.eliminarPersonalExternoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("EliminarPersonalExternoProyecto");
        this.actualizarPersonalExternoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarPersonalExternoProyecto");
        this.obtenerPersonalExterno = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerPersonalExterno");
        this.obtenerPersonalExternoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerPersonalExternoProyecto").returningResultSet("personalExternoProyecto", BeanPropertyRowMapper.newInstance(co.edu.fnsp.gpci.entidadesVista.PersonalExternoProyecto.class));

        this.ingresarEstudianteProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarEstudianteProyecto");
        this.eliminarEstudianteProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("EliminarEstudianteProyecto");
        this.actualizarEstudianteProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarEstudianteProyecto");
        this.obtenerEstudiante = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerEstudiante");
        this.obtenerEstudiantesProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerEstudiantesProyecto").returningResultSet("estudiantesProyecto", BeanPropertyRowMapper.newInstance(co.edu.fnsp.gpci.entidadesVista.EstudianteProyecto.class));

        this.ingresarCompromisoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarCompromisoProyecto");
        this.eliminarCompromisoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("EliminarCompromisoProyecto");
        this.actualizarCompromisoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarCompromisoProyecto");
        this.obtenerCompromisosProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerCompromisosProyecto").returningResultSet("compromisosProyecto", BeanPropertyRowMapper.newInstance(CompromisoProyecto.class));
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
        for (co.edu.fnsp.gpci.entidadesVista.ProfesorProyecto profesorProyecto : proyecto.getProfesoresProyecto()) {
            parametrosProfesorProyecto.addValue("varCodigoVinculacionUdeA", profesorProyecto.getCodigoVinculacionUdeA());
            parametrosProfesorProyecto.addValue("varCartacesionderechospatrimonio", profesorProyecto.isCartaCesionDerechosPatrimonio());
            parametrosProfesorProyecto.addValue("varIdFacultad", profesorProyecto.getIdFacultad());
            parametrosProfesorProyecto.addValue("varHorasSemana", profesorProyecto.getHorasSemana());
            if (profesorProyecto.getHorasSemanaFueraPlan().length() == 0) {
                parametrosProfesorProyecto.addValue("varHorasSemanaFueraPlan", null);
            } else {
                parametrosProfesorProyecto.addValue("varHorasSemanaFueraPlan", profesorProyecto.getHorasSemanaFueraPlan());
            }
            if (profesorProyecto.getMesesFueraPlan().length() == 0) {
                parametrosProfesorProyecto.addValue("varMesesFueraPlan", null);
            } else {
                parametrosProfesorProyecto.addValue("varMesesFueraPlan", profesorProyecto.getMesesFueraPlan());
            }
            parametrosProfesorProyecto.addValue("varMesesDedicados", profesorProyecto.getMesesDedicados());
            parametrosProfesorProyecto.addValue("varPorcentajePI", profesorProyecto.getPorcentajePI());
            parametrosProfesorProyecto.addValue("varIdRol", profesorProyecto.getIdRol());
            parametrosProfesorProyecto.addValue("varApellidos", profesorProyecto.getApellidos());
            parametrosProfesorProyecto.addValue("varContacto", profesorProyecto.getContacto());
            parametrosProfesorProyecto.addValue("varCorreoElectronico", profesorProyecto.getCorreoElectronico());
            parametrosProfesorProyecto.addValue("varNombres", profesorProyecto.getNombres());
            parametrosProfesorProyecto.addValue("varNumeroIdentificacion", profesorProyecto.getNumeroIdentificacion());
            parametrosProfesorProyecto.addValue("varIdTipoIdentificacion", profesorProyecto.getIdTipoIdentificacion());
            ingresarProfesorProyecto.execute(parametrosProfesorProyecto);
        }

        MapSqlParameterSource parametrosIngresoEstudianteProyecto = new MapSqlParameterSource();
        parametrosIngresoEstudianteProyecto.addValue("varIdProyecto", idProyecto);
        for (co.edu.fnsp.gpci.entidadesVista.EstudianteProyecto estudianteProyecto : proyecto.getEstudiantesProyecto()) {
            parametrosIngresoEstudianteProyecto.addValue("varHorasSemana", estudianteProyecto.getHorasSemana());
            parametrosIngresoEstudianteProyecto.addValue("varMesesDedicados", estudianteProyecto.getMesesDedicados());
            parametrosIngresoEstudianteProyecto.addValue("varIdTipoEstudiante", estudianteProyecto.getIdTipoEstudiante());
            parametrosIngresoEstudianteProyecto.addValue("varPorcentajePropiedadIntelectual", estudianteProyecto.getPorcentajePropiedadIntelectual());
            parametrosIngresoEstudianteProyecto.addValue("varIdPrograma", estudianteProyecto.getIdPrograma());
            parametrosIngresoEstudianteProyecto.addValue("varMesesDedicados", estudianteProyecto.getMesesDedicados());
            parametrosIngresoEstudianteProyecto.addValue("varIdRol", estudianteProyecto.getIdRol());
            if (estudianteProyecto.getSemestre().length() == 0) {
                parametrosIngresoEstudianteProyecto.addValue("varSemestre", null);
            } else {
                parametrosIngresoEstudianteProyecto.addValue("varSemestre", estudianteProyecto.getSemestre());
            }
            parametrosIngresoEstudianteProyecto.addValue("varApellidos", estudianteProyecto.getApellidos());
            parametrosIngresoEstudianteProyecto.addValue("varContacto", estudianteProyecto.getContacto());
            parametrosIngresoEstudianteProyecto.addValue("varCorreoElectronico", estudianteProyecto.getCorreoElectronico());
            parametrosIngresoEstudianteProyecto.addValue("varNombres", estudianteProyecto.getNombres());
            parametrosIngresoEstudianteProyecto.addValue("varNumeroIdentificacion", estudianteProyecto.getNumeroIdentificacion());
            parametrosIngresoEstudianteProyecto.addValue("varIdTipoIdentificacion", estudianteProyecto.getIdTipoIdentificacion());

            ingresarEstudianteProyecto.execute(parametrosIngresoEstudianteProyecto);
        }

        MapSqlParameterSource parametrosPersonalExternoProyecto = new MapSqlParameterSource();
        parametrosPersonalExternoProyecto.addValue("varIdProyecto", idProyecto);
        for (co.edu.fnsp.gpci.entidadesVista.PersonalExternoProyecto profesorProyecto : proyecto.getPersonalExternoProyecto()) {
            parametrosPersonalExternoProyecto.addValue("varCartacesionderechospatrimonio", profesorProyecto.isCartaCesionDerechosPatrimonio());
            parametrosPersonalExternoProyecto.addValue("varHorasSemana", profesorProyecto.getHorasSemana());
            parametrosPersonalExternoProyecto.addValue("varMesesDedicados", profesorProyecto.getMesesDedicados());
            parametrosPersonalExternoProyecto.addValue("varPorcentajePropiedadIntelectual", profesorProyecto.getPorcentajePropiedadIntelectual());
            parametrosPersonalExternoProyecto.addValue("varIdRol", profesorProyecto.getIdRol());
            parametrosPersonalExternoProyecto.addValue("varApellidos", profesorProyecto.getApellidos());
            parametrosPersonalExternoProyecto.addValue("varEntidad", profesorProyecto.getEntidad());
            parametrosPersonalExternoProyecto.addValue("varCorreoElectronico", profesorProyecto.getCorreoElectronico());
            parametrosPersonalExternoProyecto.addValue("varNombres", profesorProyecto.getNombres());
            parametrosPersonalExternoProyecto.addValue("varNumeroIdentificacion", profesorProyecto.getNumeroIdentificacion());
            parametrosPersonalExternoProyecto.addValue("varIdTipoIdentificacion", profesorProyecto.getIdTipoIdentificacion());
            ingresarPersonalExternoProyecto.execute(parametrosPersonalExternoProyecto);
        }

        MapSqlParameterSource parametrosCompromiso = new MapSqlParameterSource();
        parametrosCompromiso.addValue("varIdProyecto", idProyecto);
        for (CompromisoProyecto compromiso : proyecto.getCompromisosProyecto()) {
            parametrosCompromiso.addValue("varDescripcion", compromiso.getDescripcion());
            ingresarCompromisoProyecto.execute(parametrosCompromiso);
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
        this.ActualizarEstudiantesProyecto(proyecto);
        this.ActualizarPersonalExternoProyecto(proyecto);
        this.ActualizarCompromisosProyecto(proyecto);
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
        proyecto.getGrupoInvestigacion().setIdGrupoInvestigacion((int) resultado.get("varIdGrupoInvestigacion"));
        proyecto.getGrupoInvestigacion().setNombre((String) resultado.get("varGrupoInvestigacion"));
        proyecto.getRiesgoEtico().setIdRiesgoEtico((int) resultado.get("varIdRiesgoEtico"));
        proyecto.getRiesgoEtico().setNombre((String) resultado.get("varRiesgoEtico"));
        proyecto.getTipoContrato().setIdTipoContrato((int) resultado.get("varIdTipoContrato"));
        proyecto.getTipoContrato().setNombre((String) resultado.get("varTipoContrato"));
        proyecto.getEnfoqueMetodologico().setIdEnfoqueMetodologico((int) resultado.get("varIdEnfoqueMetodologico"));
        proyecto.getEnfoqueMetodologico().setNombre((String) resultado.get("varEnfoqueMetodologico"));
        proyecto.getConvocatoria().setIdConvocatoria((int) resultado.get("varIdConvocatoria"));
        proyecto.getConvocatoria().setNombre((String) resultado.get("varConvocatoria"));
        proyecto.setObjetivoGeneral((String) resultado.get("varObjetivoGeneral"));
        proyecto.getEstado().setIdEstadoProyecto((int) resultado.get("varIdEstado"));
        proyecto.getEstado().setNombre((String) resultado.get("varEstado"));

        Map resultadoObjetivos = obtenerObjetivosEspecificosProyecto.execute(parametros);
        ArrayList<ObjetivoEspecifico> objetivosEspecificos = (ArrayList<ObjetivoEspecifico>) resultadoObjetivos.get("objetivosEspecificosProyecto");
        proyecto.setObjetivosEspecificos(objetivosEspecificos);

        Map resultadoProfesores = obtenerProfesoresProyecto.execute(parametros);
        ArrayList<co.edu.fnsp.gpci.entidadesVista.ProfesorProyecto> profesoresProyectoActuales = (ArrayList<co.edu.fnsp.gpci.entidadesVista.ProfesorProyecto>) resultadoProfesores.get("profesoresProyecto");
        proyecto.setProfesoresProyecto(profesoresProyectoActuales);

        Map resultadoEstudiantes = obtenerEstudiantesProyecto.execute(parametros);
        ArrayList<co.edu.fnsp.gpci.entidadesVista.EstudianteProyecto> estudiantesProyectoActuales = (ArrayList<co.edu.fnsp.gpci.entidadesVista.EstudianteProyecto>) resultadoEstudiantes.get("estudiantesProyecto");
        proyecto.setEstudiantesProyecto(estudiantesProyectoActuales);

        Map resultadoPersonalExterno = obtenerPersonalExternoProyecto.execute(parametros);
        ArrayList<co.edu.fnsp.gpci.entidadesVista.PersonalExternoProyecto> personalExternoProyectoActuales = (ArrayList<co.edu.fnsp.gpci.entidadesVista.PersonalExternoProyecto>) resultadoPersonalExterno.get("personalExternoProyecto");
        proyecto.setPersonalExternoProyecto(personalExternoProyectoActuales);

        Map resultadoCompromisos = obtenerCompromisosProyecto.execute(parametros);
        ArrayList<CompromisoProyecto> compromisosProyecto = (ArrayList<CompromisoProyecto>) resultadoCompromisos.get("compromisosProyecto");
        proyecto.setCompromisosProyecto(compromisosProyecto);

        return proyecto;
    }

    @Override
    public ArrayList<ReporteProyecto> obtenerProyectos(Date fechaInicio, Date fechaFinal) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varFechaInicio", fechaInicio);
        parametros.addValue("varFechaFinal", fechaFinal);

        Map resultado = obtenerProyectos.execute(parametros);
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

    private void ActualizarCompromisosProyecto(Proyecto proyecto) {
        MapSqlParameterSource parametrosConsultaCompromisosProyecto = new MapSqlParameterSource();
        parametrosConsultaCompromisosProyecto.addValue("varIdProyecto", proyecto.getIdProyecto());
        Map resultadoCompromisosProyecto = obtenerCompromisosProyecto.execute(parametrosConsultaCompromisosProyecto);
        ArrayList<CompromisoProyecto> compromisosProyectoActuales = (ArrayList<CompromisoProyecto>) resultadoCompromisosProyecto.get("compromisosProyecto");

        MapSqlParameterSource parametrosEliminacionCompromisoProyecto = new MapSqlParameterSource();
        MapSqlParameterSource parametrosActualizacionCompromisoProyecto = new MapSqlParameterSource();
        for (CompromisoProyecto compromisoProyectoActual : compromisosProyectoActuales) {
            CompromisoProyecto compromisoProyectoModificado = null;
            for (CompromisoProyecto compromisoProyecto : proyecto.getCompromisosProyecto()) {
                if (compromisoProyecto.getIdCompromisoProyecto() == compromisoProyectoActual.getIdCompromisoProyecto()) {
                    compromisoProyectoModificado = compromisoProyecto;
                    break;
                }
            }
            if (compromisoProyectoModificado == null) {
                parametrosEliminacionCompromisoProyecto.addValue("varIdCompromiso", compromisoProyectoActual.getIdCompromisoProyecto());
                eliminarCompromisoProyecto.execute(parametrosEliminacionCompromisoProyecto);
            } else {
                parametrosActualizacionCompromisoProyecto.addValue("varIdCompromiso", compromisoProyectoModificado.getIdCompromisoProyecto());
                parametrosActualizacionCompromisoProyecto.addValue("varDescripcion", compromisoProyectoModificado.getDescripcion());
                actualizarCompromisoProyecto.execute(parametrosActualizacionCompromisoProyecto);
            }
        }

        MapSqlParameterSource parametrosIngresoCompromisoProyecto = new MapSqlParameterSource();
        parametrosIngresoCompromisoProyecto.addValue("varIdProyecto", proyecto.getIdProyecto());
        for (CompromisoProyecto compromisoProyecto : proyecto.getCompromisosProyecto()) {
            if (compromisoProyecto.getIdCompromisoProyecto() == 0) {
                parametrosIngresoCompromisoProyecto.addValue("varDescripcion", compromisoProyecto.getDescripcion());
                ingresarCompromisoProyecto.execute(parametrosIngresoCompromisoProyecto);
            }
        }
    }

    private void ActualizarProfesoresProyecto(Proyecto proyecto) {
        MapSqlParameterSource parametrosConsultaProfesoresProyecto = new MapSqlParameterSource();
        parametrosConsultaProfesoresProyecto.addValue("varIdProyecto", proyecto.getIdProyecto());
        Map resultadoProfesores = obtenerProfesoresProyecto.execute(parametrosConsultaProfesoresProyecto);
        ArrayList<co.edu.fnsp.gpci.entidadesVista.ProfesorProyecto> profesoresActuales = (ArrayList<co.edu.fnsp.gpci.entidadesVista.ProfesorProyecto>) resultadoProfesores.get("profesoresProyecto");

        MapSqlParameterSource parametrosEliminacionProfesorProyecto = new MapSqlParameterSource();
        MapSqlParameterSource parametrosActualizacionProfesorProyecto = new MapSqlParameterSource();
        for (co.edu.fnsp.gpci.entidadesVista.ProfesorProyecto profesorProyectoActual : profesoresActuales) {
            co.edu.fnsp.gpci.entidadesVista.ProfesorProyecto profesorProyectoModificado = null;
            for (co.edu.fnsp.gpci.entidadesVista.ProfesorProyecto profesorProyecto : proyecto.getProfesoresProyecto()) {
                if (profesorProyecto.getIdProfesor() == profesorProyectoActual.getIdProfesor()) {
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
                parametrosActualizacionProfesorProyecto.addValue("varIdProfesor", profesorProyectoModificado.getIdProfesor());
                parametrosActualizacionProfesorProyecto.addValue("varCodigoVinculacionUdeA", profesorProyectoModificado.getCodigoVinculacionUdeA());
                parametrosActualizacionProfesorProyecto.addValue("varCartacesionderechospatrimonio", profesorProyectoModificado.isCartaCesionDerechosPatrimonio());
                parametrosActualizacionProfesorProyecto.addValue("varIdFacultad", profesorProyectoModificado.getIdFacultad());
                parametrosActualizacionProfesorProyecto.addValue("varHorasSemana", profesorProyectoModificado.getHorasSemana());
                parametrosActualizacionProfesorProyecto.addValue("varMesesDedicados", profesorProyectoModificado.getMesesDedicados());
                if (profesorProyectoModificado.getHorasSemanaFueraPlan().length() == 0) {
                    parametrosActualizacionProfesorProyecto.addValue("varHorasSemanaFueraPlan", null);
                } else {
                    parametrosActualizacionProfesorProyecto.addValue("varHorasSemanaFueraPlan", profesorProyectoModificado.getHorasSemanaFueraPlan());
                }
                if (profesorProyectoModificado.getMesesFueraPlan().length() == 0) {
                    parametrosActualizacionProfesorProyecto.addValue("varMesesFueraPlan", null);
                } else {
                    parametrosActualizacionProfesorProyecto.addValue("varMesesFueraPlan", profesorProyectoModificado.getMesesFueraPlan());
                }
                parametrosActualizacionProfesorProyecto.addValue("varPorcentajePI", profesorProyectoModificado.getPorcentajePI());
                parametrosActualizacionProfesorProyecto.addValue("varIdRol", profesorProyectoModificado.getIdRol());
                parametrosActualizacionProfesorProyecto.addValue("varApellidos", profesorProyectoModificado.getApellidos());
                parametrosActualizacionProfesorProyecto.addValue("varContacto", profesorProyectoModificado.getContacto());
                parametrosActualizacionProfesorProyecto.addValue("varCorreoElectronico", profesorProyectoModificado.getCorreoElectronico());
                parametrosActualizacionProfesorProyecto.addValue("varNombres", profesorProyectoModificado.getNombres());
                parametrosActualizacionProfesorProyecto.addValue("varNumeroIdentificacion", profesorProyectoModificado.getNumeroIdentificacion());
                parametrosActualizacionProfesorProyecto.addValue("varIdTipoIdentificacion", profesorProyectoModificado.getIdTipoIdentificacion());
                actualizarProfesorProyecto.execute(parametrosActualizacionProfesorProyecto);
            }
        }

        MapSqlParameterSource parametrosIngresoProfesorProyecto = new MapSqlParameterSource();
        parametrosIngresoProfesorProyecto.addValue("varIdProyecto", proyecto.getIdProyecto());
        for (co.edu.fnsp.gpci.entidadesVista.ProfesorProyecto profesorProyecto : proyecto.getProfesoresProyecto()) {
            if (profesorProyecto.getIdProfesor() == 0) {
                parametrosIngresoProfesorProyecto.addValue("varCodigoVinculacionUdeA", profesorProyecto.getCodigoVinculacionUdeA());
                parametrosIngresoProfesorProyecto.addValue("varCartacesionderechospatrimonio", profesorProyecto.isCartaCesionDerechosPatrimonio());
                parametrosIngresoProfesorProyecto.addValue("varIdFacultad", profesorProyecto.getIdFacultad());
                parametrosIngresoProfesorProyecto.addValue("varHorasSemana", profesorProyecto.getHorasSemana());
                parametrosIngresoProfesorProyecto.addValue("varMesesDedicados", profesorProyecto.getMesesDedicados());
                if (profesorProyecto.getHorasSemanaFueraPlan().length() == 0) {
                    parametrosIngresoProfesorProyecto.addValue("varHorasSemanaFueraPlan", null);
                } else {
                    parametrosIngresoProfesorProyecto.addValue("varHorasSemanaFueraPlan", profesorProyecto.getHorasSemanaFueraPlan());
                }
                if (profesorProyecto.getMesesFueraPlan().length() == 0) {
                    parametrosIngresoProfesorProyecto.addValue("varMesesFueraPlan", null);
                } else {
                    parametrosIngresoProfesorProyecto.addValue("varMesesFueraPlan", profesorProyecto.getMesesFueraPlan());
                }
                parametrosIngresoProfesorProyecto.addValue("varPorcentajePI", profesorProyecto.getPorcentajePI());
                parametrosIngresoProfesorProyecto.addValue("varIdRol", profesorProyecto.getIdRol());
                parametrosIngresoProfesorProyecto.addValue("varApellidos", profesorProyecto.getApellidos());
                parametrosIngresoProfesorProyecto.addValue("varContacto", profesorProyecto.getContacto());
                parametrosIngresoProfesorProyecto.addValue("varCorreoElectronico", profesorProyecto.getCorreoElectronico());
                parametrosIngresoProfesorProyecto.addValue("varNombres", profesorProyecto.getNombres());
                parametrosIngresoProfesorProyecto.addValue("varNumeroIdentificacion", profesorProyecto.getNumeroIdentificacion());
                parametrosIngresoProfesorProyecto.addValue("varIdTipoIdentificacion", profesorProyecto.getIdTipoIdentificacion());
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

    private void ActualizarEstudiantesProyecto(Proyecto proyecto) {
        MapSqlParameterSource parametrosConsultaEstudiantesProyecto = new MapSqlParameterSource();
        parametrosConsultaEstudiantesProyecto.addValue("varIdProyecto", proyecto.getIdProyecto());
        Map resultadoEstudiantes = obtenerEstudiantesProyecto.execute(parametrosConsultaEstudiantesProyecto);
        ArrayList<co.edu.fnsp.gpci.entidadesVista.EstudianteProyecto> estudiantesActuales = (ArrayList<co.edu.fnsp.gpci.entidadesVista.EstudianteProyecto>) resultadoEstudiantes.get("estudiantesProyecto");

        MapSqlParameterSource parametrosEliminacionEstudianteProyecto = new MapSqlParameterSource();
        MapSqlParameterSource parametrosActualizacionEstudianteProyecto = new MapSqlParameterSource();
        for (co.edu.fnsp.gpci.entidadesVista.EstudianteProyecto estudianteProyectoActual : estudiantesActuales) {
            co.edu.fnsp.gpci.entidadesVista.EstudianteProyecto estudianteProyectoModificado = null;
            for (co.edu.fnsp.gpci.entidadesVista.EstudianteProyecto estudianteProyecto : proyecto.getEstudiantesProyecto()) {
                if (estudianteProyecto.getIdEstudiante() == estudianteProyectoActual.getIdEstudiante()) {
                    estudianteProyectoModificado = estudianteProyecto;
                    break;
                }
            }
            if (estudianteProyectoModificado == null) {
                parametrosEliminacionEstudianteProyecto.addValue("varIdProyecto", proyecto.getIdProyecto());
                parametrosEliminacionEstudianteProyecto.addValue("varIdEstudiante", estudianteProyectoActual.getIdEstudiante());
                eliminarEstudianteProyecto.execute(parametrosEliminacionEstudianteProyecto);
            } else {
                parametrosActualizacionEstudianteProyecto.addValue("varIdProyecto", proyecto.getIdProyecto());
                parametrosActualizacionEstudianteProyecto.addValue("varIdEstudiante", estudianteProyectoModificado.getIdEstudiante());
                parametrosActualizacionEstudianteProyecto.addValue("varIdTipoEstudiante", estudianteProyectoModificado.getIdTipoEstudiante());
                parametrosActualizacionEstudianteProyecto.addValue("varHorasSemana", estudianteProyectoModificado.getHorasSemana());
                parametrosActualizacionEstudianteProyecto.addValue("varPorcentajePropiedadIntelectual", estudianteProyectoModificado.getPorcentajePropiedadIntelectual());
                parametrosActualizacionEstudianteProyecto.addValue("varIdPrograma", estudianteProyectoModificado.getIdPrograma());
                parametrosActualizacionEstudianteProyecto.addValue("varMesesDedicados", estudianteProyectoModificado.getMesesDedicados());
                parametrosActualizacionEstudianteProyecto.addValue("varIdRol", estudianteProyectoModificado.getIdRol());
                if (estudianteProyectoModificado.getSemestre().length() == 0) {
                    parametrosActualizacionEstudianteProyecto.addValue("varSemestre", null);
                } else {
                    parametrosActualizacionEstudianteProyecto.addValue("varSemestre", estudianteProyectoModificado.getSemestre());
                }
                parametrosActualizacionEstudianteProyecto.addValue("varApellidos", estudianteProyectoModificado.getApellidos());
                parametrosActualizacionEstudianteProyecto.addValue("varContacto", estudianteProyectoModificado.getContacto());
                parametrosActualizacionEstudianteProyecto.addValue("varCorreoElectronico", estudianteProyectoModificado.getCorreoElectronico());
                parametrosActualizacionEstudianteProyecto.addValue("varNombres", estudianteProyectoModificado.getNombres());
                parametrosActualizacionEstudianteProyecto.addValue("varNumeroIdentificacion", estudianteProyectoModificado.getNumeroIdentificacion());
                parametrosActualizacionEstudianteProyecto.addValue("varIdTipoIdentificacion", estudianteProyectoModificado.getIdTipoIdentificacion());
                actualizarEstudianteProyecto.execute(parametrosActualizacionEstudianteProyecto);
            }
        }

        MapSqlParameterSource parametrosIngresoEstudianteProyecto = new MapSqlParameterSource();
        parametrosIngresoEstudianteProyecto.addValue("varIdProyecto", proyecto.getIdProyecto());
        for (co.edu.fnsp.gpci.entidadesVista.EstudianteProyecto estudianteProyecto : proyecto.getEstudiantesProyecto()) {
            if (estudianteProyecto.getIdEstudiante() == 0) {
                parametrosIngresoEstudianteProyecto.addValue("varHorasSemana", estudianteProyecto.getHorasSemana());
                parametrosIngresoEstudianteProyecto.addValue("varMesesDedicados", estudianteProyecto.getMesesDedicados());
                parametrosIngresoEstudianteProyecto.addValue("varIdTipoEstudiante", estudianteProyecto.getIdTipoEstudiante());
                parametrosIngresoEstudianteProyecto.addValue("varPorcentajePropiedadIntelectual", estudianteProyecto.getPorcentajePropiedadIntelectual());
                parametrosIngresoEstudianteProyecto.addValue("varIdPrograma", estudianteProyecto.getIdPrograma());
                parametrosIngresoEstudianteProyecto.addValue("varMesesDedicados", estudianteProyecto.getMesesDedicados());
                parametrosIngresoEstudianteProyecto.addValue("varIdRol", estudianteProyecto.getIdRol());
                if (estudianteProyecto.getSemestre().length() == 0) {
                    parametrosIngresoEstudianteProyecto.addValue("varSemestre", null);
                } else {
                    parametrosIngresoEstudianteProyecto.addValue("varSemestre", estudianteProyecto.getSemestre());
                }
                parametrosIngresoEstudianteProyecto.addValue("varApellidos", estudianteProyecto.getApellidos());
                parametrosIngresoEstudianteProyecto.addValue("varContacto", estudianteProyecto.getContacto());
                parametrosIngresoEstudianteProyecto.addValue("varCorreoElectronico", estudianteProyecto.getCorreoElectronico());
                parametrosIngresoEstudianteProyecto.addValue("varNombres", estudianteProyecto.getNombres());
                parametrosIngresoEstudianteProyecto.addValue("varNumeroIdentificacion", estudianteProyecto.getNumeroIdentificacion());
                parametrosIngresoEstudianteProyecto.addValue("varIdTipoIdentificacion", estudianteProyecto.getIdTipoIdentificacion());
                ingresarEstudianteProyecto.execute(parametrosIngresoEstudianteProyecto);
            }
        }
    }

    @Override
    public Estudiante obtenerEstudiante(long numeroIdentificacion, int idTipoIdentificacion) {
        Estudiante estudiante = null;
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varNumeroIdentificacion", numeroIdentificacion);
        parametros.addValue("varIdTipoIdentificacion", idTipoIdentificacion);
        Map resultado = obtenerEstudiante.execute(parametros);

        if (resultado.get("varIdEstudiante") != null) {
            estudiante = new Estudiante();
            estudiante.setNombres((String) resultado.get("varNombres"));
            estudiante.setApellidos((String) resultado.get("varApellidos"));
            estudiante.setContacto((String) resultado.get("varContacto"));
            estudiante.setCorreoElectronico((String) resultado.get("varCorreoElectronico"));
            estudiante.setIdTipoEstudiante((int) resultado.get("varIdTipoEstudiante"));
            estudiante.setDescripcionTipoEstudiante((String) resultado.get("varDescripcionTipoEstudiante"));
        }

        return estudiante;
    }

    private void ActualizarPersonalExternoProyecto(Proyecto proyecto) {
        MapSqlParameterSource parametrosConsultaPersonalExternoProyecto = new MapSqlParameterSource();
        parametrosConsultaPersonalExternoProyecto.addValue("varIdProyecto", proyecto.getIdProyecto());
        Map resultadoPersonalExterno = obtenerPersonalExternoProyecto.execute(parametrosConsultaPersonalExternoProyecto);
        ArrayList<co.edu.fnsp.gpci.entidadesVista.PersonalExternoProyecto> personalExternoesActuales = (ArrayList<co.edu.fnsp.gpci.entidadesVista.PersonalExternoProyecto>) resultadoPersonalExterno.get("personalExternoProyecto");

        MapSqlParameterSource parametrosEliminacionPersonalExternoProyecto = new MapSqlParameterSource();
        MapSqlParameterSource parametrosActualizacionPersonalExternoProyecto = new MapSqlParameterSource();
        for (co.edu.fnsp.gpci.entidadesVista.PersonalExternoProyecto personalExternoProyectoActual : personalExternoesActuales) {
            co.edu.fnsp.gpci.entidadesVista.PersonalExternoProyecto personalExternoProyectoModificado = null;
            for (co.edu.fnsp.gpci.entidadesVista.PersonalExternoProyecto personalExternoProyecto : proyecto.getPersonalExternoProyecto()) {
                if (personalExternoProyecto.getIdPersonalExterno() == personalExternoProyectoActual.getIdPersonalExterno()) {
                    personalExternoProyectoModificado = personalExternoProyecto;
                    break;
                }
            }
            if (personalExternoProyectoModificado == null) {
                parametrosEliminacionPersonalExternoProyecto.addValue("varIdProyecto", proyecto.getIdProyecto());
                parametrosEliminacionPersonalExternoProyecto.addValue("varIdPersonalExterno", personalExternoProyectoActual.getIdPersonalExterno());
                eliminarPersonalExternoProyecto.execute(parametrosEliminacionPersonalExternoProyecto);
            } else {
                parametrosActualizacionPersonalExternoProyecto.addValue("varIdProyecto", proyecto.getIdProyecto());
                parametrosActualizacionPersonalExternoProyecto.addValue("varIdPersonalExterno", personalExternoProyectoModificado.getIdPersonalExterno());
                parametrosActualizacionPersonalExternoProyecto.addValue("varCartacesionderechospatrimonio", personalExternoProyectoModificado.isCartaCesionDerechosPatrimonio());
                parametrosActualizacionPersonalExternoProyecto.addValue("varHorasSemana", personalExternoProyectoModificado.getHorasSemana());
                parametrosActualizacionPersonalExternoProyecto.addValue("varMesesDedicados", personalExternoProyectoModificado.getMesesDedicados());
                parametrosActualizacionPersonalExternoProyecto.addValue("varPorcentajePropiedadIntelectual", personalExternoProyectoModificado.getPorcentajePropiedadIntelectual());
                parametrosActualizacionPersonalExternoProyecto.addValue("varIdRol", personalExternoProyectoModificado.getIdRol());
                parametrosActualizacionPersonalExternoProyecto.addValue("varApellidos", personalExternoProyectoModificado.getApellidos());
                parametrosActualizacionPersonalExternoProyecto.addValue("varEntidad", personalExternoProyectoModificado.getEntidad());
                parametrosActualizacionPersonalExternoProyecto.addValue("varCorreoElectronico", personalExternoProyectoModificado.getCorreoElectronico());
                parametrosActualizacionPersonalExternoProyecto.addValue("varNombres", personalExternoProyectoModificado.getNombres());
                parametrosActualizacionPersonalExternoProyecto.addValue("varNumeroIdentificacion", personalExternoProyectoModificado.getNumeroIdentificacion());
                parametrosActualizacionPersonalExternoProyecto.addValue("varIdTipoIdentificacion", personalExternoProyectoModificado.getIdTipoIdentificacion());
                actualizarPersonalExternoProyecto.execute(parametrosActualizacionPersonalExternoProyecto);
            }
        }

        MapSqlParameterSource parametrosIngresoPersonalExternoProyecto = new MapSqlParameterSource();
        parametrosIngresoPersonalExternoProyecto.addValue("varIdProyecto", proyecto.getIdProyecto());
        for (co.edu.fnsp.gpci.entidadesVista.PersonalExternoProyecto personalExternoProyecto : proyecto.getPersonalExternoProyecto()) {
            if (personalExternoProyecto.getIdPersonalExterno() == 0) {
                parametrosIngresoPersonalExternoProyecto.addValue("varCartacesionderechospatrimonio", personalExternoProyecto.isCartaCesionDerechosPatrimonio());
                parametrosIngresoPersonalExternoProyecto.addValue("varHorasSemana", personalExternoProyecto.getHorasSemana());
                parametrosIngresoPersonalExternoProyecto.addValue("varMesesDedicados", personalExternoProyecto.getMesesDedicados());
                parametrosIngresoPersonalExternoProyecto.addValue("varPorcentajePropiedadIntelectual", personalExternoProyecto.getPorcentajePropiedadIntelectual());
                parametrosIngresoPersonalExternoProyecto.addValue("varIdRol", personalExternoProyecto.getIdRol());
                parametrosIngresoPersonalExternoProyecto.addValue("varApellidos", personalExternoProyecto.getApellidos());
                parametrosIngresoPersonalExternoProyecto.addValue("varEntidad", personalExternoProyecto.getEntidad());
                parametrosIngresoPersonalExternoProyecto.addValue("varCorreoElectronico", personalExternoProyecto.getCorreoElectronico());
                parametrosIngresoPersonalExternoProyecto.addValue("varNombres", personalExternoProyecto.getNombres());
                parametrosIngresoPersonalExternoProyecto.addValue("varNumeroIdentificacion", personalExternoProyecto.getNumeroIdentificacion());
                parametrosIngresoPersonalExternoProyecto.addValue("varIdTipoIdentificacion", personalExternoProyecto.getIdTipoIdentificacion());
                ingresarPersonalExternoProyecto.execute(parametrosIngresoPersonalExternoProyecto);
            }
        }
    }

    @Override
    public PersonalExterno obtenerPersonalExterno(long numeroIdentificacion, int idTipoIdentificacion) {
        PersonalExterno personalExterno = null;
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varNumeroIdentificacion", numeroIdentificacion);
        parametros.addValue("varIdTipoIdentificacion", idTipoIdentificacion);
        Map resultado = obtenerPersonalExterno.execute(parametros);

        if (resultado.get("varIdPersonalExterno") != null) {
            personalExterno = new PersonalExterno();
            personalExterno.setNombres((String) resultado.get("varNombres"));
            personalExterno.setApellidos((String) resultado.get("varApellidos"));
            personalExterno.setCorreoElectronico((String) resultado.get("varCorreoElectronico"));
            personalExterno.setEntidad((String) resultado.get("varEntidad"));
        }

        return personalExterno;
    }

}
