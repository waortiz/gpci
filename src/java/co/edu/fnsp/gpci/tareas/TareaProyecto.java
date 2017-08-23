/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.tareas;

import co.edu.fnsp.gpci.entidades.CompromisoProyecto;
import co.edu.fnsp.gpci.entidades.ProyectoNotificacion;
import co.edu.fnsp.gpci.repositorios.IRepositorioProyecto;
import co.edu.fnsp.gpci.utilidades.Mail;
import java.util.ArrayList;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

/**
 *
 * @author William
 */

public class TareaProyecto {
 
    private @Value("${dias.previo.notificacion.vencimiento.plazo.proyecto}") int diasPreviosNotificacion;
    private static final Logger logger = LogManager.getLogger(TareaProyecto.class.getName());

    @Autowired
    private Mail mail;

    @Autowired
    private IRepositorioProyecto repositorioProyecto;
    
    public void notificarVencimientoPlazoProyectos() {
        ArrayList<ProyectoNotificacion> proyectos = repositorioProyecto.obtenerProyectosNotificar(diasPreviosNotificacion);
        for (ProyectoNotificacion proyecto : proyectos) {
            try {
                ArrayList<CompromisoProyecto> compromisosProyecto = repositorioProyecto.obtenerCompromisosProyectoPorCumplir(proyecto.getIdProyecto());
                StringBuilder notificacion = new StringBuilder();
                notificacion.append("Sr(a) <b><i>").append(proyecto.getInvestigadorPrincipal()).append("</i></b><br /><br />El proyecto ").append(proyecto.getNombreCortoProyecto()).append(" está próximo a vencerse en los plazos regulares.");
                if(compromisosProyecto.size() > 0) {
                    notificacion.append(" Los compromisos pendientes son:<br /><ul>");
                }
                for (CompromisoProyecto compromisoProyecto : compromisosProyecto) {
                    notificacion.append("<li>").append(compromisoProyecto.getDescripcion()).append("</li>");
                }
                if(compromisosProyecto.size() > 0) {
                    notificacion.append("</ul>");
                }
                mail.sendMail(proyecto.getCorreoElectronico(), "Notificación Vencimiento Proyecto", notificacion.toString());
                repositorioProyecto.ingresarNotificacionVencimientoPlazo(proyecto.getIdProyecto(), proyecto.getIdTipoPersona(), proyecto.getIdPersona());
            } catch (Exception exc) {
                logger.error(exc);
            }
        }
    }   
}
