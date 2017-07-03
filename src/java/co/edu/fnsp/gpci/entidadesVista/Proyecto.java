/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.entidadesVista;

import co.edu.fnsp.gpci.entidades.*;
import java.util.ArrayList;

/**
 *
 * @author William
 */
public class Proyecto {

    private long idProyecto;
    private String nombreCompletoProyecto;
    private String nombreCortoProyecto;
    private String fechaInicio;
    private String fechaFinalizacion;
    private AreaTematica areaTematica;
    private boolean ingresadoSIGEP;
    private boolean ingresadoSIIU;
    private boolean ingresadoSIU;
    private String codigoSIIU;
    private String codigoCOLCIENCIAS;
    private String codigoSIU;
    private String codigo;
    private boolean participacionInternacional;
    private TipoProyecto tipoProyecto;
    private GrupoInvestigacion grupoInvestigacion;
    private RiesgoEtico riesgoEtico;
    private TipoContrato tipoContrato;
    private EnfoqueMetodologico enfoqueMetodologico;
    private Convocatoria convocatoria;
    private String objetivoGeneral;
    private EstadoProyecto estado;
    private ArrayList<ObjetivoEspecifico> objetivosEspecificos = new ArrayList<>();
    private ArrayList<CompromisoProyecto> compromisosProyecto = new ArrayList<>();
    private ArrayList<ProfesorProyecto> profesoresProyecto = new ArrayList<>();
    private ArrayList<EstudianteProyecto> estudiantesProyecto = new ArrayList<>();
    private ArrayList<PersonalExternoProyecto> personalExternoProyecto = new ArrayList<>();

    /**
     * @return the idProyecto
     */
    public long getIdProyecto() {
        return idProyecto;
    }

    /**
     * @param idProyecto the idProyecto to set
     */
    public void setIdProyecto(long idProyecto) {
        this.idProyecto = idProyecto;
    }

    /**
     * @return the nombreCompletoProyecto
     */
    public String getNombreCompletoProyecto() {
        return nombreCompletoProyecto;
    }

    /**
     * @param nombreCompletoProyecto the nombreCompletoProyecto to set
     */
    public void setNombreCompletoProyecto(String nombreCompletoProyecto) {
        this.nombreCompletoProyecto = nombreCompletoProyecto;
    }

    /**
     * @return the nombreCortoProyecto
     */
    public String getNombreCortoProyecto() {
        return nombreCortoProyecto;
    }

    /**
     * @param nombreCortoProyecto the nombreCortoProyecto to set
     */
    public void setNombreCortoProyecto(String nombreCortoProyecto) {
        this.nombreCortoProyecto = nombreCortoProyecto;
    }

    /**
     * @return the fechaInicio
     */
    public String getFechaInicio() {
        return fechaInicio;
    }

    /**
     * @param fechaInicio the fechaInicio to set
     */
    public void setFechaInicio(String fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    /**
     * @return the fechaFinalizacion
     */
    public String getFechaFinalizacion() {
        return fechaFinalizacion;
    }

    /**
     * @param fechaFinalizacion the fechaFinalizacion to set
     */
    public void setFechaFinalizacion(String fechaFinalizacion) {
        this.fechaFinalizacion = fechaFinalizacion;
    }

    /**
     * @return the areaTematica
     */
    public AreaTematica getAreaTematica() {
        return areaTematica;
    }

    /**
     * @param areaTematica the areaTematica to set
     */
    public void setAreaTematica(AreaTematica areaTematica) {
        this.areaTematica = areaTematica;
    }

    /**
     * @return the ingresadoSIGEP
     */
    public boolean isIngresadoSIGEP() {
        return ingresadoSIGEP;
    }

    /**
     * @param ingresadoSIGEP the ingresadoSIGEP to set
     */
    public void setIngresadoSIGEP(boolean ingresadoSIGEP) {
        this.ingresadoSIGEP = ingresadoSIGEP;
    }

    /**
     * @return the ingresadoSIIU
     */
    public boolean isIngresadoSIIU() {
        return ingresadoSIIU;
    }

    /**
     * @param ingresadoSIIU the ingresadoSIIU to set
     */
    public void setIngresadoSIIU(boolean ingresadoSIIU) {
        this.ingresadoSIIU = ingresadoSIIU;
    }

    /**
     * @return the ingresadoSIU
     */
    public boolean isIngresadoSIU() {
        return ingresadoSIU;
    }

    /**
     * @param ingresadoSIU the ingresadoSIU to set
     */
    public void setIngresadoSIU(boolean ingresadoSIU) {
        this.ingresadoSIU = ingresadoSIU;
    }

    /**
     * @return the codigoSIIU
     */
    public String getCodigoSIIU() {
        return codigoSIIU;
    }

    /**
     * @param codigoSIIU the codigoSIIU to set
     */
    public void setCodigoSIIU(String codigoSIIU) {
        this.codigoSIIU = codigoSIIU;
    }

    /**
     * @return the codigoCOLCIENCIAS
     */
    public String getCodigoCOLCIENCIAS() {
        return codigoCOLCIENCIAS;
    }

    /**
     * @param codigoCOLCIENCIAS the codigoCOLCIENCIAS to set
     */
    public void setCodigoCOLCIENCIAS(String codigoCOLCIENCIAS) {
        this.codigoCOLCIENCIAS = codigoCOLCIENCIAS;
    }

    /**
     * @return the codigoSIU
     */
    public String getCodigoSIU() {
        return codigoSIU;
    }

    /**
     * @param codigoSIU the codigoSIU to set
     */
    public void setCodigoSIU(String codigoSIU) {
        this.codigoSIU = codigoSIU;
    }

    /**
     * @return the participacionInternacional
     */
    public boolean isParticipacionInternacional() {
        return participacionInternacional;
    }

    /**
     * @param participacionInternacional the participacionInternacional to set
     */
    public void setParticipacionInternacional(boolean participacionInternacional) {
        this.participacionInternacional = participacionInternacional;
    }

    /**
     * @return the tipoProyecto
     */
    public TipoProyecto getTipoProyecto() {
        return tipoProyecto;
    }

    /**
     * @param tipoProyecto the tipoProyecto to set
     */
    public void setTipoProyecto(TipoProyecto tipoProyecto) {
        this.tipoProyecto = tipoProyecto;
    }

    /**
     * @return the grupoInvestigacion
     */
    public GrupoInvestigacion getGrupoInvestigacion() {
        return grupoInvestigacion;
    }

    /**
     * @param grupoInvestigacion the grupoInvestigacion to set
     */
    public void setGrupoInvestigacion(GrupoInvestigacion grupoInvestigacion) {
        this.grupoInvestigacion = grupoInvestigacion;
    }

    /**
     * @return the riesgoEtico
     */
    public RiesgoEtico getRiesgoEtico() {
        return riesgoEtico;
    }

    /**
     * @param riesgoEtico the riesgoEtico to set
     */
    public void setRiesgoEtico(RiesgoEtico riesgoEtico) {
        this.riesgoEtico = riesgoEtico;
    }

    /**
     * @return the tipoContrato
     */
    public TipoContrato getTipoContrato() {
        return tipoContrato;
    }

    /**
     * @param tipoContrato the tipoContrato to set
     */
    public void setTipoContrato(TipoContrato tipoContrato) {
        this.tipoContrato = tipoContrato;
    }

    /**
     * @return the enfoqueMetodologico
     */
    public EnfoqueMetodologico getEnfoqueMetodologico() {
        return enfoqueMetodologico;
    }

    /**
     * @param enfoqueMetodologico the enfoqueMetodologico to set
     */
    public void setEnfoqueMetodologico(EnfoqueMetodologico enfoqueMetodologico) {
        this.enfoqueMetodologico = enfoqueMetodologico;
    }

    /**
     * @return the convocatoria
     */
    public Convocatoria getConvocatoria() {
        return convocatoria;
    }

    /**
     * @param convocatoria the convocatoria to set
     */
    public void setConvocatoria(Convocatoria convocatoria) {
        this.convocatoria = convocatoria;
    }

    /**
     * @return the objetivoGeneral
     */
    public String getObjetivoGeneral() {
        return objetivoGeneral;
    }

    /**
     * @param objetivoGeneral the objetivoGeneral to set
     */
    public void setObjetivoGeneral(String objetivoGeneral) {
        this.objetivoGeneral = objetivoGeneral;
    }

    /**
     * @return the estado
     */
    public EstadoProyecto getEstado() {
        return estado;
    }

    /**
     * @param estado the estado to set
     */
    public void setEstado(EstadoProyecto estado) {
        this.estado = estado;
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
     * @return the objetivosEspecificos
     */
    public ArrayList<ObjetivoEspecifico> getObjetivosEspecificos() {
        return objetivosEspecificos;
    }

    /**
     * @param objetivosEspecificos the objetivosEspecificos to set
     */
    public void setObjetivosEspecificos(ArrayList<ObjetivoEspecifico> objetivosEspecificos) {
        this.objetivosEspecificos = objetivosEspecificos;
    }

    /**
     * @return the profesoresProyecto
     */
    public ArrayList<ProfesorProyecto> getProfesoresProyecto() {
        return profesoresProyecto;
    }

    /**
     * @param profesoresProyecto the profesoresProyecto to set
     */
    public void setProfesoresProyecto(ArrayList<ProfesorProyecto> profesoresProyecto) {
        this.profesoresProyecto = profesoresProyecto;
    }
      
    /**
     * @return the estudiantesProyecto
     */
    public ArrayList<EstudianteProyecto> getEstudiantesProyecto() {
        return estudiantesProyecto;
    }

    /**
     * @param estudiantesProyecto the estudiantesProyecto to set
     */
    public void setEstudiantesProyecto(ArrayList<EstudianteProyecto> estudiantesProyecto) {
        this.estudiantesProyecto = estudiantesProyecto;
    }
    
    /**
    * @return the personalExternoProyecto
    */
    public ArrayList<PersonalExternoProyecto> getPersonalExternoProyecto() {
        return personalExternoProyecto;
    }

    /**
     * @param personalExternoProyecto the personalExternoProyecto to set
     */
    public void setPersonalExternoProyecto(ArrayList<PersonalExternoProyecto> personalExternoProyecto) {
        this.personalExternoProyecto = personalExternoProyecto;
    }

    /**
     * @return the compromisosProyecto
     */
    public ArrayList<CompromisoProyecto> getCompromisosProyecto() {
        return compromisosProyecto;
    }

    /**
     * @param compromisosProyecto the compromisosProyecto to set
     */
    public void setCompromisosProyecto(ArrayList<CompromisoProyecto> compromisosProyecto) {
        this.compromisosProyecto = compromisosProyecto;
    }    
    
    @Override
    public String toString() {
        String listadoObjetivosEspecificos = "";
        for (ObjetivoEspecifico objetivo : objetivosEspecificos) {
            listadoObjetivosEspecificos = listadoObjetivosEspecificos + "{idObjetivoEspecifico: " + objetivo.getIdObjetivoEspecifico()
                    + ", descripcion: " + objetivo.getDescripcion() + "}";
        }

        return "{idProyecto: " + idProyecto
                + ", nombreCompletoProyecto: " + nombreCompletoProyecto
                + ", nombreCortoProyecto: " + nombreCortoProyecto
                + ", fechaInicio: " + fechaInicio + ", fechaFinalizacion: " + fechaFinalizacion
                + ", AreaTematica:" + areaTematica
                + ", ingresadoSIGEP: " + ingresadoSIIU
                + ", ingresadoSIU: " + ingresadoSIU
                + ", codigoSIIU: " + codigoSIIU
                + ", codigoCOLCIENCIAS: " + codigoCOLCIENCIAS
                + ", codigoSIU: " + codigoSIU
                + ", codigo: " + codigo
                + ", participacionInternacional: " + participacionInternacional
                + ", TipoProyecto: " + tipoProyecto
                + ", GrupoInvestigacion: " + grupoInvestigacion
                + ", RiesgoEtico: " + riesgoEtico
                + ", TipoContrato: " + tipoContrato
                + ", EnfoqueMetodologico: " + enfoqueMetodologico
                + ", Convocatoria: " + convocatoria
                + ", objetivoGeneral: " + objetivoGeneral
                + ", EstadoProyecto: " + estado
                + ", objetivosEspecificos: ["
                + listadoObjetivosEspecificos
                + "]}";
    }
}
