/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.controladores;

import co.edu.fnsp.gpci.entidades.ProyectosPorEstado;
import co.edu.fnsp.gpci.servicios.IServicioProyecto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.ui.Model;

/**
 *
 * @author William
 */
@Controller
public class IndexController {

    @Autowired
    private IServicioProyecto servicioProyecto;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(Model model) {
        String datosBarra = "";

        ProyectosPorEstado proyectosPorEstado = servicioProyecto.obtenerCantidadProyectosPorEstado();
        String datosGrafico = "[\n"
                + "      ['Estado', 'Cantidad'],\n"
                + "      ['Ejecución', " + proyectosPorEstado.getCantidadProyectosEjecucion() + "],\n"
                + "      ['Finalizado', " + proyectosPorEstado.getCantidadProyectosFinalizados() + "],\n"
                + "      ['Atrasado', " + proyectosPorEstado.getCantidadProyectosAtrasados() + "],\n"
                + "      ['Cancelado', " + proyectosPorEstado.getCantidadProyectosCancelados() + "],\n"
                + "      ['Trasladado', " + proyectosPorEstado.getCantidadProyectosTrasladados() + "]\n"
                + "    ]";

        model.addAttribute("datosBarra", datosBarra);
        model.addAttribute("datosGrafico", datosGrafico);

        return "index";
    }
}
