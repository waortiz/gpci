/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.entidadesVista;

import co.edu.fnsp.gpci.entidades.ActaProyecto;
import co.edu.fnsp.gpci.entidades.AdendaIngresoProyecto;
import co.edu.fnsp.gpci.entidades.AdendaCambioProyecto;
import co.edu.fnsp.gpci.entidades.AdendaRetiroProyecto;
import co.edu.fnsp.gpci.entidades.AdicionProyecto;
import co.edu.fnsp.gpci.entidades.AlertaAvalProyecto;
import co.edu.fnsp.gpci.entidades.CompromisoProyecto;
import co.edu.fnsp.gpci.entidades.EntidadInternacionalProyecto;
import co.edu.fnsp.gpci.entidades.EstudianteProyecto;
import co.edu.fnsp.gpci.entidades.FuenteFinanciacionProyecto;
import co.edu.fnsp.gpci.entidades.GrupoInvestigacion;
import co.edu.fnsp.gpci.entidades.ObjetivoEspecifico;
import co.edu.fnsp.gpci.entidades.PersonalExternoProyecto;
import co.edu.fnsp.gpci.entidades.PlazoProyecto;
import co.edu.fnsp.gpci.entidades.ProfesorProyecto;
import co.edu.fnsp.gpci.entidades.ProrrogaProyecto;
import co.edu.fnsp.gpci.utilidades.Util;
import java.util.ArrayList;

/**
 *
 * @author William
 */
public class ProyectoEdicion {

    private long idProyecto;
    private String nombreCompletoProyecto;
    private String nombreCortoProyecto;
    private String fechaInicio;
    private String fechaFinalizacion;
    private String areaTematica;
    private boolean ingresadoSIGEP;
    private boolean ingresadoSIIU;
    private boolean ingresadoSIU;
    private String codigoSIIU;
    private String codigoCOLCIENCIAS;
    private String codigoSIU;
    private String codigo;
    private boolean participacionInternacional;
    private String tipoProyecto;
    private String riesgoEtico;
    private String tipoContrato;
    private String enfoqueMetodologico;
    private String convocatoria;
    private String objetivoGeneral;
    private String estado;
    private ArrayList<ObjetivoEspecifico> objetivosEspecificos = new ArrayList<>();
    private ArrayList<GrupoInvestigacion> gruposInvestigacion = new ArrayList<>();
    private ArrayList<EntidadInternacionalProyecto> entidadesInternacionalesProyecto = new ArrayList<>();
    private ArrayList<ProfesorProyecto> profesoresProyecto = new ArrayList<>();
    private ArrayList<EstudianteProyecto> estudiantesProyecto = new ArrayList<>();
    private ArrayList<PersonalExternoProyecto> personalExternoProyecto = new ArrayList<>();
    private ArrayList<CompromisoProyecto> compromisosProyecto = new ArrayList<>();
    private ArrayList<ActaProyecto> actasProyecto = new ArrayList<>();
    private ArrayList<ProrrogaProyecto> prorrogasProyecto = new ArrayList<>();
    private ArrayList<AdendaIngresoProyecto> adendasIngresoProyecto = new ArrayList<>();
    private ArrayList<AdendaCambioProyecto> adendasCambioProyecto = new ArrayList<>();
    private ArrayList<AdendaRetiroProyecto> adendasRetiroProyecto = new ArrayList<>();
    private ArrayList<AdicionProyecto> adicionesProyecto = new ArrayList<>();
    private ArrayList<PlazoProyecto> plazosProyecto = new ArrayList<>();
    private ArrayList<FuenteFinanciacionProyecto> fuentesFinanciacionProyecto = new ArrayList<>();
    private ArrayList<co.edu.fnsp.gpci.entidades.CumplimientoCompromisoProyecto> cumplimientoCompromisosProyecto = new ArrayList<>();
    private ArrayList<AlertaAvalProyecto> alertasAvalProyecto = new ArrayList<>();
    private ArrayList<co.edu.fnsp.gpci.entidades.CumplimientoAlertaAvalProyecto> cumplimientosAlertasAvalProyecto = new ArrayList<>();

    /**
     * @return the areaTematica
     */
    public String getAreaTematica() {
        return areaTematica;
    }

    /**
     * @return the tipoProyecto
     */
    public String getTipoProyecto() {
        return tipoProyecto;
    }

    /**
     * @return the riesgoEtico
     */
    public String getRiesgoEtico() {
        return riesgoEtico;
    }

    /**
     * @return the tipoContrato
     */
    public String getTipoContrato() {
        return tipoContrato;
    }

    /**
     * @return the enfoqueMetodologico
     */
    public String getEnfoqueMetodologico() {
        return enfoqueMetodologico;
    }

    /**
     * @return the convocatoria
     */
    public String getConvocatoria() {
        return convocatoria;
    }

    /**
     * @return the estado
     */
    public String getEstado() {
        return estado;
    }

    /**
     * @param areaTematica the areaTematica to set
     */
    public void setAreaTematica(String areaTematica) {
        this.areaTematica = areaTematica;
    }

    /**
     * @param tipoProyecto the tipoProyecto to set
     */
    public void setTipoProyecto(String tipoProyecto) {
        this.tipoProyecto = tipoProyecto;
    }

    /**
     * @param riesgoEtico the riesgoEtico to set
     */
    public void setRiesgoEtico(String riesgoEtico) {
        this.riesgoEtico = riesgoEtico;
    }

    /**
     * @param tipoContrato the tipoContrato to set
     */
    public void setTipoContrato(String tipoContrato) {
        this.tipoContrato = tipoContrato;
    }

    /**
     * @param enfoqueMetodologico the enfoqueMetodologico to set
     */
    public void setEnfoqueMetodologico(String enfoqueMetodologico) {
        this.enfoqueMetodologico = enfoqueMetodologico;
    }

    /**
     * @param convocatoria the convocatoria to set
     */
    public void setConvocatoria(String convocatoria) {
        this.convocatoria = convocatoria;
    }

    /**
     * @param estado the estado to set
     */
    public void setEstado(String estado) {
        this.estado = estado;
    }

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
     * @return the objetivosEspecificos
     */
    public String getObjetivosEspecificosJSON() {
        return Util.obtenerObjetivosEspecificosJSON(objetivosEspecificos);
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
     * @return the profesores proyecto JSON
     */
    public String getProfesoresProyectoJSON() {
        return Util.obtenerProfesoresProyectoJSON(profesoresProyecto);
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
     * @return the estudiantes proyecto JSON
     */
    public String getEstudiantesProyectoJSON() {
        return Util.obtenerEstudiantesProyectoJSON(estudiantesProyecto);
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
     * @return the personal externo proyecto JSON
     */
    public String getPersonalExternoProyectoJSON() {

        return Util.obtenerPersonalExternoProyectoJSON(this.getPersonalExternoProyecto());
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

    /**
     * @return the compromisosProyecto
     */
    public String getCompromisosProyectoJSON() {
        return Util.obtenerCompromisosProyectoJSON(compromisosProyecto);

    }

    /**
     * @return the actasProyecto
     */
    public ArrayList<ActaProyecto> getActasProyecto() {
        return actasProyecto;
    }

    /**
     * @param actasProyecto the actasProyecto to set
     */
    public void setActasProyecto(ArrayList<ActaProyecto> actasProyecto) {
        this.actasProyecto = actasProyecto;
    }

    /**
     * @return the actasProyecto
     */
    public String getActasProyectoJSON() {

        return Util.obtenerActasProyectoJSON(actasProyecto);

    }

    /**
     * @return the prorrogasProyecto
     */
    public ArrayList<ProrrogaProyecto> getProrrogasProyecto() {
        return prorrogasProyecto;
    }

    /**
     * @return the prorrogasProyecto
     */
    public String getProrrogasProyectoJSON() {
        return Util.obtenerProrrogasProyectoJSON(prorrogasProyecto);
    }

    /**
     * @param prorrogasProyecto the prorrogasProyecto to set
     */
    public void setProrrogasProyecto(ArrayList<ProrrogaProyecto> prorrogasProyecto) {
        this.prorrogasProyecto = prorrogasProyecto;
    }

    /**
     * @return the adendasIngresoProyecto
     */
    public ArrayList<AdendaIngresoProyecto> getAdendasIngresoProyecto() {
        return adendasIngresoProyecto;
    }

    /**
     * @return the adendasIngresoProyecto
     */
    public String getAdendasIngresoProyectoJSON() {
        return Util.obtenerAdendasIngresoProyectoJSON(adendasIngresoProyecto);
    }

    /**
     * @param adendasIngresoProyecto the adendasIngresoProyecto to set
     */
    public void setAdendasIngresoProyecto(ArrayList<AdendaIngresoProyecto> adendasIngresoProyecto) {
        this.adendasIngresoProyecto = adendasIngresoProyecto;
    }

    /**
     * @return the adendasRetiroProyecto
     */
    public ArrayList<AdendaRetiroProyecto> getAdendasRetiroProyecto() {
        return adendasRetiroProyecto;
    }

    /**
     * @return the adendasRetiroProyecto
     */
    public String getAdendasRetiroProyectoJSON() {
        return Util.obtenerAdendasRetiroProyectoJSON(adendasRetiroProyecto);
    }

    /**
     * @param adendasRetiroProyecto the adendasRetiroProyecto to set
     */
    public void setAdendasRetiroProyecto(ArrayList<AdendaRetiroProyecto> adendasRetiroProyecto) {
        this.adendasRetiroProyecto = adendasRetiroProyecto;
    }

    /**
     * @return the adendasCambioProyecto
     */
    public ArrayList<AdendaCambioProyecto> getAdendasCambioProyecto() {
        return adendasCambioProyecto;
    }

    /**
     * @return the adendasCambioProyecto
     */
    public String getAdendasCambioProyectoJSON() {
        return Util.obtenerAdendasCambioProyectoJSON(adendasCambioProyecto);
    }

    /**
     * @param adendasCambioProyecto the adendasCambioProyecto to set
     */
    public void setAdendasCambioProyecto(ArrayList<AdendaCambioProyecto> adendasCambioProyecto) {
        this.adendasCambioProyecto = adendasCambioProyecto;
    }

    /**
     * @return the adicionesProyecto
     */
    public ArrayList<AdicionProyecto> getAdicionesProyecto() {
        return adicionesProyecto;
    }

    /**
     * @return the adicionesProyecto
     */
    public String getAdicionesProyectoJSON() {
        return Util.obtenerAdicionesProyectoJSON(adicionesProyecto);
    }

    /**
     * @param adicionesProyecto the adicionesProyecto to set
     */
    public void setAdicionesProyecto(ArrayList<AdicionProyecto> adicionesProyecto) {
        this.adicionesProyecto = adicionesProyecto;
    }

    /**
     * @return the plazosProyecto
     */
    public ArrayList<PlazoProyecto> getPlazosProyecto() {
        return plazosProyecto;
    }

    /**
     * @param plazosProyecto the plazosProyecto to set
     */
    public void setPlazosProyecto(ArrayList<PlazoProyecto> plazosProyecto) {
        this.plazosProyecto = plazosProyecto;
    }

    /**
     * @return the plazosProyecto
     */
    public String getPlazosProyectoJSON() {
        return Util.obtenerPlazosProyectoJSON(this.plazosProyecto);
    }

    /**
     * @return the gruposInvestigacion
     */
    public ArrayList<GrupoInvestigacion> getGruposInvestigacion() {
        return gruposInvestigacion;
    }

    /**
     * @param gruposInvestigacion the gruposInvestigacion to set
     */
    public void setGruposInvestigacion(ArrayList<GrupoInvestigacion> gruposInvestigacion) {
        this.gruposInvestigacion = gruposInvestigacion;
    }

    /**
     * @return the entidadesInternacionalesProyecto
     */
    public ArrayList<EntidadInternacionalProyecto> getEntidadesInternacionalesProyecto() {
        return entidadesInternacionalesProyecto;
    }

    /**
     * @return the JSON entidadesInternacionalesProyecto
     */
    public String getEntidadesInternacionalesProyectoJSON() {
        return Util.obtenerEntidadesInternacionalesProyectoJSON(entidadesInternacionalesProyecto);
    }

    /**
     * @param entidadesInternacionalesProyecto the entidadesInternacionalesProyecto to set
     */
    public void setEntidadesInternacionalesProyecto(ArrayList<EntidadInternacionalProyecto> entidadesInternacionalesProyecto) {
        this.entidadesInternacionalesProyecto = entidadesInternacionalesProyecto;
    }

    /**
     * @return the fuentesFinanciacionProyecto
     */
    public ArrayList<FuenteFinanciacionProyecto> getFuentesFinanciacionProyecto() {
        return fuentesFinanciacionProyecto;
    }

    /**
     * @return the JSON fuentesFinanciacionProyecto
     */
    public String getFuentesFinanciacionProyectoJSON() {
        return Util.obtenerFuentesFinanciacionProyectoJSON(fuentesFinanciacionProyecto);
    }

    /**
     * @param fuentesFinanciacionProyecto the fuentesFinanciacionProyecto to set
     */
    public void setFuentesFinanciacionProyecto(ArrayList<FuenteFinanciacionProyecto> fuentesFinanciacionProyecto) {
        this.fuentesFinanciacionProyecto = fuentesFinanciacionProyecto;
    }

    /**
     * @return the cumplimientoCompromisosProyecto
     */
    public ArrayList<co.edu.fnsp.gpci.entidades.CumplimientoCompromisoProyecto> getCumplimientoCompromisosProyecto() {
        return cumplimientoCompromisosProyecto;
    }

    /**
     * @return the cumplimientoCompromisosProyecto
     */
    public String getCumplimientoCompromisosProyectoJSON() {
        return Util.obtenerCumplimientoCompromisosProyectoJSON(cumplimientoCompromisosProyecto);
    }

    /**
     * @param cumplimientoCompromisosProyecto the
     * cumplimientoCompromisosProyecto to set
     */
    public void setCumplimientoCompromisosProyecto(ArrayList<co.edu.fnsp.gpci.entidades.CumplimientoCompromisoProyecto> cumplimientoCompromisosProyecto) {
        this.cumplimientoCompromisosProyecto = cumplimientoCompromisosProyecto;
    }

    /**
     * @return the alertasAvalProyecto
     */
    public ArrayList<AlertaAvalProyecto> getAlertasAvalProyecto() {
        return alertasAvalProyecto;
    }

    /**
     * @return the alertasAvalProyecto
     */
    public String getAlertasAvalProyectoJSON() {
        return Util.obtenerAlertasAvalProyectoJSON(alertasAvalProyecto);
    }

    /**
     * @param alertasAvalProyecto the alertasAvalProyecto to set
     */
    public void setAlertasAvalProyecto(ArrayList<AlertaAvalProyecto> alertasAvalProyecto) {
        this.alertasAvalProyecto = alertasAvalProyecto;
    }

    /**
     * @return the cumplimientosAlertasAvalProyecto
     */
    public ArrayList<co.edu.fnsp.gpci.entidades.CumplimientoAlertaAvalProyecto> getCumplimientosAlertasAvalProyecto() {
        return cumplimientosAlertasAvalProyecto;
    }

    /**
    * @return the cumplimientosAlertasAvalProyecto
    */
    public String getCumplimientosAlertasAvalProyectoJSON() {
        return Util.obtenerCumplimientosAlertasAvalProyectoJSON(cumplimientosAlertasAvalProyecto);
    }
    
    /**
     * @param cumplimientosAlertasAvalProyecto the cumplimientosAlertasAvalProyecto to set
     */
    public void setCumplimientosAlertasAvalProyecto(ArrayList<co.edu.fnsp.gpci.entidades.CumplimientoAlertaAvalProyecto> cumplimientosAlertasAvalProyecto) {
        this.cumplimientosAlertasAvalProyecto = cumplimientosAlertasAvalProyecto;
    }
}
