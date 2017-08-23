/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.servicios;

import co.edu.fnsp.gpci.entidades.AreaTematica;
import co.edu.fnsp.gpci.entidades.Convocatoria;
import co.edu.fnsp.gpci.entidades.EnfoqueMetodologico;
import co.edu.fnsp.gpci.entidades.EstadoProyecto;
import co.edu.fnsp.gpci.entidades.Facultad;
import co.edu.fnsp.gpci.entidades.FuenteFinanciacion;
import co.edu.fnsp.gpci.entidades.GrupoInvestigacion;
import co.edu.fnsp.gpci.entidades.Programa;
import co.edu.fnsp.gpci.entidades.RiesgoEtico;
import co.edu.fnsp.gpci.entidades.Rol;
import co.edu.fnsp.gpci.entidades.TipoActa;
import co.edu.fnsp.gpci.entidades.TipoAval;
import co.edu.fnsp.gpci.entidades.TipoCompromiso;
import co.edu.fnsp.gpci.entidades.TipoContrato;
import co.edu.fnsp.gpci.entidades.TipoEstudiante;
import co.edu.fnsp.gpci.entidades.TipoFuenteFinanciacionProyecto;
import co.edu.fnsp.gpci.entidades.TipoIdentificacion;
import co.edu.fnsp.gpci.entidades.TipoPersona;
import co.edu.fnsp.gpci.entidades.TipoProyecto;
import co.edu.fnsp.gpci.entidades.TipoVinculacion;
import co.edu.fnsp.gpci.repositorios.IRepositorioMaestro;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author William
 */
@Service("servicioMaestro")
public class ServicioMaestro implements IServicioMaestro {

    @Autowired
    private IRepositorioMaestro repositorioMaestro;

    @Override
    public List<AreaTematica> obtenerAreasTematicas() {
        return repositorioMaestro.obtenerAreasTematicas();
    }

    @Override
    public List<TipoProyecto> obtenerTiposProyecto() {
        return repositorioMaestro.obtenerTiposProyecto();
    }

    @Override
    public List<GrupoInvestigacion> obtenerGruposInvestigacion() {
        return repositorioMaestro.obtenerGruposInvestigacion();
    }

    @Override
    public List<RiesgoEtico> obtenerRiesgosEtico() {
        return repositorioMaestro.obtenerRiesgosEtico();
    }

    @Override
    public List<TipoContrato> obtenerTiposContrato() {
        return repositorioMaestro.obtenerTiposContrato();
    }

    @Override
    public List<EnfoqueMetodologico> obtenerEnfoquesMetodologicos() {
        return repositorioMaestro.obtenerEnfoquesMetodologicos();
    }

    @Override
    public List<Convocatoria> obtenerConvocatorias() {
        return repositorioMaestro.obtenerConvocatorias();
    }

    @Override
    public List<EstadoProyecto> obtenerEstadosProyecto() {
        return repositorioMaestro.obtenerEstadosProyecto();
    }

    @Override
    public List<TipoIdentificacion> obtenerTiposIdentificacion() {
        return repositorioMaestro.obtenerTiposIdentificacion();
    }

    @Override
    public List<Rol> obtenerRoles() {
        return repositorioMaestro.obtenerRoles();
    }

    @Override
    public List<Facultad> obtenerFacultades() {
        return repositorioMaestro.obtenerFacultades();
    }

    @Override
    public List<TipoEstudiante> obtenerTiposEstudiante() {
        return repositorioMaestro.obtenerTiposEstudiante();
    }

    @Override
    public List<Programa> obtenerProgramas() {
        return repositorioMaestro.obtenerProgramas();
    }

    @Override
    public List<TipoActa> obtenerTiposActa() {
        return repositorioMaestro.obtenerTiposActa();
    }

    @Override
    public List<TipoFuenteFinanciacionProyecto> obtenerTiposFuenteFinanciacionProyecto() {
        return repositorioMaestro.obtenerTiposFuenteFinanciacionProyecto();
    }

    @Override
    public List<FuenteFinanciacion> obtenerFuentesFinanciacion() {
        return repositorioMaestro.obtenerFuentesFinanciacion();
    }

    @Override
    public List<TipoPersona> obtenerTiposPersona() {
        return repositorioMaestro.obtenerTiposPersona();
    }

    @Override
    public List<TipoCompromiso> obtenerTiposCompromiso() {
        return repositorioMaestro.obtenerTiposCompromiso();
    }

    @Override
    public List<TipoAval> obtenerTiposAval() {
        return repositorioMaestro.obtenerTiposAval();
    }

    @Override
    public List<TipoVinculacion> obtenerTiposVinculacion() {
        return repositorioMaestro.obtenerTiposVinculacion();
    }

    @Override
    public int ingresarConvocatoria(Convocatoria convocatoria) {
        return repositorioMaestro.ingresarConvocatoria(convocatoria);
    }

    @Override
    public int ingresarAreaTematica(AreaTematica areaTematica) {
        return repositorioMaestro.ingresarAreaTematica(areaTematica);
    }
}
