/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.entidadesVista;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author William
 */
public class BusquedaProyectos {

    private String fechaInicial;
    private String fechaFinal;
    private String documentoInvestigadorPrincipal;
    private String codigo;

    /**
     * @return the fechaInicial
     */
    public String getFechaInicial() {
        return fechaInicial;
    }

    /**
     * @param fechaInicial the fechaInicial to set
     */
    public void setFechaInicial(String fechaInicial) {
        this.fechaInicial = fechaInicial;
    }

    /**
     * @param fechaFinal the fechaFinal to set
     */
    public void setFechaFinal(String fechaFinal) {
        this.fechaFinal = fechaFinal;
    }

    /**
     * @return the fechaFinal
     */
    public String getFechaFinal() {
        return fechaFinal;
    }
    
    public void establecerFechaInicioIncial() {
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        calendar.add(Calendar.DATE, -15);
        fechaInicial = formatter.format(calendar.getTime());
    }

    public void establecerFechaInicioFinal() {
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        calendar.add(Calendar.DATE, 15);
        fechaFinal = formatter.format(calendar.getTime());
    }

    /**
     * @return the codigo
     */
    public String getCodigo() {
        return codigo;
    }

    /**
     * @param codigo the codigo to set
     */
    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    /**
     * @return the documentoInvestigadorPrincipal
     */
    public String getDocumentoInvestigadorPrincipal() {
        return documentoInvestigadorPrincipal;
    }

    /**
     * @param documentoInvestigadorPrincipal the documentoInvestigadorPrincipal to set
     */
    public void setDocumentoInvestigadorPrincipal(String documentoInvestigadorPrincipal) {
        this.documentoInvestigadorPrincipal = documentoInvestigadorPrincipal;
    }

}
