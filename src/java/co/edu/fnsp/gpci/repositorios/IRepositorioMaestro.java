/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.repositorios;

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
import java.util.ArrayList;

/**
 *
 * @author William
 */
public interface IRepositorioMaestro {

    ArrayList<AreaTematica> obtenerAreasTematicas();

    ArrayList<TipoProyecto> obtenerTiposProyecto();

    ArrayList<GrupoInvestigacion> obtenerGruposInvestigacion();

    ArrayList<RiesgoEtico> obtenerRiesgosEtico();

    ArrayList<TipoContrato> obtenerTiposContrato();

    ArrayList<EnfoqueMetodologico> obtenerEnfoquesMetodologicos();

    ArrayList<Convocatoria> obtenerConvocatorias();

    ArrayList<EstadoProyecto> obtenerEstadosProyecto();
    
    ArrayList<TipoIdentificacion> obtenerTiposIdentificacion();
    
    ArrayList<Rol> obtenerRoles();
    
    ArrayList<Facultad> obtenerFacultades();

    ArrayList<TipoEstudiante> obtenerTiposEstudiante();

    ArrayList<Programa> obtenerProgramas();
    
    ArrayList<TipoActa> obtenerTiposActa();
    
    ArrayList<TipoFuenteFinanciacionProyecto> obtenerTiposFuenteFinanciacionProyecto();
    
    ArrayList<FuenteFinanciacion> obtenerFuentesFinanciacion();

    ArrayList<TipoPersona> obtenerTiposPersona();

    ArrayList<TipoCompromiso> obtenerTiposCompromiso();

    ArrayList<TipoAval> obtenerTiposAval();

    ArrayList<TipoVinculacion> obtenerTiposVinculacion();

    int ingresarConvocatoria(Convocatoria convocatoria);

    int ingresarAreaTematica(AreaTematica areaTematica);
}
