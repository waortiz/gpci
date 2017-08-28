/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.repositorios;

import co.edu.fnsp.gpci.entidades.AlertaAvalProyecto;
import co.edu.fnsp.gpci.entidades.CompromisoProyecto;
import co.edu.fnsp.gpci.entidades.PersonalExterno;
import co.edu.fnsp.gpci.entidades.Profesor;
import co.edu.fnsp.gpci.entidades.Proyecto;
import co.edu.fnsp.gpci.entidades.ReporteProyecto;
import co.edu.fnsp.gpci.entidades.Estudiante;
import co.edu.fnsp.gpci.entidades.ProyectoNotificacion;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author William
 */
public interface IRepositorioProyecto {

    void ingresarProyecto(Proyecto proyecto);

    void actualizarProyecto(Proyecto proyecto);

    Proyecto obtenerProyecto(long idProyecto);

    ArrayList<ReporteProyecto> obtenerProyectos(Date fechaInicio, Date fechaFinal, String codigo, String documentoInvestigadorPrincipal);

    Profesor obtenerProfesor(int idTipoIdentificacion, long numeroIdentificacion);

    Estudiante obtenerEstudiante(int idTipoIdentificacion, long numeroIdentificacion);

    PersonalExterno obtenerPersonalExterno(int idTipoIdentificacion, long numeroIdentificacion);

    ArrayList<CompromisoProyecto> obtenerCompromisosProyecto(long idProyecto);
    
    ArrayList<CompromisoProyecto> obtenerCompromisosProyectoPorCumplir(long idProyecto);
    
    ArrayList<AlertaAvalProyecto> obtenerAlertasAvalProyecto(long idProyecto);

    ArrayList<ProyectoNotificacion> obtenerProyectosNotificar(int diasPreviosNotificacion);

    void ingresarNotificacionVencimientoPlazo(long idProyecto, int idTipoPersona, long idPersona);

    boolean existeProyecto(String codigo);
    
    String obtenerCodigoProyecto(long idProyecto);
}
