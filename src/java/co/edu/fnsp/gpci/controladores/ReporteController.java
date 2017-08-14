/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.controladores;

import co.edu.fnsp.gpci.entidades.ReporteFuenteFinanciacionProyecto;
import co.edu.fnsp.gpci.entidades.ReporteIntegranteProyecto;
import co.edu.fnsp.gpci.entidades.ReporteProfesorProyecto;
import co.edu.fnsp.gpci.entidades.ReporteProyecto;
import co.edu.fnsp.gpci.entidades.ReporteProyectoInscrito;
import co.edu.fnsp.gpci.entidades.ReporteProyectoPorGrupoInvestigacion;
import co.edu.fnsp.gpci.entidadesVista.BusquedaProyectos;
import co.edu.fnsp.gpci.entidadesVista.DatosIntegrantesProyectos;
import co.edu.fnsp.gpci.servicios.IServicioReporte;
import co.edu.fnsp.gpci.utilidades.Util;
import com.google.gson.Gson;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 *
 * @author William
 */
@Controller
@RequestMapping(value = "/reportes")
public class ReporteController {

    private static final Logger logger = LogManager.getLogger(ReporteController.class.getName());

    @Autowired
    private IServicioReporte servicioReporte;

    /**
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/integrantesProyectos", method = RequestMethod.GET)
    public String obtenerProyectos(Model model) {

        ArrayList<ReporteIntegranteProyecto> reporte = servicioReporte.obtenerIntegrantesProyectos();
        model.addAttribute("reporte", reporte);

        return "reportes/integrantesProyectos";
    }

    /**
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/proyectosPorGrupoInvestigacion", method = RequestMethod.GET)
    public String obtenerProyectosPorGrupoInvestigacion(Model model) {

        ArrayList<ReporteProyectoPorGrupoInvestigacion> reporte = servicioReporte.obtenerProyectosPorGrupoInvestigacion();
        model.addAttribute("reporte", reporte);

        return "reportes/proyectosPorGrupoInvestigacion";
    }

     /**
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/fuentesFinanciacionProyectos", method = RequestMethod.GET)
    public String obtenerFuentesFinanciacionProyectos(Model model) {

        ArrayList<ReporteFuenteFinanciacionProyecto> reporte = servicioReporte.obtenerFuentesFinanciacionProyectos();
        model.addAttribute("reporte", reporte);

        return "reportes/fuentesFinanciacionProyectos";
    }
    
    @RequestMapping(value = "/proyectosEjecucionAtrasadosProfesor", method = RequestMethod.GET)
    public String mostrarProyectosEjecucionAtrasadosProfesor(Model model) {

        model.addAttribute("reporte", new ArrayList<>());
        BusquedaProyectos busquedaProyectos = new BusquedaProyectos();
        model.addAttribute("busquedaProyectos", busquedaProyectos);

        return "reportes/proyectosEjecucionAtrasadosProfesor";
    }
    
   @RequestMapping(value = "/proyectosEjecucionAtrasadosProfesor", method = RequestMethod.POST)
    public String obtenerProyectosEjecucionAtrasadosProfesor(@ModelAttribute(value = "busquedaProyectos") BusquedaProyectos busquedaProyectos, Model model) {

        ArrayList<ReporteProfesorProyecto> proyectos = new ArrayList<>();
        try {
            proyectos = servicioReporte.obtenerProyectosEjecucionAtrasadosProfesor(Long.parseLong(busquedaProyectos.getCedulaProfesor()));
        } catch (Exception ex) {
            logger.error(ex);
        }

        model.addAttribute("reporte", proyectos);

        return "reportes/proyectosEjecucionAtrasadosProfesor";
    }

    @RequestMapping(value = "/proyectosProfesor", method = RequestMethod.GET)
    public String mostrarProyectosProfesor(Model model) {

        model.addAttribute("reporte", new ArrayList<>());
        BusquedaProyectos busquedaProyectos = new BusquedaProyectos();
        model.addAttribute("busquedaProyectos", busquedaProyectos);

        return "reportes/proyectosProfesor";
    }
    
   @RequestMapping(value = "/proyectosProfesor", method = RequestMethod.POST)
    public String obtenerProyectosProfesor(@ModelAttribute(value = "busquedaProyectos") BusquedaProyectos busquedaProyectos, Model model) {

        ArrayList<ReporteProfesorProyecto> proyectos = new ArrayList<>();
        try {
            proyectos = servicioReporte.obtenerProyectosProfesor(Long.parseLong(busquedaProyectos.getCedulaProfesor()));
        } catch (Exception ex) {
            logger.error(ex);
        }

        model.addAttribute("reporte", proyectos);

        return "reportes/proyectosProfesor";
    }

     /**
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/proyectosInscritos", method = RequestMethod.GET)
    public String obtenerProyectosInscritos(Model model) {

        ArrayList<ReporteProyectoInscrito> reporte = servicioReporte.obtenerProyectosInscritos();
        model.addAttribute("reporte", reporte);

        return "reportes/proyectosInscritos";
    }
}
