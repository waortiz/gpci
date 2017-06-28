/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.repositorios;

import co.edu.fnsp.gpci.entidades.Profesor;
import co.edu.fnsp.gpci.entidades.Proyecto;
import co.edu.fnsp.gpci.entidades.ReporteProyecto;
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
   ArrayList<ReporteProyecto> obtenerProyectos(Date fechaInicio, Date fechaFinal); 
   Profesor obtenerProfesor(long numeroIdentificacion, int idTipoIdentificacion);
}
