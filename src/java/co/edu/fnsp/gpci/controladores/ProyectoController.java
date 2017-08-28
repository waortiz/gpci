/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.controladores;

import co.edu.fnsp.gpci.editores.AreaTematicaEditor;
import co.edu.fnsp.gpci.editores.ConvocatoriaEditor;
import co.edu.fnsp.gpci.editores.EnfoqueMetodologicoEditor;
import co.edu.fnsp.gpci.editores.EstadoProyectoEditor;
import co.edu.fnsp.gpci.editores.RiesgoEticoEditor;
import co.edu.fnsp.gpci.editores.TipoContratoEditor;
import co.edu.fnsp.gpci.editores.TipoProyectoEditor;
import co.edu.fnsp.gpci.entidades.AreaTematica;
import co.edu.fnsp.gpci.entidades.EnfoqueMetodologico;
import co.edu.fnsp.gpci.entidades.EstadoProyecto;
import co.edu.fnsp.gpci.entidades.Estudiante;
import co.edu.fnsp.gpci.entidades.Facultad;
import co.edu.fnsp.gpci.entidades.FuenteFinanciacion;
import co.edu.fnsp.gpci.entidades.GrupoInvestigacion;
import co.edu.fnsp.gpci.entidades.GrupoInvestigacionProyecto;
import co.edu.fnsp.gpci.entidades.PersonalExterno;
import co.edu.fnsp.gpci.entidades.Profesor;
import co.edu.fnsp.gpci.entidades.Programa;
import co.edu.fnsp.gpci.entidades.Proyecto;
import co.edu.fnsp.gpci.entidades.ReporteProyecto;
import co.edu.fnsp.gpci.entidades.RiesgoEtico;
import co.edu.fnsp.gpci.entidades.Rol;
import co.edu.fnsp.gpci.entidades.TipoAval;
import co.edu.fnsp.gpci.entidades.TipoCompromiso;
import co.edu.fnsp.gpci.entidades.TipoContrato;
import co.edu.fnsp.gpci.entidades.TipoEstudiante;
import co.edu.fnsp.gpci.entidades.TipoFuenteFinanciacionProyecto;
import co.edu.fnsp.gpci.entidades.TipoIdentificacion;
import co.edu.fnsp.gpci.entidades.TipoProyecto;
import co.edu.fnsp.gpci.entidades.TipoVinculacion;
import co.edu.fnsp.gpci.entidades.Usuario;
import co.edu.fnsp.gpci.entidadesVista.BusquedaPersona;
import co.edu.fnsp.gpci.entidadesVista.BusquedaProyectos;
import co.edu.fnsp.gpci.entidades.Convocatoria;
import co.edu.fnsp.gpci.entidadesVista.ProyectoEdicion;
import co.edu.fnsp.gpci.servicios.IServicioMaestro;
import co.edu.fnsp.gpci.servicios.IServicioProyecto;
import co.edu.fnsp.gpci.utilidades.Util;
import com.google.gson.Gson;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
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
@RequestMapping(value = "/proyectos")
public class ProyectoController {

    private static final Logger logger = LogManager.getLogger(ProyectoController.class.getName());

    @Autowired
    private IServicioProyecto servicioProyecto;

    @Autowired
    private IServicioMaestro servicioMaestro;

    /**
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/proyectos", method = RequestMethod.GET)
    public String obtenerProyectos(Model model) {
        ArrayList<ReporteProyecto> proyectos = new ArrayList<>();
        BusquedaProyectos busquedaProyectos = new BusquedaProyectos();
        try {
            proyectos = servicioProyecto.obtenerProyectos(null, null, "", "");
        } catch (Exception ex) {
            logger.error(ex);
        }

        model.addAttribute("busquedaProyectos", busquedaProyectos);
        model.addAttribute("proyectos", proyectos);

        return "proyectos/proyectos";
    }

    @RequestMapping(value = "/proyectos", method = RequestMethod.POST)
    public String buscarProyectos(@ModelAttribute(value = "busquedaProyectos") BusquedaProyectos busquedaProyectos, Model model) {

        ArrayList<ReporteProyecto> proyectos = new ArrayList<>();
        try {
            Date fechaFinal = Util.obtenerFecha(busquedaProyectos.getFechaFinal());
            Date fechaInicial = Util.obtenerFecha(busquedaProyectos.getFechaInicial());

            Calendar calendar = Calendar.getInstance();
            calendar.setTime(fechaInicial);
            calendar.add(Calendar.HOUR, 11);
            calendar.add(Calendar.MINUTE, 59);
            calendar.add(Calendar.SECOND, 59);
            fechaInicial = calendar.getTime();

            proyectos = servicioProyecto.obtenerProyectos(fechaInicial, fechaFinal, busquedaProyectos.getCodigo(), busquedaProyectos.getDocumentoInvestigadorPrincipal());
        } catch (Exception ex) {
            logger.error(ex);
        }

        model.addAttribute("proyectos", proyectos);

        return "proyectos/proyectos";
    }

    /**
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/crear", method = RequestMethod.GET)
    public String mostrarCreacionProyecto(Model model) {
        List<AreaTematica> areasTematicas = servicioMaestro.obtenerAreasTematicas();
        List<TipoProyecto> tiposProyecto = servicioMaestro.obtenerTiposProyecto();
        List<GrupoInvestigacion> gruposInvestigacion = servicioMaestro.obtenerGruposInvestigacion();
        List<RiesgoEtico> riesgosEticos = servicioMaestro.obtenerRiesgosEtico();
        List<TipoContrato> tiposContrato = servicioMaestro.obtenerTiposContrato();
        List<EnfoqueMetodologico> enfoquesMetodologicos = servicioMaestro.obtenerEnfoquesMetodologicos();
        List<Convocatoria> convocatorias = servicioMaestro.obtenerConvocatorias();
        List<EstadoProyecto> estadosProyecto = servicioMaestro.obtenerEstadosProyecto();
        List<TipoIdentificacion> tiposIdentificacion = servicioMaestro.obtenerTiposIdentificacion();
        List<Rol> roles = servicioMaestro.obtenerRoles();
        List<Facultad> facultades = servicioMaestro.obtenerFacultades();
        List<TipoEstudiante> tiposEstudiante = servicioMaestro.obtenerTiposEstudiante();
        List<Programa> programas = servicioMaestro.obtenerProgramas();
        List<TipoFuenteFinanciacionProyecto> tiposFuenteFinanciacionProyecto = servicioMaestro.obtenerTiposFuenteFinanciacionProyecto();
        List<FuenteFinanciacion> fuentesFinanciacion = servicioMaestro.obtenerFuentesFinanciacion();
        List<TipoCompromiso> tiposCompromiso = servicioMaestro.obtenerTiposCompromiso();
        List<TipoAval> tiposAval = servicioMaestro.obtenerTiposAval();
        List<TipoVinculacion> tiposVinculacion = servicioMaestro.obtenerTiposVinculacion();

        model.addAttribute("gruposInvestigacionPorAsignar", gruposInvestigacion);
        model.addAttribute("gruposInvestigacionAsignados", new ArrayList<>());
        model.addAttribute("areasTematicas", areasTematicas);
        model.addAttribute("tiposProyecto", tiposProyecto);
        model.addAttribute("gruposInvestigacion", gruposInvestigacion);
        model.addAttribute("riesgosEticos", riesgosEticos);
        model.addAttribute("tiposContrato", tiposContrato);
        model.addAttribute("enfoquesMetodologicos", enfoquesMetodologicos);
        model.addAttribute("convocatorias", convocatorias);
        model.addAttribute("estadosProyecto", estadosProyecto);
        model.addAttribute("tiposIdentificacion", tiposIdentificacion);
        model.addAttribute("roles", roles);
        model.addAttribute("facultades", facultades);
        model.addAttribute("tiposEstudiante", tiposEstudiante);
        model.addAttribute("programas", programas);
        model.addAttribute("fuentesFinanciacion", fuentesFinanciacion);
        model.addAttribute("tiposFuenteFinanciacionProyecto", tiposFuenteFinanciacionProyecto);
        model.addAttribute("tiposCompromiso", tiposCompromiso);
        model.addAttribute("tiposAval", tiposAval);
        model.addAttribute("tiposVinculacion", tiposVinculacion);

        model.addAttribute("proyecto", new Proyecto());

        return "proyectos/crear";
    }

    /**
     *
     * @param proyecto
     * @param model
     * @return
     */
    @RequestMapping(value = "/crear", method = RequestMethod.POST)
    public @ResponseBody
    String crearProyecto(@ModelAttribute("proyecto") Proyecto proyecto, Model model) {

        try {
            if (proyecto.getIdProyecto() == 0) {
                proyecto.setFechaCreacion(new Date());
                Usuario usuario = (Usuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
                proyecto.setUsuarioCreacion(usuario);
            }
            if (!proyecto.isParticipacionInternacional()) {
                proyecto.setEntidadesInternacionalesProyecto(new ArrayList<>());
            }
            if (proyecto.getIdProyecto() == 0) {
                servicioProyecto.ingresarProyecto(proyecto);
            } else {
                servicioProyecto.actualizarProyecto(proyecto);
            }

            return "";

        } catch (Exception exc) {
            logger.error(exc);
            throw exc;
        }
    }

    /**
     *
     * @param idProyecto
     * @param model
     * @return
     */
    @RequestMapping(value = "/editar/{idProyecto}", method = RequestMethod.GET)
    public String obtenerProyecto(@PathVariable long idProyecto, Model model) {
        List<AreaTematica> areasTematicas = servicioMaestro.obtenerAreasTematicas();
        List<TipoProyecto> tiposProyecto = servicioMaestro.obtenerTiposProyecto();
        List<GrupoInvestigacion> gruposInvestigacion = servicioMaestro.obtenerGruposInvestigacion();
        List<RiesgoEtico> riesgosEticos = servicioMaestro.obtenerRiesgosEtico();
        List<TipoContrato> tiposContrato = servicioMaestro.obtenerTiposContrato();
        List<EnfoqueMetodologico> enfoquesMetodologicos = servicioMaestro.obtenerEnfoquesMetodologicos();
        List<Convocatoria> convocatorias = servicioMaestro.obtenerConvocatorias();
        List<EstadoProyecto> estadosProyecto = servicioMaestro.obtenerEstadosProyecto();
        List<TipoIdentificacion> tiposIdentificacion = servicioMaestro.obtenerTiposIdentificacion();
        List<Rol> roles = servicioMaestro.obtenerRoles();
        List<Facultad> facultades = servicioMaestro.obtenerFacultades();
        List<TipoEstudiante> tiposEstudiante = servicioMaestro.obtenerTiposEstudiante();
        List<Programa> programas = servicioMaestro.obtenerProgramas();
        List<TipoAval> tiposAval = servicioMaestro.obtenerTiposAval();
        List<TipoFuenteFinanciacionProyecto> tiposFuenteFinanciacionProyecto = servicioMaestro.obtenerTiposFuenteFinanciacionProyecto();
        List<FuenteFinanciacion> fuentesFinanciacion = servicioMaestro.obtenerFuentesFinanciacion();
        List<TipoCompromiso> tiposCompromiso = servicioMaestro.obtenerTiposCompromiso();
        List<TipoVinculacion> tiposVinculacion = servicioMaestro.obtenerTiposVinculacion();

        model.addAttribute("areasTematicas", areasTematicas);
        model.addAttribute("tiposProyecto", tiposProyecto);
        model.addAttribute("riesgosEticos", riesgosEticos);
        model.addAttribute("tiposContrato", tiposContrato);
        model.addAttribute("enfoquesMetodologicos", enfoquesMetodologicos);
        model.addAttribute("convocatorias", convocatorias);
        model.addAttribute("estadosProyecto", estadosProyecto);
        model.addAttribute("tiposIdentificacion", tiposIdentificacion);
        model.addAttribute("roles", roles);
        model.addAttribute("facultades", facultades);
        model.addAttribute("tiposEstudiante", tiposEstudiante);
        model.addAttribute("programas", programas);
        model.addAttribute("tiposCompromiso", tiposCompromiso);
        model.addAttribute("tiposAval", tiposAval);
        model.addAttribute("fuentesFinanciacion", fuentesFinanciacion);
        model.addAttribute("tiposFuenteFinanciacionProyecto", tiposFuenteFinanciacionProyecto);
        model.addAttribute("tiposVinculacion", tiposVinculacion);

        ProyectoEdicion proyectoEdicion = new ProyectoEdicion();
        Proyecto proyecto = servicioProyecto.obtenerProyecto(idProyecto);
        proyectoEdicion.setIdProyecto(idProyecto);
        proyectoEdicion.setIdGrupoInvestigacionPrincipal(proyecto.getIdGrupoInvestigacionPrincipal());
        proyectoEdicion.setAreaTematica(Integer.toString(proyecto.getAreaTematica().getIdAreaTematica()));
        proyectoEdicion.setCodigo(proyecto.getCodigo());
        proyectoEdicion.setCodigoCOLCIENCIAS(proyecto.getCodigoCOLCIENCIAS());
        proyectoEdicion.setCodigoSIIU(proyecto.getCodigoSIIU());
        proyectoEdicion.setCodigoSIU(proyecto.getCodigoSIU());
        proyectoEdicion.setConvocatoria(Long.toString(proyecto.getConvocatoria().getIdConvocatoria()));
        proyectoEdicion.setEnfoqueMetodologico(Integer.toString(proyecto.getEnfoqueMetodologico().getIdEnfoqueMetodologico()));
        proyectoEdicion.setEstado(Integer.toString(proyecto.getEstado().getIdEstadoProyecto()));
        proyectoEdicion.setFechaInicio(Util.obtenerFechaFormateada(proyecto.getFechaInicio()));
        proyectoEdicion.setFechaFinalizacion(Util.obtenerFechaFormateada(proyecto.getFechaFinalizacion()));
        proyectoEdicion.setFechaIngresadoSIGEP(Util.obtenerFechaFormateada(proyecto.getFechaIngresadoSIGEP()));
        proyectoEdicion.setIngresadoSIGEP(proyecto.isIngresadoSIGEP());
        proyectoEdicion.setIngresadoSIIU(proyecto.isIngresadoSIIU());
        proyectoEdicion.setIngresadoSIU(proyecto.isIngresadoSIU());
        proyectoEdicion.setNombreCompletoProyecto(proyecto.getNombreCompletoProyecto());
        proyectoEdicion.setNombreCortoProyecto(proyecto.getNombreCortoProyecto());
        proyectoEdicion.setObjetivoGeneral(proyecto.getObjetivoGeneral());
        proyectoEdicion.setParticipacionInternacional(proyecto.isParticipacionInternacional());
        proyectoEdicion.setRiesgoEtico(Integer.toString(proyecto.getRiesgoEtico().getIdRiesgoEtico()));
        proyectoEdicion.setTipoContrato(Integer.toString(proyecto.getTipoContrato().getIdTipoContrato()));
        proyectoEdicion.setTipoProyecto(Integer.toString(proyecto.getTipoProyecto().getIdTipoProyecto()));
        proyectoEdicion.setGruposInvestigacion(proyecto.getGruposInvestigacion());
        proyectoEdicion.setObjetivosEspecificos(proyecto.getObjetivosEspecificos());
        if (proyecto.getObjetivosEspecificos().size() > 0) {
            model.addAttribute("objetivosEspecificosJSON", proyectoEdicion.getObjetivosEspecificosJSON());
        }
        proyectoEdicion.setProfesoresProyecto(proyecto.getProfesoresProyecto());
        if (proyectoEdicion.getProfesoresProyecto().size() > 0) {
            model.addAttribute("profesoresProyectoJSON", proyectoEdicion.getProfesoresProyectoJSON());
        }
        proyectoEdicion.setEstudiantesProyecto(proyecto.getEstudiantesProyecto());
        if (proyectoEdicion.getEstudiantesProyecto().size() > 0) {
            model.addAttribute("estudiantesProyectoJSON", proyectoEdicion.getEstudiantesProyectoJSON());
        }
        proyectoEdicion.setPersonalExternoProyecto(proyecto.getPersonalExternoProyecto());
        if (proyectoEdicion.getPersonalExternoProyecto().size() > 0) {
            model.addAttribute("personalExternoProyectoJSON", proyectoEdicion.getPersonalExternoProyectoJSON());
        }
        proyectoEdicion.setCompromisosProyecto(proyecto.getCompromisosProyecto());
        if (proyectoEdicion.getCompromisosProyecto().size() > 0) {
            model.addAttribute("compromisosProyectoJSON", proyectoEdicion.getCompromisosProyectoJSON());
        }
        proyectoEdicion.setEntidadesInternacionalesProyecto(proyecto.getEntidadesInternacionalesProyecto());
        if (proyecto.getEntidadesInternacionalesProyecto().size() > 0) {
            model.addAttribute("entidadesInternacionalesProyectoJSON", proyectoEdicion.getEntidadesInternacionalesProyectoJSON());
        }
        proyectoEdicion.setFuentesFinanciacionProyecto(proyecto.getFuentesFinanciacionProyecto());
        if (proyectoEdicion.getFuentesFinanciacionProyecto().size() > 0) {
            model.addAttribute("fuentesFinanciacionProyectoJSON", proyectoEdicion.getFuentesFinanciacionProyectoJSON());
        }
        proyectoEdicion.setAlertasAvalProyecto(proyecto.getAlertasAvalProyecto());
        if (proyectoEdicion.getAlertasAvalProyecto().size() > 0) {
            model.addAttribute("alertasAvalProyectoJSON", proyectoEdicion.getAlertasAvalProyectoJSON());
        }
        proyectoEdicion.setGruposInvestigacion(proyecto.getGruposInvestigacion());
        if (proyectoEdicion.getGruposInvestigacion().size() > 0) {
            model.addAttribute("gruposInvestigacionJSON", proyectoEdicion.getGruposInvestigacionJSON());
        }

        ArrayList<GrupoInvestigacion> gruposInvestigacionPorAsignar = new ArrayList<>();
        for (GrupoInvestigacion grupoInvestigacion : gruposInvestigacion) {
            boolean existe = false;
            for (GrupoInvestigacionProyecto grupoInvestigacionAsignado : proyecto.getGruposInvestigacion()) {
                if (grupoInvestigacion.getIdGrupoInvestigacion() == grupoInvestigacionAsignado.getIdGrupoInvestigacion()) {
                    existe = true;
                    break;
                }
            }
            if (!existe) {
                gruposInvestigacionPorAsignar.add(grupoInvestigacion);
            }
        }
        model.addAttribute("gruposInvestigacionPorAsignar", gruposInvestigacionPorAsignar);

        model.addAttribute("proyecto", proyectoEdicion);

        return "proyectos/crear";
    }

    @RequestMapping(value = "/profesores", method = RequestMethod.POST)
    public @ResponseBody
    String buscarProfesor(@ModelAttribute(value = "busquedaPersona") BusquedaPersona busquedaPersona, Model model) {

        Profesor profesor = servicioProyecto.obtenerProfesor(busquedaPersona.getIdTipoIdentificacion(), busquedaPersona.getNumeroIdentificacion());
        Gson gson = new Gson();
        String json = "";
        if (profesor != null) {
            json = gson.toJson(profesor);
        }

        return json;
    }

    @RequestMapping(value = "/estudiantes", method = RequestMethod.POST)
    public @ResponseBody
    String buscarEstudiante(@ModelAttribute(value = "busquedaPersona") BusquedaPersona busquedaPersona, Model model) {

        Estudiante estudiante = servicioProyecto.obtenerEstudiante(busquedaPersona.getIdTipoIdentificacion(), busquedaPersona.getNumeroIdentificacion());
        Gson gson = new Gson();
        String json = "";
        if (estudiante != null) {
            json = gson.toJson(estudiante);
        }

        return json;
    }

    @RequestMapping(value = "/personalExterno", method = RequestMethod.POST)
    public @ResponseBody
    String buscarPersonalExterno(@ModelAttribute(value = "busquedaPersona") BusquedaPersona busquedaPersona, Model model) {

        PersonalExterno personalExterno = servicioProyecto.obtenerPersonalExterno(busquedaPersona.getIdTipoIdentificacion(), busquedaPersona.getNumeroIdentificacion());
        Gson gson = new Gson();
        String json = "";
        if (personalExterno != null) {
            json = gson.toJson(personalExterno);
        }

        return json;
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(AreaTematica.class, new AreaTematicaEditor());
        binder.registerCustomEditor(TipoProyecto.class, new TipoProyectoEditor());
        binder.registerCustomEditor(RiesgoEtico.class, new RiesgoEticoEditor());
        binder.registerCustomEditor(TipoContrato.class, new TipoContratoEditor());
        binder.registerCustomEditor(EnfoqueMetodologico.class, new EnfoqueMetodologicoEditor());
        binder.registerCustomEditor(Convocatoria.class, new ConvocatoriaEditor());
        binder.registerCustomEditor(EstadoProyecto.class, new EstadoProyectoEditor());
    }
}
