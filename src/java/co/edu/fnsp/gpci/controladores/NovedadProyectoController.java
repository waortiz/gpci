/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.controladores;

import co.edu.fnsp.gpci.entidades.Documento;
import co.edu.fnsp.gpci.entidades.ActaProyecto;
import co.edu.fnsp.gpci.entidades.AdendaCambioProyecto;
import co.edu.fnsp.gpci.entidades.AdendaIngresoProyecto;
import co.edu.fnsp.gpci.entidades.AdendaRetiroProyecto;
import co.edu.fnsp.gpci.entidades.AdicionProyecto;
import co.edu.fnsp.gpci.entidades.AlertaAvalProyecto;
import co.edu.fnsp.gpci.entidades.CompromisoProyecto;
import co.edu.fnsp.gpci.entidades.CumplimientoAlertaAvalProyecto;
import co.edu.fnsp.gpci.entidades.CumplimientoCompromisoProyecto;
import co.edu.fnsp.gpci.entidades.PersonalExterno;
import co.edu.fnsp.gpci.entidades.PlazoProyecto;
import co.edu.fnsp.gpci.entidades.Profesor;
import co.edu.fnsp.gpci.entidades.ProrrogaProyecto;
import co.edu.fnsp.gpci.entidades.Proyecto;
import co.edu.fnsp.gpci.entidades.ReporteProyecto;
import co.edu.fnsp.gpci.entidades.Rol;
import co.edu.fnsp.gpci.entidades.TipoActa;
import co.edu.fnsp.gpci.entidades.TipoIdentificacion;
import co.edu.fnsp.gpci.entidades.TipoPersona;
import co.edu.fnsp.gpci.entidadesVista.BusquedaProyectos;
import co.edu.fnsp.gpci.entidades.Estudiante;
import co.edu.fnsp.gpci.entidadesVista.ProyectoEdicion;
import co.edu.fnsp.gpci.servicios.IServicioMaestro;
import co.edu.fnsp.gpci.servicios.IServicioNovedadProyecto;
import co.edu.fnsp.gpci.servicios.IServicioProyecto;
import co.edu.fnsp.gpci.utilidades.Util;
import com.google.gson.Gson;
import co.edu.fnsp.gpci.entidades.TipoPersonaEnum;
import java.io.IOException;
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

    @Autowired
    private IServicioProyecto servicioProyecto;

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
        proyectoEdicion.setFechaInicio(Util.obtenerFechaFormateada(proyecto.getFechaInicio()));
        proyectoEdicion.setFechaFinalizacion(Util.obtenerFechaFormateada(proyecto.getFechaFinalizacion()));
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
        proyectoEdicion.setAdendasCambioProyecto(proyecto.getAdendasCambioProyecto());
        proyectoEdicion.setAdendasIngresoProyecto(proyecto.getAdendasIngresoProyecto());
        proyectoEdicion.setAdendasRetiroProyecto(proyecto.getAdendasRetiroProyecto());
        proyectoEdicion.setAdicionesProyecto(proyecto.getAdicionesProyecto());
        proyectoEdicion.setProrrogasProyecto(proyecto.getProrrogasProyecto());
        proyectoEdicion.setPlazosProyecto(proyecto.getPlazosProyecto());

        List<Rol> roles = servicioMaestro.obtenerRoles();
        List<TipoIdentificacion> tiposIdentificacion = servicioMaestro.obtenerTiposIdentificacion();
        List<TipoPersona> tiposPersona = servicioMaestro.obtenerTiposPersona();
        List<TipoActa> tiposActa = servicioMaestro.obtenerTiposActa();
        List<CompromisoProyecto> compromisosProyecto = servicioProyecto.obtenerCompromisosProyecto(idProyecto);
        List<AlertaAvalProyecto> alertasAvalProyecto = servicioProyecto.obtenerAlertasAvalProyecto(idProyecto);

        model.addAttribute("tiposActa", tiposActa);
        model.addAttribute("tiposIdentificacion", tiposIdentificacion);
        model.addAttribute("roles", roles);
        model.addAttribute("tiposPersona", tiposPersona);
        model.addAttribute("compromisosProyecto", compromisosProyecto);
        model.addAttribute("alertasAvalProyecto", alertasAvalProyecto);

        if (proyecto.getActasProyecto().size() > 0) {
            model.addAttribute("actasProyectoJSON", proyectoEdicion.getActasProyectoJSON());
        }
        if (proyecto.getAdendasCambioProyecto().size() > 0) {
            model.addAttribute("adendasCambioProyectoJSON", proyectoEdicion.getAdendasCambioProyectoJSON());
        }
        if (proyecto.getAdendasIngresoProyecto().size() > 0) {
            model.addAttribute("adendasIngresoProyectoJSON", proyectoEdicion.getAdendasIngresoProyectoJSON());
        }
        if (proyecto.getAdendasRetiroProyecto().size() > 0) {
            model.addAttribute("adendasRetiroProyectoJSON", proyectoEdicion.getAdendasRetiroProyectoJSON());
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
        if (proyecto.getCumplimientoCompromisosProyecto().size() > 0) {
            model.addAttribute("cumplimientoCompromisosProyectoJSON", proyectoEdicion.getCumplimientoCompromisosProyectoJSON());
        }
        if (proyecto.getCumplimientosAlertasAvalProyecto().size() > 0) {
            model.addAttribute("cumplimientosAlertasAvalProyectoJSON", proyectoEdicion.getCumplimientosAlertasAvalProyectoJSON());
        }
        
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
            actaProyectoGuardar.setNumero(actaProyecto.getNumeroActa());
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

    @RequestMapping(value = {"/adendaCambioProyecto"}, method = RequestMethod.POST)
    public @ResponseBody
    String guardarAdendaCambioProyecto(@ModelAttribute(value = "adendaCambioProyecto") co.edu.fnsp.gpci.entidadesVista.AdendaCambioProyecto adendaCambioProyecto, Model model) throws Exception {
        String json = "";
        try {
            AdendaCambioProyecto adendaProyectoGuardar = new AdendaCambioProyecto();
            if (adendaCambioProyecto.getTipoPersonaAdendaCambio() == TipoPersonaEnum.PROFESOR.getIdTipoPersona()) {
                Profesor profesor = servicioProyecto.obtenerProfesor(adendaCambioProyecto.getTipoIdentificacionPersonaAdendaCambio(), adendaCambioProyecto.getNumeroIdentificacionPersonaAdendaCambio());
                if (profesor != null) {
                    adendaProyectoGuardar.setIdPersona(profesor.getIdProfesor());
                } else {
                    throw new Exception("El profesor no existe");
                }
            } else if (adendaCambioProyecto.getTipoPersonaAdendaCambio() == TipoPersonaEnum.ESTUDIANTE.getIdTipoPersona()) {
                Estudiante estudiante = servicioProyecto.obtenerEstudiante(adendaCambioProyecto.getTipoIdentificacionPersonaAdendaCambio(), adendaCambioProyecto.getNumeroIdentificacionPersonaAdendaCambio());
                if (estudiante != null) {
                    adendaProyectoGuardar.setIdPersona(estudiante.getIdEstudiante());
                } else {
                    throw new Exception("El estudiante no existe");
                }
            } else if (adendaCambioProyecto.getTipoPersonaAdendaCambio() == TipoPersonaEnum.PERSONAL_EXTERNO.getIdTipoPersona()) {
                PersonalExterno personalExterno = servicioProyecto.obtenerPersonalExterno(adendaCambioProyecto.getTipoIdentificacionPersonaAdendaCambio(), adendaCambioProyecto.getNumeroIdentificacionPersonaAdendaCambio());
                if (personalExterno != null) {
                    adendaProyectoGuardar.setIdPersona(personalExterno.getIdPersonalExterno());
                } else {
                    throw new Exception("El personal externo no existe");
                }
            }

            adendaProyectoGuardar.setIdAdenda(adendaCambioProyecto.getIdAdenda());
            adendaProyectoGuardar.setFechaCambio(adendaCambioProyecto.getFechaAdendaCambio());
            adendaProyectoGuardar.setFechaActa(adendaCambioProyecto.getFechaActaAdendaCambio());
            adendaProyectoGuardar.setNumeroActa(adendaCambioProyecto.getNumeroActaAdendaCambio());
            adendaProyectoGuardar.setIdRol(adendaCambioProyecto.getRolAdendaCambio());
            adendaProyectoGuardar.setIdTipoPersona(adendaCambioProyecto.getTipoPersonaAdendaCambio());
            adendaProyectoGuardar.setIdTipoIdentificacionPersona(adendaCambioProyecto.getTipoIdentificacionPersonaAdendaCambio());
            adendaProyectoGuardar.setNumeroIdentificacionPersona(adendaCambioProyecto.getNumeroIdentificacionPersonaAdendaCambio());
            adendaProyectoGuardar.setObservaciones(adendaCambioProyecto.getObservacionesAdendaCambio());
            Documento documento = null;
            if (adendaCambioProyecto.getDocumentoAdendaCambio() != null) {
                documento = new Documento();
                documento.setContenido(adendaCambioProyecto.getDocumentoAdendaCambio().getBytes());
                documento.setNombre(adendaCambioProyecto.getDocumentoAdendaCambio().getOriginalFilename());
                documento.setTipoContenido(adendaCambioProyecto.getDocumentoAdendaCambio().getContentType());
            }
            servicioNovedadProyecto.guardarAdendaCambioProyecto(adendaCambioProyecto.getIdProyecto(), adendaProyectoGuardar, documento);
            ArrayList<AdendaCambioProyecto> adendas = servicioNovedadProyecto.obtenerAdendasCambioProyecto(adendaCambioProyecto.getIdProyecto());
            Gson gson = new Gson();
            json = gson.toJson(adendas);

        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = "/documentoAdendaCambio/{idAdenda}", method = RequestMethod.GET)
    public void obtenerDocumentoAdenda(@PathVariable("idAdenda") long idAdenda, HttpServletResponse response) throws IOException {
        Documento documento = servicioNovedadProyecto.obtenerDocumentoAdendaCambioProyecto(idAdenda);
        response.setContentType(documento.getTipoContenido());
        response.setContentLength(documento.getContenido().length);
        response.setHeader("Content-Disposition", "attachment; filename=\"" + documento.getNombre() + "\"");
        FileCopyUtils.copy(documento.getContenido(), response.getOutputStream());
    }

    @RequestMapping(value = "/eliminarAdendaCambio/{idProyecto}/{idAdenda}", method = RequestMethod.GET)
    public @ResponseBody
    String eliminarAdenda(@PathVariable("idProyecto") long idProyecto, @PathVariable("idAdenda") long idAdenda, Model model) {
        String json = "";
        try {
            servicioNovedadProyecto.eliminarAdendaCambioProyecto(idAdenda);
            ArrayList<AdendaCambioProyecto> adendas = servicioNovedadProyecto.obtenerAdendasCambioProyecto(idProyecto);
            Gson gson = new Gson();
            json = gson.toJson(adendas);
        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = {"/adendaIngresoProyecto"}, method = RequestMethod.POST)
    public @ResponseBody
    String guardarAdendaIngresoProyecto(@ModelAttribute(value = "adendaIngresoProyecto") co.edu.fnsp.gpci.entidadesVista.AdendaIngresoProyecto adendaIngresoProyecto, Model model) throws Exception {
        String json = "";
        try {
            AdendaIngresoProyecto adendaProyectoGuardar = new AdendaIngresoProyecto();
            if (adendaIngresoProyecto.getTipoPersonaAdendaIngreso() == TipoPersonaEnum.PROFESOR.getIdTipoPersona()) {
                Profesor profesor = servicioProyecto.obtenerProfesor(adendaIngresoProyecto.getTipoIdentificacionPersonaAdendaIngreso(), adendaIngresoProyecto.getNumeroIdentificacionPersonaAdendaIngreso());
                if (profesor != null) {
                    adendaProyectoGuardar.setIdPersona(profesor.getIdProfesor());
                } else {
                    throw new Exception("El profesor no existe");
                }
            } else if (adendaIngresoProyecto.getTipoPersonaAdendaIngreso() == TipoPersonaEnum.ESTUDIANTE.getIdTipoPersona()) {
                Estudiante estudiante = servicioProyecto.obtenerEstudiante(adendaIngresoProyecto.getTipoIdentificacionPersonaAdendaIngreso(), adendaIngresoProyecto.getNumeroIdentificacionPersonaAdendaIngreso());
                if (estudiante != null) {
                    adendaProyectoGuardar.setIdPersona(estudiante.getIdEstudiante());
                } else {
                    throw new Exception("El estudiante no existe");
                }
            } else if (adendaIngresoProyecto.getTipoPersonaAdendaIngreso() == TipoPersonaEnum.PERSONAL_EXTERNO.getIdTipoPersona()) {
                PersonalExterno personalExterno = servicioProyecto.obtenerPersonalExterno(adendaIngresoProyecto.getTipoIdentificacionPersonaAdendaIngreso(), adendaIngresoProyecto.getNumeroIdentificacionPersonaAdendaIngreso());
                if (personalExterno != null) {
                    adendaProyectoGuardar.setIdPersona(personalExterno.getIdPersonalExterno());
                } else {
                    throw new Exception("El personal externo no existe");
                }
            }

            adendaProyectoGuardar.setIdAdenda(adendaIngresoProyecto.getIdAdenda());
            adendaProyectoGuardar.setFechaIngreso(adendaIngresoProyecto.getFechaAdendaIngreso());
            adendaProyectoGuardar.setFechaActa(adendaIngresoProyecto.getFechaActaAdendaIngreso());
            adendaProyectoGuardar.setNumeroActa(adendaIngresoProyecto.getNumeroActaAdendaIngreso());
            adendaProyectoGuardar.setIdTipoPersona(adendaIngresoProyecto.getTipoPersonaAdendaIngreso());
            adendaProyectoGuardar.setIdTipoIdentificacionPersona(adendaIngresoProyecto.getTipoIdentificacionPersonaAdendaIngreso());
            adendaProyectoGuardar.setNumeroIdentificacionPersona(adendaIngresoProyecto.getNumeroIdentificacionPersonaAdendaIngreso());
            Documento documento = null;
            if (adendaIngresoProyecto.getDocumentoAdendaIngreso() != null) {
                documento = new Documento();
                documento.setContenido(adendaIngresoProyecto.getDocumentoAdendaIngreso().getBytes());
                documento.setNombre(adendaIngresoProyecto.getDocumentoAdendaIngreso().getOriginalFilename());
                documento.setTipoContenido(adendaIngresoProyecto.getDocumentoAdendaIngreso().getContentType());
            }
            servicioNovedadProyecto.guardarAdendaIngresoProyecto(adendaIngresoProyecto.getIdProyecto(), adendaProyectoGuardar, documento);
            ArrayList<AdendaIngresoProyecto> adendas = servicioNovedadProyecto.obtenerAdendasIngresoProyecto(adendaIngresoProyecto.getIdProyecto());
            Gson gson = new Gson();
            json = gson.toJson(adendas);

        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = "/documentoAdendaIngreso/{idAdenda}", method = RequestMethod.GET)
    public void obtenerDocumentoAdendaIngreso(@PathVariable("idAdenda") long idAdenda, HttpServletResponse response) throws IOException {
        Documento documento = servicioNovedadProyecto.obtenerDocumentoAdendaIngresoProyecto(idAdenda);
        response.setContentType(documento.getTipoContenido());
        response.setContentLength(documento.getContenido().length);
        response.setHeader("Content-Disposition", "attachment; filename=\"" + documento.getNombre() + "\"");
        FileCopyUtils.copy(documento.getContenido(), response.getOutputStream());
    }

    @RequestMapping(value = "/eliminarAdendaIngreso/{idProyecto}/{idAdenda}", method = RequestMethod.GET)
    public @ResponseBody
    String eliminarAdendaIngreso(@PathVariable("idProyecto") long idProyecto, @PathVariable("idAdenda") long idAdenda, Model model) {
        String json = "";
        try {
            servicioNovedadProyecto.eliminarAdendaIngresoProyecto(idAdenda);
            ArrayList<AdendaIngresoProyecto> adendas = servicioNovedadProyecto.obtenerAdendasIngresoProyecto(idProyecto);
            Gson gson = new Gson();
            json = gson.toJson(adendas);
        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = {"/adendaRetiroProyecto"}, method = RequestMethod.POST)
    public @ResponseBody
    String guardarAdendaRetiroProyecto(@ModelAttribute(value = "adendaRetiroProyecto") co.edu.fnsp.gpci.entidadesVista.AdendaRetiroProyecto adendaRetiroProyecto, Model model) throws Exception {
        String json = "";
        try {
            AdendaRetiroProyecto adendaProyectoGuardar = new AdendaRetiroProyecto();
            if (adendaRetiroProyecto.getTipoPersonaAdendaRetiro() == TipoPersonaEnum.PROFESOR.getIdTipoPersona()) {
                Profesor profesor = servicioProyecto.obtenerProfesor(adendaRetiroProyecto.getTipoIdentificacionPersonaAdendaRetiro(), adendaRetiroProyecto.getNumeroIdentificacionPersonaAdendaRetiro());
                if (profesor != null) {
                    adendaProyectoGuardar.setIdPersona(profesor.getIdProfesor());
                } else {
                    throw new Exception("El profesor no existe");
                }
            } else if (adendaRetiroProyecto.getTipoPersonaAdendaRetiro() == TipoPersonaEnum.ESTUDIANTE.getIdTipoPersona()) {
                Estudiante estudiante = servicioProyecto.obtenerEstudiante(adendaRetiroProyecto.getTipoIdentificacionPersonaAdendaRetiro(), adendaRetiroProyecto.getNumeroIdentificacionPersonaAdendaRetiro());
                if (estudiante != null) {
                    adendaProyectoGuardar.setIdPersona(estudiante.getIdEstudiante());
                } else {
                    throw new Exception("El estudiante no existe");
                }
            } else if (adendaRetiroProyecto.getTipoPersonaAdendaRetiro() == TipoPersonaEnum.PERSONAL_EXTERNO.getIdTipoPersona()) {
                PersonalExterno personalExterno = servicioProyecto.obtenerPersonalExterno(adendaRetiroProyecto.getTipoIdentificacionPersonaAdendaRetiro(), adendaRetiroProyecto.getNumeroIdentificacionPersonaAdendaRetiro());
                if (personalExterno != null) {
                    adendaProyectoGuardar.setIdPersona(personalExterno.getIdPersonalExterno());
                } else {
                    throw new Exception("El personal externo no existe");
                }
            }

            adendaProyectoGuardar.setIdAdenda(adendaRetiroProyecto.getIdAdenda());
            adendaProyectoGuardar.setFechaRetiro(adendaRetiroProyecto.getFechaAdendaRetiro());
            adendaProyectoGuardar.setFechaActa(adendaRetiroProyecto.getFechaActaAdendaRetiro());
            adendaProyectoGuardar.setNumeroActa(adendaRetiroProyecto.getNumeroActaAdendaRetiro());
            adendaProyectoGuardar.setIdTipoPersona(adendaRetiroProyecto.getTipoPersonaAdendaRetiro());
            adendaProyectoGuardar.setIdTipoIdentificacionPersona(adendaRetiroProyecto.getTipoIdentificacionPersonaAdendaRetiro());
            adendaProyectoGuardar.setNumeroIdentificacionPersona(adendaRetiroProyecto.getNumeroIdentificacionPersonaAdendaRetiro());
            adendaProyectoGuardar.setMotivo(adendaRetiroProyecto.getMotivoAdendaRetiro());
            Documento documento = null;
            if (adendaRetiroProyecto.getDocumentoAdendaRetiro() != null) {
                documento = new Documento();
                documento.setContenido(adendaRetiroProyecto.getDocumentoAdendaRetiro().getBytes());
                documento.setNombre(adendaRetiroProyecto.getDocumentoAdendaRetiro().getOriginalFilename());
                documento.setTipoContenido(adendaRetiroProyecto.getDocumentoAdendaRetiro().getContentType());
            }
            servicioNovedadProyecto.guardarAdendaRetiroProyecto(adendaRetiroProyecto.getIdProyecto(), adendaProyectoGuardar, documento);
            ArrayList<AdendaRetiroProyecto> adendas = servicioNovedadProyecto.obtenerAdendasRetiroProyecto(adendaRetiroProyecto.getIdProyecto());
            Gson gson = new Gson();
            json = gson.toJson(adendas);

        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = "/documentoAdendaRetiro/{idAdenda}", method = RequestMethod.GET)
    public void obtenerDocumentoAdendaRetiro(@PathVariable("idAdenda") long idAdenda, HttpServletResponse response) throws IOException {
        Documento documento = servicioNovedadProyecto.obtenerDocumentoAdendaRetiroProyecto(idAdenda);
        response.setContentType(documento.getTipoContenido());
        response.setContentLength(documento.getContenido().length);
        response.setHeader("Content-Disposition", "attachment; filename=\"" + documento.getNombre() + "\"");
        FileCopyUtils.copy(documento.getContenido(), response.getOutputStream());
    }

    @RequestMapping(value = "/eliminarAdendaRetiro/{idProyecto}/{idAdenda}", method = RequestMethod.GET)
    public @ResponseBody
    String eliminarAdendaRetiro(@PathVariable("idProyecto") long idProyecto, @PathVariable("idAdenda") long idAdenda, Model model) {
        String json = "";
        try {
            servicioNovedadProyecto.eliminarAdendaRetiroProyecto(idAdenda);
            ArrayList<AdendaRetiroProyecto> adendas = servicioNovedadProyecto.obtenerAdendasRetiroProyecto(idProyecto);
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
            adicionProyectoGuardar.setDescripcion(adicionProyecto.getDescripcionAdicion());
            adicionProyectoGuardar.setNumeroActa(adicionProyecto.getNumeroActaAdicion());
            adicionProyectoGuardar.setFechaActa(adicionProyecto.getFechaActaAdicion());
            adicionProyectoGuardar.setNumeroActaCODI(adicionProyecto.getNumeroActaCODIAdicion());
            adicionProyectoGuardar.setFechaActaCODI(adicionProyecto.getFechaActaCODIAdicion());
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
            prorrogaProyectoGuardar.setFechaActa(prorrogaProyecto.getFechaActaProrroga());
            prorrogaProyectoGuardar.setNumeroActaCODI(prorrogaProyecto.getNumeroActaCODIProrroga());
            prorrogaProyectoGuardar.setFechaActaCODI(prorrogaProyecto.getFechaActaCODIProrroga());
            prorrogaProyectoGuardar.setMontoAprobado(Util.obtenerNumero(prorrogaProyecto.getMontoAprobadoProrroga()));
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
            plazoProyectoGuardar.setFechaActa(plazoProyecto.getFechaActaPlazo());
            plazoProyectoGuardar.setFechaActaCODI(plazoProyecto.getFechaActaCODIPlazo());
            plazoProyectoGuardar.setNumeroActa(plazoProyecto.getNumeroActaPlazo());
            plazoProyectoGuardar.setNumeroActaCODI(plazoProyecto.getNumeroActaCODIPlazo());
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

    @RequestMapping(value = {"/cumplimientoCompromisoProyecto"}, method = RequestMethod.POST)
    public @ResponseBody
    String guardarCumplimientoCompromisoProyecto(@ModelAttribute(value = "cumplimientoCompromisoProyecto") co.edu.fnsp.gpci.entidadesVista.CumplimientoCompromisoProyecto cumplimientoCompromisoProyecto, Model model) throws Exception {
        String json = "";
        try {
            CumplimientoCompromisoProyecto cumplimientoCompromisoProyectoGuardar = new CumplimientoCompromisoProyecto();
            cumplimientoCompromisoProyectoGuardar.setIdCumplimientoCompromisoProyecto(cumplimientoCompromisoProyecto.getIdCumplimientoCompromisoProyecto());
            cumplimientoCompromisoProyectoGuardar.setIdCompromisoProyecto(cumplimientoCompromisoProyecto.getCompromisoProyecto());
            cumplimientoCompromisoProyectoGuardar.setFechaActa(cumplimientoCompromisoProyecto.getFechaActaCumplimientoCompromisoProyecto());
            cumplimientoCompromisoProyectoGuardar.setNumeroActa(cumplimientoCompromisoProyecto.getNumeroActaCumplimientoCompromisoProyecto());
            Documento documento = null;
            if (cumplimientoCompromisoProyecto.getDocumentoCumplimientoCompromisoProyecto() != null) {
                documento = new Documento();
                documento.setContenido(cumplimientoCompromisoProyecto.getDocumentoCumplimientoCompromisoProyecto().getBytes());
                documento.setNombre(cumplimientoCompromisoProyecto.getDocumentoCumplimientoCompromisoProyecto().getOriginalFilename());
                documento.setTipoContenido(cumplimientoCompromisoProyecto.getDocumentoCumplimientoCompromisoProyecto().getContentType());
            }
            servicioNovedadProyecto.guardarCumplimientoCompromisoProyecto(cumplimientoCompromisoProyecto.getIdProyecto(), cumplimientoCompromisoProyectoGuardar, documento);
            ArrayList<CumplimientoCompromisoProyecto> cumplimientoCompromisos = servicioNovedadProyecto.obtenerCumplimientoCompromisosProyecto(cumplimientoCompromisoProyecto.getIdProyecto());
            Gson gson = new Gson();
            json = gson.toJson(cumplimientoCompromisos);

        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = "/documentoCumplimientoCompromisoProyecto/{idCumplimientoCompromisoProyecto}", method = RequestMethod.GET)
    public void obtenerDocumentoCumplimientoCompromisoProyecto(@PathVariable("idCumplimientoCompromisoProyecto") long idCumplimientoCompromisoProyecto, HttpServletResponse response) throws IOException {
        Documento documento = servicioNovedadProyecto.obtenerDocumentoCumplimientoCompromisoProyecto(idCumplimientoCompromisoProyecto);
        response.setContentType(documento.getTipoContenido());
        response.setContentLength(documento.getContenido().length);
        response.setHeader("Content-Disposition", "attachment; filename=\"" + documento.getNombre() + "\"");
        FileCopyUtils.copy(documento.getContenido(), response.getOutputStream());
    }

    @RequestMapping(value = "/eliminarCumplimientoCompromisoProyecto/{idProyecto}/{idCumplimientoCompromisoProyecto}", method = RequestMethod.GET)
    public @ResponseBody
    String eliminarCumplimientoCompromisoProyecto(@PathVariable("idProyecto") long idProyecto, @PathVariable("idCumplimientoCompromisoProyecto") long idCumplimientoCompromisoProyecto, Model model) {
        String json = "";
        try {
            servicioNovedadProyecto.eliminarCumplimientoCompromisoProyecto(idCumplimientoCompromisoProyecto);
            ArrayList<CumplimientoCompromisoProyecto> cumplimientoCompromisos = servicioNovedadProyecto.obtenerCumplimientoCompromisosProyecto(idProyecto);
            Gson gson = new Gson();
            json = gson.toJson(cumplimientoCompromisos);
        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = {"/cumplimientoAlertaAvalProyecto"}, method = RequestMethod.POST)
    public @ResponseBody
    String guardarCumplimientoAlertaAvalProyecto(@ModelAttribute(value = "cumplimientoAlertaAvalProyecto") co.edu.fnsp.gpci.entidadesVista.CumplimientoAlertaAvalProyecto cumplimientoAlertaAvalProyecto, Model model) throws Exception {
        String json = "";
        try {
            CumplimientoAlertaAvalProyecto cumplimientoAlertaAvalProyectoGuardar = new CumplimientoAlertaAvalProyecto();
            cumplimientoAlertaAvalProyectoGuardar.setIdCumplimientoAlertaAvalProyecto(cumplimientoAlertaAvalProyecto.getIdCumplimientoAlertaAvalProyecto());
            cumplimientoAlertaAvalProyectoGuardar.setIdAlertaAvalProyecto(cumplimientoAlertaAvalProyecto.getAlertaAvalProyecto());
            cumplimientoAlertaAvalProyectoGuardar.setFechaActa(cumplimientoAlertaAvalProyecto.getFechaActaCumplimientoAlertaAvalProyecto());
            cumplimientoAlertaAvalProyectoGuardar.setNumeroActa(cumplimientoAlertaAvalProyecto.getNumeroActaCumplimientoAlertaAvalProyecto());
            Documento documento = null;
            if (cumplimientoAlertaAvalProyecto.getDocumentoCumplimientoAlertaAvalProyecto() != null) {
                documento = new Documento();
                documento.setContenido(cumplimientoAlertaAvalProyecto.getDocumentoCumplimientoAlertaAvalProyecto().getBytes());
                documento.setNombre(cumplimientoAlertaAvalProyecto.getDocumentoCumplimientoAlertaAvalProyecto().getOriginalFilename());
                documento.setTipoContenido(cumplimientoAlertaAvalProyecto.getDocumentoCumplimientoAlertaAvalProyecto().getContentType());
            }
            servicioNovedadProyecto.guardarCumplimientoAlertaAvalProyecto(cumplimientoAlertaAvalProyecto.getIdProyecto(), cumplimientoAlertaAvalProyectoGuardar, documento);
            ArrayList<CumplimientoAlertaAvalProyecto> cumplimientosAlertasAval = servicioNovedadProyecto.obtenerCumplimientosAlertasAvalProyecto(cumplimientoAlertaAvalProyecto.getIdProyecto());
            Gson gson = new Gson();
            json = gson.toJson(cumplimientosAlertasAval);

        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }

    @RequestMapping(value = "/documentoCumplimientoAlertaAvalProyecto/{idCumplimientoAlertaAvalProyecto}", method = RequestMethod.GET)
    public void obtenerDocumentoCumplimientoAlertaAvalProyecto(@PathVariable("idCumplimientoAlertaAvalProyecto") long idCumplimientoAlertaAvalProyecto, HttpServletResponse response) throws IOException {
        Documento documento = servicioNovedadProyecto.obtenerDocumentoCumplimientoAlertaAvalProyecto(idCumplimientoAlertaAvalProyecto);
        response.setContentType(documento.getTipoContenido());
        response.setContentLength(documento.getContenido().length);
        response.setHeader("Content-Disposition", "attachment; filename=\"" + documento.getNombre() + "\"");
        FileCopyUtils.copy(documento.getContenido(), response.getOutputStream());
    }

    @RequestMapping(value = "/eliminarCumplimientoAlertaAvalProyecto/{idProyecto}/{idCumplimientoAlertaAvalProyecto}", method = RequestMethod.GET)
    public @ResponseBody
    String eliminarCumplimientoAlertaAvalProyecto(@PathVariable("idProyecto") long idProyecto, @PathVariable("idCumplimientoAlertaAvalProyecto") long idCumplimientoAlertaAvalProyecto, Model model) {
        String json = "";
        try {
            servicioNovedadProyecto.eliminarCumplimientoAlertaAvalProyecto(idCumplimientoAlertaAvalProyecto);
            ArrayList<CumplimientoAlertaAvalProyecto> cumplimientosAlertasAvalProyecto = servicioNovedadProyecto.obtenerCumplimientosAlertasAvalProyecto(idProyecto);
            Gson gson = new Gson();
            json = gson.toJson(cumplimientosAlertasAvalProyecto);
        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }

        return json;
    }
}
