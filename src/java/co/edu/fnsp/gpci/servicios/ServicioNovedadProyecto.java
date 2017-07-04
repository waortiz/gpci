/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.servicios;

import co.edu.fnsp.gpci.entidades.ActaProyecto;
import co.edu.fnsp.gpci.entidades.Documento;
import co.edu.fnsp.gpci.entidades.Proyecto;
import co.edu.fnsp.gpci.entidades.ReporteProyecto;
import co.edu.fnsp.gpci.repositorios.IRepositorioNovedadProyecto;
import java.util.ArrayList;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author William
 */
@Service("servicioNovedadProyecto")
public class ServicioNovedadProyecto implements IServicioNovedadProyecto {

    @Autowired
    private IRepositorioNovedadProyecto repositorioNovedadProyecto;

    @Override
    public Proyecto obtenerProyecto(long idProyecto) {
        return repositorioNovedadProyecto.obtenerProyecto(idProyecto);
    }

    @Override
    public ArrayList<ReporteProyecto> obtenerProyectos(Date fechaInicio, Date fechaFinal) {
        return repositorioNovedadProyecto.obtenerProyectos(fechaInicio, fechaFinal);
    }

    @Override
    public void guardarActaProyecto(long idProyecto, ActaProyecto actaProyecto, Documento documento) {
        repositorioNovedadProyecto.guardarActaProyecto(idProyecto, actaProyecto, documento);
    }

    @Override
    public ArrayList<ActaProyecto> obtenerActasProyecto(long idProyecto) {
        return repositorioNovedadProyecto.obtenerActasProyecto(idProyecto);
    }

    @Override
    public Documento obtenerDocumentoActaProyecto(long idActa) {
        return repositorioNovedadProyecto.obtenerDocumentoActaProyecto(idActa);
    }

    @Override
    public void eliminarActaProyecto(long idActa) {
        repositorioNovedadProyecto.eliminarActaProyecto(idActa);
    }
}
