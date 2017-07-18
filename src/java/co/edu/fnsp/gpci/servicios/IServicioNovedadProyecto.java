/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.servicios;

import co.edu.fnsp.gpci.entidades.Proyecto;
import co.edu.fnsp.gpci.entidades.ReporteProyecto;
import co.edu.fnsp.gpci.entidades.ActaProyecto;
import co.edu.fnsp.gpci.entidades.AdendaProyecto;
import co.edu.fnsp.gpci.entidades.AdicionProyecto;
import co.edu.fnsp.gpci.entidades.Documento;
import co.edu.fnsp.gpci.entidades.PlazoProyecto;
import co.edu.fnsp.gpci.entidades.ProrrogaProyecto;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author William
 */
public interface IServicioNovedadProyecto {
    Proyecto obtenerProyecto(long idProyecto);
    ArrayList<ReporteProyecto> obtenerProyectos(Date fechaInicio, Date fechaFinal);
    void guardarActaProyecto(long idProyecto, ActaProyecto actaProyecto, Documento documento);
    ArrayList<ActaProyecto> obtenerActasProyecto(long idProyecto);
    Documento obtenerDocumentoActaProyecto(long idActa);
    void eliminarActaProyecto(long idActa);
    void guardarAdendaProyecto(long idProyecto, AdendaProyecto adendaProyecto, Documento documento);
    ArrayList<AdendaProyecto> obtenerAdendasProyecto(long idProyecto);
    Documento obtenerDocumentoAdendaProyecto(long idAdenda);
    void eliminarAdendaProyecto(long idAdenda);
    void guardarAdicionProyecto(long idProyecto, AdicionProyecto actaProyecto, Documento documento);
    ArrayList<AdicionProyecto> obtenerAdicionesProyecto(long idProyecto);
    Documento obtenerDocumentoAdicionProyecto(long idAdicion);
    void eliminarAdicionProyecto(long idAdicion);
    void guardarProrrogaProyecto(long idProyecto, ProrrogaProyecto actaProyecto, Documento documento);
    ArrayList<ProrrogaProyecto> obtenerProrrogasProyecto(long idProyecto);
    Documento obtenerDocumentoProrrogaProyecto(long idProrroga);
    void eliminarProrrogaProyecto(long idProrroga);    
    void guardarPlazoProyecto(long idProyecto, PlazoProyecto actaProyecto, Documento documento);
    ArrayList<PlazoProyecto> obtenerPlazosProyecto(long idProyecto);
    Documento obtenerDocumentoPlazoProyecto(long idPlazo);
    void eliminarPlazoProyecto(long idPlazo);        
}
