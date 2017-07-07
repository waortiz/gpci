/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.servicios;

import co.edu.fnsp.gpci.entidades.ActaProyecto;
import co.edu.fnsp.gpci.entidades.AdendaProyecto;
import co.edu.fnsp.gpci.entidades.AdicionProyecto;
import co.edu.fnsp.gpci.entidades.Documento;
import co.edu.fnsp.gpci.entidades.ProrrogaProyecto;
import co.edu.fnsp.gpci.entidades.Proyecto;
import co.edu.fnsp.gpci.entidades.ReporteProyecto;
import co.edu.fnsp.gpci.repositorios.IRepositorioNovedadProyecto;
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
@Service("servicioNovedadProyecto")
public class ServicioNovedadProyecto implements IServicioNovedadProyecto {

    @Autowired
    private IRepositorioNovedadProyecto repositorioNovedadProyecto;

    @Autowired
    private PlatformTransactionManager transactionManager;
    
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
        TransactionDefinition txDef = new DefaultTransactionDefinition();
        TransactionStatus txStatus = transactionManager.getTransaction(txDef);
        try {
            repositorioNovedadProyecto.guardarActaProyecto(idProyecto, actaProyecto, documento);
            transactionManager.commit(txStatus);
        } catch (Exception exc) {
            transactionManager.rollback(txStatus);
            throw exc;
        }
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
        TransactionDefinition txDef = new DefaultTransactionDefinition();
        TransactionStatus txStatus = transactionManager.getTransaction(txDef);
        try {
            repositorioNovedadProyecto.eliminarActaProyecto(idActa);
            transactionManager.commit(txStatus);
        } catch (Exception exc) {
            transactionManager.rollback(txStatus);
            throw exc;
        }
    }

    @Override
    public void guardarAdendaProyecto(long idProyecto, AdendaProyecto actaProyecto, Documento documento) {
        TransactionDefinition txDef = new DefaultTransactionDefinition();
        TransactionStatus txStatus = transactionManager.getTransaction(txDef);
        try {
            repositorioNovedadProyecto.guardarAdendaProyecto(idProyecto, actaProyecto, documento);
            transactionManager.commit(txStatus);
        } catch (Exception exc) {
            transactionManager.rollback(txStatus);
            throw exc;
        }
    }

    @Override
    public ArrayList<AdendaProyecto> obtenerAdendasProyecto(long idProyecto) {
        return repositorioNovedadProyecto.obtenerAdendasProyecto(idProyecto);
    }

    @Override
    public Documento obtenerDocumentoAdendaProyecto(long idAdenda) {
        return repositorioNovedadProyecto.obtenerDocumentoAdendaProyecto(idAdenda);
    }

    @Override
    public void eliminarAdendaProyecto(long idAdenda) {
        TransactionDefinition txDef = new DefaultTransactionDefinition();
        TransactionStatus txStatus = transactionManager.getTransaction(txDef);
        try {
            repositorioNovedadProyecto.eliminarAdendaProyecto(idAdenda);
            transactionManager.commit(txStatus);
        } catch (Exception exc) {
            transactionManager.rollback(txStatus);
            throw exc;
        }
    }
     @Override
    public void guardarAdicionProyecto(long idProyecto, AdicionProyecto actaProyecto, Documento documento) {
        TransactionDefinition txDef = new DefaultTransactionDefinition();
        TransactionStatus txStatus = transactionManager.getTransaction(txDef);
        try {
            repositorioNovedadProyecto.guardarAdicionProyecto(idProyecto, actaProyecto, documento);
            transactionManager.commit(txStatus);
        } catch (Exception exc) {
            transactionManager.rollback(txStatus);
            throw exc;
        }
    }

    @Override
    public ArrayList<AdicionProyecto> obtenerAdicionesProyecto(long idProyecto) {
        return repositorioNovedadProyecto.obtenerAdicionesProyecto(idProyecto);
    }

    @Override
    public Documento obtenerDocumentoAdicionProyecto(long idAdicion) {
        return repositorioNovedadProyecto.obtenerDocumentoAdicionProyecto(idAdicion);
    }

    @Override
    public void eliminarAdicionProyecto(long idAdicion) {
        TransactionDefinition txDef = new DefaultTransactionDefinition();
        TransactionStatus txStatus = transactionManager.getTransaction(txDef);
        try {
            repositorioNovedadProyecto.eliminarAdicionProyecto(idAdicion);
            transactionManager.commit(txStatus);
        } catch (Exception exc) {
            transactionManager.rollback(txStatus);
            throw exc;
        }
    }
     @Override
    public void guardarProrrogaProyecto(long idProyecto, ProrrogaProyecto actaProyecto, Documento documento) {
        TransactionDefinition txDef = new DefaultTransactionDefinition();
        TransactionStatus txStatus = transactionManager.getTransaction(txDef);
        try {
            repositorioNovedadProyecto.guardarProrrogaProyecto(idProyecto, actaProyecto, documento);
            transactionManager.commit(txStatus);
        } catch (Exception exc) {
            transactionManager.rollback(txStatus);
            throw exc;
        }
    }

    @Override
    public ArrayList<ProrrogaProyecto> obtenerProrrogasProyecto(long idProyecto) {
        return repositorioNovedadProyecto.obtenerProrrogasProyecto(idProyecto);
    }

    @Override
    public Documento obtenerDocumentoProrrogaProyecto(long idProrroga) {
        return repositorioNovedadProyecto.obtenerDocumentoProrrogaProyecto(idProrroga);
    }

    @Override
    public void eliminarProrrogaProyecto(long idProrroga) {
        TransactionDefinition txDef = new DefaultTransactionDefinition();
        TransactionStatus txStatus = transactionManager.getTransaction(txDef);
        try {
            repositorioNovedadProyecto.eliminarProrrogaProyecto(idProrroga);
            transactionManager.commit(txStatus);
        } catch (Exception exc) {
            transactionManager.rollback(txStatus);
            throw exc;
        }
    }
}
