/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.controladores;

import co.edu.fnsp.gpci.entidades.ReporteIntegranteProyecto;
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
import org.springframework.web.bind.annotation.ResponseBody;

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

    @RequestMapping(value = "/obtenerIntegrantesProyectos", method = RequestMethod.GET)
    public @ResponseBody
    String obtenerIntegrantesProyectos(Model model) {

        ArrayList<ReporteIntegranteProyecto> reporte = servicioReporte.obtenerIntegrantesProyectos();
        DatosIntegrantesProyectos datos = new DatosIntegrantesProyectos();
        datos.setDraw(1);
        datos.setRecordsFiltered(reporte.size());
        datos.setRecordsTotal(reporte.size());
        datos.setData(reporte);
        
        Gson gson = new Gson();
        String json = "";
        json = gson.toJson(datos);

        return json;
    }
}
