/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.servicios;

import co.edu.fnsp.gpci.entidades.PersonalExterno;
import co.edu.fnsp.gpci.entidades.Profesor;
import co.edu.fnsp.gpci.entidades.Proyecto;
import co.edu.fnsp.gpci.entidades.ReporteProyecto;
import co.edu.fnsp.gpci.entidadesVista.Estudiante;
import co.edu.fnsp.gpci.repositorios.IRepositorioProyecto;
import java.util.ArrayList;
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
    public Profesor obtenerProfesor(long numeroIdentificacion, int idTipoIdentificacion) {
        return repositorioProyecto.obtenerProfesor(numeroIdentificacion, idTipoIdentificacion);
    }

    @Override
    public Estudiante obtenerEstudiante(long numeroIdentificacion, int idTipoIdentificacion) {
        return repositorioProyecto.obtenerEstudiante(numeroIdentificacion, idTipoIdentificacion);
    }

    @Override
    public PersonalExterno obtenerPersonalExterno(long numeroIdentificacion, int idTipoIdentificacion) {
        return repositorioProyecto.obtenerPersonalExterno(numeroIdentificacion, idTipoIdentificacion);
    }
}
