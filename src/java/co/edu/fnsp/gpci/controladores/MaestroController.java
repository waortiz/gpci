/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.controladores;

import co.edu.fnsp.gpci.entidades.AreaTematica;
import co.edu.fnsp.gpci.entidades.Convocatoria;
import co.edu.fnsp.gpci.servicios.IServicioMaestro;
import com.google.gson.Gson;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author William
 */
@Controller
@RequestMapping(value = "/maestros")
public class MaestroController {
    
    private static final Logger logger = LogManager.getLogger(MaestroController.class.getName());

    @Autowired
    private IServicioMaestro servicioMaestro;

    
    @RequestMapping(value = {"/convocatoria"}, method = RequestMethod.POST)
    public @ResponseBody
    String ingresarConvocatoria(@ModelAttribute(value = "convocatoria") co.edu.fnsp.gpci.entidadesVista.Convocatoria convocatoria, Model model) throws Exception {
        String json = "";
        try {
            Convocatoria convocatoriaGuardar = new Convocatoria();
            convocatoriaGuardar.setNombre(convocatoria.getNombreConvocatoria());
            int idConvocatoria = servicioMaestro.ingresarConvocatoria(convocatoriaGuardar);
            convocatoriaGuardar.setIdConvocatoria(idConvocatoria);
            Gson gson = new Gson();
            json = gson.toJson(idConvocatoria);

        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }
    
        @RequestMapping(value = {"/areaTematica"}, method = RequestMethod.POST)
    public @ResponseBody
    String ingresarAreaTematica(@ModelAttribute(value = "areaTematica") co.edu.fnsp.gpci.entidadesVista.AreaTematica areaTematica, Model model) throws Exception {
        String json = "";
        try {
            AreaTematica areaTematicaGuardar = new AreaTematica();
            areaTematicaGuardar.setNombre(areaTematica.getNombreAreaTematica());
            int idAreaTematica = servicioMaestro.ingresarAreaTematica(areaTematicaGuardar);
            areaTematicaGuardar.setIdAreaTematica(idAreaTematica);
            Gson gson = new Gson();
            json = gson.toJson(idAreaTematica);

        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }
}
