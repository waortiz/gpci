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
import co.edu.fnsp.gpci.entidades.Proyecto;
import co.edu.fnsp.gpci.entidades.ReporteProyecto;
import co.edu.fnsp.gpci.entidades.RiesgoEtico;
import co.edu.fnsp.gpci.entidades.Rol;
import co.edu.fnsp.gpci.entidades.TipoContrato;
import co.edu.fnsp.gpci.entidades.TipoIdentificacion;
import co.edu.fnsp.gpci.entidades.TipoProyecto;
import co.edu.fnsp.gpci.entidades.Usuario;
import co.edu.fnsp.gpci.entidadesVista.ProyectoEdicion;
import co.edu.fnsp.gpci.servicios.IServicioMaestro;
import co.edu.fnsp.gpci.servicios.IServicioProyecto;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String obtenerProyectos(Model model) {
        List<ReporteProyecto> proyectos = servicioProyecto.obtenerProyectos();

        model.addAttribute("proyectos", proyectos);

        return "proyectos/index";
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

        model.addAttribute("proyecto", new co.edu.fnsp.gpci.entidadesVista.Proyecto());

        return "proyectos/crear";
    }

    /**
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/editar/{id}", method = RequestMethod.GET)
    public String mostrarEdicionProyecto(@PathVariable long id, Model model) {
        List<AreaTematica> areasTematicas = servicioMaestro.obtenerAreasTematicas();
        List<TipoProyecto> tiposProyecto = servicioMaestro.obtenerTiposProyecto();
        List<GrupoInvestigacion> gruposInvestigacion = servicioMaestro.obtenerGruposInvestigacion();
        List<RiesgoEtico> riesgosEticos = servicioMaestro.obtenerRiesgosEtico();
        List<TipoContrato> tiposContrato = servicioMaestro.obtenerTiposContrato();
        List<EnfoqueMetodologico> enfoquesMetodologicos = servicioMaestro.obtenerEnfoquesMetodologicos();
        List<Convocatoria> convocatorias = servicioMaestro.obtenerConvocatorias();
        List<EstadoProyecto> estadosProyecto = servicioMaestro.obtenerEstadosProyecto();

        model.addAttribute("areasTematicas", areasTematicas);
        model.addAttribute("tiposProyecto", tiposProyecto);
        model.addAttribute("gruposInvestigacion", gruposInvestigacion);
        model.addAttribute("riesgosEticos", riesgosEticos);
        model.addAttribute("tiposContrato", tiposContrato);
        model.addAttribute("enfoquesMetodologicos", enfoquesMetodologicos);
        model.addAttribute("convocatorias", convocatorias);
        model.addAttribute("estadosProyecto", estadosProyecto);

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
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        proyectoEdicion.setFechaInicio(formatter.format(proyecto.getFechaInicio()));
        proyectoEdicion.setFechaFinalizacion(formatter.format(proyecto.getFechaFinalizacion()));
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
        model.addAttribute("proyecto", proyectoEdicion);

        return "proyectos/editar";
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
            nuevoProyecto.setAreaTematica(proyecto.getAreaTematica());
            nuevoProyecto.setCodigo(proyecto.getCodigo());
            nuevoProyecto.setCodigoCOLCIENCIAS(proyecto.getCodigoCOLCIENCIAS());
            nuevoProyecto.setCodigoSIIU(proyecto.getCodigoSIIU());
            nuevoProyecto.setCodigoSIU(proyecto.getCodigoSIU());
            nuevoProyecto.setConvocatoria(proyecto.getConvocatoria());
            nuevoProyecto.setEnfoqueMetodologico(proyecto.getEnfoqueMetodologico());
            nuevoProyecto.setEstado(proyecto.getEstado());
            nuevoProyecto.setFechaCreacion(new Date());
            Usuario usuario = new Usuario();
            usuario.setIdUsuario(1);
            nuevoProyecto.setUsuarioCreacion(usuario);
            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
            nuevoProyecto.setFechaInicio(formatter.parse(proyecto.getFechaInicio()));
            nuevoProyecto.setFechaFinalizacion(formatter.parse(proyecto.getFechaFinalizacion()));
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
            servicioProyecto.ingresarProyecto(nuevoProyecto);

            List<ReporteProyecto> proyectos = servicioProyecto.obtenerProyectos();
            model.addAttribute("proyectos", proyectos);
            model.addAttribute("mensaje", "El proyecto se ha ingreasado exitosamente");

            return "proyectos/index";
        } catch (Exception exc) {
            model.addAttribute("mensaje", "No se pudo ingresar el proyecto: " + exc.getMessage());
            List<AreaTematica> areasTematicas = servicioMaestro.obtenerAreasTematicas();
            List<TipoProyecto> tiposProyecto = servicioMaestro.obtenerTiposProyecto();
            List<GrupoInvestigacion> gruposInvestigacion = servicioMaestro.obtenerGruposInvestigacion();
            List<RiesgoEtico> riesgosEticos = servicioMaestro.obtenerRiesgosEtico();
            List<TipoContrato> tiposContrato = servicioMaestro.obtenerTiposContrato();
            List<EnfoqueMetodologico> enfoquesMetodologicos = servicioMaestro.obtenerEnfoquesMetodologicos();
            List<Convocatoria> convocatorias = servicioMaestro.obtenerConvocatorias();
            List<EstadoProyecto> estadosProyecto = servicioMaestro.obtenerEstadosProyecto();

            model.addAttribute("areasTematicas", areasTematicas);
            model.addAttribute("tiposProyecto", tiposProyecto);
            model.addAttribute("gruposInvestigacion", gruposInvestigacion);
            model.addAttribute("riesgosEticos", riesgosEticos);
            model.addAttribute("tiposContrato", tiposContrato);
            model.addAttribute("enfoquesMetodologicos", enfoquesMetodologicos);
            model.addAttribute("convocatorias", convocatorias);
            model.addAttribute("estadosProyecto", estadosProyecto);

            ProyectoEdicion proyectoEdicion = new ProyectoEdicion();
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
            if (proyecto.getObjetivosEspecificos().size() > 0) {
                model.addAttribute("objetivosEspecificosJSON", proyectoEdicion.getObjetivosEspecificosJSON());
            }
            model.addAttribute("proyecto", proyectoEdicion);
        }

        return "proyectos/crear";
    }

    /**
     *
     * @param proyecto
     * @param model
     * @return
     */
    @RequestMapping(value = "/editar", method = RequestMethod.POST)
    public String editarProyecto(@ModelAttribute("proyecto") co.edu.fnsp.gpci.entidadesVista.Proyecto proyecto, Model model) {

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
            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
            nuevoProyecto.setFechaInicio(formatter.parse(proyecto.getFechaInicio()));
            nuevoProyecto.setFechaFinalizacion(formatter.parse(proyecto.getFechaFinalizacion()));
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
            System.out.println(proyecto);
            servicioProyecto.actualizarProyecto(nuevoProyecto);
            model.addAttribute("mensajeExitoso", "El proyecto se ha actualizado exitosamente");

        } catch (Exception exc) {
            model.addAttribute("mensajeError", "No se pudo actualizar el proyecto: " + exc.getMessage());
        }

        List<AreaTematica> areasTematicas = servicioMaestro.obtenerAreasTematicas();
        List<TipoProyecto> tiposProyecto = servicioMaestro.obtenerTiposProyecto();
        List<GrupoInvestigacion> gruposInvestigacion = servicioMaestro.obtenerGruposInvestigacion();
        List<RiesgoEtico> riesgosEticos = servicioMaestro.obtenerRiesgosEtico();
        List<TipoContrato> tiposContrato = servicioMaestro.obtenerTiposContrato();
        List<EnfoqueMetodologico> enfoquesMetodologicos = servicioMaestro.obtenerEnfoquesMetodologicos();
        List<Convocatoria> convocatorias = servicioMaestro.obtenerConvocatorias();
        List<EstadoProyecto> estadosProyecto = servicioMaestro.obtenerEstadosProyecto();

        model.addAttribute("areasTematicas", areasTematicas);
        model.addAttribute("tiposProyecto", tiposProyecto);
        model.addAttribute("gruposInvestigacion", gruposInvestigacion);
        model.addAttribute("riesgosEticos", riesgosEticos);
        model.addAttribute("tiposContrato", tiposContrato);
        model.addAttribute("enfoquesMetodologicos", enfoquesMetodologicos);
        model.addAttribute("convocatorias", convocatorias);
        model.addAttribute("estadosProyecto", estadosProyecto);

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
        if (proyecto.getObjetivosEspecificos().size() > 0) {
            model.addAttribute("objetivosEspecificosJSON", proyectoEdicion.getObjetivosEspecificosJSON());
        }
        model.addAttribute("proyecto", proyectoEdicion);

        return "proyectos/editar";
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
