/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.servicios;

import co.edu.fnsp.gpci.entidades.ActaProyecto;
import co.edu.fnsp.gpci.entidades.AdendaCambioProyecto;
import co.edu.fnsp.gpci.entidades.AdendaIngresoProyecto;
import co.edu.fnsp.gpci.entidades.AdendaRetiroProyecto;
import co.edu.fnsp.gpci.entidades.AdicionProyecto;
import co.edu.fnsp.gpci.entidades.CumplimientoAlertaAvalProyecto;
import co.edu.fnsp.gpci.entidades.CumplimientoCompromisoProyecto;
import co.edu.fnsp.gpci.entidades.Documento;
import co.edu.fnsp.gpci.entidades.PlazoProyecto;
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
    public void guardarProrrogaProyecto(long idProyecto, ProrrogaProyecto prorrogaProyecto, Documento documento) {
        TransactionDefinition txDef = new DefaultTransactionDefinition();
        TransactionStatus txStatus = transactionManager.getTransaction(txDef);
        try {
            repositorioNovedadProyecto.guardarProrrogaProyecto(idProyecto, prorrogaProyecto, documento);
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

    @Override
    public void guardarPlazoProyecto(long idProyecto, PlazoProyecto plazoProyecto, Documento documento) {
        TransactionDefinition txDef = new DefaultTransactionDefinition();
        TransactionStatus txStatus = transactionManager.getTransaction(txDef);
        try {
            repositorioNovedadProyecto.guardarPlazoProyecto(idProyecto, plazoProyecto, documento);
            transactionManager.commit(txStatus);
        } catch (Exception exc) {
            transactionManager.rollback(txStatus);
            throw exc;
        }
    }

    @Override
    public ArrayList<PlazoProyecto> obtenerPlazosProyecto(long idProyecto) {
        return repositorioNovedadProyecto.obtenerPlazosProyecto(idProyecto);
    }

    @Override
    public Documento obtenerDocumentoPlazoProyecto(long idPlazo) {
        return repositorioNovedadProyecto.obtenerDocumentoPlazoProyecto(idPlazo);
    }

    @Override
    public void eliminarPlazoProyecto(long idPlazo) {
        TransactionDefinition txDef = new DefaultTransactionDefinition();
        TransactionStatus txStatus = transactionManager.getTransaction(txDef);
        try {
            repositorioNovedadProyecto.eliminarPlazoProyecto(idPlazo);
            transactionManager.commit(txStatus);
        } catch (Exception exc) {
            transactionManager.rollback(txStatus);
            throw exc;
        }
    }

    @Override
    public void guardarAdendaCambioProyecto(long idProyecto, AdendaCambioProyecto adendaCambioProyecto, Documento documento) {
        TransactionDefinition txDef = new DefaultTransactionDefinition();
        TransactionStatus txStatus = transactionManager.getTransaction(txDef);
        try {
            repositorioNovedadProyecto.guardarAdendaCambioProyecto(idProyecto, adendaCambioProyecto, documento);
            transactionManager.commit(txStatus);
        } catch (Exception exc) {
            transactionManager.rollback(txStatus);
            throw exc;
        }
    }

    @Override
    public ArrayList<AdendaCambioProyecto> obtenerAdendasCambioProyecto(long idProyecto) {
        return repositorioNovedadProyecto.obtenerAdendasCambioProyecto(idProyecto);
    }

    @Override
    public Documento obtenerDocumentoAdendaCambioProyecto(long idAdenda) {
        return repositorioNovedadProyecto.obtenerDocumentoAdendaCambioProyecto(idAdenda);
    }

    @Override
    public void eliminarAdendaCambioProyecto(long idAdenda) {
        TransactionDefinition txDef = new DefaultTransactionDefinition();
        TransactionStatus txStatus = transactionManager.getTransaction(txDef);
        try {
            repositorioNovedadProyecto.eliminarAdendaCambioProyecto(idAdenda);
            transactionManager.commit(txStatus);
        } catch (Exception exc) {
            transactionManager.rollback(txStatus);
            throw exc;
        }
    }

    @Override
    public void guardarAdendaIngresoProyecto(long idProyecto, AdendaIngresoProyecto adendaIngresoProyecto, Documento documento) {
        TransactionDefinition txDef = new DefaultTransactionDefinition();
        TransactionStatus txStatus = transactionManager.getTransaction(txDef);
        try {
            repositorioNovedadProyecto.guardarAdendaIngresoProyecto(idProyecto, adendaIngresoProyecto, documento);
            transactionManager.commit(txStatus);
        } catch (Exception exc) {
            transactionManager.rollback(txStatus);
            throw exc;
        }
    }

    @Override
    public ArrayList<AdendaIngresoProyecto> obtenerAdendasIngresoProyecto(long idProyecto) {
        return repositorioNovedadProyecto.obtenerAdendasIngresoProyecto(idProyecto);
    }

    @Override
    public Documento obtenerDocumentoAdendaIngresoProyecto(long idAdenda) {
        return repositorioNovedadProyecto.obtenerDocumentoAdendaIngresoProyecto(idAdenda);
    }

    @Override
    public void eliminarAdendaIngresoProyecto(long idAdenda) {
        TransactionDefinition txDef = new DefaultTransactionDefinition();
        TransactionStatus txStatus = transactionManager.getTransaction(txDef);
        try {
            repositorioNovedadProyecto.eliminarAdendaIngresoProyecto(idAdenda);
            transactionManager.commit(txStatus);
        } catch (Exception exc) {
            transactionManager.rollback(txStatus);
            throw exc;
        }
    }

    @Override
    public void guardarAdendaRetiroProyecto(long idProyecto, AdendaRetiroProyecto adendaRetiroProyecto, Documento documento) {
        TransactionDefinition txDef = new DefaultTransactionDefinition();
        TransactionStatus txStatus = transactionManager.getTransaction(txDef);
        try {
            repositorioNovedadProyecto.guardarAdendaRetiroProyecto(idProyecto, adendaRetiroProyecto, documento);
            transactionManager.commit(txStatus);
        } catch (Exception exc) {
            transactionManager.rollback(txStatus);
            throw exc;
        }
    }

    @Override
    public ArrayList<AdendaRetiroProyecto> obtenerAdendasRetiroProyecto(long idProyecto) {
        return repositorioNovedadProyecto.obtenerAdendasRetiroProyecto(idProyecto);
    }

    @Override
    public Documento obtenerDocumentoAdendaRetiroProyecto(long idAdenda) {
        return repositorioNovedadProyecto.obtenerDocumentoAdendaRetiroProyecto(idAdenda);
    }

    @Override
    public void eliminarAdendaRetiroProyecto(long idAdenda) {
        TransactionDefinition txDef = new DefaultTransactionDefinition();
        TransactionStatus txStatus = transactionManager.getTransaction(txDef);
        try {
            repositorioNovedadProyecto.eliminarAdendaRetiroProyecto(idAdenda);
            transactionManager.commit(txStatus);
        } catch (Exception exc) {
            transactionManager.rollback(txStatus);
            throw exc;
        }
    }

    @Override
    public void guardarCumplimientoCompromisoProyecto(long idProyecto, CumplimientoCompromisoProyecto cumplimientoCompromisoProyecto, Documento documento) {
        TransactionDefinition txDef = new DefaultTransactionDefinition();
        TransactionStatus txStatus = transactionManager.getTransaction(txDef);
        try {
            repositorioNovedadProyecto.guardarCumplimientoCompromisoProyecto(idProyecto, cumplimientoCompromisoProyecto, documento);
            transactionManager.commit(txStatus);
        } catch (Exception exc) {
            transactionManager.rollback(txStatus);
            throw exc;
        }
    }

    @Override
    public ArrayList<CumplimientoCompromisoProyecto> obtenerCumplimientoCompromisosProyecto(long idProyecto) {
        return repositorioNovedadProyecto.obtenerCumplimientoCompromisosProyecto(idProyecto);
    }

    @Override
    public Documento obtenerDocumentoCumplimientoCompromisoProyecto(long idCumplimientoCompromiso) {
        return repositorioNovedadProyecto.obtenerDocumentoCumplimientoCompromisoProyecto(idCumplimientoCompromiso);
    }

    @Override
    public void eliminarCumplimientoCompromisoProyecto(long idCumplimientoCompromiso) {
        TransactionDefinition txDef = new DefaultTransactionDefinition();
        TransactionStatus txStatus = transactionManager.getTransaction(txDef);
        try {
            repositorioNovedadProyecto.eliminarCumplimientoCompromisoProyecto(idCumplimientoCompromiso);
            transactionManager.commit(txStatus);
        } catch (Exception exc) {
            transactionManager.rollback(txStatus);
            throw exc;
        }
    }

    @Override
    public void guardarCumplimientoAlertaAvalProyecto(long idProyecto, CumplimientoAlertaAvalProyecto cumplimientoAlertaAvalProyecto, Documento documento) {
        TransactionDefinition txDef = new DefaultTransactionDefinition();
        TransactionStatus txStatus = transactionManager.getTransaction(txDef);
        try {
            repositorioNovedadProyecto.guardarCumplimientoAlertaAvalProyecto(idProyecto, cumplimientoAlertaAvalProyecto, documento);
            transactionManager.commit(txStatus);
        } catch (Exception exc) {
            transactionManager.rollback(txStatus);
            throw exc;
        }
    }

    @Override
    public ArrayList<CumplimientoAlertaAvalProyecto> obtenerCumplimientosAlertasAvalProyecto(long idProyecto) {
        return repositorioNovedadProyecto.obtenerCumplimientosAlertasAvalProyecto(idProyecto);
    }

    @Override
    public Documento obtenerDocumentoCumplimientoAlertaAvalProyecto(long idCumplimientoAlertaAvalProyecto) {
        return repositorioNovedadProyecto.obtenerDocumentoCumplimientoAlertaAvalProyecto(idCumplimientoAlertaAvalProyecto);
    }

    @Override
    public void eliminarCumplimientoAlertaAvalProyecto(long idCumplimientoAlertaAvalProyecto) {
        TransactionDefinition txDef = new DefaultTransactionDefinition();
        TransactionStatus txStatus = transactionManager.getTransaction(txDef);
        try {
            repositorioNovedadProyecto.eliminarCumplimientoAlertaAvalProyecto(idCumplimientoAlertaAvalProyecto);
            transactionManager.commit(txStatus);
        } catch (Exception exc) {
            transactionManager.rollback(txStatus);
            throw exc;
        }
    }
}
