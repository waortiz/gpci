/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.repositorios;

import co.edu.fnsp.gpci.entidades.ActaProyecto;
import co.edu.fnsp.gpci.entidades.AdendaProyecto;
import co.edu.fnsp.gpci.entidades.AdicionProyecto;
import co.edu.fnsp.gpci.entidades.AreaTematica;
import co.edu.fnsp.gpci.entidades.Documento;
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

    private SimpleJdbcCall ingresarAdendaProyecto;
    private SimpleJdbcCall actualizarAdendaProyecto;
    private SimpleJdbcCall eliminarAdendaProyecto;
    private SimpleJdbcCall obtenerAdendasProyecto;
    private SimpleJdbcCall ingresarDocumentoAdendaProyecto;
    private SimpleJdbcCall obtenerDocumentoAdendaProyecto;
    private SimpleJdbcCall actualizarDocumentoAdendaProyecto;

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

    private SimpleJdbcCall ingresarAdicionProyecto;
    private SimpleJdbcCall actualizarAdicionProyecto;
    private SimpleJdbcCall eliminarAdicionProyecto;
    private SimpleJdbcCall obtenerAdicionesProyecto;
    private SimpleJdbcCall ingresarDocumentoAdicionProyecto;
    private SimpleJdbcCall obtenerDocumentoAdicionProyecto;
    private SimpleJdbcCall actualizarDocumentoAdicionProyecto;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        jdbcTemplate.setResultsMapCaseInsensitive(true);

        this.obtenerProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerProyecto");
        this.obtenerProyectos = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ObtenerProyectos").returningResultSet("proyectos", BeanPropertyRowMapper.newInstance(ReporteProyecto.class));

        this.ingresarAdendaProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarAdendaProyecto");
        this.eliminarAdendaProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("EliminarAdendaProyecto");
        this.actualizarAdendaProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarAdendaProyecto");
        this.obtenerAdendasProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerAdendasProyecto").returningResultSet("adendasProyecto", BeanPropertyRowMapper.newInstance(AdendaProyecto.class));
        this.ingresarDocumentoAdendaProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarDocumentoAdendaProyecto");
        this.obtenerDocumentoAdendaProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerDocumentoAdendaProyecto");
        this.actualizarDocumentoAdendaProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarDocumentoAdendaProyecto");

        this.ingresarActaProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarActaProyecto");
        this.eliminarActaProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("EliminarActaProyecto");
        this.actualizarActaProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarActaProyecto");
        this.obtenerActasProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerActasProyecto").returningResultSet("actasProyecto", BeanPropertyRowMapper.newInstance(ActaProyecto.class));
        this.ingresarDocumentoActaProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarDocumentoActaProyecto");
        this.obtenerDocumentoActaProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerDocumentoActaProyecto");
        this.actualizarDocumentoActaProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarDocumentoActaProyecto");

        this.ingresarAdicionProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarAdicionProyecto");
        this.eliminarAdicionProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("EliminarAdicionProyecto");
        this.actualizarAdicionProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarAdicionProyecto");
        this.obtenerAdicionesProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerAdicionesProyecto").returningResultSet("adicionesProyecto", BeanPropertyRowMapper.newInstance(AdicionProyecto.class));
        this.ingresarDocumentoAdicionProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarDocumentoAdicionProyecto");
        this.obtenerDocumentoAdicionProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerDocumentoAdicionProyecto");
        this.actualizarDocumentoAdicionProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarDocumentoAdicionProyecto");

        this.ingresarProrrogaProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("IngresarProrrogaProyecto");
        this.eliminarProrrogaProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("EliminarProrrogaProyecto");
        this.actualizarProrrogaProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ActualizarProrrogaProyecto");
        this.obtenerProrrogasProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerProrrogasProyecto").returningResultSet("prorrogasProyecto", BeanPropertyRowMapper.newInstance(ProrrogaProyecto.class));
        this.ingresarDocumentoProrrogaProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("ingresarDocumentoProrrogaProyecto");
        this.obtenerDocumentoProrrogaProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("obtenerDocumentoProrrogaProyecto");
        this.actualizarDocumentoProrrogaProyecto = new SimpleJdbcCall(jdbcTemplate).withProcedureName("actualizarDocumentoProrrogaProyecto");
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

        Map resultadoAdendas = obtenerAdendasProyecto.execute(parametros);
        ArrayList<AdendaProyecto> adendas = (ArrayList<AdendaProyecto>) resultadoAdendas.get("adendasProyecto");
        for (AdendaProyecto adendaProyecto : adendas) {
            adendaProyecto.setFechaFormateada(Util.obtenerFechaFormateada(adendaProyecto.getFecha()));
        }
        proyecto.setAdendasProyecto(adendas);

        Map resultadoAdiciones = obtenerAdicionesProyecto.execute(parametros);
        ArrayList<AdicionProyecto> adicionesProyecto = (ArrayList<AdicionProyecto>) resultadoAdiciones.get("adicionesProyecto");
        for (AdicionProyecto adicionProyecto : adicionesProyecto) {
            adicionProyecto.setFechaFormateada(Util.obtenerFechaFormateada(adicionProyecto.getFecha()));
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
            prorrogaProyecto.setFechaFormateada(Util.obtenerFechaFormateada(prorrogaProyecto.getFecha()));
        }
        proyecto.setProrrogasProyecto(prorrogasProyecto);

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

    @Override
    public void guardarActaProyecto(long idProyecto, ActaProyecto actaProyecto, Documento documento) {

        if (actaProyecto.getIdActa() == 0) {
            MapSqlParameterSource parametrosIngresoActaProyecto = new MapSqlParameterSource();
            parametrosIngresoActaProyecto.addValue("varIdProyecto", idProyecto);
            parametrosIngresoActaProyecto.addValue("varNombre", actaProyecto.getNombre());
            parametrosIngresoActaProyecto.addValue("varObservaciones", actaProyecto.getObservaciones());
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
            parametrosActualizacionActaProyecto.addValue("varNombre", actaProyecto.getNombre());
            parametrosActualizacionActaProyecto.addValue("varObservaciones", actaProyecto.getObservaciones());
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
    public void guardarAdendaProyecto(long idProyecto, AdendaProyecto adendaProyecto, Documento documento) {

        if (adendaProyecto.getIdAdenda() == 0) {
            MapSqlParameterSource parametrosIngresoAdendaProyecto = new MapSqlParameterSource();
            parametrosIngresoAdendaProyecto.addValue("varIdProyecto", idProyecto);
            parametrosIngresoAdendaProyecto.addValue("varModificacion", adendaProyecto.getModificacion());
            Map resultado = ingresarAdendaProyecto.execute(parametrosIngresoAdendaProyecto);
            long idAdenda = (long) resultado.get("varIdAdenda");

            MapSqlParameterSource parametrosIngresoDocumentoAdendaProyecto = new MapSqlParameterSource();
            parametrosIngresoDocumentoAdendaProyecto.addValue("varIdAdenda", idAdenda);
            parametrosIngresoDocumentoAdendaProyecto.addValue("varNombre", documento.getNombre());
            parametrosIngresoDocumentoAdendaProyecto.addValue("varTipoContenido", documento.getTipoContenido());
            parametrosIngresoDocumentoAdendaProyecto.addValue("varContenido", documento.getContenido());
            ingresarDocumentoAdendaProyecto.execute(parametrosIngresoDocumentoAdendaProyecto);

        } else {
            MapSqlParameterSource parametrosActualizacionAdendaProyecto = new MapSqlParameterSource();
            parametrosActualizacionAdendaProyecto.addValue("varIdAdenda", adendaProyecto.getIdAdenda());
            parametrosActualizacionAdendaProyecto.addValue("varModificacion", adendaProyecto.getModificacion());
            actualizarAdendaProyecto.execute(parametrosActualizacionAdendaProyecto);

            if (documento != null) {
                MapSqlParameterSource parametrosActualizacionDocumentoAdendaProyecto = new MapSqlParameterSource();
                parametrosActualizacionDocumentoAdendaProyecto.addValue("varIdAdenda", adendaProyecto.getIdAdenda());
                parametrosActualizacionDocumentoAdendaProyecto.addValue("varNombre", documento.getNombre());
                parametrosActualizacionDocumentoAdendaProyecto.addValue("varTipoContenido", documento.getTipoContenido());
                parametrosActualizacionDocumentoAdendaProyecto.addValue("varContenido", documento.getContenido());
                actualizarDocumentoAdendaProyecto.execute(parametrosActualizacionDocumentoAdendaProyecto);
            }
        }
    }

    @Override
    public ArrayList<AdendaProyecto> obtenerAdendasProyecto(long idProyecto) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdProyecto", idProyecto);

        Map resultadoAdendasProyecto = obtenerAdendasProyecto.execute(parametros);
        ArrayList<AdendaProyecto> adendasProyecto = (ArrayList<AdendaProyecto>) resultadoAdendasProyecto.get("adendasProyecto");
        for (AdendaProyecto adendaProyecto : adendasProyecto) {
            adendaProyecto.setFechaFormateada(Util.obtenerFechaFormateada(adendaProyecto.getFecha()));
        }

        return adendasProyecto;
    }

    @Override
    public Documento obtenerDocumentoAdendaProyecto(long idAdenda) {
        Documento documento = new Documento();
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdAdenda", idAdenda);

        Map resultado = obtenerDocumentoAdendaProyecto.execute(parametros);

        documento.setNombre((String) resultado.get("varNombre"));
        documento.setTipoContenido((String) resultado.get("varTipoContenido"));
        documento.setContenido((byte[]) resultado.get("varContenido"));

        return documento;
    }

    @Override
    public void eliminarAdendaProyecto(long idAdenda) {
        MapSqlParameterSource parametros = new MapSqlParameterSource();
        parametros.addValue("varIdAdenda", idAdenda);
        eliminarAdendaProyecto.execute(parametros);
    }

    @Override
    public void guardarAdicionProyecto(long idProyecto, AdicionProyecto adicionProyecto, Documento documento) {

        if (adicionProyecto.getIdAdicion() == 0) {
            MapSqlParameterSource parametrosIngresoAdicionProyecto = new MapSqlParameterSource();
            parametrosIngresoAdicionProyecto.addValue("varIdProyecto", idProyecto);
            parametrosIngresoAdicionProyecto.addValue("varMonto", adicionProyecto.getMonto());
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
            adicionProyecto.setFechaFormateada(Util.obtenerFechaFormateada(adicionProyecto.getFecha()));
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
            prorrogaProyecto.setFechaFormateada(Util.obtenerFechaFormateada(prorrogaProyecto.getFecha()));
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
}
