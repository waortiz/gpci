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
import java.util.List;

/**
 *
 * @author William
 */
public interface IServicioMaestro {

    List<AreaTematica> obtenerAreasTematicas();

    List<TipoProyecto> obtenerTiposProyecto();

    List<GrupoInvestigacion> obtenerGruposInvestigacion();

    List<RiesgoEtico> obtenerRiesgosEtico();

    List<TipoContrato> obtenerTiposContrato();

    List<EnfoqueMetodologico> obtenerEnfoquesMetodologicos();

    List<Convocatoria> obtenerConvocatorias();

    List<EstadoProyecto> obtenerEstadosProyecto();

    List<TipoIdentificacion> obtenerTiposIdentificacion();

    List<Rol> obtenerRoles();

    List<Facultad> obtenerFacultades();

    List<TipoEstudiante> obtenerTiposEstudiante();

    List<Programa> obtenerProgramas();

    List<TipoActa> obtenerTiposActa();

    List<TipoFuenteFinanciacionProyecto> obtenerTiposFuenteFinanciacionProyecto();

    List<FuenteFinanciacion> obtenerFuentesFinanciacion();

    List<TipoPersona> obtenerTiposPersona();

    List<TipoCompromiso> obtenerTiposCompromiso();

    List<TipoAval> obtenerTiposAval();

    List<TipoVinculacion> obtenerTiposVinculacion();

    int ingresarConvocatoria(Convocatoria convocatoria);

    int ingresarAreaTematica(AreaTematica areaTematica);
}
