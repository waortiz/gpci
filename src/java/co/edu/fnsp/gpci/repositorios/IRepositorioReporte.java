/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.repositorios;

import co.edu.fnsp.gpci.entidades.ReporteFuenteFinanciacionProyecto;
import co.edu.fnsp.gpci.entidades.ReporteIntegranteProyecto;
import co.edu.fnsp.gpci.entidades.ReporteProyectoPorGrupoInvestigacion;
import java.util.ArrayList;

/**
 *
 * @author William
 */
public interface IRepositorioReporte {

    ArrayList<ReporteIntegranteProyecto> obtenerIntegrantesProyectos();

    ArrayList<ReporteProyectoPorGrupoInvestigacion> obtenerProyectosPorGrupoInvestigacion();

    ArrayList<ReporteFuenteFinanciacionProyecto> obtenerFuentesFinanciacionProyectos();
}
