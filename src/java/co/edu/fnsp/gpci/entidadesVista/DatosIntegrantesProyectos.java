/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.entidadesVista;

import co.edu.fnsp.gpci.entidades.ReporteIntegranteProyecto;
import java.util.ArrayList;

/**
 *
 * @author William
 */
public class DatosIntegrantesProyectos {

    private int draw;
    private int recordsTotal;
    private int recordsFiltered;
    private ArrayList<ReporteIntegranteProyecto> data = new ArrayList<>();

    /**
     * @return the draw
     */
    public int getDraw() {
        return draw;
    }

    /**
     * @param draw the draw to set
     */
    public void setDraw(int draw) {
        this.draw = draw;
    }

    /**
     * @return the recordsTotal
     */
    public int getRecordsTotal() {
        return recordsTotal;
    }

    /**
     * @param recordsTotal the recordsTotal to set
     */
    public void setRecordsTotal(int recordsTotal) {
        this.recordsTotal = recordsTotal;
    }

    /**
     * @return the recordsFiltered
     */
    public int getRecordsFiltered() {
        return recordsFiltered;
    }

    /**
     * @param recordsFiltered the recordsFiltered to set
     */
    public void setRecordsFiltered(int recordsFiltered) {
        this.recordsFiltered = recordsFiltered;
    }

    /**
     * @return the data
     */
    public ArrayList<ReporteIntegranteProyecto> getData() {
        return data;
    }

    /**
     * @param data the data to set
     */
    public void setData(ArrayList<ReporteIntegranteProyecto> data) {
        this.data = data;
    }

}
