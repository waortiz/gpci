/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.repositorios;

import co.edu.fnsp.gpci.entidades.Proyecto;
import co.edu.fnsp.gpci.entidades.ReporteProyecto;
import co.edu.fnsp.gpci.entidades.ActaProyecto;
import co.edu.fnsp.gpci.entidades.AdendaCambioProyecto;
import co.edu.fnsp.gpci.entidades.AdendaIngresoProyecto;
import co.edu.fnsp.gpci.entidades.AdendaRetiroProyecto;
import co.edu.fnsp.gpci.entidades.AdicionProyecto;
import co.edu.fnsp.gpci.entidades.CumplimientoAlertaAvalProyecto;
import co.edu.fnsp.gpci.entidades.CumplimientoCompromisoProyecto;
import co.edu.fnsp.gpci.entidades.Documento;
import co.edu.fnsp.gpci.entidades.PlazoProyecto;
import co.edu.fnsp.gpci.entidades.ProrrogaProyecto;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author William
 */
public interface IRepositorioNovedadProyecto {
    Proyecto obtenerProyecto(long idProyecto);
    ArrayList<ReporteProyecto> obtenerProyectos(Date fechaInicio, Date fechaFinal);
    void guardarActaProyecto(long idProyecto, ActaProyecto actaProyecto, Documento documento);
    ArrayList<ActaProyecto> obtenerActasProyecto(long idProyecto);
    Documento obtenerDocumentoActaProyecto(long idActa);
    void eliminarActaProyecto(long idActa);
    void guardarAdicionProyecto(long idProyecto, AdicionProyecto adicionProyecto, Documento documento);
    ArrayList<AdicionProyecto> obtenerAdicionesProyecto(long idProyecto);
    Documento obtenerDocumentoAdicionProyecto(long idAdicion);
    void eliminarAdicionProyecto(long idAdicion);
    void guardarProrrogaProyecto(long idProyecto, ProrrogaProyecto prorrogaProyecto, Documento documento);
    ArrayList<ProrrogaProyecto> obtenerProrrogasProyecto(long idProyecto);
    Documento obtenerDocumentoProrrogaProyecto(long idProrroga);
    void eliminarProrrogaProyecto(long idProrroga);
    void guardarPlazoProyecto(long idProyecto, PlazoProyecto plazoProyecto, Documento documento);
    ArrayList<PlazoProyecto> obtenerPlazosProyecto(long idProyecto);
    Documento obtenerDocumentoPlazoProyecto(long idPlazo);
    void eliminarPlazoProyecto(long idPlazo);    
    void guardarAdendaCambioProyecto(long idProyecto, AdendaCambioProyecto adendaCambioProyecto, Documento documento);
    ArrayList<AdendaCambioProyecto> obtenerAdendasCambioProyecto(long idProyecto);
    Documento obtenerDocumentoAdendaCambioProyecto(long idAdenda);
    void eliminarAdendaCambioProyecto(long idAdenda);
    void guardarAdendaIngresoProyecto(long idProyecto, AdendaIngresoProyecto adendaIngresoProyecto, Documento documento);
    ArrayList<AdendaIngresoProyecto> obtenerAdendasIngresoProyecto(long idProyecto);
    Documento obtenerDocumentoAdendaIngresoProyecto(long idAdenda);
    void eliminarAdendaIngresoProyecto(long idAdenda);
    void guardarAdendaRetiroProyecto(long idProyecto, AdendaRetiroProyecto adendaRetiroProyecto, Documento documento);
    ArrayList<AdendaRetiroProyecto> obtenerAdendasRetiroProyecto(long idProyecto);
    Documento obtenerDocumentoAdendaRetiroProyecto(long idAdenda);
    void eliminarAdendaRetiroProyecto(long idAdenda);
    void guardarCumplimientoCompromisoProyecto(long idProyecto, CumplimientoCompromisoProyecto cumplimientoCompromisoProyecto, Documento documento);
    ArrayList<CumplimientoCompromisoProyecto> obtenerCumplimientoCompromisosProyecto(long idProyecto);
    Documento obtenerDocumentoCumplimientoCompromisoProyecto(long idCumplimientoCompromisoProyecto);
    void eliminarCumplimientoCompromisoProyecto(long idCumplimientoCompromisoProyecto);    
    void guardarCumplimientoAlertaAvalProyecto(long idProyecto, CumplimientoAlertaAvalProyecto cumplimientoAlertaAvalProyecto, Documento documento);
    ArrayList<CumplimientoAlertaAvalProyecto> obtenerCumplimientosAlertasAvalProyecto(long idProyecto);
    Documento obtenerDocumentoCumplimientoAlertaAvalProyecto(long idCumplimientoAlertaAvalProyecto);
    void eliminarCumplimientoAlertaAvalProyecto(long idCumplimientoAlertaAvalProyecto);    
}
