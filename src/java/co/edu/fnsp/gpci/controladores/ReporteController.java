/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.controladores;

import co.edu.fnsp.gpci.entidades.ReporteFuenteFinanciacionProyecto;
import co.edu.fnsp.gpci.entidades.ReporteIntegranteProyecto;
import co.edu.fnsp.gpci.entidades.ReporteProyectoPorGrupoInvestigacion;
import co.edu.fnsp.gpci.entidadesVista.DatosIntegrantesProyectos;
import co.edu.fnsp.gpci.servicios.IServicioReporte;
import com.google.gson.Gson;
import java.util.ArrayList;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
}
