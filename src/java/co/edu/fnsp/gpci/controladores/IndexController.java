/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.controladores;

import co.edu.fnsp.gpci.entidades.ProyectoPorEstadoPorAnyo;
import co.edu.fnsp.gpci.entidades.CantidadProyectosPorEstado;
import co.edu.fnsp.gpci.servicios.IServicioReporte;
import com.google.gson.Gson;
import java.util.ArrayList;
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
    private IServicioReporte servicioReporte;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(Model model) {
        ArrayList<ProyectoPorEstadoPorAnyo> proyectosPorEstadoPorAnyo = servicioReporte.obtenerProyectosPorEstadoPorAnyo();
        Gson gson = new Gson();
        String datosBarra = gson.toJson(proyectosPorEstadoPorAnyo);
        model.addAttribute("datosBarra", datosBarra);
       
        CantidadProyectosPorEstado cantidadProyectosPorEstado = servicioReporte.obtenerCantidadProyectosPorEstado();
        String datosGrafico = "[\n"
                + "      ['Estado', 'Cantidad'],\n"
                + "      ['Ejecución', " + cantidadProyectosPorEstado.getCantidadProyectosEjecucion() + "],\n"
                + "      ['Finalizados', " + cantidadProyectosPorEstado.getCantidadProyectosFinalizados() + "],\n"
                + "      ['Atrasados', " + cantidadProyectosPorEstado.getCantidadProyectosAtrasados() + "],\n"
                + "    ]";
        model.addAttribute("datosGrafico", datosGrafico);

        return "index";
    }
}
