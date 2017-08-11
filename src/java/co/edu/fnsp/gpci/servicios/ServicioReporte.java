/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.servicios;

import co.edu.fnsp.gpci.entidades.ReporteIntegranteProyecto;
import co.edu.fnsp.gpci.repositorios.IRepositorioReporte;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 *
 * @author William
 */
@Service("servicioReporte")
public class ServicioReporte implements IServicioReporte {

    @Autowired
    private IRepositorioReporte repositorioReporte;

    @Override
    public ArrayList<ReporteIntegranteProyecto> obtenerIntegrantesProyectos() {
        return repositorioReporte.obtenerIntegrantesProyectos();
    }
}