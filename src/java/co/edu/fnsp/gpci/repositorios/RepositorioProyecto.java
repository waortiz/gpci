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
import co.edu.fnsp.gpci.entidades.GrupoInvestigacionProyecto;
import co.edu.fnsp.gpci.entidades.PersonalExternoProyecto;
import co.edu.fnsp.gpci.entidades.ProfesorProyecto;
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
@Repository("repositorioProyecto")
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

    private SimpleJdbcCall ingresarGrupoInvestigacionProyecto;
    private SimpleJdbcCall actualizarGrupoInvestigacionProyecto;
    private SimpleJdbcCall eliminarGrupoInvestigacionProyecto;
    private SimpleJdbcCall obtenerGruposInvestigacionProyecto;

    private SimpleJdbcCall ingresarEntidadInternacionalProyecto;
    private SimpleJdbcCall actualizarEntidadInternacionalProyecto;
    private SimpleJdbcCall eliminarEntidadInternacionalProyecto;
    private SimpleJdbcCall obtenerEntidadesInternacionalesProyecto;

    private SimpleJdbcCall ingresarFuenteFinanciacionProyecto;
    private SimpleJdbcCall actualizarFuenteFinanciacionProyecto;
    private SimpleJdbcCall eliminarFuenteFinanciacionProyecto;
    private SimpleJdbcCall obtenerFuentesFinanciacionProyecto;

    private SimpleJdbcCall ingresarAlertaAvalProyecto;
    private SimpleJdbcCall actualizarAlertaAvalProyecto;
    private SimpleJdbcCall eliminarAlertaAvalProyecto;
    private SimpleJdbcCall obtenerAlertasAvalProyecto;

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
        this.obtenerProfesoresProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerProfesoresProyecto").returningResultSet("profesoresProyecto", BeanPropertyRowMapper.newInstance(ProfesorProyecto.class));

        this.ingresarPersonalExternoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarPersonalExternoProyecto");
        this.eliminarPersonalExternoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("EliminarPersonalExternoProyecto");
        this.actualizarPersonalExternoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarPersonalExternoProyecto");
        this.obtenerPersonalExterno = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerPersonalExterno");
        this.obtenerPersonalExternoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerPersonalExternoProyecto").returningResultSet("personalExternoProyecto", BeanPropertyRowMapper.newInstance(PersonalExternoProyecto.class));

        this.ingresarEstudianteProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarEstudianteProyecto");
        this.eliminarEstudianteProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("EliminarEstudianteProyecto");
        this.actualizarEstudianteProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarEstudianteProyecto");
        this.obtenerEstudiante = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerEstudiante");
        this.obtenerEstudiantesProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerEstudiantesProyecto").returningResultSet("estudiantesProyecto", BeanPropertyRowMapper.newInstance(EstudianteProyecto.class));

        this.ingresarCompromisoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarCompromisoProyecto");
        this.eliminarCompromisoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("EliminarCompromisoProyecto");
        this.actualizarCompromisoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarCompromisoProyecto");
        this.obtenerCompromisosProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerCompromisosProyecto").returningResultSet("compromisosProyecto", BeanPropertyRowMapper.newInstance(CompromisoProyecto.class));

        this.ingresarEntidadInternacionalProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarEntidadInternacionalProyecto");
        this.eliminarEntidadInternacionalProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("EliminarEntidadInternacionalProyecto");
        this.actualizarEntidadInternacionalProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarEntidadInternacionalProyecto");
        this.obtenerEntidadesInternacionalesProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerEntidadesInternacionalesProyecto").returningResultSet("entidadesInternacionalesProyecto", BeanPropertyRowMapper.newInstance(EntidadInternacionalProyecto.class));

        this.ingresarGrupoInvestigacionProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarGrupoInvestigacionProyecto");
        this.actualizarGrupoInvestigacionProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarGrupoInvestigacionProyecto");
        this.eliminarGrupoInvestigacionProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("EliminarGrupoInvestigacionProyecto");
        this.obtenerGruposInvestigacionProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerGruposInvestigacionProyecto").returningResultSet("gruposInvestigacionProyecto", BeanPropertyRowMapper.newInstance(GrupoInvestigacionProyecto.class));

        this.ingresarFuenteFinanciacionProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarFuenteFinanciacionProyecto");
        this.eliminarFuenteFinanciacionProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("EliminarFuenteFinanciacionProyecto");
        this.actualizarFuenteFinanciacionProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarFuenteFinanciacionProyecto");
        this.obtenerFuentesFinanciacionProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerFuentesFinanciacionProyecto").returningResultSet("fuentesFinanciacionProyecto", BeanPropertyRowMapper.newInstance(FuenteFinanciacionProyecto.class));

        this.ingresarAlertaAvalProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarAlertaAvalProyecto");
        this.eliminarAlertaAvalProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("EliminarAlertaAvalProyecto");
        this.actualizarAlertaAvalProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarAlertaAvalProyecto");
        this.obtenerAlertasAvalProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerAlertasAvalProyecto").returningResultSet("alertasAvalProyecto", BeanPropertyRowMapper.newInstance(AlertaAvalProyecto.class));
    }

    @Override
    public void ingresarProyecto(Proyecto proyecto) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varNombreCortoProyecto", proyecto.getNombreCortoProyecto());
        parametros.addValue("varNombreCompletoProyecto", proyecto.getNombreCompletoProyecto());
        parametros.addValue("varFechaInicio", proyecto.getFechaInicio());
        parametros.addValue("varFechaFinalizacion", proyecto.getFechaFinalizacion());
        parametros.addValue("varIdAreaTematica", proyecto.getAreaTematica().getIdAreaTematica());
        parametros.addValue("varFechaIngresadoSIGEP", proyecto.getFechaIngresadoSIGEP());
        parametros.addValue("varIngresadoSIGEP", proyecto.isIngresadoSIGEP());
        parametros.addValue("varIngresadoSIU", proyecto.isIngresadoSIU());
        parametros.addValue("varIngresadoSIIU", proyecto.isIngresadoSIIU());
        parametros.addValue("varCodigoSIIU", proyecto.getCodigoSIIU());
        parametros.addValue("varCodigoCOLCIENCIAS", proyecto.getCodigoCOLCIENCIAS());
        parametros.addValue("varCodigoSIU", proyecto.getCodigoSIU());
        parametros.addValue("varCodigo", proyecto.getCodigo());
        parametros.addValue("varParticipacionInternacional", proyecto.isParticipacionInternacional());
        parametros.addValue("varIdTipoProyecto", proyecto.getTipoProyecto().getIdTipoProyecto());
        parametros.addValue("varIdRiesgoEtico", proyecto.getRiesgoEtico().getIdRiesgoEtico());
        parametros.addValue("varIdTipoContrato", proyecto.getTipoContrato().getIdTipoContrato());
        parametros.addValue("varIdEnfoqueMetodologico", proyecto.getEnfoqueMetodologico().getIdEnfoqueMetodologico());
        parametros.addValue("varIdConvocatoria", proyecto.getConvocatoria().getIdConvocatoria());
        parametros.addValue("varObjetivoGeneral", proyecto.getObjetivoGeneral());
        parametros.addValue("varIdEstado", proyecto.getEstado().getIdEstadoProyecto());
        parametros.addValue("varidUsuarioCreacion", proyecto.getUsuarioCreacion().getIdUsuario());
        Map resultado = ingresarProyecto.execute(parametros);

        long idProyecto = (long) resultado.get("varIdProyecto");
        MapSqlParameterSource parametrosIngresoObjetivoEspecifico = new MapSqlParameterSource();
        parametrosIngresoObjetivoEspecifico.addValue("varIdProyecto", idProyecto);
        for (ObjetivoEspecifico objetivo : proyecto.getObjetivosEspecificos()) {
            parametrosIngresoObjetivoEspecifico.addValue("varDescripcion", objetivo.getDescripcion());
            ingresarObjetivoEspecificoProyecto.execute(parametrosIngresoObjetivoEspecifico);
        }

        MapSqlParameterSource parametrosIngresoGrupoInvestigacionProyecto = new MapSqlParameterSource();
        parametrosIngresoGrupoInvestigacionProyecto.addValue("varIdProyecto", idProyecto);
        for (GrupoInvestigacionProyecto grupoInvestigacion : proyecto.getGruposInvestigacion()) {
            parametrosIngresoGrupoInvestigacionProyecto.addValue("varIdGrupoInvestigacion", grupoInvestigacion.getIdGrupoInvestigacion());
            if (proyecto.getIdGrupoInvestigacionPrincipal() == grupoInvestigacion.getIdGrupoInvestigacion()) {
                parametrosIngresoGrupoInvestigacionProyecto.addValue("varPrincipal", true);
            } else {
                parametrosIngresoGrupoInvestigacionProyecto.addValue("varPrincipal", false);
            }
            ingresarGrupoInvestigacionProyecto.execute(parametrosIngresoGrupoInvestigacionProyecto);
        }

        MapSqlParameterSource parametrosIngresoEntidadInternacionalProyecto = new MapSqlParameterSource();
        parametrosIngresoEntidadInternacionalProyecto.addValue("varIdProyecto", idProyecto);
        for (EntidadInternacionalProyecto entidadInternacional : proyecto.getEntidadesInternacionalesProyecto()) {
            parametrosIngresoEntidadInternacionalProyecto.addValue("varNombre", entidadInternacional.getNombre());
            ingresarEntidadInternacionalProyecto.execute(parametrosIngresoEntidadInternacionalProyecto);
        }

        MapSqlParameterSource parametrosIngresoProfesorProyecto = new MapSqlParameterSource();
        parametrosIngresoProfesorProyecto.addValue("varIdProyecto", idProyecto);
        for (ProfesorProyecto profesorProyecto : proyecto.getProfesoresProyecto()) {
            parametrosIngresoProfesorProyecto.addValue("varIdTipoVinculacion", profesorProyecto.getIdTipoVinculacion());
            parametrosIngresoProfesorProyecto.addValue("varCartacesionderechospatrimonio", profesorProyecto.isCartaCesionDerechosPatrimonio());
            parametrosIngresoProfesorProyecto.addValue("varIdFacultad", profesorProyecto.getIdFacultad());
            parametrosIngresoProfesorProyecto.addValue("varHorasSemana", profesorProyecto.getHorasSemana());
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
            parametrosIngresoProfesorProyecto.addValue("varMesesDedicados", profesorProyecto.getMesesDedicados());
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

        MapSqlParameterSource parametrosIngresoEstudianteProyecto = new MapSqlParameterSource();
        parametrosIngresoEstudianteProyecto.addValue("varIdProyecto", idProyecto);
        for (EstudianteProyecto estudianteProyecto : proyecto.getEstudiantesProyecto()) {
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

        MapSqlParameterSource parametrosIngresoPersonalExternoProyecto = new MapSqlParameterSource();
        parametrosIngresoPersonalExternoProyecto.addValue("varIdProyecto", idProyecto);
        for (PersonalExternoProyecto profesorProyecto : proyecto.getPersonalExternoProyecto()) {
            parametrosIngresoPersonalExternoProyecto.addValue("varCartacesionderechospatrimonio", profesorProyecto.isCartaCesionDerechosPatrimonio());
            parametrosIngresoPersonalExternoProyecto.addValue("varHorasSemana", profesorProyecto.getHorasSemana());
            parametrosIngresoPersonalExternoProyecto.addValue("varMesesDedicados", profesorProyecto.getMesesDedicados());
            parametrosIngresoPersonalExternoProyecto.addValue("varPorcentajePropiedadIntelectual", profesorProyecto.getPorcentajePropiedadIntelectual());
            parametrosIngresoPersonalExternoProyecto.addValue("varIdRol", profesorProyecto.getIdRol());
            parametrosIngresoPersonalExternoProyecto.addValue("varApellidos", profesorProyecto.getApellidos());
            parametrosIngresoPersonalExternoProyecto.addValue("varEntidad", profesorProyecto.getEntidad());
            parametrosIngresoPersonalExternoProyecto.addValue("varCorreoElectronico", profesorProyecto.getCorreoElectronico());
            parametrosIngresoPersonalExternoProyecto.addValue("varNombres", profesorProyecto.getNombres());
            parametrosIngresoPersonalExternoProyecto.addValue("varNumeroIdentificacion", profesorProyecto.getNumeroIdentificacion());
            parametrosIngresoPersonalExternoProyecto.addValue("varIdTipoIdentificacion", profesorProyecto.getIdTipoIdentificacion());
            ingresarPersonalExternoProyecto.execute(parametrosIngresoPersonalExternoProyecto);
        }

        MapSqlParameterSource parametrosIngresoCompromiso = new MapSqlParameterSource();
        parametrosIngresoCompromiso.addValue("varIdProyecto", idProyecto);
        for (CompromisoProyecto compromiso : proyecto.getCompromisosProyecto()) {
            parametrosIngresoCompromiso.addValue("varDescripcion", compromiso.getDescripcion());
            if (!compromiso.getSoporte().isEmpty()) {
                parametrosIngresoCompromiso.addValue("varSoporte", compromiso.getSoporte());
            } else {
                parametrosIngresoCompromiso.addValue("varSoporte", null);
            }
            parametrosIngresoCompromiso.addValue("varIdTipoCompromiso", compromiso.getIdTipoCompromiso());
            ingresarCompromisoProyecto.execute(parametrosIngresoCompromiso);
        }

        MapSqlParameterSource parametrosIngresoFuenteFinanciacionProyecto = new MapSqlParameterSource();
        parametrosIngresoFuenteFinanciacionProyecto.addValue("varIdProyecto", proyecto.getIdProyecto());
        for (FuenteFinanciacionProyecto fuenteFinanciacion : proyecto.getFuentesFinanciacionProyecto()) {
            if (fuenteFinanciacion.getIdFuenteFinanciacionProyecto() == 0) {
                parametrosIngresoFuenteFinanciacionProyecto.addValue("varIdFuenteFinanciacion", fuenteFinanciacion.getIdFuenteFinanciacion());
                parametrosIngresoFuenteFinanciacionProyecto.addValue("varIdTipoFuenteFinanciacionProyecto", fuenteFinanciacion.getIdTipoFuenteFinanciacionProyecto());
                parametrosIngresoFuenteFinanciacionProyecto.addValue("varMontoFrescos", fuenteFinanciacion.getMontoFrescos());
                parametrosIngresoFuenteFinanciacionProyecto.addValue("varMontoEspecies", fuenteFinanciacion.getMontoEspecies());
                ingresarFuenteFinanciacionProyecto.execute(parametrosIngresoFuenteFinanciacionProyecto);
            }
        }

        MapSqlParameterSource parametrosIngresoAlertaAval = new MapSqlParameterSource();
        parametrosIngresoAlertaAval.addValue("varIdProyecto", idProyecto);
        for (AlertaAvalProyecto alertaAvalProyecto : proyecto.getAlertasAvalProyecto()) {
            parametrosIngresoAlertaAval.addValue("varDescripcion", alertaAvalProyecto.getDescripcion());
            parametrosIngresoAlertaAval.addValue("varIdTipoAval", alertaAvalProyecto.getIdTipoAval());
            parametrosIngresoAlertaAval.addValue("varIdTipoAval", alertaAvalProyecto.getIdTipoAval());
            parametrosIngresoAlertaAval.addValue("varFechaActa", alertaAvalProyecto.getFechaActa());
            parametrosIngresoAlertaAval.addValue("varNumeroActa", alertaAvalProyecto.getNumeroActa());
            ingresarAlertaAvalProyecto.execute(parametrosIngresoAlertaAval);
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
        parametros.addValue("varFechaIngresadoSIGEP", proyecto.getFechaIngresadoSIGEP());
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
        this.ActualizarGruposInvestigacion(proyecto);
        this.ActualizarEntidadesInternacionales(proyecto);
        this.ActualizarFuentesFinanciacionProyecto(proyecto);
        this.ActualizarAlertasAvalProyecto(proyecto);
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
        if(resultado.get("varFechaIngresadoSIGEP") != null) {
            proyecto.setFechaIngresadoSIGEP((Date) resultado.get("varFechaIngresadoSIGEP"));
        }
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
        ArrayList<ProfesorProyecto> profesoresProyectoActuales = (ArrayList<ProfesorProyecto>) resultadoProfesores.get("profesoresProyecto");
        proyecto.setProfesoresProyecto(profesoresProyectoActuales);

        Map resultadoEstudiantes = obtenerEstudiantesProyecto.execute(parametros);
        ArrayList<EstudianteProyecto> estudiantesProyectoActuales = (ArrayList<EstudianteProyecto>) resultadoEstudiantes.get("estudiantesProyecto");
        proyecto.setEstudiantesProyecto(estudiantesProyectoActuales);

        Map resultadoPersonalExterno = obtenerPersonalExternoProyecto.execute(parametros);
        ArrayList<PersonalExternoProyecto> personalExternoProyectoActuales = (ArrayList<PersonalExternoProyecto>) resultadoPersonalExterno.get("personalExternoProyecto");
        proyecto.setPersonalExternoProyecto(personalExternoProyectoActuales);

        Map resultadoCompromisos = obtenerCompromisosProyecto.execute(parametros);
        ArrayList<CompromisoProyecto> compromisosProyecto = (ArrayList<CompromisoProyecto>) resultadoCompromisos.get("compromisosProyecto");
        proyecto.setCompromisosProyecto(compromisosProyecto);

        Map resultadoGruposInvestigacion = obtenerGruposInvestigacionProyecto.execute(parametros);
        ArrayList<GrupoInvestigacionProyecto> gruposInvestigacion = (ArrayList<GrupoInvestigacionProyecto>) resultadoGruposInvestigacion.get("gruposInvestigacionProyecto");
        proyecto.setGruposInvestigacion(gruposInvestigacion);
        for (GrupoInvestigacionProyecto grupoInvestigacion : gruposInvestigacion) {
            if (grupoInvestigacion.isPrincipal()) {
                proyecto.setIdGrupoInvestigacionPrincipal(grupoInvestigacion.getIdGrupoInvestigacion());
                break;
            }
        }

        Map resultadoEntidadesInternacionales = obtenerEntidadesInternacionalesProyecto.execute(parametros);
        ArrayList<EntidadInternacionalProyecto> entidadesInternacionales = (ArrayList<EntidadInternacionalProyecto>) resultadoEntidadesInternacionales.get("entidadesInternacionalesProyecto");
        proyecto.setEntidadesInternacionalesProyecto(entidadesInternacionales);

        Map resultadoFuentesFinanciacion = obtenerFuentesFinanciacionProyecto.execute(parametros);
        ArrayList<FuenteFinanciacionProyecto> fuentesFinanciacionProyecto = (ArrayList<FuenteFinanciacionProyecto>) resultadoFuentesFinanciacion.get("fuentesFinanciacionProyecto");
        proyecto.setFuentesFinanciacionProyecto(fuentesFinanciacionProyecto);

        Map resultadoAlertasAvalProyecto = obtenerAlertasAvalProyecto.execute(parametros);
        ArrayList<AlertaAvalProyecto> alertasAvalProyecto = (ArrayList<AlertaAvalProyecto>) resultadoAlertasAvalProyecto.get("alertasAvalProyecto");
        proyecto.setAlertasAvalProyecto(alertasAvalProyecto);

        return proyecto;
    }

    @Override
    public ArrayList<ReporteProyecto> obtenerProyectos(Date fechaInicio, Date fechaFinal, String codigo, String documentoInvestigadorPrincipal) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varFechaInicio", fechaInicio);
        parametros.addValue("varFechaFinal", fechaFinal);
        if (!codigo.isEmpty()) {
            parametros.addValue("varCodigo", codigo);
        } else {
            parametros.addValue("varCodigo", null);
        }
        if (!documentoInvestigadorPrincipal.isEmpty()) {
            parametros.addValue("varDocumentoInvestigadorPrincipal", documentoInvestigadorPrincipal);
        } else {
            parametros.addValue("varDocumentoInvestigadorPrincipal", null);
        }

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
                parametrosEliminacionCompromisoProyecto.addValue("varIdCompromisoProyecto", compromisoProyectoActual.getIdCompromisoProyecto());
                eliminarCompromisoProyecto.execute(parametrosEliminacionCompromisoProyecto);
            } else {
                parametrosActualizacionCompromisoProyecto.addValue("varIdCompromisoProyecto", compromisoProyectoModificado.getIdCompromisoProyecto());
                parametrosActualizacionCompromisoProyecto.addValue("varDescripcion", compromisoProyectoModificado.getDescripcion());
                parametrosActualizacionCompromisoProyecto.addValue("varIdTipoCompromiso", compromisoProyectoModificado.getIdTipoCompromiso());
                if (!compromisoProyectoModificado.getSoporte().isEmpty()) {
                    parametrosActualizacionCompromisoProyecto.addValue("varSoporte", compromisoProyectoModificado.getSoporte());
                } else {
                    parametrosActualizacionCompromisoProyecto.addValue("varSoporte", null);
                }
                actualizarCompromisoProyecto.execute(parametrosActualizacionCompromisoProyecto);
            }
        }

        MapSqlParameterSource parametrosIngresoCompromisoProyecto = new MapSqlParameterSource();
        parametrosIngresoCompromisoProyecto.addValue("varIdProyecto", proyecto.getIdProyecto());
        for (CompromisoProyecto compromisoProyecto : proyecto.getCompromisosProyecto()) {
            if (compromisoProyecto.getIdCompromisoProyecto() == 0) {
                parametrosIngresoCompromisoProyecto.addValue("varDescripcion", compromisoProyecto.getDescripcion());
                parametrosIngresoCompromisoProyecto.addValue("varIdTipoCompromiso", compromisoProyecto.getIdTipoCompromiso());
                if (!compromisoProyecto.getSoporte().isEmpty()) {
                    parametrosIngresoCompromisoProyecto.addValue("varSoporte", compromisoProyecto.getSoporte());
                } else {
                    parametrosIngresoCompromisoProyecto.addValue("varSoporte", null);
                }
                ingresarCompromisoProyecto.execute(parametrosIngresoCompromisoProyecto);
            }
        }
    }

    @Override
    public ArrayList<CompromisoProyecto> obtenerCompromisosProyecto(long idProyecto) {
        MapSqlParameterSource parametrosConsultaCompromisosProyecto = new MapSqlParameterSource();
        parametrosConsultaCompromisosProyecto.addValue("varIdProyecto", idProyecto);
        Map resultadoCompromisosProyecto = obtenerCompromisosProyecto.execute(parametrosConsultaCompromisosProyecto);
        ArrayList<CompromisoProyecto> compromisosProyecto = (ArrayList<CompromisoProyecto>) resultadoCompromisosProyecto.get("compromisosProyecto");
        return compromisosProyecto;
    }

    private void ActualizarProfesoresProyecto(Proyecto proyecto) {
        MapSqlParameterSource parametrosConsultaProfesoresProyecto = new MapSqlParameterSource();
        parametrosConsultaProfesoresProyecto.addValue("varIdProyecto", proyecto.getIdProyecto());
        Map resultadoProfesores = obtenerProfesoresProyecto.execute(parametrosConsultaProfesoresProyecto);
        ArrayList<ProfesorProyecto> profesoresActuales = (ArrayList<ProfesorProyecto>) resultadoProfesores.get("profesoresProyecto");

        MapSqlParameterSource parametrosEliminacionProfesorProyecto = new MapSqlParameterSource();
        MapSqlParameterSource parametrosActualizacionProfesorProyecto = new MapSqlParameterSource();
        for (ProfesorProyecto profesorProyectoActual : profesoresActuales) {
            ProfesorProyecto profesorProyectoModificado = null;
            for (ProfesorProyecto profesorProyecto : proyecto.getProfesoresProyecto()) {
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
                parametrosActualizacionProfesorProyecto.addValue("varIdTipoVinculacion", profesorProyectoModificado.getIdTipoVinculacion());
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
        for (ProfesorProyecto profesorProyecto : proyecto.getProfesoresProyecto()) {
            if (profesorProyecto.getIdProfesor() == 0) {
                parametrosIngresoProfesorProyecto.addValue("varIdTipoVinculacion", profesorProyecto.getIdTipoVinculacion());
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
    public Profesor obtenerProfesor(int idTipoIdentificacion, long numeroIdentificacion) {
        Profesor profesor = null;
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varNumeroIdentificacion", numeroIdentificacion);
        parametros.addValue("varIdTipoIdentificacion", idTipoIdentificacion);
        Map resultado = obtenerProfesor.execute(parametros);

        if (resultado.get("varIdProfesor") != null) {
            profesor = new Profesor();
            profesor.setIdProfesor((long) resultado.get("varIdProfesor"));
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
        ArrayList<EstudianteProyecto> estudiantesActuales = (ArrayList<EstudianteProyecto>) resultadoEstudiantes.get("estudiantesProyecto");

        MapSqlParameterSource parametrosEliminacionEstudianteProyecto = new MapSqlParameterSource();
        MapSqlParameterSource parametrosActualizacionEstudianteProyecto = new MapSqlParameterSource();
        for (EstudianteProyecto estudianteProyectoActual : estudiantesActuales) {
            EstudianteProyecto estudianteProyectoModificado = null;
            for (EstudianteProyecto estudianteProyecto : proyecto.getEstudiantesProyecto()) {
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
        for (EstudianteProyecto estudianteProyecto : proyecto.getEstudiantesProyecto()) {
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
    public Estudiante obtenerEstudiante(int idTipoIdentificacion, long numeroIdentificacion) {
        Estudiante estudiante = null;
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varNumeroIdentificacion", numeroIdentificacion);
        parametros.addValue("varIdTipoIdentificacion", idTipoIdentificacion);
        Map resultado = obtenerEstudiante.execute(parametros);

        if (resultado.get("varIdEstudiante") != null) {
            estudiante = new Estudiante();
            estudiante.setIdEstudiante((long) resultado.get("varIdEstudiante"));
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
        ArrayList<PersonalExternoProyecto> personalExternoesActuales = (ArrayList<PersonalExternoProyecto>) resultadoPersonalExterno.get("personalExternoProyecto");

        MapSqlParameterSource parametrosEliminacionPersonalExternoProyecto = new MapSqlParameterSource();
        MapSqlParameterSource parametrosActualizacionPersonalExternoProyecto = new MapSqlParameterSource();
        for (PersonalExternoProyecto personalExternoProyectoActual : personalExternoesActuales) {
            PersonalExternoProyecto personalExternoProyectoModificado = null;
            for (PersonalExternoProyecto personalExternoProyecto : proyecto.getPersonalExternoProyecto()) {
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
        for (PersonalExternoProyecto personalExternoProyecto : proyecto.getPersonalExternoProyecto()) {
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
    public PersonalExterno obtenerPersonalExterno(int idTipoIdentificacion, long numeroIdentificacion) {
        PersonalExterno personalExterno = null;
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varNumeroIdentificacion", numeroIdentificacion);
        parametros.addValue("varIdTipoIdentificacion", idTipoIdentificacion);
        Map resultado = obtenerPersonalExterno.execute(parametros);

        if (resultado.get("varIdPersonalExterno") != null) {
            personalExterno = new PersonalExterno();
            personalExterno.setIdPersonalExterno((long) resultado.get("varIdPersonalExterno"));
            personalExterno.setNombres((String) resultado.get("varNombres"));
            personalExterno.setApellidos((String) resultado.get("varApellidos"));
            personalExterno.setCorreoElectronico((String) resultado.get("varCorreoElectronico"));
            personalExterno.setEntidad((String) resultado.get("varEntidad"));
        }

        return personalExterno;
    }

    private void ActualizarGruposInvestigacion(Proyecto proyecto) {
        MapSqlParameterSource parametrosConsultaGruposInvestigacion = new MapSqlParameterSource();
        parametrosConsultaGruposInvestigacion.addValue("varIdProyecto", proyecto.getIdProyecto());
        Map resultadoGruposInvestigacion = obtenerGruposInvestigacionProyecto.execute(parametrosConsultaGruposInvestigacion);
        ArrayList<GrupoInvestigacionProyecto> gruposInvestigacionActuales = (ArrayList<GrupoInvestigacionProyecto>) resultadoGruposInvestigacion.get("gruposInvestigacionProyecto");

        MapSqlParameterSource parametrosEliminacionGrupoInvestigacion = new MapSqlParameterSource();
        MapSqlParameterSource parametrosActualizacionGrupoInvestigacion = new MapSqlParameterSource();
        for (GrupoInvestigacionProyecto grupoInvestigacionActual : gruposInvestigacionActuales) {
            GrupoInvestigacionProyecto grupoInvestigacionModificado = null;
            for (GrupoInvestigacionProyecto grupoInvestigacion : proyecto.getGruposInvestigacion()) {
                if (grupoInvestigacion.getIdGrupoInvestigacion() == grupoInvestigacionActual.getIdGrupoInvestigacion()) {
                    grupoInvestigacionModificado = grupoInvestigacion;
                    break;
                }
            }
            if (grupoInvestigacionModificado == null) {
                parametrosEliminacionGrupoInvestigacion.addValue("varIdProyecto", proyecto.getIdProyecto());
                parametrosEliminacionGrupoInvestigacion.addValue("varIdGrupoInvestigacion", grupoInvestigacionActual.getIdGrupoInvestigacion());
                eliminarGrupoInvestigacionProyecto.execute(parametrosEliminacionGrupoInvestigacion);
            } else {
                parametrosActualizacionGrupoInvestigacion.addValue("varIdGrupoInvestigacion", grupoInvestigacionModificado.getIdGrupoInvestigacion());
                parametrosActualizacionGrupoInvestigacion.addValue("varIdProyecto", proyecto.getIdProyecto());
                if (proyecto.getIdGrupoInvestigacionPrincipal() == grupoInvestigacionModificado.getIdGrupoInvestigacion()) {
                    parametrosActualizacionGrupoInvestigacion.addValue("varPrincipal", true);
                } else {
                    parametrosActualizacionGrupoInvestigacion.addValue("varPrincipal", false);
                }
                actualizarGrupoInvestigacionProyecto.execute(parametrosActualizacionGrupoInvestigacion);
            }
        }

        MapSqlParameterSource parametrosIngresoGrupoInvestigacion = new MapSqlParameterSource();
        parametrosIngresoGrupoInvestigacion.addValue("varIdProyecto", proyecto.getIdProyecto());
        for (GrupoInvestigacionProyecto grupoInvestigacion : proyecto.getGruposInvestigacion()) {
            boolean grupoInvestigacionExiste = false;
            for (GrupoInvestigacionProyecto grupoInvestigacionActual : gruposInvestigacionActuales) {
                if (grupoInvestigacion.getIdGrupoInvestigacion() == grupoInvestigacionActual.getIdGrupoInvestigacion()) {
                    grupoInvestigacionExiste = true;
                    break;
                }
            }
            if (!grupoInvestigacionExiste) {
                parametrosIngresoGrupoInvestigacion.addValue("varIdGrupoInvestigacion", grupoInvestigacion.getIdGrupoInvestigacion());
                if (proyecto.getIdGrupoInvestigacionPrincipal() == grupoInvestigacion.getIdGrupoInvestigacion()) {
                    parametrosIngresoGrupoInvestigacion.addValue("varPrincipal", true);
                } else {
                    parametrosIngresoGrupoInvestigacion.addValue("varPrincipal", false);
                }
                ingresarGrupoInvestigacionProyecto.execute(parametrosIngresoGrupoInvestigacion);
            }
        }
    }

    private void ActualizarEntidadesInternacionales(Proyecto proyecto) {
        MapSqlParameterSource parametrosConsultaEntidadesInternacionales = new MapSqlParameterSource();
        parametrosConsultaEntidadesInternacionales.addValue("varIdProyecto", proyecto.getIdProyecto());
        Map resultadoEntidadesInternacionales = obtenerEntidadesInternacionalesProyecto.execute(parametrosConsultaEntidadesInternacionales);
        ArrayList<EntidadInternacionalProyecto> entidadesInternacionalesActuales = (ArrayList<EntidadInternacionalProyecto>) resultadoEntidadesInternacionales.get("entidadesInternacionalesProyecto");

        MapSqlParameterSource parametrosEliminacionEntidadInternacional = new MapSqlParameterSource();
        MapSqlParameterSource parametrosActualizacionEntidadInternacional = new MapSqlParameterSource();
        for (EntidadInternacionalProyecto entidadInternacionalActual : entidadesInternacionalesActuales) {
            EntidadInternacionalProyecto entidadInternacionalModificado = null;
            for (EntidadInternacionalProyecto entidadInternacional : proyecto.getEntidadesInternacionalesProyecto()) {
                if (entidadInternacional.getIdEntidadInternacionalProyecto() == entidadInternacionalActual.getIdEntidadInternacionalProyecto()) {
                    entidadInternacionalModificado = entidadInternacional;
                    break;
                }
            }
            if (entidadInternacionalModificado == null) {
                parametrosEliminacionEntidadInternacional.addValue("varIdEntidadInternacionalProyecto", entidadInternacionalActual.getIdEntidadInternacionalProyecto());
                eliminarEntidadInternacionalProyecto.execute(parametrosEliminacionEntidadInternacional);
            } else {
                parametrosActualizacionEntidadInternacional.addValue("varIdEntidadInternacionalProyecto", entidadInternacionalModificado.getIdEntidadInternacionalProyecto());
                parametrosActualizacionEntidadInternacional.addValue("varNombre", entidadInternacionalModificado.getNombre());
                actualizarEntidadInternacionalProyecto.execute(parametrosActualizacionEntidadInternacional);
            }
        }

        MapSqlParameterSource parametrosIngresoEntidadInternacional = new MapSqlParameterSource();
        parametrosIngresoEntidadInternacional.addValue("varIdProyecto", proyecto.getIdProyecto());
        for (EntidadInternacionalProyecto entidadInternacional : proyecto.getEntidadesInternacionalesProyecto()) {
            if (entidadInternacional.getIdEntidadInternacionalProyecto() == 0) {
                parametrosIngresoEntidadInternacional.addValue("varNombre", entidadInternacional.getNombre());
                ingresarEntidadInternacionalProyecto.execute(parametrosIngresoEntidadInternacional);
            }
        }
    }

    private void ActualizarFuentesFinanciacionProyecto(Proyecto proyecto) {
        MapSqlParameterSource parametrosConsultaFuentesFinanciacion = new MapSqlParameterSource();
        parametrosConsultaFuentesFinanciacion.addValue("varIdProyecto", proyecto.getIdProyecto());
        Map resultadoFuentesFinanciacion = obtenerFuentesFinanciacionProyecto.execute(parametrosConsultaFuentesFinanciacion);
        ArrayList<FuenteFinanciacionProyecto> fuentesFinanciacionActuales = (ArrayList<FuenteFinanciacionProyecto>) resultadoFuentesFinanciacion.get("fuentesFinanciacionProyecto");

        MapSqlParameterSource parametrosEliminacionFuenteFinanciacionProyecto = new MapSqlParameterSource();
        MapSqlParameterSource parametrosActualizacionFuenteFinanciacionProyecto = new MapSqlParameterSource();
        for (FuenteFinanciacionProyecto fuenteFinanciacionActual : fuentesFinanciacionActuales) {
            FuenteFinanciacionProyecto fuenteFinanciacionModificado = null;
            for (FuenteFinanciacionProyecto fuenteFinanciacion : proyecto.getFuentesFinanciacionProyecto()) {
                if (fuenteFinanciacion.getIdFuenteFinanciacionProyecto() == fuenteFinanciacionActual.getIdFuenteFinanciacionProyecto()) {
                    fuenteFinanciacionModificado = fuenteFinanciacion;
                    break;
                }
            }
            if (fuenteFinanciacionModificado == null) {
                parametrosEliminacionFuenteFinanciacionProyecto.addValue("varIdFuenteFinanciacionProyecto", fuenteFinanciacionActual.getIdFuenteFinanciacionProyecto());
                eliminarFuenteFinanciacionProyecto.execute(parametrosEliminacionFuenteFinanciacionProyecto);
            } else {
                parametrosActualizacionFuenteFinanciacionProyecto.addValue("varIdFuenteFinanciacionProyecto", fuenteFinanciacionModificado.getIdFuenteFinanciacionProyecto());
                parametrosActualizacionFuenteFinanciacionProyecto.addValue("varIdFuenteFinanciacion", fuenteFinanciacionModificado.getIdFuenteFinanciacion());
                parametrosActualizacionFuenteFinanciacionProyecto.addValue("varIdTipoFuenteFinanciacionProyecto", fuenteFinanciacionModificado.getIdTipoFuenteFinanciacionProyecto());
                parametrosActualizacionFuenteFinanciacionProyecto.addValue("varMontoFrescos", fuenteFinanciacionModificado.getMontoFrescos());
                parametrosActualizacionFuenteFinanciacionProyecto.addValue("varMontoEspecies", fuenteFinanciacionModificado.getMontoEspecies());
                actualizarFuenteFinanciacionProyecto.execute(parametrosActualizacionFuenteFinanciacionProyecto);
            }
        }

        MapSqlParameterSource parametrosIngresoFuenteFinanciacionProyecto = new MapSqlParameterSource();
        parametrosIngresoFuenteFinanciacionProyecto.addValue("varIdProyecto", proyecto.getIdProyecto());
        for (FuenteFinanciacionProyecto fuenteFinanciacion : proyecto.getFuentesFinanciacionProyecto()) {
            if (fuenteFinanciacion.getIdFuenteFinanciacionProyecto() == 0) {
                parametrosIngresoFuenteFinanciacionProyecto.addValue("varIdFuenteFinanciacion", fuenteFinanciacion.getIdFuenteFinanciacion());
                parametrosIngresoFuenteFinanciacionProyecto.addValue("varIdTipoFuenteFinanciacionProyecto", fuenteFinanciacion.getIdTipoFuenteFinanciacionProyecto());
                parametrosIngresoFuenteFinanciacionProyecto.addValue("varMontoFrescos", fuenteFinanciacion.getMontoFrescos());
                parametrosIngresoFuenteFinanciacionProyecto.addValue("varMontoEspecies", fuenteFinanciacion.getMontoEspecies());
                ingresarFuenteFinanciacionProyecto.execute(parametrosIngresoFuenteFinanciacionProyecto);
            }
        }
    }

    private void ActualizarAlertasAvalProyecto(Proyecto proyecto) {
        MapSqlParameterSource parametrosConsultaAlertasAvalProyecto = new MapSqlParameterSource();
        parametrosConsultaAlertasAvalProyecto.addValue("varIdProyecto", proyecto.getIdProyecto());
        Map resultadoAlertaAvalsProyecto = obtenerAlertasAvalProyecto.execute(parametrosConsultaAlertasAvalProyecto);
        ArrayList<AlertaAvalProyecto> alertasAvalProyectoActuales = (ArrayList<AlertaAvalProyecto>) resultadoAlertaAvalsProyecto.get("alertasAvalProyecto");

        MapSqlParameterSource parametrosEliminacionAlertaAvalProyecto = new MapSqlParameterSource();
        MapSqlParameterSource parametrosActualizacionAlertaAvalProyecto = new MapSqlParameterSource();
        for (AlertaAvalProyecto alertaAvalProyectoActual : alertasAvalProyectoActuales) {
            AlertaAvalProyecto alertaAvalProyectoModificado = null;
            for (AlertaAvalProyecto alertaAvalProyecto : proyecto.getAlertasAvalProyecto()) {
                if (alertaAvalProyecto.getIdAlertaAvalProyecto() == alertaAvalProyectoActual.getIdAlertaAvalProyecto()) {
                    alertaAvalProyectoModificado = alertaAvalProyecto;
                    break;
                }
            }
            if (alertaAvalProyectoModificado == null) {
                parametrosEliminacionAlertaAvalProyecto.addValue("varIdAlertaAvalProyecto", alertaAvalProyectoActual.getIdAlertaAvalProyecto());
                eliminarAlertaAvalProyecto.execute(parametrosEliminacionAlertaAvalProyecto);
            } else {
                parametrosActualizacionAlertaAvalProyecto.addValue("varIdAlertaAvalProyecto", alertaAvalProyectoModificado.getIdAlertaAvalProyecto());
                parametrosActualizacionAlertaAvalProyecto.addValue("varDescripcion", alertaAvalProyectoModificado.getDescripcion());
                parametrosActualizacionAlertaAvalProyecto.addValue("varIdTipoAval", alertaAvalProyectoModificado.getIdTipoAval());
                parametrosActualizacionAlertaAvalProyecto.addValue("varFechaActa", alertaAvalProyectoModificado.getFechaActa());
                parametrosActualizacionAlertaAvalProyecto.addValue("varNumeroActa", alertaAvalProyectoModificado.getNumeroActa());
                actualizarAlertaAvalProyecto.execute(parametrosActualizacionAlertaAvalProyecto);
            }
        }

        MapSqlParameterSource parametrosIngresoAlertaAvalProyecto = new MapSqlParameterSource();
        parametrosIngresoAlertaAvalProyecto.addValue("varIdProyecto", proyecto.getIdProyecto());
        for (AlertaAvalProyecto alertaAvalProyecto : proyecto.getAlertasAvalProyecto()) {
            if (alertaAvalProyecto.getIdAlertaAvalProyecto() == 0) {
                parametrosIngresoAlertaAvalProyecto.addValue("varDescripcion", alertaAvalProyecto.getDescripcion());
                parametrosIngresoAlertaAvalProyecto.addValue("varIdTipoAval", alertaAvalProyecto.getIdTipoAval());
                parametrosIngresoAlertaAvalProyecto.addValue("varFechaActa", alertaAvalProyecto.getFechaActa());
                parametrosIngresoAlertaAvalProyecto.addValue("varNumeroActa", alertaAvalProyecto.getNumeroActa());
                ingresarAlertaAvalProyecto.execute(parametrosIngresoAlertaAvalProyecto);
            }
        }
    }

    @Override
    public ArrayList<AlertaAvalProyecto> obtenerAlertasAvalProyecto(long idProyecto) {
        MapSqlParameterSource parametrosConsultaAlertaAvalsProyecto = new MapSqlParameterSource();
        parametrosConsultaAlertaAvalsProyecto.addValue("varIdProyecto", idProyecto);
        Map resultadoAlertaAvalsProyecto = obtenerAlertasAvalProyecto.execute(parametrosConsultaAlertaAvalsProyecto);
        ArrayList<AlertaAvalProyecto> alertasAvalProyecto = (ArrayList<AlertaAvalProyecto>) resultadoAlertaAvalsProyecto.get("alertasAvalProyecto");
        return alertasAvalProyecto;
    }

}
