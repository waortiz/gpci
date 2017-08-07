/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.servicios;

import co.edu.fnsp.gpci.entidades.ActaProyecto;
import co.edu.fnsp.gpci.entidades.AlertaAvalProyecto;
import co.edu.fnsp.gpci.entidades.CompromisoProyecto;
import co.edu.fnsp.gpci.entidades.EstadoProyecto;
import co.edu.fnsp.gpci.entidades.EstadoProyectoEnum;
import co.edu.fnsp.gpci.entidades.PersonalExterno;
import co.edu.fnsp.gpci.entidades.PlazoProyecto;
import co.edu.fnsp.gpci.entidades.Profesor;
import co.edu.fnsp.gpci.entidades.ProrrogaProyecto;
import co.edu.fnsp.gpci.entidades.Proyecto;
import co.edu.fnsp.gpci.entidades.ReporteProyecto;
import co.edu.fnsp.gpci.entidades.TipoActaEnum;
import co.edu.fnsp.gpci.entidades.Estudiante;
import co.edu.fnsp.gpci.repositorios.IRepositorioProyecto;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

/**
 *
 * @author William
 */
@Service("servicioProyecto")
public class ServicioProyecto implements IServicioProyecto {

    @Autowired
    private IRepositorioProyecto repositorioProyecto;

    @Autowired
    private PlatformTransactionManager transactionManager;

    @Override
    public void ingresarProyecto(Proyecto proyecto) {
        TransactionDefinition txDef = new DefaultTransactionDefinition();
        TransactionStatus txStatus = transactionManager.getTransaction(txDef);
        try {
            establecerEstadoProyecto(proyecto);
            repositorioProyecto.ingresarProyecto(proyecto);
            transactionManager.commit(txStatus);
        } catch (Exception exc) {
            transactionManager.rollback(txStatus);
            throw exc;
        }
    }

    @Override
    public void actualizarProyecto(Proyecto proyecto) {
        TransactionDefinition txDef = new DefaultTransactionDefinition();
        TransactionStatus txStatus = transactionManager.getTransaction(txDef);
        try {
            establecerEstadoProyecto(proyecto);
            repositorioProyecto.actualizarProyecto(proyecto);
            transactionManager.commit(txStatus);
        } catch (Exception exc) {
            transactionManager.rollback(txStatus);
            throw exc;
        }
    }

    @Override
    public Proyecto obtenerProyecto(long idProyecto) {
        return repositorioProyecto.obtenerProyecto(idProyecto);
    }

    @Override
    public ArrayList<ReporteProyecto> obtenerProyectos(Date fechaInicio, Date fechaFinal) {
        return repositorioProyecto.obtenerProyectos(fechaInicio, fechaFinal);
    }

    @Override
    public Profesor obtenerProfesor(int idTipoIdentificacion, long numeroIdentificacion) {
        return repositorioProyecto.obtenerProfesor(idTipoIdentificacion, numeroIdentificacion);
    }

    @Override
    public Estudiante obtenerEstudiante(int idTipoIdentificacion, long numeroIdentificacion) {
        return repositorioProyecto.obtenerEstudiante(idTipoIdentificacion, numeroIdentificacion);
    }

    @Override
    public PersonalExterno obtenerPersonalExterno(int idTipoIdentificacion, long numeroIdentificacion) {
        return repositorioProyecto.obtenerPersonalExterno(idTipoIdentificacion, numeroIdentificacion);
    }

    @Override
    public ArrayList<CompromisoProyecto> obtenerCompromisosProyecto(long idProyecto) {
        return repositorioProyecto.obtenerCompromisosProyecto(idProyecto);
    }

    @Override
    public ArrayList<AlertaAvalProyecto> obtenerAlertasAvalProyecto(long idProyecto) {
        return repositorioProyecto.obtenerAlertasAvalProyecto(idProyecto);
    }

    private void establecerEstadoProyecto(Proyecto proyecto) {
        EstadoProyecto estadoProyecto = new EstadoProyecto();
        int meses = 0;
        for (PlazoProyecto plazo : proyecto.getPlazosProyecto()) {
            meses += plazo.getMesesAprobados();
        }
        for (ProrrogaProyecto prorroga : proyecto.getProrrogasProyecto()) {
            meses += prorroga.getMesesAprobados();
        }
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(proyecto.getFechaFinalizacion());
        calendar.add(Calendar.MONTH, meses);
        Date fechaFinalizacion = calendar.getTime();
        if (fechaFinalizacion.compareTo(new Date()) >= 0) {
            estadoProyecto.setIdEstadoProyecto(EstadoProyectoEnum.EJECUCION.getIdEstadoProyecto());
            proyecto.setEstado(estadoProyecto);
        } else if (fechaFinalizacion.compareTo(new Date()) < 0) {
            boolean existeActaFinalizacion = false;
            for (ActaProyecto acta : proyecto.getActasProyecto()) {
                if (acta.getIdTipoActa() == TipoActaEnum.FINALIZACION.getIdTipoActa()) {
                    existeActaFinalizacion = true;
                    break;
                }
            }
            if (existeActaFinalizacion) {
                estadoProyecto.setIdEstadoProyecto(EstadoProyectoEnum.FINALIZADO.getIdEstadoProyecto());
            } else {
                estadoProyecto.setIdEstadoProyecto(EstadoProyectoEnum.ATRASADO.getIdEstadoProyecto());
            }
            proyecto.setEstado(estadoProyecto);
        }
    }
}
