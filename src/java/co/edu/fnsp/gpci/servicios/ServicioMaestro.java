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
import co.edu.fnsp.gpci.entidades.TipoContrato;
import co.edu.fnsp.gpci.entidades.TipoEstudiante;
import co.edu.fnsp.gpci.entidades.TipoFuenteFinanciacionProyecto;
import co.edu.fnsp.gpci.entidades.TipoIdentificacion;
import co.edu.fnsp.gpci.entidades.TipoPersona;
import co.edu.fnsp.gpci.entidades.TipoProyecto;
import co.edu.fnsp.gpci.repositorios.IRepositorioMaestro;
import java.util.ArrayList;
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
    public ArrayList<AreaTematica> obtenerAreasTematicas() {
        return repositorioMaestro.obtenerAreasTematicas();
    }

    @Override
    public ArrayList<TipoProyecto> obtenerTiposProyecto() {
        return repositorioMaestro.obtenerTiposProyecto();
    }

    @Override
    public ArrayList<GrupoInvestigacion> obtenerGruposInvestigacion() {
        return repositorioMaestro.obtenerGruposInvestigacion();
    }

    @Override
    public ArrayList<RiesgoEtico> obtenerRiesgosEtico() {
        return repositorioMaestro.obtenerRiesgosEtico();
    }

    @Override
    public ArrayList<TipoContrato> obtenerTiposContrato() {
        return repositorioMaestro.obtenerTiposContrato();
    }

    @Override
    public ArrayList<EnfoqueMetodologico> obtenerEnfoquesMetodologicos() {
        return repositorioMaestro.obtenerEnfoquesMetodologicos();
    }

    @Override
    public ArrayList<Convocatoria> obtenerConvocatorias() {
        return repositorioMaestro.obtenerConvocatorias();
    }

    @Override
    public ArrayList<EstadoProyecto> obtenerEstadosProyecto() {
        return repositorioMaestro.obtenerEstadosProyecto();
    }

    @Override
    public ArrayList<TipoIdentificacion> obtenerTiposIdentificacion() {
        return repositorioMaestro.obtenerTiposIdentificacion();
    }

    @Override
    public ArrayList<Rol> obtenerRoles() {
        return repositorioMaestro.obtenerRoles();
    }

    @Override
    public ArrayList<Facultad> obtenerFacultades() {
        return repositorioMaestro.obtenerFacultades();
    }

    @Override
    public ArrayList<TipoEstudiante> obtenerTiposEstudiante() {
        return repositorioMaestro.obtenerTiposEstudiante();
    }

    @Override
    public ArrayList<Programa> obtenerProgramas() {
        return repositorioMaestro.obtenerProgramas();
    }

    @Override
    public ArrayList<TipoActa> obtenerTiposActa() {
        return repositorioMaestro.obtenerTiposActa();
    }

    @Override
    public ArrayList<TipoFuenteFinanciacionProyecto> obtenerTiposFuenteFinanciacionProyecto() {
        return repositorioMaestro.obtenerTiposFuenteFinanciacionProyecto();
    }

    @Override
    public ArrayList<FuenteFinanciacion> obtenerFuentesFinanciacion() {
        return repositorioMaestro.obtenerFuentesFinanciacion();
    }

    @Override
    public ArrayList<TipoPersona> obtenerTiposPersona() {
        return repositorioMaestro.obtenerTiposPersona();
    }
}
