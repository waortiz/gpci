/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.servicios;

import co.edu.fnsp.gpci.entidades.Proyecto;
import co.edu.fnsp.gpci.entidades.ReporteProyecto;
import java.util.ArrayList;

/**
 *
 * @author William
 */
public interface IServicioProyecto {

    void ingresarProyecto(Proyecto proyecto);
    void actualizarProyecto(Proyecto proyecto);
    Proyecto obtenerProyecto(long idProyecto);
    ArrayList<ReporteProyecto> obtenerProyectos();
}
