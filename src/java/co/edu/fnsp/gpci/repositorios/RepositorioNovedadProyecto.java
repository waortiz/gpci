/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.repositorios;

import co.edu.fnsp.gpci.entidades.ActaProyecto;
import co.edu.fnsp.gpci.entidades.AdendaCambioProyecto;
import co.edu.fnsp.gpci.entidades.AdendaIngresoProyecto;
import co.edu.fnsp.gpci.entidades.AdendaRetiroProyecto;
import co.edu.fnsp.gpci.entidades.AdicionProyecto;
import co.edu.fnsp.gpci.entidades.AreaTematica;
import co.edu.fnsp.gpci.entidades.CompromisoHomologadoProyecto;
import co.edu.fnsp.gpci.entidades.CumplimientoAlertaAvalProyecto;
import co.edu.fnsp.gpci.entidades.CumplimientoCompromisoProyecto;
import co.edu.fnsp.gpci.entidades.Documento;
import co.edu.fnsp.gpci.entidades.PlazoProyecto;
import co.edu.fnsp.gpci.entidades.ProrrogaProyecto;
import co.edu.fnsp.gpci.entidades.Proyecto;
import co.edu.fnsp.gpci.entidades.ReporteProyecto;
import co.edu.fnsp.gpci.entidades.TipoProyecto;
import co.edu.fnsp.gpci.utilidades.Util;
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
@Repository("repositorioNovedadProyecto")
public class RepositorioNovedadProyecto implements IRepositorioNovedadProyecto {

    private SimpleJdbcCall obtenerProyecto;
    private SimpleJdbcCall obtenerProyectos;

    private SimpleJdbcCall ingresarAdendaCambioProyecto;
    private SimpleJdbcCall actualizarAdendaCambioProyecto;
    private SimpleJdbcCall eliminarAdendaCambioProyecto;
    private SimpleJdbcCall obtenerAdendasCambioProyecto;
    private SimpleJdbcCall ingresarDocumentoAdendaCambioProyecto;
    private SimpleJdbcCall obtenerDocumentoAdendaCambioProyecto;
    private SimpleJdbcCall actualizarDocumentoAdendaCambioProyecto;

    private SimpleJdbcCall ingresarAdendaIngresoProyecto;
    private SimpleJdbcCall actualizarAdendaIngresoProyecto;
    private SimpleJdbcCall eliminarAdendaIngresoProyecto;
    private SimpleJdbcCall obtenerAdendasIngresoProyecto;
    private SimpleJdbcCall ingresarDocumentoAdendaIngresoProyecto;
    private SimpleJdbcCall obtenerDocumentoAdendaIngresoProyecto;
    private SimpleJdbcCall actualizarDocumentoAdendaIngresoProyecto;

    private SimpleJdbcCall ingresarAdendaRetiroProyecto;
    private SimpleJdbcCall actualizarAdendaRetiroProyecto;
    private SimpleJdbcCall eliminarAdendaRetiroProyecto;
    private SimpleJdbcCall obtenerAdendasRetiroProyecto;
    private SimpleJdbcCall ingresarDocumentoAdendaRetiroProyecto;
    private SimpleJdbcCall obtenerDocumentoAdendaRetiroProyecto;
    private SimpleJdbcCall actualizarDocumentoAdendaRetiroProyecto;

    private SimpleJdbcCall ingresarActaProyecto;
    private SimpleJdbcCall actualizarActaProyecto;
    private SimpleJdbcCall eliminarActaProyecto;
    private SimpleJdbcCall obtenerActasProyecto;
    private SimpleJdbcCall ingresarDocumentoActaProyecto;
    private SimpleJdbcCall obtenerDocumentoActaProyecto;
    private SimpleJdbcCall actualizarDocumentoActaProyecto;

    private SimpleJdbcCall ingresarProrrogaProyecto;
    private SimpleJdbcCall actualizarProrrogaProyecto;
    private SimpleJdbcCall eliminarProrrogaProyecto;
    private SimpleJdbcCall obtenerProrrogasProyecto;
    private SimpleJdbcCall ingresarDocumentoProrrogaProyecto;
    private SimpleJdbcCall obtenerDocumentoProrrogaProyecto;
    private SimpleJdbcCall actualizarDocumentoProrrogaProyecto;

    private SimpleJdbcCall ingresarPlazoProyecto;
    private SimpleJdbcCall actualizarPlazoProyecto;
    private SimpleJdbcCall eliminarPlazoProyecto;
    private SimpleJdbcCall obtenerPlazosProyecto;
    private SimpleJdbcCall ingresarDocumentoPlazoProyecto;
    private SimpleJdbcCall obtenerDocumentoPlazoProyecto;
    private SimpleJdbcCall actualizarDocumentoPlazoProyecto;

    private SimpleJdbcCall ingresarAdicionProyecto;
    private SimpleJdbcCall actualizarAdicionProyecto;
    private SimpleJdbcCall eliminarAdicionProyecto;
    private SimpleJdbcCall obtenerAdicionesProyecto;
    private SimpleJdbcCall ingresarDocumentoAdicionProyecto;
    private SimpleJdbcCall obtenerDocumentoAdicionProyecto;
    private SimpleJdbcCall actualizarDocumentoAdicionProyecto;

    private SimpleJdbcCall ingresarCumplimientoCompromisoProyecto;
    private SimpleJdbcCall actualizarCumplimientoCompromisoProyecto;
    private SimpleJdbcCall eliminarCumplimientoCompromisoProyecto;
    private SimpleJdbcCall obtenerCumplimientoCompromisosProyecto;
    private SimpleJdbcCall ingresarDocumentoCumplimientoCompromisoProyecto;
    private SimpleJdbcCall obtenerDocumentoCumplimientoCompromisoProyecto;
    private SimpleJdbcCall actualizarDocumentoCumplimientoCompromisoProyecto;

    private SimpleJdbcCall ingresarCumplimientoAlertaAvalProyecto;
    private SimpleJdbcCall actualizarCumplimientoAlertaAvalProyecto;
    private SimpleJdbcCall eliminarCumplimientoAlertaAvalProyecto;
    private SimpleJdbcCall obtenerCumplimientosAlertasAvalProyecto;
    private SimpleJdbcCall ingresarDocumentoCumplimientoAlertaAvalProyecto;
    private SimpleJdbcCall obtenerDocumentoCumplimientoAlertaAvalProyecto;
    private SimpleJdbcCall actualizarDocumentoCumplimientoAlertaAvalProyecto;

    private SimpleJdbcCall ingresarCompromisoHomologadoProyecto;
    private SimpleJdbcCall actualizarCompromisoHomologadoProyecto;
    private SimpleJdbcCall eliminarCompromisoHomologadoProyecto;
    private SimpleJdbcCall obtenerCompromisosHomologadosProyecto;
    
    @Autowired
    public void setDataSource(DataSource dataSource) {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        jdbcTemplate.setResultsMapCaseInsensitive(true);

        this.obtenerProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerProyecto");
        this.obtenerProyectos = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerProyectos").returningResultSet("proyectos", BeanPropertyRowMapper.newInstance(ReporteProyecto.class));

        this.ingresarAdendaCambioProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarAdendaCambioProyecto");
        this.eliminarAdendaCambioProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("EliminarAdendaCambioProyecto");
        this.actualizarAdendaCambioProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarAdendaCambioProyecto");
        this.obtenerAdendasCambioProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerAdendasCambioProyecto").returningResultSet("adendasCambioProyecto", BeanPropertyRowMapper.newInstance(AdendaCambioProyecto.class));
        this.ingresarDocumentoAdendaCambioProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarDocumentoAdendaCambioProyecto");
        this.obtenerDocumentoAdendaCambioProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerDocumentoAdendaCambioProyecto");
        this.actualizarDocumentoAdendaCambioProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarDocumentoAdendaCambioProyecto");

        this.ingresarAdendaIngresoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarAdendaIngresoProyecto");
        this.eliminarAdendaIngresoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("EliminarAdendaIngresoProyecto");
        this.actualizarAdendaIngresoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarAdendaIngresoProyecto");
        this.obtenerAdendasIngresoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerAdendasIngresoProyecto").returningResultSet("adendasIngresoProyecto", BeanPropertyRowMapper.newInstance(AdendaIngresoProyecto.class));
        this.ingresarDocumentoAdendaIngresoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarDocumentoAdendaIngresoProyecto");
        this.obtenerDocumentoAdendaIngresoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerDocumentoAdendaIngresoProyecto");
        this.actualizarDocumentoAdendaIngresoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarDocumentoAdendaIngresoProyecto");

        this.ingresarAdendaRetiroProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarAdendaRetiroProyecto");
        this.eliminarAdendaRetiroProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("EliminarAdendaRetiroProyecto");
        this.actualizarAdendaRetiroProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarAdendaRetiroProyecto");
        this.obtenerAdendasRetiroProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerAdendasRetiroProyecto").returningResultSet("adendasRetiroProyecto", BeanPropertyRowMapper.newInstance(AdendaRetiroProyecto.class));
        this.ingresarDocumentoAdendaRetiroProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarDocumentoAdendaRetiroProyecto");
        this.obtenerDocumentoAdendaRetiroProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerDocumentoAdendaRetiroProyecto");
        this.actualizarDocumentoAdendaRetiroProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarDocumentoAdendaRetiroProyecto");

        this.ingresarActaProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarActaProyecto");
        this.eliminarActaProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("EliminarActaProyecto");
        this.actualizarActaProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarActaProyecto");
        this.obtenerActasProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerActasProyecto").returningResultSet("actasProyecto", BeanPropertyRowMapper.newInstance(ActaProyecto.class));
        this.ingresarDocumentoActaProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarDocumentoActaProyecto");
        this.obtenerDocumentoActaProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerDocumentoActaProyecto");
        this.actualizarDocumentoActaProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarDocumentoActaProyecto");

        this.ingresarAdicionProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarAdicionProyecto");
        this.eliminarAdicionProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("EliminarAdicionProyecto");
        this.actualizarAdicionProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarAdicionProyecto");
        this.obtenerAdicionesProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerAdicionesProyecto").returningResultSet("adicionesProyecto", BeanPropertyRowMapper.newInstance(AdicionProyecto.class));
        this.ingresarDocumentoAdicionProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarDocumentoAdicionProyecto");
        this.obtenerDocumentoAdicionProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerDocumentoAdicionProyecto");
        this.actualizarDocumentoAdicionProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarDocumentoAdicionProyecto");

        this.ingresarProrrogaProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarProrrogaProyecto");
        this.eliminarProrrogaProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("EliminarProrrogaProyecto");
        this.actualizarProrrogaProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarProrrogaProyecto");
        this.obtenerProrrogasProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerProrrogasProyecto").returningResultSet("prorrogasProyecto", BeanPropertyRowMapper.newInstance(ProrrogaProyecto.class));
        this.ingresarDocumentoProrrogaProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarDocumentoProrrogaProyecto");
        this.obtenerDocumentoProrrogaProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerDocumentoProrrogaProyecto");
        this.actualizarDocumentoProrrogaProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarDocumentoProrrogaProyecto");

        this.ingresarPlazoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarPlazoProyecto");
        this.eliminarPlazoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("EliminarPlazoProyecto");
        this.actualizarPlazoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarPlazoProyecto");
        this.obtenerPlazosProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerPlazosProyecto").returningResultSet("plazosProyecto", BeanPropertyRowMapper.newInstance(PlazoProyecto.class));
        this.ingresarDocumentoPlazoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarDocumentoPlazoProyecto");
        this.obtenerDocumentoPlazoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerDocumentoPlazoProyecto");
        this.actualizarDocumentoPlazoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarDocumentoPlazoProyecto");

        this.ingresarCumplimientoCompromisoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarCumplimientoCompromisoProyecto");
        this.eliminarCumplimientoCompromisoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("EliminarCumplimientoCompromisoProyecto");
        this.actualizarCumplimientoCompromisoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarCumplimientoCompromisoProyecto");
        this.obtenerCumplimientoCompromisosProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerCumplimientoCompromisosProyecto").returningResultSet("cumplimientoCompromisosProyecto", BeanPropertyRowMapper.newInstance(CumplimientoCompromisoProyecto.class));
        this.ingresarDocumentoCumplimientoCompromisoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarDocumentoCumplimientoCompromisoProyecto");
        this.obtenerDocumentoCumplimientoCompromisoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerDocumentoCumplimientoCompromisoProyecto");
        this.actualizarDocumentoCumplimientoCompromisoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarDocumentoCumplimientoCompromisoProyecto");

        this.ingresarCompromisoHomologadoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarCompromisoHomologadoProyecto");
        this.eliminarCompromisoHomologadoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("EliminarCompromisoHomologadoProyecto");
        this.actualizarCompromisoHomologadoProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarCompromisoHomologadoProyecto");
        this.obtenerCompromisosHomologadosProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerCompromisosHomologadosProyecto").returningResultSet("compromisosHomologadosProyecto", BeanPropertyRowMapper.newInstance(CompromisoHomologadoProyecto.class));
        
        this.ingresarCumplimientoAlertaAvalProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarCumplimientoAlertaAvalProyecto");
        this.eliminarCumplimientoAlertaAvalProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("EliminarCumplimientoAlertaAvalProyecto");
        this.actualizarCumplimientoAlertaAvalProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarCumplimientoAlertaAvalProyecto");
        this.obtenerCumplimientosAlertasAvalProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerCumplimientoAlertasAvalProyecto").returningResultSet("cumplimientosAlertasAvalProyecto", BeanPropertyRowMapper.newInstance(CumplimientoAlertaAvalProyecto.class));
        this.ingresarDocumentoCumplimientoAlertaAvalProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarDocumentoCumplimientoAlertaAvalProyecto");
        this.obtenerDocumentoCumplimientoAlertaAvalProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerDocumentoCumplimientoAlertaAvalProyecto");
        this.actualizarDocumentoCumplimientoAlertaAvalProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarDocumentoCumplimientoAlertaAvalProyecto");
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

        Map resultadoAdendasIngreso = obtenerAdendasIngresoProyecto.execute(parametros);
        ArrayList<AdendaIngresoProyecto> adendasIngreso = (ArrayList<AdendaIngresoProyecto>) resultadoAdendasIngreso.get("adendasIngresoProyecto");
        for (AdendaIngresoProyecto adendaProyecto : adendasIngreso) {
            adendaProyecto.setFechaIngresoFormateada(Util.obtenerFechaFormateada(adendaProyecto.getFechaIngreso()));
            adendaProyecto.setFechaActaFormateada(Util.obtenerFechaFormateada(adendaProyecto.getFechaActa()));
        }
        proyecto.setAdendasIngresoProyecto(adendasIngreso);

        Map resultadoAdendasCambio = obtenerAdendasCambioProyecto.execute(parametros);
        ArrayList<AdendaCambioProyecto> adendasCambio = (ArrayList<AdendaCambioProyecto>) resultadoAdendasCambio.get("adendasCambioProyecto");
        for (AdendaCambioProyecto adendaProyecto : adendasCambio) {
            adendaProyecto.setFechaCambioFormateada(Util.obtenerFechaFormateada(adendaProyecto.getFechaCambio()));
            adendaProyecto.setFechaActaFormateada(Util.obtenerFechaFormateada(adendaProyecto.getFechaActa()));
        }
        proyecto.setAdendasCambioProyecto(adendasCambio);

        Map resultadoAdendasRetiro = obtenerAdendasRetiroProyecto.execute(parametros);
        ArrayList<AdendaRetiroProyecto> adendasRetiro = (ArrayList<AdendaRetiroProyecto>) resultadoAdendasRetiro.get("adendasRetiroProyecto");
        for (AdendaRetiroProyecto adendaProyecto : adendasRetiro) {
            adendaProyecto.setFechaRetiroFormateada(Util.obtenerFechaFormateada(adendaProyecto.getFechaRetiro()));
            adendaProyecto.setFechaActaFormateada(Util.obtenerFechaFormateada(adendaProyecto.getFechaActa()));
        }
        proyecto.setAdendasRetiroProyecto(adendasRetiro);

        Map resultadoAdiciones = obtenerAdicionesProyecto.execute(parametros);
        ArrayList<AdicionProyecto> adicionesProyecto = (ArrayList<AdicionProyecto>) resultadoAdiciones.get("adicionesProyecto");
        for (AdicionProyecto adicionProyecto : adicionesProyecto) {
            adicionProyecto.setFechaActaFormateada(Util.obtenerFechaFormateada(adicionProyecto.getFechaActa()));
            adicionProyecto.setFechaActaCODIFormateada(Util.obtenerFechaFormateada(adicionProyecto.getFechaActaCODI()));
        }
        proyecto.setAdicionesProyecto(adicionesProyecto);

        Map resultadoActasProyecto = obtenerActasProyecto.execute(parametros);
        ArrayList<ActaProyecto> actasProyecto = (ArrayList<ActaProyecto>) resultadoActasProyecto.get("actasProyecto");
        for (ActaProyecto actaProyecto : actasProyecto) {
            actaProyecto.setFechaFormateada(Util.obtenerFechaFormateada(actaProyecto.getFecha()));
        }
        proyecto.setActasProyecto(actasProyecto);

        Map resultadoProrrogas = obtenerProrrogasProyecto.execute(parametros);
        ArrayList<ProrrogaProyecto> prorrogasProyecto = (ArrayList<ProrrogaProyecto>) resultadoProrrogas.get("prorrogasProyecto");
        for (ProrrogaProyecto prorrogaProyecto : prorrogasProyecto) {
            prorrogaProyecto.setFechaActaFormateada(Util.obtenerFechaFormateada(prorrogaProyecto.getFechaActa()));
            prorrogaProyecto.setFechaActaCODIFormateada(Util.obtenerFechaFormateada(prorrogaProyecto.getFechaActaCODI()));
            prorrogaProyecto.setMontoAprobadoFormateado(Util.obtenerNumeroFormatoMoneda(prorrogaProyecto.getMontoAprobado()));
        }
        proyecto.setProrrogasProyecto(prorrogasProyecto);

        Map resultadoPlazos = obtenerPlazosProyecto.execute(parametros);
        ArrayList<PlazoProyecto> plazosProyecto = (ArrayList<PlazoProyecto>) resultadoPlazos.get("plazosProyecto");
        for (PlazoProyecto plazoProyecto : plazosProyecto) {
            plazoProyecto.setFechaActaFormateada(Util.obtenerFechaFormateada(plazoProyecto.getFechaActa()));
            plazoProyecto.setFechaActaCODIFormateada(Util.obtenerFechaFormateada(plazoProyecto.getFechaActaCODI()));
        }
        proyecto.setPlazosProyecto(plazosProyecto);

        Map resultadoCumplimientoCompromisos = obtenerCumplimientoCompromisosProyecto.execute(parametros);
        ArrayList<CumplimientoCompromisoProyecto> cumplimientoCompromisosProyecto = (ArrayList<CumplimientoCompromisoProyecto>) resultadoCumplimientoCompromisos.get("cumplimientoCompromisosProyecto");
        for (CumplimientoCompromisoProyecto cumplimientoCompromisoProyecto : cumplimientoCompromisosProyecto) {
            cumplimientoCompromisoProyecto.setFechaActaFormateada(Util.obtenerFechaFormateada(cumplimientoCompromisoProyecto.getFechaActa()));
        }
        proyecto.setCumplimientoCompromisosProyecto(cumplimientoCompromisosProyecto);

        Map resultadoCompromisosHomologados = obtenerCompromisosHomologadosProyecto.execute(parametros);
        ArrayList<CompromisoHomologadoProyecto> compromisosHomologadosProyecto = (ArrayList<CompromisoHomologadoProyecto>) resultadoCompromisosHomologados.get("compromisosHomologadosProyecto");
        for (CompromisoHomologadoProyecto compromisoHomologadoProyecto : compromisosHomologadosProyecto) {
            compromisoHomologadoProyecto.setFechaActaFormateada(Util.obtenerFechaFormateada(compromisoHomologadoProyecto.getFechaActa()));
        }
        proyecto.setCompromisosHomologadosProyecto(compromisosHomologadosProyecto);

        Map resultadoCumplimientosAlertasAvalProyecto = obtenerCumplimientosAlertasAvalProyecto.execute(parametros);
        ArrayList<CumplimientoAlertaAvalProyecto> cumplimientosAlertasAvalProyecto = (ArrayList<CumplimientoAlertaAvalProyecto>) resultadoCumplimientosAlertasAvalProyecto.get("cumplimientosAlertasAvalProyecto");
        for (CumplimientoAlertaAvalProyecto cumplimientoAlertaAvalProyecto : cumplimientosAlertasAvalProyecto) {
            cumplimientoAlertaAvalProyecto.setFechaActaFormateada(Util.obtenerFechaFormateada(cumplimientoAlertaAvalProyecto.getFechaActa()));
        }
        proyecto.setCumplimientosAlertasAvalProyecto(cumplimientosAlertasAvalProyecto);
        
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
        for(ReporteProyecto proyecto:proyectos) {
            proyecto.setFechaCreacionFormateada(Util.obtenerFechaFormateada(proyecto.getFechaCreacion()));
            proyecto.setFechaFinalizacionFormateada(Util.obtenerFechaFormateada(proyecto.getFechaFinalizacion()));
            proyecto.setFechaInicioFormateada(Util.obtenerFechaFormateada(proyecto.getFechaInicio()));
        }
        
        return proyectos;
    }

    @Override
    public void guardarActaProyecto(long idProyecto, ActaProyecto actaProyecto, Documento documento) {

        if (actaProyecto.getIdActa() == 0) {
            MapSqlParameterSource parametrosIngresoActaProyecto = new MapSqlParameterSource();
            parametrosIngresoActaProyecto.addValue("varIdProyecto", idProyecto);
            parametrosIngresoActaProyecto.addValue("varIdTipoActa", actaProyecto.getIdTipoActa());
            parametrosIngresoActaProyecto.addValue("varObservaciones", actaProyecto.getObservaciones());
            parametrosIngresoActaProyecto.addValue("varFecha", actaProyecto.getFecha());
            parametrosIngresoActaProyecto.addValue("varNumero", actaProyecto.getNumero());
            Map resultado = ingresarActaProyecto.execute(parametrosIngresoActaProyecto);
            long idActa = (long) resultado.get("varIdActa");

            MapSqlParameterSource parametrosIngresoDocumentoActaProyecto = new MapSqlParameterSource();
            parametrosIngresoDocumentoActaProyecto.addValue("varIdActa", idActa);
            parametrosIngresoDocumentoActaProyecto.addValue("varNombre", documento.getNombre());
            parametrosIngresoDocumentoActaProyecto.addValue("varTipoContenido", documento.getTipoContenido());
            parametrosIngresoDocumentoActaProyecto.addValue("varContenido", documento.getContenido());
            ingresarDocumentoActaProyecto.execute(parametrosIngresoDocumentoActaProyecto);

        } else {
            MapSqlParameterSource parametrosActualizacionActaProyecto = new MapSqlParameterSource();
            parametrosActualizacionActaProyecto.addValue("varIdActa", actaProyecto.getIdActa());
            parametrosActualizacionActaProyecto.addValue("varIdTipoActa", actaProyecto.getIdTipoActa());
            parametrosActualizacionActaProyecto.addValue("varObservaciones", actaProyecto.getObservaciones());
            parametrosActualizacionActaProyecto.addValue("varFecha", actaProyecto.getFecha());
            parametrosActualizacionActaProyecto.addValue("varNumero", actaProyecto.getNumero());
            actualizarActaProyecto.execute(parametrosActualizacionActaProyecto);

            if (documento != null) {
                MapSqlParameterSource parametrosActualizacionDocumentoActaProyecto = new MapSqlParameterSource();
                parametrosActualizacionDocumentoActaProyecto.addValue("varIdActa", actaProyecto.getIdActa());
                parametrosActualizacionDocumentoActaProyecto.addValue("varNombre", documento.getNombre());
                parametrosActualizacionDocumentoActaProyecto.addValue("varTipoContenido", documento.getTipoContenido());
                parametrosActualizacionDocumentoActaProyecto.addValue("varContenido", documento.getContenido());
                actualizarDocumentoActaProyecto.execute(parametrosActualizacionDocumentoActaProyecto);
            }
        }
    }

    @Override
    public ArrayList<ActaProyecto> obtenerActasProyecto(long idProyecto) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdProyecto", idProyecto);

        Map resultadoActasProyecto = obtenerActasProyecto.execute(parametros);
        ArrayList<ActaProyecto> actasProyecto = (ArrayList<ActaProyecto>) resultadoActasProyecto.get("actasProyecto");
        for (ActaProyecto actaProyecto : actasProyecto) {
            actaProyecto.setFechaFormateada(Util.obtenerFechaFormateada(actaProyecto.getFecha()));
        }

        return actasProyecto;
    }

    @Override
    public Documento obtenerDocumentoActaProyecto(long idActa) {
        Documento documento = new Documento();
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdActa", idActa);

        Map resultado = obtenerDocumentoActaProyecto.execute(parametros);

        documento.setNombre((String) resultado.get("varNombre"));
        documento.setTipoContenido((String) resultado.get("varTipoContenido"));
        documento.setContenido((byte[]) resultado.get("varContenido"));

        return documento;
    }

    @Override
    public void eliminarActaProyecto(long idActa) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdActa", idActa);
        eliminarActaProyecto.execute(parametros);
    }

    @Override
    public void guardarAdendaIngresoProyecto(long idProyecto, AdendaIngresoProyecto adendaProyecto, Documento documento) {

        if (adendaProyecto.getIdAdenda() == 0) {
            MapSqlParameterSource parametrosIngresoAdendaProyecto = new MapSqlParameterSource();
            parametrosIngresoAdendaProyecto.addValue("varIdProyecto", idProyecto);
            parametrosIngresoAdendaProyecto.addValue("varIdTipoPersona", adendaProyecto.getIdTipoPersona());
            parametrosIngresoAdendaProyecto.addValue("varIdPersona", adendaProyecto.getIdPersona());
            parametrosIngresoAdendaProyecto.addValue("varFechaIngreso", adendaProyecto.getFechaIngreso());
            parametrosIngresoAdendaProyecto.addValue("varFechaActa", adendaProyecto.getFechaActa());
            parametrosIngresoAdendaProyecto.addValue("varNumeroActa", adendaProyecto.getNumeroActa());
            Map resultado = ingresarAdendaIngresoProyecto.execute(parametrosIngresoAdendaProyecto);
            long idAdenda = (long) resultado.get("varIdAdenda");

            MapSqlParameterSource parametrosIngresoDocumentoAdendaProyecto = new MapSqlParameterSource();
            parametrosIngresoDocumentoAdendaProyecto.addValue("varIdAdenda", idAdenda);
            parametrosIngresoDocumentoAdendaProyecto.addValue("varNombre", documento.getNombre());
            parametrosIngresoDocumentoAdendaProyecto.addValue("varTipoContenido", documento.getTipoContenido());
            parametrosIngresoDocumentoAdendaProyecto.addValue("varContenido", documento.getContenido());
            ingresarDocumentoAdendaIngresoProyecto.execute(parametrosIngresoDocumentoAdendaProyecto);

        } else {
            MapSqlParameterSource parametrosActualizacionAdendaProyecto = new MapSqlParameterSource();
            parametrosActualizacionAdendaProyecto.addValue("varIdAdenda", adendaProyecto.getIdAdenda());
            parametrosActualizacionAdendaProyecto.addValue("varIdTipoPersona", adendaProyecto.getIdTipoPersona());
            parametrosActualizacionAdendaProyecto.addValue("varIdPersona", adendaProyecto.getIdPersona());
            parametrosActualizacionAdendaProyecto.addValue("varFechaIngreso", adendaProyecto.getFechaIngreso());
            parametrosActualizacionAdendaProyecto.addValue("varFechaActa", adendaProyecto.getFechaActa());
            parametrosActualizacionAdendaProyecto.addValue("varNumeroActa", adendaProyecto.getNumeroActa());
            actualizarAdendaIngresoProyecto.execute(parametrosActualizacionAdendaProyecto);

            if (documento != null) {
                MapSqlParameterSource parametrosActualizacionDocumentoAdendaProyecto = new MapSqlParameterSource();
                parametrosActualizacionDocumentoAdendaProyecto.addValue("varIdAdenda", adendaProyecto.getIdAdenda());
                parametrosActualizacionDocumentoAdendaProyecto.addValue("varNombre", documento.getNombre());
                parametrosActualizacionDocumentoAdendaProyecto.addValue("varTipoContenido", documento.getTipoContenido());
                parametrosActualizacionDocumentoAdendaProyecto.addValue("varContenido", documento.getContenido());
                actualizarDocumentoAdendaIngresoProyecto.execute(parametrosActualizacionDocumentoAdendaProyecto);
            }
        }
    }

    @Override
    public ArrayList<AdendaIngresoProyecto> obtenerAdendasIngresoProyecto(long idProyecto) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdProyecto", idProyecto);

        Map resultadoAdendasProyecto = obtenerAdendasIngresoProyecto.execute(parametros);
        ArrayList<AdendaIngresoProyecto> adendasProyecto = (ArrayList<AdendaIngresoProyecto>) resultadoAdendasProyecto.get("adendasIngresoProyecto");
        for (AdendaIngresoProyecto adendaProyecto : adendasProyecto) {
            adendaProyecto.setFechaIngresoFormateada(Util.obtenerFechaFormateada(adendaProyecto.getFechaIngreso()));
            adendaProyecto.setFechaActaFormateada(Util.obtenerFechaFormateada(adendaProyecto.getFechaActa()));
        }

        return adendasProyecto;
    }

    @Override
    public Documento obtenerDocumentoAdendaIngresoProyecto(long idAdenda) {
        Documento documento = new Documento();
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdAdenda", idAdenda);

        Map resultado = obtenerDocumentoAdendaIngresoProyecto.execute(parametros);

        documento.setNombre((String) resultado.get("varNombre"));
        documento.setTipoContenido((String) resultado.get("varTipoContenido"));
        documento.setContenido((byte[]) resultado.get("varContenido"));

        return documento;
    }

    @Override
    public void eliminarAdendaIngresoProyecto(long idAdenda) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdAdenda", idAdenda);
        eliminarAdendaIngresoProyecto.execute(parametros);
    }

    @Override
    public void guardarAdendaRetiroProyecto(long idProyecto, AdendaRetiroProyecto adendaProyecto, Documento documento) {

        if (adendaProyecto.getIdAdenda() == 0) {
            MapSqlParameterSource parametrosIngresoAdendaProyecto = new MapSqlParameterSource();
            parametrosIngresoAdendaProyecto.addValue("varIdProyecto", idProyecto);
            parametrosIngresoAdendaProyecto.addValue("varIdTipoPersona", adendaProyecto.getIdTipoPersona());
            parametrosIngresoAdendaProyecto.addValue("varIdPersona", adendaProyecto.getIdPersona());
            parametrosIngresoAdendaProyecto.addValue("varMotivo", adendaProyecto.getMotivo());
            parametrosIngresoAdendaProyecto.addValue("varFechaActa", adendaProyecto.getFechaActa());
            parametrosIngresoAdendaProyecto.addValue("varNumeroActa", adendaProyecto.getNumeroActa());
            parametrosIngresoAdendaProyecto.addValue("varFechaRetiro", adendaProyecto.getFechaRetiro());
            Map resultado = ingresarAdendaRetiroProyecto.execute(parametrosIngresoAdendaProyecto);
            long idAdenda = (long) resultado.get("varIdAdenda");

            MapSqlParameterSource parametrosIngresoDocumentoAdendaProyecto = new MapSqlParameterSource();
            parametrosIngresoDocumentoAdendaProyecto.addValue("varIdAdenda", idAdenda);
            parametrosIngresoDocumentoAdendaProyecto.addValue("varNombre", documento.getNombre());
            parametrosIngresoDocumentoAdendaProyecto.addValue("varTipoContenido", documento.getTipoContenido());
            parametrosIngresoDocumentoAdendaProyecto.addValue("varContenido", documento.getContenido());
            ingresarDocumentoAdendaRetiroProyecto.execute(parametrosIngresoDocumentoAdendaProyecto);

        } else {
            MapSqlParameterSource parametrosActualizacionAdendaProyecto = new MapSqlParameterSource();
            parametrosActualizacionAdendaProyecto.addValue("varIdAdenda", adendaProyecto.getIdAdenda());
            parametrosActualizacionAdendaProyecto.addValue("varIdTipoPersona", adendaProyecto.getIdTipoPersona());
            parametrosActualizacionAdendaProyecto.addValue("varIdPersona", adendaProyecto.getIdPersona());
            parametrosActualizacionAdendaProyecto.addValue("varMotivo", adendaProyecto.getMotivo());
            parametrosActualizacionAdendaProyecto.addValue("varFechaActa", adendaProyecto.getFechaActa());
            parametrosActualizacionAdendaProyecto.addValue("varNumeroActa", adendaProyecto.getNumeroActa());
            parametrosActualizacionAdendaProyecto.addValue("varFechaRetiro", adendaProyecto.getFechaRetiro());
            actualizarAdendaRetiroProyecto.execute(parametrosActualizacionAdendaProyecto);

            if (documento != null) {
                MapSqlParameterSource parametrosActualizacionDocumentoAdendaProyecto = new MapSqlParameterSource();
                parametrosActualizacionDocumentoAdendaProyecto.addValue("varIdAdenda", adendaProyecto.getIdAdenda());
                parametrosActualizacionDocumentoAdendaProyecto.addValue("varNombre", documento.getNombre());
                parametrosActualizacionDocumentoAdendaProyecto.addValue("varTipoContenido", documento.getTipoContenido());
                parametrosActualizacionDocumentoAdendaProyecto.addValue("varContenido", documento.getContenido());
                actualizarDocumentoAdendaRetiroProyecto.execute(parametrosActualizacionDocumentoAdendaProyecto);
            }
        }
    }

    @Override
    public ArrayList<AdendaRetiroProyecto> obtenerAdendasRetiroProyecto(long idProyecto) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdProyecto", idProyecto);

        Map resultadoAdendasProyecto = obtenerAdendasRetiroProyecto.execute(parametros);
        ArrayList<AdendaRetiroProyecto> adendasProyecto = (ArrayList<AdendaRetiroProyecto>) resultadoAdendasProyecto.get("adendasRetiroProyecto");
        for (AdendaRetiroProyecto adendaProyecto : adendasProyecto) {
            adendaProyecto.setFechaActaFormateada(Util.obtenerFechaFormateada(adendaProyecto.getFechaActa()));
            adendaProyecto.setFechaRetiroFormateada(Util.obtenerFechaFormateada(adendaProyecto.getFechaRetiro()));
        }

        return adendasProyecto;
    }

    @Override
    public Documento obtenerDocumentoAdendaRetiroProyecto(long idAdenda) {
        Documento documento = new Documento();
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdAdenda", idAdenda);

        Map resultado = obtenerDocumentoAdendaRetiroProyecto.execute(parametros);

        documento.setNombre((String) resultado.get("varNombre"));
        documento.setTipoContenido((String) resultado.get("varTipoContenido"));
        documento.setContenido((byte[]) resultado.get("varContenido"));

        return documento;
    }

    @Override
    public void eliminarAdendaRetiroProyecto(long idAdenda) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdAdenda", idAdenda);
        eliminarAdendaRetiroProyecto.execute(parametros);
    }

    @Override
    public void guardarAdendaCambioProyecto(long idProyecto, AdendaCambioProyecto adendaProyecto, Documento documento) {

        if (adendaProyecto.getIdAdenda() == 0) {
            MapSqlParameterSource parametrosIngresoAdendaProyecto = new MapSqlParameterSource();
            parametrosIngresoAdendaProyecto.addValue("varIdProyecto", idProyecto);
            parametrosIngresoAdendaProyecto.addValue("varIdTipoPersona", adendaProyecto.getIdTipoPersona());
            parametrosIngresoAdendaProyecto.addValue("varIdRol", adendaProyecto.getIdRol());
            parametrosIngresoAdendaProyecto.addValue("varIdPersonaAnterior", adendaProyecto.getIdPersonaAnterior());
            parametrosIngresoAdendaProyecto.addValue("varIdPersona", adendaProyecto.getIdPersona());
            parametrosIngresoAdendaProyecto.addValue("varObservaciones", adendaProyecto.getObservaciones());
            parametrosIngresoAdendaProyecto.addValue("varFechaActa", adendaProyecto.getFechaActa());
            parametrosIngresoAdendaProyecto.addValue("varNumeroActa", adendaProyecto.getNumeroActa());
            parametrosIngresoAdendaProyecto.addValue("varFechaCambio", adendaProyecto.getFechaCambio());
            Map resultado = ingresarAdendaCambioProyecto.execute(parametrosIngresoAdendaProyecto);
            long idAdenda = (long) resultado.get("varIdAdenda");

            MapSqlParameterSource parametrosIngresoDocumentoAdendaProyecto = new MapSqlParameterSource();
            parametrosIngresoDocumentoAdendaProyecto.addValue("varIdAdenda", idAdenda);
            parametrosIngresoDocumentoAdendaProyecto.addValue("varNombre", documento.getNombre());
            parametrosIngresoDocumentoAdendaProyecto.addValue("varTipoContenido", documento.getTipoContenido());
            parametrosIngresoDocumentoAdendaProyecto.addValue("varContenido", documento.getContenido());
            ingresarDocumentoAdendaCambioProyecto.execute(parametrosIngresoDocumentoAdendaProyecto);

        } else {
            MapSqlParameterSource parametrosActualizacionAdendaProyecto = new MapSqlParameterSource();
            parametrosActualizacionAdendaProyecto.addValue("varIdAdenda", adendaProyecto.getIdAdenda());
            parametrosActualizacionAdendaProyecto.addValue("varIdTipoPersona", adendaProyecto.getIdTipoPersona());
            parametrosActualizacionAdendaProyecto.addValue("varIdRol", adendaProyecto.getIdRol());
            parametrosActualizacionAdendaProyecto.addValue("varIdPersonaAnterior", adendaProyecto.getIdPersonaAnterior());
            parametrosActualizacionAdendaProyecto.addValue("varIdPersona", adendaProyecto.getIdPersona());
            parametrosActualizacionAdendaProyecto.addValue("varObservaciones", adendaProyecto.getObservaciones());
            parametrosActualizacionAdendaProyecto.addValue("varFechaActa", adendaProyecto.getFechaActa());
            parametrosActualizacionAdendaProyecto.addValue("varNumeroActa", adendaProyecto.getNumeroActa());
            parametrosActualizacionAdendaProyecto.addValue("varFechaCambio", adendaProyecto.getFechaCambio());
            actualizarAdendaCambioProyecto.execute(parametrosActualizacionAdendaProyecto);

            if (documento != null) {
                MapSqlParameterSource parametrosActualizacionDocumentoAdendaProyecto = new MapSqlParameterSource();
                parametrosActualizacionDocumentoAdendaProyecto.addValue("varIdAdenda", adendaProyecto.getIdAdenda());
                parametrosActualizacionDocumentoAdendaProyecto.addValue("varNombre", documento.getNombre());
                parametrosActualizacionDocumentoAdendaProyecto.addValue("varTipoContenido", documento.getTipoContenido());
                parametrosActualizacionDocumentoAdendaProyecto.addValue("varContenido", documento.getContenido());
                actualizarDocumentoAdendaCambioProyecto.execute(parametrosActualizacionDocumentoAdendaProyecto);
            }
        }
    }

    @Override
    public ArrayList<AdendaCambioProyecto> obtenerAdendasCambioProyecto(long idProyecto) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdProyecto", idProyecto);

        Map resultadoAdendasProyecto = obtenerAdendasCambioProyecto.execute(parametros);
        ArrayList<AdendaCambioProyecto> adendasProyecto = (ArrayList<AdendaCambioProyecto>) resultadoAdendasProyecto.get("adendasCambioProyecto");
        for (AdendaCambioProyecto adendaProyecto : adendasProyecto) {
            adendaProyecto.setFechaActaFormateada(Util.obtenerFechaFormateada(adendaProyecto.getFechaActa()));
            adendaProyecto.setFechaCambioFormateada(Util.obtenerFechaFormateada(adendaProyecto.getFechaCambio()));
        }

        return adendasProyecto;
    }

    @Override
    public Documento obtenerDocumentoAdendaCambioProyecto(long idAdenda) {
        Documento documento = new Documento();
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdAdenda", idAdenda);

        Map resultado = obtenerDocumentoAdendaCambioProyecto.execute(parametros);

        documento.setNombre((String) resultado.get("varNombre"));
        documento.setTipoContenido((String) resultado.get("varTipoContenido"));
        documento.setContenido((byte[]) resultado.get("varContenido"));

        return documento;
    }

    @Override
    public void eliminarAdendaCambioProyecto(long idAdenda) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdAdenda", idAdenda);
        eliminarAdendaCambioProyecto.execute(parametros);
    }

    @Override
    public void guardarAdicionProyecto(long idProyecto, AdicionProyecto adicionProyecto, Documento documento) {

        if (adicionProyecto.getIdAdicion() == 0) {
            MapSqlParameterSource parametrosIngresoAdicionProyecto = new MapSqlParameterSource();
            parametrosIngresoAdicionProyecto.addValue("varIdProyecto", idProyecto);
            parametrosIngresoAdicionProyecto.addValue("varMonto", adicionProyecto.getMonto());
            parametrosIngresoAdicionProyecto.addValue("varDescripcion", adicionProyecto.getDescripcion());
            parametrosIngresoAdicionProyecto.addValue("varFechaActa", adicionProyecto.getFechaActa());
            parametrosIngresoAdicionProyecto.addValue("varFechaActaCODI", adicionProyecto.getFechaActaCODI());
            parametrosIngresoAdicionProyecto.addValue("varNumeroActa", adicionProyecto.getNumeroActa());
            parametrosIngresoAdicionProyecto.addValue("varNumeroActaCODI", adicionProyecto.getNumeroActaCODI());
            Map resultado = ingresarAdicionProyecto.execute(parametrosIngresoAdicionProyecto);
            long idAdicion = (long) resultado.get("varIdAdicion");

            MapSqlParameterSource parametrosIngresoDocumentoAdicionProyecto = new MapSqlParameterSource();
            parametrosIngresoDocumentoAdicionProyecto.addValue("varIdAdicion", idAdicion);
            parametrosIngresoDocumentoAdicionProyecto.addValue("varNombre", documento.getNombre());
            parametrosIngresoDocumentoAdicionProyecto.addValue("varTipoContenido", documento.getTipoContenido());
            parametrosIngresoDocumentoAdicionProyecto.addValue("varContenido", documento.getContenido());
            ingresarDocumentoAdicionProyecto.execute(parametrosIngresoDocumentoAdicionProyecto);

        } else {
            MapSqlParameterSource parametrosActualizacionAdicionProyecto = new MapSqlParameterSource();
            parametrosActualizacionAdicionProyecto.addValue("varIdAdicion", adicionProyecto.getIdAdicion());
            parametrosActualizacionAdicionProyecto.addValue("varMonto", adicionProyecto.getMonto());
            parametrosActualizacionAdicionProyecto.addValue("varDescripcion", adicionProyecto.getDescripcion());
            parametrosActualizacionAdicionProyecto.addValue("varFechaActa", adicionProyecto.getFechaActa());
            parametrosActualizacionAdicionProyecto.addValue("varFechaActaCODI", adicionProyecto.getFechaActaCODI());
            parametrosActualizacionAdicionProyecto.addValue("varNumeroActa", adicionProyecto.getNumeroActa());
            parametrosActualizacionAdicionProyecto.addValue("varNumeroActaCODI", adicionProyecto.getNumeroActaCODI());
            actualizarAdicionProyecto.execute(parametrosActualizacionAdicionProyecto);

            if (documento != null) {
                MapSqlParameterSource parametrosActualizacionDocumentoAdicionProyecto = new MapSqlParameterSource();
                parametrosActualizacionDocumentoAdicionProyecto.addValue("varIdAdicion", adicionProyecto.getIdAdicion());
                parametrosActualizacionDocumentoAdicionProyecto.addValue("varNombre", documento.getNombre());
                parametrosActualizacionDocumentoAdicionProyecto.addValue("varTipoContenido", documento.getTipoContenido());
                parametrosActualizacionDocumentoAdicionProyecto.addValue("varContenido", documento.getContenido());
                actualizarDocumentoAdicionProyecto.execute(parametrosActualizacionDocumentoAdicionProyecto);
            }
        }
    }

    @Override
    public ArrayList<AdicionProyecto> obtenerAdicionesProyecto(long idProyecto) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdProyecto", idProyecto);

        Map resultadoAdicionsProyecto = obtenerAdicionesProyecto.execute(parametros);
        ArrayList<AdicionProyecto> adicionesProyecto = (ArrayList<AdicionProyecto>) resultadoAdicionsProyecto.get("adicionesProyecto");
        for (AdicionProyecto adicionProyecto : adicionesProyecto) {
            adicionProyecto.setFechaActaFormateada(Util.obtenerFechaFormateada(adicionProyecto.getFechaActa()));
            adicionProyecto.setFechaActaCODIFormateada(Util.obtenerFechaFormateada(adicionProyecto.getFechaActaCODI()));
            adicionProyecto.setMontoFormateado(Util.obtenerNumeroFormatoMoneda(adicionProyecto.getMonto()));
        }

        return adicionesProyecto;
    }

    @Override
    public Documento obtenerDocumentoAdicionProyecto(long idAdicion) {
        Documento documento = new Documento();
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdAdicion", idAdicion);

        Map resultado = obtenerDocumentoAdicionProyecto.execute(parametros);

        documento.setNombre((String) resultado.get("varNombre"));
        documento.setTipoContenido((String) resultado.get("varTipoContenido"));
        documento.setContenido((byte[]) resultado.get("varContenido"));

        return documento;
    }

    @Override
    public void eliminarAdicionProyecto(long idAdicion) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdAdicion", idAdicion);
        eliminarAdicionProyecto.execute(parametros);
    }

    @Override
    public void guardarProrrogaProyecto(long idProyecto, ProrrogaProyecto prorrogaProyecto, Documento documento) {

        if (prorrogaProyecto.getIdProrroga() == 0) {
            MapSqlParameterSource parametrosIngresoProrrogaProyecto = new MapSqlParameterSource();
            parametrosIngresoProrrogaProyecto.addValue("varIdProyecto", idProyecto);
            parametrosIngresoProrrogaProyecto.addValue("varDescripcion", prorrogaProyecto.getDescripcion());
            parametrosIngresoProrrogaProyecto.addValue("varMesesAprobados", prorrogaProyecto.getMesesAprobados());
            parametrosIngresoProrrogaProyecto.addValue("varFechaActa", prorrogaProyecto.getFechaActa());
            parametrosIngresoProrrogaProyecto.addValue("varNumeroActa", prorrogaProyecto.getNumeroActa());
            parametrosIngresoProrrogaProyecto.addValue("varFechaActaCODI", prorrogaProyecto.getFechaActaCODI());
            parametrosIngresoProrrogaProyecto.addValue("varNumeroActaCODI", prorrogaProyecto.getNumeroActaCODI());
            parametrosIngresoProrrogaProyecto.addValue("varMontoAprobado", prorrogaProyecto.getMontoAprobado());
            Map resultado = ingresarProrrogaProyecto.execute(parametrosIngresoProrrogaProyecto);
            long idProrroga = (long) resultado.get("varIdProrroga");

            MapSqlParameterSource parametrosIngresoDocumentoProrrogaProyecto = new MapSqlParameterSource();
            parametrosIngresoDocumentoProrrogaProyecto.addValue("varIdProrroga", idProrroga);
            parametrosIngresoDocumentoProrrogaProyecto.addValue("varNombre", documento.getNombre());
            parametrosIngresoDocumentoProrrogaProyecto.addValue("varTipoContenido", documento.getTipoContenido());
            parametrosIngresoDocumentoProrrogaProyecto.addValue("varContenido", documento.getContenido());
            ingresarDocumentoProrrogaProyecto.execute(parametrosIngresoDocumentoProrrogaProyecto);

        } else {
            MapSqlParameterSource parametrosActualizacionProrrogaProyecto = new MapSqlParameterSource();
            parametrosActualizacionProrrogaProyecto.addValue("varIdProrroga", prorrogaProyecto.getIdProrroga());
            parametrosActualizacionProrrogaProyecto.addValue("varDescripcion", prorrogaProyecto.getDescripcion());
            parametrosActualizacionProrrogaProyecto.addValue("varMesesAprobados", prorrogaProyecto.getMesesAprobados());
            parametrosActualizacionProrrogaProyecto.addValue("varFechaActa", prorrogaProyecto.getFechaActa());
            parametrosActualizacionProrrogaProyecto.addValue("varNumeroActa", prorrogaProyecto.getNumeroActa());
            parametrosActualizacionProrrogaProyecto.addValue("varFechaActaCODI", prorrogaProyecto.getFechaActaCODI());
            parametrosActualizacionProrrogaProyecto.addValue("varNumeroActaCODI", prorrogaProyecto.getNumeroActaCODI());
            parametrosActualizacionProrrogaProyecto.addValue("varMontoAprobado", prorrogaProyecto.getMontoAprobado());
            actualizarProrrogaProyecto.execute(parametrosActualizacionProrrogaProyecto);

            if (documento != null) {
                MapSqlParameterSource parametrosActualizacionDocumentoProrrogaProyecto = new MapSqlParameterSource();
                parametrosActualizacionDocumentoProrrogaProyecto.addValue("varIdProrroga", prorrogaProyecto.getIdProrroga());
                parametrosActualizacionDocumentoProrrogaProyecto.addValue("varNombre", documento.getNombre());
                parametrosActualizacionDocumentoProrrogaProyecto.addValue("varTipoContenido", documento.getTipoContenido());
                parametrosActualizacionDocumentoProrrogaProyecto.addValue("varContenido", documento.getContenido());
                actualizarDocumentoProrrogaProyecto.execute(parametrosActualizacionDocumentoProrrogaProyecto);
            }
        }
    }

    @Override
    public ArrayList<ProrrogaProyecto> obtenerProrrogasProyecto(long idProyecto) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdProyecto", idProyecto);

        Map resultadoProrrogasProyecto = obtenerProrrogasProyecto.execute(parametros);
        ArrayList<ProrrogaProyecto> prorrogasProyecto = (ArrayList<ProrrogaProyecto>) resultadoProrrogasProyecto.get("prorrogasProyecto");
        for (ProrrogaProyecto prorrogaProyecto : prorrogasProyecto) {
            prorrogaProyecto.setFechaActaFormateada(Util.obtenerFechaFormateada(prorrogaProyecto.getFechaActa()));
            prorrogaProyecto.setFechaActaCODIFormateada(Util.obtenerFechaFormateada(prorrogaProyecto.getFechaActaCODI()));
            prorrogaProyecto.setMontoAprobadoFormateado(Util.obtenerNumeroFormatoMoneda(prorrogaProyecto.getMontoAprobado()));
        }

        return prorrogasProyecto;

    }

    @Override
    public Documento obtenerDocumentoProrrogaProyecto(long idProrroga) {
        Documento documento = new Documento();
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdProrroga", idProrroga);

        Map resultado = obtenerDocumentoProrrogaProyecto.execute(parametros);

        documento.setNombre((String) resultado.get("varNombre"));
        documento.setTipoContenido((String) resultado.get("varTipoContenido"));
        documento.setContenido((byte[]) resultado.get("varContenido"));

        return documento;

    }

    @Override
    public void eliminarProrrogaProyecto(long idProrroga) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdProrroga", idProrroga);
        eliminarProrrogaProyecto.execute(parametros);
    }

    @Override
    public void guardarPlazoProyecto(long idProyecto, PlazoProyecto plazoProyecto, Documento documento) {

        if (plazoProyecto.getIdPlazo() == 0) {
            MapSqlParameterSource parametrosIngresoPlazoProyecto = new MapSqlParameterSource();
            parametrosIngresoPlazoProyecto.addValue("varIdProyecto", idProyecto);
            parametrosIngresoPlazoProyecto.addValue("varDescripcion", plazoProyecto.getDescripcion());
            parametrosIngresoPlazoProyecto.addValue("varMesesAprobados", plazoProyecto.getMesesAprobados());
            parametrosIngresoPlazoProyecto.addValue("varFechaActa", plazoProyecto.getFechaActa());
            parametrosIngresoPlazoProyecto.addValue("varNumeroActa", plazoProyecto.getNumeroActa());
            parametrosIngresoPlazoProyecto.addValue("varFechaActaCODI", plazoProyecto.getFechaActaCODI());
            parametrosIngresoPlazoProyecto.addValue("varNumeroActaCODI", plazoProyecto.getNumeroActaCODI());
            Map resultado = ingresarPlazoProyecto.execute(parametrosIngresoPlazoProyecto);
            long idPlazo = (long) resultado.get("varIdPlazo");

            MapSqlParameterSource parametrosIngresoDocumentoPlazoProyecto = new MapSqlParameterSource();
            parametrosIngresoDocumentoPlazoProyecto.addValue("varIdPlazo", idPlazo);
            parametrosIngresoDocumentoPlazoProyecto.addValue("varNombre", documento.getNombre());
            parametrosIngresoDocumentoPlazoProyecto.addValue("varTipoContenido", documento.getTipoContenido());
            parametrosIngresoDocumentoPlazoProyecto.addValue("varContenido", documento.getContenido());
            ingresarDocumentoPlazoProyecto.execute(parametrosIngresoDocumentoPlazoProyecto);

        } else {
            MapSqlParameterSource parametrosActualizacionPlazoProyecto = new MapSqlParameterSource();
            parametrosActualizacionPlazoProyecto.addValue("varIdPlazo", plazoProyecto.getIdPlazo());
            parametrosActualizacionPlazoProyecto.addValue("varDescripcion", plazoProyecto.getDescripcion());
            parametrosActualizacionPlazoProyecto.addValue("varMesesAprobados", plazoProyecto.getMesesAprobados());
            parametrosActualizacionPlazoProyecto.addValue("varFechaActa", plazoProyecto.getFechaActa());
            parametrosActualizacionPlazoProyecto.addValue("varNumeroActa", plazoProyecto.getNumeroActa());
            parametrosActualizacionPlazoProyecto.addValue("varFechaActaCODI", plazoProyecto.getFechaActaCODI());
            parametrosActualizacionPlazoProyecto.addValue("varNumeroActaCODI", plazoProyecto.getNumeroActaCODI());
            actualizarPlazoProyecto.execute(parametrosActualizacionPlazoProyecto);

            if (documento != null) {
                MapSqlParameterSource parametrosActualizacionDocumentoPlazoProyecto = new MapSqlParameterSource();
                parametrosActualizacionDocumentoPlazoProyecto.addValue("varIdPlazo", plazoProyecto.getIdPlazo());
                parametrosActualizacionDocumentoPlazoProyecto.addValue("varNombre", documento.getNombre());
                parametrosActualizacionDocumentoPlazoProyecto.addValue("varTipoContenido", documento.getTipoContenido());
                parametrosActualizacionDocumentoPlazoProyecto.addValue("varContenido", documento.getContenido());
                actualizarDocumentoPlazoProyecto.execute(parametrosActualizacionDocumentoPlazoProyecto);
            }
        }
    }

    @Override
    public ArrayList<PlazoProyecto> obtenerPlazosProyecto(long idProyecto) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdProyecto", idProyecto);

        Map resultadoPlazosProyecto = obtenerPlazosProyecto.execute(parametros);
        ArrayList<PlazoProyecto> plazosProyecto = (ArrayList<PlazoProyecto>) resultadoPlazosProyecto.get("plazosProyecto");
        for (PlazoProyecto plazoProyecto : plazosProyecto) {
            plazoProyecto.setFechaActaFormateada(Util.obtenerFechaFormateada(plazoProyecto.getFechaActa()));
            plazoProyecto.setFechaActaCODIFormateada(Util.obtenerFechaFormateada(plazoProyecto.getFechaActaCODI()));
        }

        return plazosProyecto;

    }

    @Override
    public Documento obtenerDocumentoPlazoProyecto(long idPlazo) {
        Documento documento = new Documento();
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdPlazo", idPlazo);

        Map resultado = obtenerDocumentoPlazoProyecto.execute(parametros);

        documento.setNombre((String) resultado.get("varNombre"));
        documento.setTipoContenido((String) resultado.get("varTipoContenido"));
        documento.setContenido((byte[]) resultado.get("varContenido"));

        return documento;

    }

    @Override
    public void eliminarPlazoProyecto(long idPlazo) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdPlazo", idPlazo);
        eliminarPlazoProyecto.execute(parametros);
    }

    @Override
    public void guardarCumplimientoCompromisoProyecto(long idProyecto, CumplimientoCompromisoProyecto cumplimientoCompromisoProyecto, Documento documento) {

        if (cumplimientoCompromisoProyecto.getIdCumplimientoCompromisoProyecto() == 0) {
            MapSqlParameterSource parametrosIngresoCumplimientoCompromisoProyecto = new MapSqlParameterSource();
            parametrosIngresoCumplimientoCompromisoProyecto.addValue("varIdProyecto", idProyecto);
            parametrosIngresoCumplimientoCompromisoProyecto.addValue("varIdCompromisoProyecto", cumplimientoCompromisoProyecto.getIdCompromisoProyecto());
            parametrosIngresoCumplimientoCompromisoProyecto.addValue("varFechaActa", cumplimientoCompromisoProyecto.getFechaActa());
            parametrosIngresoCumplimientoCompromisoProyecto.addValue("varNumeroActa", cumplimientoCompromisoProyecto.getNumeroActa());
            Map resultado = ingresarCumplimientoCompromisoProyecto.execute(parametrosIngresoCumplimientoCompromisoProyecto);
            long idCumplimientoCompromiso = (long) resultado.get("varIdCumplimientoCompromisoProyecto");

            MapSqlParameterSource parametrosIngresoDocumentoCumplimientoCompromisoProyecto = new MapSqlParameterSource();
            parametrosIngresoDocumentoCumplimientoCompromisoProyecto.addValue("varIdCumplimientoCompromisoProyecto", idCumplimientoCompromiso);
            parametrosIngresoDocumentoCumplimientoCompromisoProyecto.addValue("varNombre", documento.getNombre());
            parametrosIngresoDocumentoCumplimientoCompromisoProyecto.addValue("varTipoContenido", documento.getTipoContenido());
            parametrosIngresoDocumentoCumplimientoCompromisoProyecto.addValue("varContenido", documento.getContenido());
            ingresarDocumentoCumplimientoCompromisoProyecto.execute(parametrosIngresoDocumentoCumplimientoCompromisoProyecto);

        } else {
            MapSqlParameterSource parametrosActualizacionCumplimientoCompromisoProyecto = new MapSqlParameterSource();
            parametrosActualizacionCumplimientoCompromisoProyecto.addValue("varIdCumplimientoCompromisoProyecto", cumplimientoCompromisoProyecto.getIdCumplimientoCompromisoProyecto());
            parametrosActualizacionCumplimientoCompromisoProyecto.addValue("varIdCompromisoProyecto", cumplimientoCompromisoProyecto.getIdCompromisoProyecto());
            parametrosActualizacionCumplimientoCompromisoProyecto.addValue("varFechaActa", cumplimientoCompromisoProyecto.getFechaActa());
            parametrosActualizacionCumplimientoCompromisoProyecto.addValue("varNumeroActa", cumplimientoCompromisoProyecto.getNumeroActa());
            actualizarCumplimientoCompromisoProyecto.execute(parametrosActualizacionCumplimientoCompromisoProyecto);

            if (documento != null) {
                MapSqlParameterSource parametrosActualizacionDocumentoCumplimientoCompromisoProyecto = new MapSqlParameterSource();
                parametrosActualizacionDocumentoCumplimientoCompromisoProyecto.addValue("varIdCumplimientoCompromisoProyecto", cumplimientoCompromisoProyecto.getIdCumplimientoCompromisoProyecto());
                parametrosActualizacionDocumentoCumplimientoCompromisoProyecto.addValue("varNombre", documento.getNombre());
                parametrosActualizacionDocumentoCumplimientoCompromisoProyecto.addValue("varTipoContenido", documento.getTipoContenido());
                parametrosActualizacionDocumentoCumplimientoCompromisoProyecto.addValue("varContenido", documento.getContenido());
                actualizarDocumentoCumplimientoCompromisoProyecto.execute(parametrosActualizacionDocumentoCumplimientoCompromisoProyecto);
            }
        }
    }

    @Override
    public ArrayList<CumplimientoCompromisoProyecto> obtenerCumplimientoCompromisosProyecto(long idProyecto) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdProyecto", idProyecto);

        Map resultadoCumplimientoCompromisosProyecto = obtenerCumplimientoCompromisosProyecto.execute(parametros);
        ArrayList<CumplimientoCompromisoProyecto> cumplimientoCompromisosProyecto = (ArrayList<CumplimientoCompromisoProyecto>) resultadoCumplimientoCompromisosProyecto.get("cumplimientoCompromisosProyecto");
        for (CumplimientoCompromisoProyecto cumplimientoCompromisoProyecto : cumplimientoCompromisosProyecto) {
            cumplimientoCompromisoProyecto.setFechaActaFormateada(Util.obtenerFechaFormateada(cumplimientoCompromisoProyecto.getFechaActa()));
        }

        return cumplimientoCompromisosProyecto;

    }

    @Override
    public Documento obtenerDocumentoCumplimientoCompromisoProyecto(long idCumplimientoCompromisoProyecto) {
        Documento documento = new Documento();
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdCumplimientoCompromisoProyecto", idCumplimientoCompromisoProyecto);

        Map resultado = obtenerDocumentoCumplimientoCompromisoProyecto.execute(parametros);

        documento.setNombre((String) resultado.get("varNombre"));
        documento.setTipoContenido((String) resultado.get("varTipoContenido"));
        documento.setContenido((byte[]) resultado.get("varContenido"));

        return documento;

    }

    @Override
    public void eliminarCumplimientoCompromisoProyecto(long idCumplimientoCompromisoProyecto) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdCumplimientoCompromisoProyecto", idCumplimientoCompromisoProyecto);
        eliminarCumplimientoCompromisoProyecto.execute(parametros);
    }
    
    @Override
    public void guardarCompromisoHomologadoProyecto(long idProyecto, CompromisoHomologadoProyecto compromisoHomologadoProyecto) {

        if (compromisoHomologadoProyecto.getIdCompromisoHomologadoProyecto() == 0) {
            MapSqlParameterSource parametrosIngresoCompromisoHomologadoProyecto = new MapSqlParameterSource();
            parametrosIngresoCompromisoHomologadoProyecto.addValue("varIdProyecto", idProyecto);
            parametrosIngresoCompromisoHomologadoProyecto.addValue("varIdCompromisoProyectoHomologado", compromisoHomologadoProyecto.getIdCompromisoProyectoHomologado());
            parametrosIngresoCompromisoHomologadoProyecto.addValue("varIdCompromisoProyecto", compromisoHomologadoProyecto.getIdCompromisoProyecto());
            parametrosIngresoCompromisoHomologadoProyecto.addValue("varFechaActa", compromisoHomologadoProyecto.getFechaActa());
            parametrosIngresoCompromisoHomologadoProyecto.addValue("varNumeroActa", compromisoHomologadoProyecto.getNumeroActa());
            parametrosIngresoCompromisoHomologadoProyecto.addValue("varDescripcion", compromisoHomologadoProyecto.getDescripcion());
            parametrosIngresoCompromisoHomologadoProyecto.addValue("varObservaciones", compromisoHomologadoProyecto.getObservaciones());
            ingresarCompromisoHomologadoProyecto.execute(parametrosIngresoCompromisoHomologadoProyecto);

        } else {
            MapSqlParameterSource parametrosActualizacionCompromisoHomologadoProyecto = new MapSqlParameterSource();
            parametrosActualizacionCompromisoHomologadoProyecto.addValue("varIdCompromisoHomologadoProyecto", compromisoHomologadoProyecto.getIdCompromisoHomologadoProyecto());
            parametrosActualizacionCompromisoHomologadoProyecto.addValue("varIdCompromisoProyectoHomologado", compromisoHomologadoProyecto.getIdCompromisoProyectoHomologado());
            parametrosActualizacionCompromisoHomologadoProyecto.addValue("varIdCompromisoProyecto", compromisoHomologadoProyecto.getIdCompromisoProyecto());
            parametrosActualizacionCompromisoHomologadoProyecto.addValue("varFechaActa", compromisoHomologadoProyecto.getFechaActa());
            parametrosActualizacionCompromisoHomologadoProyecto.addValue("varNumeroActa", compromisoHomologadoProyecto.getNumeroActa());
            parametrosActualizacionCompromisoHomologadoProyecto.addValue("varDescripcion", compromisoHomologadoProyecto.getDescripcion());
            parametrosActualizacionCompromisoHomologadoProyecto.addValue("varObservaciones", compromisoHomologadoProyecto.getObservaciones());
            actualizarCompromisoHomologadoProyecto.execute(parametrosActualizacionCompromisoHomologadoProyecto);
        }
    }

    @Override
    public ArrayList<CompromisoHomologadoProyecto> obtenerCompromisoHomologadosProyecto(long idProyecto) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdProyecto", idProyecto);

        Map resultadoCompromisosHomologadosProyecto = obtenerCompromisosHomologadosProyecto.execute(parametros);
        ArrayList<CompromisoHomologadoProyecto> compromisoHomologadosProyecto = (ArrayList<CompromisoHomologadoProyecto>) resultadoCompromisosHomologadosProyecto.get("compromisosHomologadosProyecto");
        for (CompromisoHomologadoProyecto compromisoHomologadoProyecto : compromisoHomologadosProyecto) {
            compromisoHomologadoProyecto.setFechaActaFormateada(Util.obtenerFechaFormateada(compromisoHomologadoProyecto.getFechaActa()));
        }

        return compromisoHomologadosProyecto;

    }

    @Override
    public void eliminarCompromisoHomologadoProyecto(long idCompromisoHomologadoProyecto) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdCompromisoHomologadoProyecto", idCompromisoHomologadoProyecto);
        eliminarCompromisoHomologadoProyecto.execute(parametros);
    }
    
    @Override
    public void guardarCumplimientoAlertaAvalProyecto(long idProyecto, CumplimientoAlertaAvalProyecto cumplimientoAlertaAvalProyecto, Documento documento) {

        if (cumplimientoAlertaAvalProyecto.getIdCumplimientoAlertaAvalProyecto() == 0) {
            MapSqlParameterSource parametrosIngresoCumplimientoAlertaAvalProyecto = new MapSqlParameterSource();
            parametrosIngresoCumplimientoAlertaAvalProyecto.addValue("varIdProyecto", idProyecto);
            parametrosIngresoCumplimientoAlertaAvalProyecto.addValue("varIdAlertaAvalProyecto", cumplimientoAlertaAvalProyecto.getIdAlertaAvalProyecto());
            parametrosIngresoCumplimientoAlertaAvalProyecto.addValue("varFechaActa", cumplimientoAlertaAvalProyecto.getFechaActa());
            parametrosIngresoCumplimientoAlertaAvalProyecto.addValue("varNumeroActa", cumplimientoAlertaAvalProyecto.getNumeroActa());
            Map resultado = ingresarCumplimientoAlertaAvalProyecto.execute(parametrosIngresoCumplimientoAlertaAvalProyecto);
            long idCumplimientoAlertaAvalProyecto = (long) resultado.get("varIdCumplimientoAlertaAvalProyecto");

            MapSqlParameterSource parametrosIngresoDocumentoCumplimientoAlertaAvalProyecto = new MapSqlParameterSource();
            parametrosIngresoDocumentoCumplimientoAlertaAvalProyecto.addValue("varIdCumplimientoAlertaAvalProyecto", idCumplimientoAlertaAvalProyecto);
            parametrosIngresoDocumentoCumplimientoAlertaAvalProyecto.addValue("varNombre", documento.getNombre());
            parametrosIngresoDocumentoCumplimientoAlertaAvalProyecto.addValue("varTipoContenido", documento.getTipoContenido());
            parametrosIngresoDocumentoCumplimientoAlertaAvalProyecto.addValue("varContenido", documento.getContenido());
            ingresarDocumentoCumplimientoAlertaAvalProyecto.execute(parametrosIngresoDocumentoCumplimientoAlertaAvalProyecto);

        } else {
            MapSqlParameterSource parametrosActualizacionCumplimientoAlertaAvalProyecto = new MapSqlParameterSource();
            parametrosActualizacionCumplimientoAlertaAvalProyecto.addValue("varIdCumplimientoAlertaAvalProyecto", cumplimientoAlertaAvalProyecto.getIdCumplimientoAlertaAvalProyecto());
            parametrosActualizacionCumplimientoAlertaAvalProyecto.addValue("varIdAlertaAvalProyecto", cumplimientoAlertaAvalProyecto.getIdAlertaAvalProyecto());
            parametrosActualizacionCumplimientoAlertaAvalProyecto.addValue("varFechaActa", cumplimientoAlertaAvalProyecto.getFechaActa());
            parametrosActualizacionCumplimientoAlertaAvalProyecto.addValue("varNumeroActa", cumplimientoAlertaAvalProyecto.getNumeroActa());
            actualizarCumplimientoAlertaAvalProyecto.execute(parametrosActualizacionCumplimientoAlertaAvalProyecto);

            if (documento != null) {
                MapSqlParameterSource parametrosActualizacionDocumentoCumplimientoAlertaAvalProyecto = new MapSqlParameterSource();
                parametrosActualizacionDocumentoCumplimientoAlertaAvalProyecto.addValue("varIdCumplimientoAlertaAvalProyecto", cumplimientoAlertaAvalProyecto.getIdCumplimientoAlertaAvalProyecto());
                parametrosActualizacionDocumentoCumplimientoAlertaAvalProyecto.addValue("varNombre", documento.getNombre());
                parametrosActualizacionDocumentoCumplimientoAlertaAvalProyecto.addValue("varTipoContenido", documento.getTipoContenido());
                parametrosActualizacionDocumentoCumplimientoAlertaAvalProyecto.addValue("varContenido", documento.getContenido());
                actualizarDocumentoCumplimientoAlertaAvalProyecto.execute(parametrosActualizacionDocumentoCumplimientoAlertaAvalProyecto);
            }
        }
    }

    @Override
    public ArrayList<CumplimientoAlertaAvalProyecto> obtenerCumplimientosAlertasAvalProyecto(long idProyecto) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdProyecto", idProyecto);

        Map resultadoCumplimientosAlertasAvalProyecto = obtenerCumplimientosAlertasAvalProyecto.execute(parametros);
        ArrayList<CumplimientoAlertaAvalProyecto> cumplimientosAlertasAvalProyecto = (ArrayList<CumplimientoAlertaAvalProyecto>) resultadoCumplimientosAlertasAvalProyecto.get("cumplimientosAlertasAvalProyecto");
        for (CumplimientoAlertaAvalProyecto cumplimientoAlertaAvalProyecto : cumplimientosAlertasAvalProyecto) {
            cumplimientoAlertaAvalProyecto.setFechaActaFormateada(Util.obtenerFechaFormateada(cumplimientoAlertaAvalProyecto.getFechaActa()));
        }

        return cumplimientosAlertasAvalProyecto;

    }

    @Override
    public Documento obtenerDocumentoCumplimientoAlertaAvalProyecto(long idCumplimientoAlertaAvalProyecto) {
        Documento documento = new Documento();
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdCumplimientoAlertaAvalProyecto", idCumplimientoAlertaAvalProyecto);

        Map resultado = obtenerDocumentoCumplimientoAlertaAvalProyecto.execute(parametros);

        documento.setNombre((String) resultado.get("varNombre"));
        documento.setTipoContenido((String) resultado.get("varTipoContenido"));
        documento.setContenido((byte[]) resultado.get("varContenido"));

        return documento;

    }

    @Override
    public void eliminarCumplimientoAlertaAvalProyecto(long idCumplimientoAlertaAvalProyecto) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdCumplimientoAlertaAvalProyecto", idCumplimientoAlertaAvalProyecto);
        eliminarCumplimientoAlertaAvalProyecto.execute(parametros);
    }
}
