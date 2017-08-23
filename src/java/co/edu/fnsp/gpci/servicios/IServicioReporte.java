/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.servicios;

import co.edu.fnsp.gpci.entidades.ProyectoPorEstadoPorAnyo;
import co.edu.fnsp.gpci.entidades.CantidadProyectosPorEstado;
import co.edu.fnsp.gpci.entidades.ProyectoEstudiante;
import co.edu.fnsp.gpci.entidades.ProyectoPersonalExterno;
import co.edu.fnsp.gpci.entidades.ProyectoProfesor;
import co.edu.fnsp.gpci.entidades.ReporteFuenteFinanciacionProyecto;
import co.edu.fnsp.gpci.entidades.ReporteIntegranteProyecto;
import co.edu.fnsp.gpci.entidades.ReporteProfesorProyecto;
import co.edu.fnsp.gpci.entidades.ReporteProyectoInscrito;
import co.edu.fnsp.gpci.entidades.ReporteProyectoPorGrupoInvestigacion;
import java.util.List;

/**
 *
 * @author William
 */
public interface IServicioReporte {

    List<ReporteIntegranteProyecto> obtenerIntegrantesProyectos();

    List<ReporteProyectoPorGrupoInvestigacion> obtenerProyectosPorGrupoInvestigacion();

    List<ReporteFuenteFinanciacionProyecto> obtenerFuentesFinanciacionProyectos();
    
    List<ReporteProfesorProyecto> obtenerProyectosEjecucionAtrasadosProfesor(long numeroIdentificacion);
    
    List<ReporteProfesorProyecto> obtenerProyectosProfesor(long numeroIdentificacion);
    
    List<ReporteProyectoInscrito> obtenerProyectosInscritos();
        
    CantidadProyectosPorEstado obtenerCantidadProyectosPorEstado();

    List<ProyectoPorEstadoPorAnyo> obtenerProyectosPorEstadoPorAnyo();

    List<ProyectoProfesor> obtenerProyectosCertificadoProfesor(long idProfesor);

    List<ProyectoEstudiante> obtenerProyectosCertificadoEstudiante(long idEstudiante);
    
    List<ProyectoPersonalExterno> obtenerProyectosCertificadoPersonalExterno(long idPersonalExterno);
}
