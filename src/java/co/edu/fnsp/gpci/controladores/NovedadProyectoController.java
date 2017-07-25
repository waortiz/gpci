/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.controladores;

import co.edu.fnsp.gpci.entidades.Documento;
import co.edu.fnsp.gpci.entidades.ActaProyecto;
import co.edu.fnsp.gpci.entidades.AdendaProyecto;
import co.edu.fnsp.gpci.entidades.AdicionProyecto;
import co.edu.fnsp.gpci.entidades.PlazoProyecto;
import co.edu.fnsp.gpci.entidades.ProrrogaProyecto;
import co.edu.fnsp.gpci.entidades.Proyecto;
import co.edu.fnsp.gpci.entidades.ReporteProyecto;
import co.edu.fnsp.gpci.entidades.TipoActa;
import co.edu.fnsp.gpci.entidadesVista.BusquedaProyectos;
import co.edu.fnsp.gpci.entidadesVista.ProyectoEdicion;
import co.edu.fnsp.gpci.servicios.IServicioMaestro;
import co.edu.fnsp.gpci.servicios.IServicioNovedadProyecto;
import co.edu.fnsp.gpci.utilidades.Util;
import com.google.gson.Gson;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author William
 */
@Controller
@RequestMapping(value = "/novedades")
public class NovedadProyectoController {

    private static final Logger logger = LogManager.getLogger(NovedadProyectoController.class.getName());

    @Autowired
    private IServicioNovedadProyecto servicioNovedadProyecto;

    @Autowired
    private IServicioMaestro servicioMaestro;
    
    /**
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/proyectos", method = RequestMethod.GET)
    public String obtenerProyectos(Model model) {

        model.addAttribute("proyectos", new ArrayList<>());
        BusquedaProyectos busquedaProyectos = new BusquedaProyectos();
        busquedaProyectos.establecerFechaInicioIncial();
        busquedaProyectos.establecerFechaInicioFinal();
        model.addAttribute("busquedaProyectos", busquedaProyectos);

        return "novedades/proyectos";
    }

    @RequestMapping(value = "/proyectos", method = RequestMethod.POST)
    public String buscarProyectos(@ModelAttribute(value = "busquedaProyectos") BusquedaProyectos busquedaProyectos, Model model) {

        ArrayList<ReporteProyecto> proyectos = new ArrayList<>();
        try {
            Date fechaFinal = Util.obtenerFecha(busquedaProyectos.getFechaFinal());
            Date fechaInicial = Util.obtenerFecha(busquedaProyectos.getFechaInicio());
            proyectos = servicioNovedadProyecto.obtenerProyectos(fechaInicial, fechaFinal);
        } catch (Exception ex) {
            logger.error(ex);
        }

        model.addAttribute("proyectos", proyectos);

        return "novedades/proyectos";
    }

    /**
     *
     * @param idProyecto
     * @param model
     * @return
     */
    @RequestMapping(value = "/editar/{idProyecto}", method = RequestMethod.GET)
    public String obtenerProyecto(@PathVariable long idProyecto, Model model) {
        ProyectoEdicion proyectoEdicion = new ProyectoEdicion();
        Proyecto proyecto = servicioNovedadProyecto.obtenerProyecto(idProyecto);
        proyectoEdicion.setIdProyecto(idProyecto);
        proyectoEdicion.setAreaTematica(proyecto.getAreaTematica().getNombre());
        proyectoEdicion.setCodigo(proyecto.getCodigo());
        proyectoEdicion.setCodigoCOLCIENCIAS(proyecto.getCodigoCOLCIENCIAS());
        proyectoEdicion.setCodigoSIIU(proyecto.getCodigoSIIU());
        proyectoEdicion.setCodigoSIU(proyecto.getCodigoSIU());
        proyectoEdicion.setConvocatoria(proyecto.getConvocatoria().getNombre());
        proyectoEdicion.setEnfoqueMetodologico(proyecto.getEnfoqueMetodologico().getNombre());
        proyectoEdicion.setEstado(proyecto.getEstado().getNombre());
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        proyectoEdicion.setFechaInicio(formatter.format(proyecto.getFechaInicio()));
        proyectoEdicion.setFechaFinalizacion(formatter.format(proyecto.getFechaFinalizacion()));
        proyectoEdicion.setGrupoInvestigacion(proyecto.getGrupoInvestigacion().getNombre());
        proyectoEdicion.setIngresadoSIGEP(proyecto.isIngresadoSIGEP());
        proyectoEdicion.setIngresadoSIIU(proyecto.isIngresadoSIIU());
        proyectoEdicion.setIngresadoSIU(proyecto.isIngresadoSIU());
        proyectoEdicion.setNombreCompletoProyecto(proyecto.getNombreCompletoProyecto());
        proyectoEdicion.setNombreCortoProyecto(proyecto.getNombreCortoProyecto());
        proyectoEdicion.setObjetivoGeneral(proyecto.getObjetivoGeneral());
        proyectoEdicion.setParticipacionInternacional(proyecto.isParticipacionInternacional());
        proyectoEdicion.setRiesgoEtico(proyecto.getRiesgoEtico().getNombre());
        proyectoEdicion.setTipoContrato(proyecto.getTipoContrato().getNombre());
        proyectoEdicion.setTipoProyecto(proyecto.getTipoProyecto().getNombre());
        proyectoEdicion.setActasProyecto(proyecto.getActasProyecto());
        proyectoEdicion.setAdendasProyecto(proyecto.getAdendasProyecto());
        proyectoEdicion.setAdicionesProyecto(proyecto.getAdicionesProyecto());
        proyectoEdicion.setProrrogasProyecto(proyecto.getProrrogasProyecto());
        proyectoEdicion.setPlazosProyecto(proyecto.getPlazosProyecto());
        if (proyecto.getActasProyecto().size() > 0) {
            model.addAttribute("actasProyectoJSON", proyectoEdicion.getActasProyectoJSON());
        }
        if (proyecto.getAdendasProyecto().size() > 0) {
            model.addAttribute("adendasProyectoJSON", proyectoEdicion.getAdendasProyectoJSON());
        }
        if (proyecto.getAdicionesProyecto().size() > 0) {
            model.addAttribute("adicionesProyectoJSON", proyectoEdicion.getAdicionesProyectoJSON());
        }
        if (proyecto.getProrrogasProyecto().size() > 0) {
            model.addAttribute("prorrogasProyectoJSON", proyectoEdicion.getProrrogasProyectoJSON());
        }
        if (proyecto.getPlazosProyecto().size() > 0) {
            model.addAttribute("plazosProyectoJSON", proyectoEdicion.getPlazosProyectoJSON());
        }
        List<TipoActa> tiposActa = servicioMaestro.obtenerTiposActa();

        model.addAttribute("tiposActa", tiposActa);
        model.addAttribute("proyecto", proyectoEdicion);

        return "novedades/editar";
    }

    @RequestMapping(value = {"/actaProyecto"}, method = RequestMethod.POST)
    public @ResponseBody
    String guardarActaProyecto(@ModelAttribute(value = "actaProyecto") co.edu.fnsp.gpci.entidadesVista.ActaProyecto actaProyecto, Model model) throws Exception {
        String json = "";
        try {
            ActaProyecto actaProyectoGuardar = new ActaProyecto();
            actaProyectoGuardar.setIdActa(actaProyecto.getIdActa());
            actaProyectoGuardar.setIdTipoActa(actaProyecto.getIdTipoActa());
            actaProyectoGuardar.setNombre(actaProyecto.getNombreActa());
            actaProyectoGuardar.setCodigo(actaProyecto.getCodigoActa());
            actaProyectoGuardar.setFecha(Util.obtenerFecha(actaProyecto.getFechaActa()));
            actaProyectoGuardar.setObservaciones(actaProyecto.getObservacionesActa());

            Documento documento = null;
            if (actaProyecto.getDocumentoActa() != null) {
                documento = new Documento();
                documento.setContenido(actaProyecto.getDocumentoActa().getBytes());
                documento.setNombre(actaProyecto.getDocumentoActa().getOriginalFilename());
                documento.setTipoContenido(actaProyecto.getDocumentoActa().getContentType());
            }
            servicioNovedadProyecto.guardarActaProyecto(actaProyecto.getIdProyecto(), actaProyectoGuardar, documento);
            ArrayList<ActaProyecto> actas = servicioNovedadProyecto.obtenerActasProyecto(actaProyecto.getIdProyecto());
            Gson gson = new Gson();
            json = gson.toJson(actas);

        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = "/documentoActa/{idActa}", method = RequestMethod.GET)
    public void obtenerDocumentoActa(@PathVariable("idActa") long idActa, HttpServletResponse response) throws IOException {
        Documento documento = servicioNovedadProyecto.obtenerDocumentoActaProyecto(idActa);
        response.setContentType(documento.getTipoContenido());
        response.setContentLength(documento.getContenido().length);
        response.setHeader("Content-Disposition", "attachment; filename=\"" + documento.getNombre() + "\"");
        FileCopyUtils.copy(documento.getContenido(), response.getOutputStream());
    }

    @RequestMapping(value = "/eliminarActa/{idProyecto}/{idActa}", method = RequestMethod.GET)
    public @ResponseBody
    String eliminarActa(@PathVariable("idProyecto") long idProyecto, @PathVariable("idActa") long idActa, Model model) {
        String json = "";
        try {
            servicioNovedadProyecto.eliminarActaProyecto(idActa);
            ArrayList<ActaProyecto> actas = servicioNovedadProyecto.obtenerActasProyecto(idProyecto);
            Gson gson = new Gson();
            json = gson.toJson(actas);
        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }      
    
    @RequestMapping(value = {"/adendaProyecto"}, method = RequestMethod.POST)
    public @ResponseBody
    String guardarAdendaProyecto(@ModelAttribute(value = "adendaProyecto") co.edu.fnsp.gpci.entidadesVista.AdendaProyecto adendaProyecto, Model model) throws Exception {
        String json = "";
        try {
            AdendaProyecto adendaProyectoGuardar = new AdendaProyecto();
            adendaProyectoGuardar.setIdAdenda(adendaProyecto.getIdAdenda());
            adendaProyectoGuardar.setModificacion(adendaProyecto.getModificacionAdenda());
            adendaProyectoGuardar.setFecha(Util.obtenerFecha(adendaProyecto.getFechaAdenda()));
            Documento documento = null;
            if (adendaProyecto.getDocumentoAdenda() != null) {
                documento = new Documento();
                documento.setContenido(adendaProyecto.getDocumentoAdenda().getBytes());
                documento.setNombre(adendaProyecto.getDocumentoAdenda().getOriginalFilename());
                documento.setTipoContenido(adendaProyecto.getDocumentoAdenda().getContentType());
            }
            servicioNovedadProyecto.guardarAdendaProyecto(adendaProyecto.getIdProyecto(), adendaProyectoGuardar, documento);
            ArrayList<AdendaProyecto> adendas = servicioNovedadProyecto.obtenerAdendasProyecto(adendaProyecto.getIdProyecto());
            Gson gson = new Gson();
            json = gson.toJson(adendas);

        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = "/documentoAdenda/{idAdenda}", method = RequestMethod.GET)
    public void obtenerDocumentoAdenda(@PathVariable("idAdenda") long idAdenda, HttpServletResponse response) throws IOException {
        Documento documento = servicioNovedadProyecto.obtenerDocumentoAdendaProyecto(idAdenda);
        response.setContentType(documento.getTipoContenido());
        response.setContentLength(documento.getContenido().length);
        response.setHeader("Content-Disposition", "attachment; filename=\"" + documento.getNombre() + "\"");
        FileCopyUtils.copy(documento.getContenido(), response.getOutputStream());
    }

    @RequestMapping(value = "/eliminarAdenda/{idProyecto}/{idAdenda}", method = RequestMethod.GET)
    public @ResponseBody
    String eliminarAdenda(@PathVariable("idProyecto") long idProyecto, @PathVariable("idAdenda") long idAdenda, Model model) {
        String json = "";
        try {
            servicioNovedadProyecto.eliminarAdendaProyecto(idAdenda);
            ArrayList<AdendaProyecto> adendas = servicioNovedadProyecto.obtenerAdendasProyecto(idProyecto);
            Gson gson = new Gson();
            json = gson.toJson(adendas);
        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }     
    
    @RequestMapping(value = {"/adicionProyecto"}, method = RequestMethod.POST)
    public @ResponseBody
    String guardarAdicionProyecto(@ModelAttribute(value = "adicionProyecto") co.edu.fnsp.gpci.entidadesVista.AdicionProyecto adicionProyecto, Model model) throws Exception {
        String json = "";
        try {
            AdicionProyecto adicionProyectoGuardar = new AdicionProyecto();
            adicionProyectoGuardar.setIdAdicion(adicionProyecto.getIdAdicion());
            adicionProyectoGuardar.setMonto(adicionProyecto.getMontoAdicion());
            adicionProyectoGuardar.setFecha(Util.obtenerFecha(adicionProyecto.getFechaAdicion()));
            Documento documento = null;
            if (adicionProyecto.getDocumentoAdicion() != null) {
                documento = new Documento();
                documento.setContenido(adicionProyecto.getDocumentoAdicion().getBytes());
                documento.setNombre(adicionProyecto.getDocumentoAdicion().getOriginalFilename());
                documento.setTipoContenido(adicionProyecto.getDocumentoAdicion().getContentType());
            }
            servicioNovedadProyecto.guardarAdicionProyecto(adicionProyecto.getIdProyecto(), adicionProyectoGuardar, documento);
            ArrayList<AdicionProyecto> adiciones = servicioNovedadProyecto.obtenerAdicionesProyecto(adicionProyecto.getIdProyecto());
            Gson gson = new Gson();
            json = gson.toJson(adiciones);

        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = "/documentoAdicion/{idAdicion}", method = RequestMethod.GET)
    public void obtenerDocumentoAdicion(@PathVariable("idAdicion") long idAdicion, HttpServletResponse response) throws IOException {
        Documento documento = servicioNovedadProyecto.obtenerDocumentoAdicionProyecto(idAdicion);
        response.setContentType(documento.getTipoContenido());
        response.setContentLength(documento.getContenido().length);
        response.setHeader("Content-Disposition", "attachment; filename=\"" + documento.getNombre() + "\"");
        FileCopyUtils.copy(documento.getContenido(), response.getOutputStream());
    }

    @RequestMapping(value = "/eliminarAdicion/{idProyecto}/{idAdicion}", method = RequestMethod.GET)
    public @ResponseBody
    String eliminarAdicion(@PathVariable("idProyecto") long idProyecto, @PathVariable("idAdicion") long idAdicion, Model model) {
        String json = "";
        try {
            servicioNovedadProyecto.eliminarAdicionProyecto(idAdicion);
            ArrayList<AdicionProyecto> adiciones = servicioNovedadProyecto.obtenerAdicionesProyecto(idProyecto);
            Gson gson = new Gson();
            json = gson.toJson(adiciones);
        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }    
    
    @RequestMapping(value = {"/prorrogaProyecto"}, method = RequestMethod.POST)
    public @ResponseBody
    String guardarProrrogaProyecto(@ModelAttribute(value = "prorrogaProyecto") co.edu.fnsp.gpci.entidadesVista.ProrrogaProyecto prorrogaProyecto, Model model) throws Exception {
        String json = "";
        try {
            ProrrogaProyecto prorrogaProyectoGuardar = new ProrrogaProyecto();
            prorrogaProyectoGuardar.setIdProrroga(prorrogaProyecto.getIdProrroga());
            prorrogaProyectoGuardar.setDescripcion(prorrogaProyecto.getDescripcionProrroga());
            prorrogaProyectoGuardar.setMesesAprobados(prorrogaProyecto.getMesesAprobadosProrroga());
            prorrogaProyectoGuardar.setFecha(Util.obtenerFecha(prorrogaProyecto.getFechaProrroga()));
            Documento documento = null;
            if (prorrogaProyecto.getDocumentoProrroga() != null) {
                documento = new Documento();
                documento.setContenido(prorrogaProyecto.getDocumentoProrroga().getBytes());
                documento.setNombre(prorrogaProyecto.getDocumentoProrroga().getOriginalFilename());
                documento.setTipoContenido(prorrogaProyecto.getDocumentoProrroga().getContentType());
            }
            servicioNovedadProyecto.guardarProrrogaProyecto(prorrogaProyecto.getIdProyecto(), prorrogaProyectoGuardar, documento);
            ArrayList<ProrrogaProyecto> prorrogas = servicioNovedadProyecto.obtenerProrrogasProyecto(prorrogaProyecto.getIdProyecto());
            Gson gson = new Gson();
            json = gson.toJson(prorrogas);

        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = "/documentoProrroga/{idProrroga}", method = RequestMethod.GET)
    public void obtenerDocumentoProrroga(@PathVariable("idProrroga") long idProrroga, HttpServletResponse response) throws IOException {
        Documento documento = servicioNovedadProyecto.obtenerDocumentoProrrogaProyecto(idProrroga);
        response.setContentType(documento.getTipoContenido());
        response.setContentLength(documento.getContenido().length);
        response.setHeader("Content-Disposition", "attachment; filename=\"" + documento.getNombre() + "\"");
        FileCopyUtils.copy(documento.getContenido(), response.getOutputStream());
    }

    @RequestMapping(value = "/eliminarProrroga/{idProyecto}/{idProrroga}", method = RequestMethod.GET)
    public @ResponseBody
    String eliminarProrroga(@PathVariable("idProyecto") long idProyecto, @PathVariable("idProrroga") long idProrroga, Model model) {
        String json = "";
        try {
            servicioNovedadProyecto.eliminarProrrogaProyecto(idProrroga);
            ArrayList<ProrrogaProyecto> prorrogas = servicioNovedadProyecto.obtenerProrrogasProyecto(idProyecto);
            Gson gson = new Gson();
            json = gson.toJson(prorrogas);
        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }
    
   @RequestMapping(value = {"/plazoProyecto"}, method = RequestMethod.POST)
    public @ResponseBody
    String guardarPlazoProyecto(@ModelAttribute(value = "plazoProyecto") co.edu.fnsp.gpci.entidadesVista.PlazoProyecto plazoProyecto, Model model) throws Exception {
        String json = "";
        try {
            PlazoProyecto plazoProyectoGuardar = new PlazoProyecto();
            plazoProyectoGuardar.setIdPlazo(plazoProyecto.getIdPlazo());
            plazoProyectoGuardar.setDescripcion(plazoProyecto.getDescripcionPlazo());
            plazoProyectoGuardar.setMesesAprobados(plazoProyecto.getMesesAprobadosPlazo());
            plazoProyectoGuardar.setFecha(Util.obtenerFecha(plazoProyecto.getFechaPlazo()));
            Documento documento = null;
            if (plazoProyecto.getDocumentoPlazo() != null) {
                documento = new Documento();
                documento.setContenido(plazoProyecto.getDocumentoPlazo().getBytes());
                documento.setNombre(plazoProyecto.getDocumentoPlazo().getOriginalFilename());
                documento.setTipoContenido(plazoProyecto.getDocumentoPlazo().getContentType());
            }
            servicioNovedadProyecto.guardarPlazoProyecto(plazoProyecto.getIdProyecto(), plazoProyectoGuardar, documento);
            ArrayList<PlazoProyecto> plazos = servicioNovedadProyecto.obtenerPlazosProyecto(plazoProyecto.getIdProyecto());
            Gson gson = new Gson();
            json = gson.toJson(plazos);

        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = "/documentoPlazo/{idPlazo}", method = RequestMethod.GET)
    public void obtenerDocumentoPlazo(@PathVariable("idPlazo") long idPlazo, HttpServletResponse response) throws IOException {
        Documento documento = servicioNovedadProyecto.obtenerDocumentoPlazoProyecto(idPlazo);
        response.setContentType(documento.getTipoContenido());
        response.setContentLength(documento.getContenido().length);
        response.setHeader("Content-Disposition", "attachment; filename=\"" + documento.getNombre() + "\"");
        FileCopyUtils.copy(documento.getContenido(), response.getOutputStream());
    }

    @RequestMapping(value = "/eliminarPlazo/{idProyecto}/{idPlazo}", method = RequestMethod.GET)
    public @ResponseBody
    String eliminarPlazo(@PathVariable("idProyecto") long idProyecto, @PathVariable("idPlazo") long idPlazo, Model model) {
        String json = "";
        try {
            servicioNovedadProyecto.eliminarPlazoProyecto(idPlazo);
            ArrayList<PlazoProyecto> plazos = servicioNovedadProyecto.obtenerPlazosProyecto(idProyecto);
            Gson gson = new Gson();
            json = gson.toJson(plazos);
        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }
}
