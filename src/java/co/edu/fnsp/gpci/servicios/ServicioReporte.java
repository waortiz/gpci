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
import co.edu.fnsp.gpci.entidades.SeguimientoProyecto;
import co.edu.fnsp.gpci.entidades.SeguimientoProyectoProfesor;
import co.edu.fnsp.gpci.repositorios.IRepositorioReporte;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author William
 */
@Service("servicioReporte")
public class ServicioReporte implements IServicioReporte {
    @Autowired
    private IRepositorioReporte repositorioReporte;

    @Override
    public List<ReporteIntegranteProyecto> obtenerIntegrantesProyectos() {
        return repositorioReporte.obtenerIntegrantesProyectos();
    }

    @Override
    public List<ReporteProyectoPorGrupoInvestigacion> obtenerProyectosPorGrupoInvestigacion() {
        return repositorioReporte.obtenerProyectosPorGrupoInvestigacion();
    }

    @Override
    public List<ReporteFuenteFinanciacionProyecto> obtenerFuentesFinanciacionProyectos() {
         return repositorioReporte.obtenerFuentesFinanciacionProyectos();
    }

    @Override
    public List<ReporteProfesorProyecto> obtenerProyectosEjecucionAtrasadosProfesor(long numeroIdentificacion) {
        return repositorioReporte.obtenerProyectosEjecucionAtrasadosProfesor(numeroIdentificacion);
    }
    @Override
    public List<ReporteProfesorProyecto> obtenerProyectosProfesor(long numeroIdentificacion) {
        return repositorioReporte.obtenerProyectosProfesor(numeroIdentificacion);
    }

    @Override
    public List<ReporteProyectoInscrito> obtenerProyectosInscritos() {
        return repositorioReporte.obtenerProyectosInscritos();
    }
    
    @Override
    public CantidadProyectosPorEstado obtenerCantidadProyectosPorEstado() {
        return repositorioReporte.obtenerCantidadProyectosPorEstado();
    }

    @Override
    public List<ProyectoPorEstadoPorAnyo> obtenerProyectosPorEstadoPorAnyo() {
        return repositorioReporte.obtenerProyectosPorEstadoPorAnyo();
    }

    @Override
    public List<ProyectoEstudiante> obtenerProyectosCertificadoEstudiante(long idEstudiante) {
        return repositorioReporte.obtenerProyectosCertificadoEstudiante(idEstudiante);
    }

    @Override
    public List<ProyectoPersonalExterno> obtenerProyectosCertificadoPersonalExterno(long idPersonalExterno) {
        return repositorioReporte.obtenerProyectosCertificadoPersonalExterno(idPersonalExterno);
    }

    @Override
    public List<ProyectoProfesor> obtenerProyectosCertificadoProfesor(long idProfesor) {
         return repositorioReporte.obtenerProyectosCertificadoProfesor(idProfesor);
    }

    @Override
    public List<SeguimientoProyectoProfesor> obtenerSeguimientoProyectosProfesor(long idProfesor) {
        return repositorioReporte.obtenerSeguimientoProyectosProfesor(idProfesor);
    }

    @Override
    public List<SeguimientoProyecto> obtenerSeguimientoProyecto(String codigo) {
        return repositorioReporte.obtenerSeguimientoProyecto(codigo);
    }
}
