/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.repositorios;

import co.edu.fnsp.gpci.entidades.AdendaCambioProyecto;
import co.edu.fnsp.gpci.entidades.AdendaIngresoProyecto;
import co.edu.fnsp.gpci.entidades.AdendaRetiroProyecto;
import co.edu.fnsp.gpci.entidades.ProyectoPorEstadoPorAnyo;
import co.edu.fnsp.gpci.entidades.CantidadProyectosPorEstado;
import co.edu.fnsp.gpci.entidades.CompromisoSeguimientoProyecto;
import co.edu.fnsp.gpci.entidades.PlazoSeguimientoProyecto;
import co.edu.fnsp.gpci.entidades.ProrrogaSeguimientoProyecto;
import co.edu.fnsp.gpci.entidades.ProyectoEstudiante;
import co.edu.fnsp.gpci.entidades.ProyectoPersonalExterno;
import co.edu.fnsp.gpci.entidades.ProyectoProfesor;
import co.edu.fnsp.gpci.entidades.ReporteFuenteFinanciacionProyecto;
import co.edu.fnsp.gpci.entidades.ReporteIntegranteProyecto;
import co.edu.fnsp.gpci.entidades.ReporteProfesorProyecto;
import co.edu.fnsp.gpci.entidades.ReporteProyectoInscrito;
import co.edu.fnsp.gpci.entidades.ReporteProyectoPorGrupoInvestigacion;
import co.edu.fnsp.gpci.entidades.SeguimientoProyecto;
import co.edu.fnsp.gpci.entidades.SeguimientoProyectoProfesor;
import co.edu.fnsp.gpci.utilidades.Util;
import java.util.ArrayList;
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
@Repository("repositorioReporte")
public class RepositorioReporte implements IRepositorioReporte {

    private SimpleJdbcCall obtenerIntegrantesProyectos;
    private SimpleJdbcCall obtenerProyectosPorGrupoInvestigacion;
    private SimpleJdbcCall obtenerFuentesFinanciacionProyectos;
    private SimpleJdbcCall obtenerProyectosEjecucionAtrasadosProfesor;
    private SimpleJdbcCall obtenerProyectosProfesor;
    private SimpleJdbcCall obtenerSeguimientoProyectosProfesor;
    private SimpleJdbcCall obtenerSeguimientoProyecto;
    private SimpleJdbcCall obtenerProrrogasSeguimientoProyecto;
    private SimpleJdbcCall obtenerPlazosSeguimientoProyecto;
    private SimpleJdbcCall obtenerCompromisosSeguimientoProyecto;
    private SimpleJdbcCall obtenerProyectosInscritos;
    private SimpleJdbcCall obtenerCantidadProyectosPorEstado;
    private SimpleJdbcCall obtenerCantidadProyectosPorEstadoPorAnyo;
    private SimpleJdbcCall obtenerProyectosCertificadoProfesor;
    private SimpleJdbcCall obtenerProyectosCertificadoEstudiante;
    private SimpleJdbcCall obtenerProyectosCertificadoPersonalExterno;
    private SimpleJdbcCall obtenerAdendasIngresoEstudianteProyecto;
    private SimpleJdbcCall obtenerAdendasCambioIngresoEstudianteProyecto;
    private SimpleJdbcCall obtenerAdendasCambioRetiroEstudianteProyecto;
    private SimpleJdbcCall obtenerAdendasRetiroEstudianteProyecto;
    private SimpleJdbcCall obtenerAdendasIngresoProfesorProyecto;
    private SimpleJdbcCall obtenerAdendasCambioIngresoProfesorProyecto;
    private SimpleJdbcCall obtenerAdendasCambioRetiroProfesorProyecto;
    private SimpleJdbcCall obtenerAdendasRetiroProfesorProyecto;
    
    @Autowired
    public void setDataSource(DataSource dataSource) {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        jdbcTemplate.setResultsMapCaseInsensitive(true);

        this.obtenerIntegrantesProyectos = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerIntegrantesProyectos").returningResultSet("proyectos", BeanPropertyRowMapper.newInstance(ReporteIntegranteProyecto.class));
        this.obtenerProyectosPorGrupoInvestigacion = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerProyectosPorGrupoInvestigacion").returningResultSet("proyectos", BeanPropertyRowMapper.newInstance(ReporteProyectoPorGrupoInvestigacion.class));
        this.obtenerFuentesFinanciacionProyectos = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerFuentesFinanciacionProyectos").returningResultSet("proyectos", BeanPropertyRowMapper.newInstance(ReporteFuenteFinanciacionProyecto.class));
        this.obtenerProyectosEjecucionAtrasadosProfesor = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerProyectosEjecucionAtrasadosProfesor").returningResultSet("proyectos", BeanPropertyRowMapper.newInstance(ReporteProfesorProyecto.class));
        this.obtenerProyectosProfesor = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerProyectosProfesor").returningResultSet("proyectos", BeanPropertyRowMapper.newInstance(ReporteProfesorProyecto.class));
        this.obtenerSeguimientoProyectosProfesor = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerSeguimientoProyectosProfesor").returningResultSet("proyectos", BeanPropertyRowMapper.newInstance(SeguimientoProyectoProfesor.class));
        this.obtenerSeguimientoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerSeguimientoProyecto").returningResultSet("proyectos", BeanPropertyRowMapper.newInstance(SeguimientoProyecto.class));
        this.obtenerPlazosSeguimientoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerPlazosSeguimientoProyecto").returningResultSet("plazos", BeanPropertyRowMapper.newInstance(PlazoSeguimientoProyecto.class));
        this.obtenerProrrogasSeguimientoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerProrrogasSeguimientoProyecto").returningResultSet("prorrogas", BeanPropertyRowMapper.newInstance(ProrrogaSeguimientoProyecto.class));
        this.obtenerCompromisosSeguimientoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerCompromisosSeguimientoProyecto").returningResultSet("compromisos", BeanPropertyRowMapper.newInstance(CompromisoSeguimientoProyecto.class));
        this.obtenerProyectosInscritos = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerProyectosInscritos").returningResultSet("proyectos", BeanPropertyRowMapper.newInstance(ReporteProyectoInscrito.class));
        this.obtenerCantidadProyectosPorEstado = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerCantidadProyectosPorEstado");
        this.obtenerCantidadProyectosPorEstadoPorAnyo = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerCantidadProyectosPorEstadoPorAnyo").returningResultSet("proyectos", BeanPropertyRowMapper.newInstance(ProyectoPorEstadoPorAnyo.class));
        this.obtenerProyectosCertificadoProfesor = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerProyectosCertificadoProfesor").returningResultSet("proyectos", BeanPropertyRowMapper.newInstance(ProyectoProfesor.class));
        this.obtenerProyectosCertificadoEstudiante = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerProyectosCertificadoEstudiante").returningResultSet("proyectos", BeanPropertyRowMapper.newInstance(ProyectoEstudiante.class));
        this.obtenerProyectosCertificadoPersonalExterno = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerProyectosCertificadoPersonalExterno").returningResultSet("proyectos", BeanPropertyRowMapper.newInstance(ProyectoPersonalExterno.class));
        this.obtenerAdendasIngresoEstudianteProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerAdendasIngresoEstudianteProyecto").returningResultSet("adendasIngresoEstudianteProyecto", BeanPropertyRowMapper.newInstance(AdendaIngresoProyecto.class));
        this.obtenerAdendasRetiroEstudianteProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerAdendasRetiroEstudianteProyecto").returningResultSet("adendasRetiroEstudianteProyecto", BeanPropertyRowMapper.newInstance(AdendaRetiroProyecto.class));
        this.obtenerAdendasCambioIngresoEstudianteProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerAdendasCambioIngresoEstudianteProyecto").returningResultSet("adendasCambioIngresoEstudianteProyecto", BeanPropertyRowMapper.newInstance(AdendaCambioProyecto.class));
        this.obtenerAdendasCambioRetiroEstudianteProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerAdendasCambioRetiroEstudianteProyecto").returningResultSet("adendasCambioRetiroEstudianteProyecto", BeanPropertyRowMapper.newInstance(AdendaCambioProyecto.class));
        this.obtenerAdendasIngresoProfesorProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerAdendasIngresoProfesorProyecto").returningResultSet("adendasIngresoProfesorProyecto", BeanPropertyRowMapper.newInstance(AdendaIngresoProyecto.class));
        this.obtenerAdendasRetiroProfesorProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerAdendasRetiroProfesorProyecto").returningResultSet("adendasRetiroProfesorProyecto", BeanPropertyRowMapper.newInstance(AdendaRetiroProyecto.class));
        this.obtenerAdendasCambioIngresoProfesorProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerAdendasCambioIngresoProfesorProyecto").returningResultSet("adendasCambioIngresoProfesorProyecto", BeanPropertyRowMapper.newInstance(AdendaCambioProyecto.class));
        this.obtenerAdendasCambioRetiroProfesorProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerAdendasCambioRetiroProfesorProyecto").returningResultSet("adendasCambioRetiroProfesorProyecto", BeanPropertyRowMapper.newInstance(AdendaCambioProyecto.class));
    }

    @Override
    public List<ReporteIntegranteProyecto> obtenerIntegrantesProyectos() {
        MapSqlParameterSource parametros = new MapSqlParameterSource();

        Map resultado = obtenerIntegrantesProyectos.execute(parametros);
        ArrayList<ReporteIntegranteProyecto> proyectos = (ArrayList<ReporteIntegranteProyecto>) resultado.get("proyectos");

        return proyectos;
    }

    @Override
    public List<ReporteProyectoPorGrupoInvestigacion> obtenerProyectosPorGrupoInvestigacion() {
        MapSqlParameterSource parametros = new MapSqlParameterSource();

        Map resultado = obtenerProyectosPorGrupoInvestigacion.execute(parametros);
        ArrayList<ReporteProyectoPorGrupoInvestigacion> proyectos = (ArrayList<ReporteProyectoPorGrupoInvestigacion>) resultado.get("proyectos");

        return proyectos;
    }

    @Override
    public List<ReporteFuenteFinanciacionProyecto> obtenerFuentesFinanciacionProyectos() {
        MapSqlParameterSource parametros = new MapSqlParameterSource();

        Map resultado = obtenerFuentesFinanciacionProyectos.execute(parametros);
        ArrayList<ReporteFuenteFinanciacionProyecto> proyectos = (ArrayList<ReporteFuenteFinanciacionProyecto>) resultado.get("proyectos");

        for (ReporteFuenteFinanciacionProyecto proyecto : proyectos) {
            proyecto.setMontoFrescosFormateado(Util.obtenerNumeroFormatoMoneda(proyecto.getMontoFrescos()));
            proyecto.setMontoEspeciesFormateado(Util.obtenerNumeroFormatoMoneda(proyecto.getMontoEspecies()));
            proyecto.setSubtotalRecursosFormateado(Util.obtenerNumeroFormatoMoneda(proyecto.getSubtotalRecursos()));
            proyecto.setTotalRecursosFormateado(Util.obtenerNumeroFormatoMoneda(proyecto.getTotalRecursos()));
        }

        return proyectos;
    }

    @Override
    public List<ReporteProfesorProyecto> obtenerProyectosEjecucionAtrasadosProfesor(long numeroIdentificacion) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varNumeroIdentificacion", numeroIdentificacion);

        Map resultado = obtenerProyectosEjecucionAtrasadosProfesor.execute(parametros);
        ArrayList<ReporteProfesorProyecto> proyectos = (ArrayList<ReporteProfesorProyecto>) resultado.get("proyectos");

        for (ReporteProfesorProyecto proyecto : proyectos) {
            proyecto.setFechaInicioFormateada(Util.obtenerFechaFormateada(proyecto.getFechaInicio()));
            proyecto.setFechaFinalizacionFormateada(Util.obtenerFechaFormateada(proyecto.getFechaFinalizacion()));
        }

        return proyectos;
    }

    @Override
    public List<ReporteProfesorProyecto> obtenerProyectosProfesor(long numeroIdentificacion) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varNumeroIdentificacion", numeroIdentificacion);

        Map resultado = obtenerProyectosProfesor.execute(parametros);
        ArrayList<ReporteProfesorProyecto> proyectos = (ArrayList<ReporteProfesorProyecto>) resultado.get("proyectos");

        for (ReporteProfesorProyecto proyecto : proyectos) {
            proyecto.setFechaInicioFormateada(Util.obtenerFechaFormateada(proyecto.getFechaInicio()));
            proyecto.setFechaFinalizacionFormateada(Util.obtenerFechaFormateada(proyecto.getFechaFinalizacion()));
        }

        return proyectos;
    }

    @Override
    public List<ReporteProyectoInscrito> obtenerProyectosInscritos() {
        MapSqlParameterSource parametros = new MapSqlParameterSource();

        Map resultado = obtenerProyectosInscritos.execute(parametros);
        ArrayList<ReporteProyectoInscrito> proyectos = (ArrayList<ReporteProyectoInscrito>) resultado.get("proyectos");

        return proyectos;
    }

    @Override
    public CantidadProyectosPorEstado obtenerCantidadProyectosPorEstado() {
        CantidadProyectosPorEstado cantidadProyectosPorEstado = new CantidadProyectosPorEstado();
        MapSqlParameterSource parametros = new MapSqlParameterSource();

        Map resultado = obtenerCantidadProyectosPorEstado.execute(parametros);

        cantidadProyectosPorEstado.setCantidadProyectosAtrasados((int) resultado.get("varCantidadProyectosAtrasados"));
        cantidadProyectosPorEstado.setCantidadProyectosFinalizados((int) resultado.get("varCantidadProyectosFinalizados"));
        cantidadProyectosPorEstado.setCantidadProyectosCancelados((int) resultado.get("varCantidadProyectosCancelados"));
        cantidadProyectosPorEstado.setCantidadProyectosEjecucion((int) resultado.get("varCantidadProyectosEjecucion"));
        cantidadProyectosPorEstado.setCantidadProyectosTrasladados((int) resultado.get("varCantidadProyectosTrasladados"));

        return cantidadProyectosPorEstado;
    }

    @Override
    public List<ProyectoPorEstadoPorAnyo> obtenerProyectosPorEstadoPorAnyo() {
        MapSqlParameterSource parametrosConsultaCantidadProyectosPorEstadoPorAnyo = new MapSqlParameterSource();
        Map resultadoProyectosPorEstadoPorAnyo = obtenerCantidadProyectosPorEstadoPorAnyo.execute(parametrosConsultaCantidadProyectosPorEstadoPorAnyo);
        ArrayList<ProyectoPorEstadoPorAnyo> proyectosPorEstadoPorAnyo = (ArrayList<ProyectoPorEstadoPorAnyo>) resultadoProyectosPorEstadoPorAnyo.get("proyectos");

        return proyectosPorEstadoPorAnyo;
    }

    @Override
    public List<ProyectoProfesor> obtenerProyectosCertificadoProfesor(long idProfesor) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdProfesor", idProfesor);

        Map resultado = obtenerProyectosCertificadoProfesor.execute(parametros);
        ArrayList<ProyectoProfesor> proyectos = (ArrayList<ProyectoProfesor>) resultado.get("proyectos");

        for(ProyectoProfesor proyectoProfesor : proyectos) {
            MapSqlParameterSource parametrosAdenda = new MapSqlParameterSource();
            parametrosAdenda.addValue("varIdProyecto", proyectoProfesor.getIdProyecto());
            parametrosAdenda.addValue("varIdProfesor", idProfesor);
            
            Map resultadoAdendasIngreso = obtenerAdendasIngresoProfesorProyecto.execute(parametrosAdenda);
            ArrayList<AdendaIngresoProyecto> adendasIngreso = (ArrayList<AdendaIngresoProyecto>) resultadoAdendasIngreso.get("adendasIngresoProfesorProyecto");
            for (AdendaIngresoProyecto adendaProyecto : adendasIngreso) {
                proyectoProfesor.setFechaInicio(adendaProyecto.getFechaIngreso());
                break;
            }
        
            Map resultadoAdendasIngresoCambio = obtenerAdendasCambioIngresoProfesorProyecto.execute(parametrosAdenda);
            ArrayList<AdendaCambioProyecto> adendasCambioIngreso = (ArrayList<AdendaCambioProyecto>) resultadoAdendasIngresoCambio.get("adendasCambioIngresoProfesorProyecto");
            for (AdendaCambioProyecto adendaProyecto : adendasCambioIngreso) {
               proyectoProfesor.setFechaInicio(adendaProyecto.getFechaCambio());
               break;
            }

            Map resultadoAdendasRetiroCambio = obtenerAdendasCambioRetiroProfesorProyecto.execute(parametrosAdenda);
            ArrayList<AdendaCambioProyecto> adendasCambioRetiro = (ArrayList<AdendaCambioProyecto>) resultadoAdendasRetiroCambio.get("adendasCambioRetiroProfesorProyecto");
            for (AdendaCambioProyecto adendaProyecto : adendasCambioRetiro) {
               proyectoProfesor.setFechaFinalizacion(adendaProyecto.getFechaCambio());
               break;
            }

            Map resultadoAdendasRetiro = obtenerAdendasRetiroProfesorProyecto.execute(parametrosAdenda);
            ArrayList<AdendaRetiroProyecto> adendasRetiro = (ArrayList<AdendaRetiroProyecto>) resultadoAdendasRetiro.get("adendasRetiroProfesorProyecto");
            for (AdendaRetiroProyecto adendaProyecto : adendasRetiro) {
                proyectoProfesor.setFechaFinalizacion(adendaProyecto.getFechaRetiro());
                break;
            }
        }

        return proyectos;
    }

    @Override
    public List<ProyectoEstudiante> obtenerProyectosCertificadoEstudiante(long idEstudiante) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdEstudiante", idEstudiante);

        Map resultado = obtenerProyectosCertificadoEstudiante.execute(parametros);
        ArrayList<ProyectoEstudiante> proyectos = (ArrayList<ProyectoEstudiante>) resultado.get("proyectos");
        for(ProyectoEstudiante proyectoEstudiante : proyectos) {
            MapSqlParameterSource parametrosAdenda = new MapSqlParameterSource();
            parametrosAdenda.addValue("varIdProyecto", proyectoEstudiante.getIdProyecto());
            parametrosAdenda.addValue("varIdEstudiante", idEstudiante);
            
            Map resultadoAdendasIngreso = obtenerAdendasIngresoEstudianteProyecto.execute(parametrosAdenda);
            ArrayList<AdendaIngresoProyecto> adendasIngreso = (ArrayList<AdendaIngresoProyecto>) resultadoAdendasIngreso.get("adendasIngresoEstudianteProyecto");
            for (AdendaIngresoProyecto adendaProyecto : adendasIngreso) {
                proyectoEstudiante.setFechaInicio(adendaProyecto.getFechaIngreso());
                break;
            }
        
            Map resultadoAdendasIngresoCambio = obtenerAdendasCambioIngresoEstudianteProyecto.execute(parametrosAdenda);
            ArrayList<AdendaCambioProyecto> adendasCambioIngreso = (ArrayList<AdendaCambioProyecto>) resultadoAdendasIngresoCambio.get("adendasCambioIngresoEstudianteProyecto");
            for (AdendaCambioProyecto adendaProyecto : adendasCambioIngreso) {
               proyectoEstudiante.setFechaInicio(adendaProyecto.getFechaCambio());
               break;
            }

            Map resultadoAdendasRetiroCambio = obtenerAdendasCambioRetiroEstudianteProyecto.execute(parametrosAdenda);
            ArrayList<AdendaCambioProyecto> adendasCambioRetiro = (ArrayList<AdendaCambioProyecto>) resultadoAdendasRetiroCambio.get("adendasCambioRetiroEstudianteProyecto");
            for (AdendaCambioProyecto adendaProyecto : adendasCambioRetiro) {
               proyectoEstudiante.setFechaFinalizacion(adendaProyecto.getFechaCambio());
               break;
            }

            Map resultadoAdendasRetiro = obtenerAdendasRetiroEstudianteProyecto.execute(parametrosAdenda);
            ArrayList<AdendaRetiroProyecto> adendasRetiro = (ArrayList<AdendaRetiroProyecto>) resultadoAdendasRetiro.get("adendasRetiroEstudianteProyecto");
            for (AdendaRetiroProyecto adendaProyecto : adendasRetiro) {
                proyectoEstudiante.setFechaFinalizacion(adendaProyecto.getFechaRetiro());
                break;
            }
        }

        return proyectos;
    }

    @Override
    public List<ProyectoPersonalExterno> obtenerProyectosCertificadoPersonalExterno(long idPersonalExterno) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdPersonalExterno", idPersonalExterno);

        Map resultado = obtenerProyectosCertificadoPersonalExterno.execute(parametros);
        ArrayList<ProyectoPersonalExterno> proyectos = (ArrayList<ProyectoPersonalExterno>) resultado.get("proyectos");

        return proyectos;
    }

    @Override
    public List<SeguimientoProyectoProfesor> obtenerSeguimientoProyectosProfesor(long idProfesor) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdProfesor", idProfesor);

        Map resultado = obtenerSeguimientoProyectosProfesor.execute(parametros);
        ArrayList<SeguimientoProyectoProfesor> proyectos = (ArrayList<SeguimientoProyectoProfesor>) resultado.get("proyectos");

        MapSqlParameterSource parametrosInformacionAdicional = new MapSqlParameterSource();
        for (SeguimientoProyectoProfesor proyecto : proyectos) {
            parametrosInformacionAdicional.addValue("varIdProyecto", proyecto.getIdProyecto());

            resultado = obtenerProrrogasSeguimientoProyecto.execute(parametrosInformacionAdicional);
            ArrayList<ProrrogaSeguimientoProyecto> prorrogas = (ArrayList<ProrrogaSeguimientoProyecto>) resultado.get("prorrogas");
            proyecto.setProrrogas(prorrogas);
            for(ProrrogaSeguimientoProyecto prorroga : prorrogas ) {
                prorroga.setMontoFormateado(Util.obtenerNumeroFormatoMoneda(prorroga.getMonto()));
            }

            resultado = obtenerPlazosSeguimientoProyecto.execute(parametrosInformacionAdicional);
            ArrayList<PlazoSeguimientoProyecto> plazos = (ArrayList<PlazoSeguimientoProyecto>) resultado.get("plazos");
            proyecto.setPlazos(plazos);

            resultado = obtenerCompromisosSeguimientoProyecto.execute(parametrosInformacionAdicional);
            ArrayList<CompromisoSeguimientoProyecto> compromisos = (ArrayList<CompromisoSeguimientoProyecto>) resultado.get("compromisos");
            proyecto.setCompromisos(compromisos);
        }

        return proyectos;
    }

    @Override
    public List<SeguimientoProyecto> obtenerSeguimientoProyecto(String codigo) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varCodigo", codigo);

        Map resultado = obtenerSeguimientoProyecto.execute(parametros);
        ArrayList<SeguimientoProyecto> proyectos = (ArrayList<SeguimientoProyecto>) resultado.get("proyectos");

        MapSqlParameterSource parametrosInformacionAdicional = new MapSqlParameterSource();
        for (SeguimientoProyecto proyecto : proyectos) {
            parametrosInformacionAdicional.addValue("varIdProyecto", proyecto.getIdProyecto());

            resultado = obtenerProrrogasSeguimientoProyecto.execute(parametrosInformacionAdicional);
            ArrayList<ProrrogaSeguimientoProyecto> prorrogas = (ArrayList<ProrrogaSeguimientoProyecto>) resultado.get("prorrogas");
            proyecto.setProrrogas(prorrogas);
            for(ProrrogaSeguimientoProyecto prorroga : prorrogas ) {
                prorroga.setMontoFormateado(Util.obtenerNumeroFormatoMoneda(prorroga.getMonto()));
            }

            resultado = obtenerPlazosSeguimientoProyecto.execute(parametrosInformacionAdicional);
            ArrayList<PlazoSeguimientoProyecto> plazos = (ArrayList<PlazoSeguimientoProyecto>) resultado.get("plazos");
            proyecto.setPlazos(plazos);

            resultado = obtenerCompromisosSeguimientoProyecto.execute(parametrosInformacionAdicional);
            ArrayList<CompromisoSeguimientoProyecto> compromisos = (ArrayList<CompromisoSeguimientoProyecto>) resultado.get("compromisos");
            proyecto.setCompromisos(compromisos);
        }

        return proyectos;
    }

}
