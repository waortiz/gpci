/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.servicios;

import co.edu.fnsp.gpci.entidades.ProyectoPorEstadoPorAnyo;
import co.edu.fnsp.gpci.entidades.CantidadProyectosPorEstado;
import co.edu.fnsp.gpci.entidades.ReporteFuenteFinanciacionProyecto;
import co.edu.fnsp.gpci.entidades.ReporteIntegranteProyecto;
import co.edu.fnsp.gpci.entidades.ReporteProfesorProyecto;
import co.edu.fnsp.gpci.entidades.ReporteProyectoInscrito;
import co.edu.fnsp.gpci.entidades.ReporteProyectoPorGrupoInvestigacion;
import java.util.ArrayList;

/**
 *
 * @author William
 */
public interface IServicioReporte {

    ArrayList<ReporteIntegranteProyecto> obtenerIntegrantesProyectos();

    ArrayList<ReporteProyectoPorGrupoInvestigacion> obtenerProyectosPorGrupoInvestigacion();

    ArrayList<ReporteFuenteFinanciacionProyecto> obtenerFuentesFinanciacionProyectos();
    
    ArrayList<ReporteProfesorProyecto> obtenerProyectosEjecucionAtrasadosProfesor(long numeroIdentificacion);
    
    ArrayList<ReporteProfesorProyecto> obtenerProyectosProfesor(long numeroIdentificacion);
    
    ArrayList<ReporteProyectoInscrito> obtenerProyectosInscritos();
        
    CantidadProyectosPorEstado obtenerCantidadProyectosPorEstado();

    ArrayList<ProyectoPorEstadoPorAnyo> obtenerProyectosPorEstadoPorAnyo();
}
