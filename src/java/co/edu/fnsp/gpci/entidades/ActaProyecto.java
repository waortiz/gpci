/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.entidades;

import java.util.Date;

/**
 *
 * @author William
 */
public class ActaProyecto {

    private long idActa;
    private String nombre;
    private int idTipoActa;
    private String descripcionTipoActa;
    private Date fecha;
    private String fechaFormateada;
    private String observaciones;
    private String codigo;

    /**
     * @return the idActa
     */
    public long getIdActa() {
        return idActa;
    }

    /**
     * @param idActa the idActa to set
     */
    public void setIdActa(long idActa) {
        this.idActa = idActa;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the fecha
     */
    public Date getFecha() {
        return fecha;
    }

    /**
     * @param fecha the fecha to set
     */
    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
    
    /**
    * @return the observaciones
    */
    public String getObservaciones() {
        return observaciones;
    }

    /**
     * @param observaciones the observaciones to set
     */
    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    /**
     * @return the fechaFormateada
     */
    public String getFechaFormateada() {
        return fechaFormateada;
    }

    /**
     * @param fechaFormateada the fechaFormateada to set
     */
    public void setFechaFormateada(String fechaFormateada) {
        this.fechaFormateada = fechaFormateada;
    }

    /**
     * @return the idTipoActa
     */
    public int getIdTipoActa() {
        return idTipoActa;
    }

    /**
     * @param idTipoActa the idTipoActa to set
     */
    public void setIdTipoActa(int idTipoActa) {
        this.idTipoActa = idTipoActa;
    }

    /**
     * @return the descripcionTipoActa
     */
    public String getDescripcionTipoActa() {
        return descripcionTipoActa;
    }

    /**
     * @param descripcionTipoActa the descripcionTipoActa to set
     */
    public void setDescripcionTipoActa(String descripcionTipoActa) {
        this.descripcionTipoActa = descripcionTipoActa;
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
}
