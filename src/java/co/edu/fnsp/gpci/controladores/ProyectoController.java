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
import co.edu.fnsp.gpci.editores.GrupoInvestigacionEditor;
import co.edu.fnsp.gpci.editores.RiesgoEticoEditor;
import co.edu.fnsp.gpci.editores.TipoContratoEditor;
import co.edu.fnsp.gpci.editores.TipoProyectoEditor;
import co.edu.fnsp.gpci.entidades.AreaTematica;
import co.edu.fnsp.gpci.entidades.Convocatoria;
import co.edu.fnsp.gpci.entidades.EnfoqueMetodologico;
import co.edu.fnsp.gpci.entidades.EstadoProyecto;
import co.edu.fnsp.gpci.entidades.Facultad;
import co.edu.fnsp.gpci.entidades.GrupoInvestigacion;
import co.edu.fnsp.gpci.entidades.PersonalExterno;
import co.edu.fnsp.gpci.entidades.Profesor;
import co.edu.fnsp.gpci.entidades.Programa;
import co.edu.fnsp.gpci.entidades.Proyecto;
import co.edu.fnsp.gpci.entidades.ReporteProyecto;
import co.edu.fnsp.gpci.entidades.RiesgoEtico;
import co.edu.fnsp.gpci.entidades.Rol;
import co.edu.fnsp.gpci.entidades.TipoContrato;
import co.edu.fnsp.gpci.entidades.TipoEstudiante;
import co.edu.fnsp.gpci.entidades.TipoIdentificacion;
import co.edu.fnsp.gpci.entidades.TipoProyecto;
import co.edu.fnsp.gpci.entidades.Usuario;
import co.edu.fnsp.gpci.entidadesVista.BusquedaPersona;
import co.edu.fnsp.gpci.entidadesVista.BusquedaProyectos;
import co.edu.fnsp.gpci.entidadesVista.ProyectoEdicion;
import co.edu.fnsp.gpci.servicios.IServicioMaestro;
import co.edu.fnsp.gpci.servicios.IServicioProyecto;
import co.edu.fnsp.gpci.utilidades.Util;
import com.google.gson.Gson;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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

    @Autowired
    private IServicioProyecto servicioProyecto;

    @Autowired
    private IServicioMaestro servicioMaestro;

    /**
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/listado", method = RequestMethod.GET)
    public String obtenerProyectos(Model model) {

        model.addAttribute("proyectos", new ArrayList<>());
        BusquedaProyectos busquedaProyectos = new BusquedaProyectos();
        busquedaProyectos.establecerFechaInicioIncial();
        busquedaProyectos.establecerFechaInicioFinal();
        model.addAttribute("busquedaProyectos", busquedaProyectos);

        return "proyectos/listado";
    }

    @RequestMapping(value = "/buscarProyectos", method = RequestMethod.POST)
    public String buscarProyectos(@ModelAttribute(value = "busquedaProyectos") BusquedaProyectos busquedaProyectos, Model model) {

        ArrayList<ReporteProyecto> proyectos = new ArrayList<>();
        try {
            Date fechaFinal = Util.formatter.parse(busquedaProyectos.getFechaFinal());
            Date fechaInicial = Util.formatter.parse(busquedaProyectos.getFechaInicio());
            proyectos = servicioProyecto.obtenerProyectos(fechaInicial, fechaFinal);
        } catch (ParseException ex) {
            Logger.getLogger(ProyectoController.class.getName()).log(Level.SEVERE, null, ex);
        }

        model.addAttribute("proyectos", proyectos);

        return "proyectos/listado";
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

        model.addAttribute("proyecto", new co.edu.fnsp.gpci.entidadesVista.Proyecto());

        return "proyectos/crear";
    }

    /**
     *
     * @param proyecto
     * @param model
     * @return
     */
    @RequestMapping(value = "/crear", method = RequestMethod.POST)
    public String crearProyecto(@ModelAttribute("proyecto") co.edu.fnsp.gpci.entidadesVista.Proyecto proyecto, Model model) {

        try {
            Proyecto nuevoProyecto = new Proyecto();
            nuevoProyecto.setIdProyecto(proyecto.getIdProyecto());
            nuevoProyecto.setAreaTematica(proyecto.getAreaTematica());
            nuevoProyecto.setCodigo(proyecto.getCodigo());
            nuevoProyecto.setCodigoCOLCIENCIAS(proyecto.getCodigoCOLCIENCIAS());
            nuevoProyecto.setCodigoSIIU(proyecto.getCodigoSIIU());
            nuevoProyecto.setCodigoSIU(proyecto.getCodigoSIU());
            nuevoProyecto.setConvocatoria(proyecto.getConvocatoria());
            nuevoProyecto.setEnfoqueMetodologico(proyecto.getEnfoqueMetodologico());
            nuevoProyecto.setEstado(proyecto.getEstado());
            nuevoProyecto.setFechaCreacion(new Date());

            if (nuevoProyecto.getIdProyecto() == 0) {
                Usuario usuario = (Usuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
                nuevoProyecto.setUsuarioCreacion(usuario);
            }

            nuevoProyecto.setFechaInicio(Util.formatter.parse(proyecto.getFechaInicio()));
            nuevoProyecto.setFechaFinalizacion(Util.formatter.parse(proyecto.getFechaFinalizacion()));
            nuevoProyecto.setGrupoInvestigacion(proyecto.getGrupoInvestigacion());
            nuevoProyecto.setIngresadoSIGEP(proyecto.isIngresadoSIGEP());
            nuevoProyecto.setIngresadoSIIU(proyecto.isIngresadoSIIU());
            nuevoProyecto.setIngresadoSIU(proyecto.isIngresadoSIU());
            nuevoProyecto.setNombreCompletoProyecto(proyecto.getNombreCompletoProyecto());
            nuevoProyecto.setNombreCortoProyecto(proyecto.getNombreCortoProyecto());
            nuevoProyecto.setObjetivoGeneral(proyecto.getObjetivoGeneral());
            nuevoProyecto.setParticipacionInternacional(proyecto.isParticipacionInternacional());
            nuevoProyecto.setRiesgoEtico(proyecto.getRiesgoEtico());
            nuevoProyecto.setTipoContrato(proyecto.getTipoContrato());
            nuevoProyecto.setTipoProyecto(proyecto.getTipoProyecto());
            nuevoProyecto.setObjetivosEspecificos(proyecto.getObjetivosEspecificos());
            nuevoProyecto.setProfesoresProyecto(proyecto.getProfesoresProyecto());
            nuevoProyecto.setEstudiantesProyecto(proyecto.getEstudiantesProyecto());
            nuevoProyecto.setPersonalExternoProyecto(proyecto.getPersonalExternoProyecto());
            nuevoProyecto.setCompromisosProyecto(proyecto.getCompromisosProyecto());

            if (proyecto.getIdProyecto() == 0) {
                servicioProyecto.ingresarProyecto(nuevoProyecto);
            } else {
                servicioProyecto.actualizarProyecto(nuevoProyecto);
            }

            model.addAttribute("proyectos", new ArrayList<>());
            if (proyecto.getIdProyecto() == 0) {
                model.addAttribute("mensaje", "El proyecto se ha ingreasado exitosamente");
            } else {
                model.addAttribute("mensaje", "El proyecto se ha actualizado exitosamente");
            }
            BusquedaProyectos busquedaProyectos = new BusquedaProyectos();
            busquedaProyectos.establecerFechaInicioIncial();
            busquedaProyectos.establecerFechaInicioFinal();
            model.addAttribute("busquedaProyectos", busquedaProyectos);

            return "proyectos/listado";
        } catch (Exception exc) {
            if (proyecto.getIdProyecto() == 0) {
                model.addAttribute("mensaje", "No se pudo ingresar el proyecto: " + exc.getMessage());
            } else {
                model.addAttribute("mensaje", "No se pudo actualizar el proyecto: " + exc.getMessage());
            }
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

            ProyectoEdicion proyectoEdicion = new ProyectoEdicion();
            proyectoEdicion.setIdProyecto(proyecto.getIdProyecto());
            proyectoEdicion.setAreaTematica(Integer.toString(proyecto.getAreaTematica().getIdAreaTematica()));
            proyectoEdicion.setCodigo(proyecto.getCodigo());
            proyectoEdicion.setCodigoCOLCIENCIAS(proyecto.getCodigoCOLCIENCIAS());
            proyectoEdicion.setCodigoSIIU(proyecto.getCodigoSIIU());
            proyectoEdicion.setCodigoSIU(proyecto.getCodigoSIU());
            proyectoEdicion.setConvocatoria(Long.toString(proyecto.getConvocatoria().getIdConvocatoria()));
            proyectoEdicion.setEnfoqueMetodologico(Integer.toString(proyecto.getEnfoqueMetodologico().getIdEnfoqueMetodologico()));
            proyectoEdicion.setEstado(Integer.toString(proyecto.getEstado().getIdEstadoProyecto()));
            proyectoEdicion.setFechaInicio(proyecto.getFechaInicio());
            proyectoEdicion.setFechaFinalizacion(proyecto.getFechaFinalizacion());
            proyectoEdicion.setGrupoInvestigacion(Integer.toString(proyecto.getGrupoInvestigacion().getIdGrupoInvestigacion()));
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
            proyectoEdicion.setObjetivosEspecificos(proyecto.getObjetivosEspecificos());
            if (proyectoEdicion.getObjetivosEspecificos().size() > 0) {
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

            model.addAttribute("proyecto", proyectoEdicion);
        }

        return "proyectos/crear";
    }

    /**
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/editar/{id}", method = RequestMethod.GET)
    public String obtenerProyecto(@PathVariable long id, Model model) {
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

        ProyectoEdicion proyectoEdicion = new ProyectoEdicion();
        Proyecto proyecto = servicioProyecto.obtenerProyecto(id);
        proyectoEdicion.setIdProyecto(id);
        proyectoEdicion.setAreaTematica(Integer.toString(proyecto.getAreaTematica().getIdAreaTematica()));
        proyectoEdicion.setCodigo(proyecto.getCodigo());
        proyectoEdicion.setCodigoCOLCIENCIAS(proyecto.getCodigoCOLCIENCIAS());
        proyectoEdicion.setCodigoSIIU(proyecto.getCodigoSIIU());
        proyectoEdicion.setCodigoSIU(proyecto.getCodigoSIU());
        proyectoEdicion.setConvocatoria(Long.toString(proyecto.getConvocatoria().getIdConvocatoria()));
        proyectoEdicion.setEnfoqueMetodologico(Integer.toString(proyecto.getEnfoqueMetodologico().getIdEnfoqueMetodologico()));
        proyectoEdicion.setEstado(Integer.toString(proyecto.getEstado().getIdEstadoProyecto()));
        proyectoEdicion.setFechaInicio(Util.formatter.format(proyecto.getFechaInicio()));
        proyectoEdicion.setFechaFinalizacion(Util.formatter.format(proyecto.getFechaFinalizacion()));
        proyectoEdicion.setGrupoInvestigacion(Integer.toString(proyecto.getGrupoInvestigacion().getIdGrupoInvestigacion()));
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

        model.addAttribute("proyecto", proyectoEdicion);

        return "proyectos/crear";
    }

    @RequestMapping(value = "/buscarProfesor", method = RequestMethod.POST)
    public @ResponseBody
    String buscarProfesor(@ModelAttribute(value = "busquedaPersona") BusquedaPersona busquedaPersona, Model model) {

        Profesor profesor = servicioProyecto.obtenerProfesor(busquedaPersona.getNumeroIdentificacion(), busquedaPersona.getIdTipoIdentificacion());
        Gson gson = new Gson();
        String json = "";
        if (profesor != null) {
            json = gson.toJson(profesor);
        }

        return json;
    }

    @RequestMapping(value = "/buscarEstudiante", method = RequestMethod.POST)
    public @ResponseBody
    String buscarEstudiante(@ModelAttribute(value = "busquedaPersona") BusquedaPersona busquedaPersona, Model model) {

        co.edu.fnsp.gpci.entidadesVista.Estudiante estudiante = servicioProyecto.obtenerEstudiante(busquedaPersona.getNumeroIdentificacion(), busquedaPersona.getIdTipoIdentificacion());
        Gson gson = new Gson();
        String json = "";
        if (estudiante != null) {
            json = gson.toJson(estudiante);
        }

        return json;
    }

    @RequestMapping(value = "/buscarPersonalExterno", method = RequestMethod.POST)
    public @ResponseBody
    String buscarPersonalExterno(@ModelAttribute(value = "busquedaPersona") BusquedaPersona busquedaPersona, Model model) {

        PersonalExterno personalExterno = servicioProyecto.obtenerPersonalExterno(busquedaPersona.getNumeroIdentificacion(), busquedaPersona.getIdTipoIdentificacion());
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
        binder.registerCustomEditor(GrupoInvestigacion.class, new GrupoInvestigacionEditor());
        binder.registerCustomEditor(RiesgoEtico.class, new RiesgoEticoEditor());
        binder.registerCustomEditor(TipoContrato.class, new TipoContratoEditor());
        binder.registerCustomEditor(EnfoqueMetodologico.class, new EnfoqueMetodologicoEditor());
        binder.registerCustomEditor(Convocatoria.class, new ConvocatoriaEditor());
        binder.registerCustomEditor(EstadoProyecto.class, new EstadoProyectoEditor());
    }
}
