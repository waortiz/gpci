/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.entidades;

import java.util.ArrayList;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author William
 */
public class Proyecto {

    private long idProyecto;
    private int idGrupoInvestigacionPrincipal;
    private String nombreCompletoProyecto;
    private String nombreCortoProyecto;
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date fechaInicio;
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date fechaFinalizacion;
    private AreaTematica areaTematica;
    private boolean ingresadoSIGEP;
    private boolean ingresadoSIIU;
    private boolean ingresadoSIU;
    private String codigoSIIU;
    private String codigoCOLCIENCIAS;
    private String codigoSIU;
    private String codigo;
    private boolean participacionInternacional;
    private TipoProyecto tipoProyecto = new TipoProyecto();
    private RiesgoEtico riesgoEtico = new RiesgoEtico();
    private TipoContrato tipoContrato = new TipoContrato();
    private EnfoqueMetodologico enfoqueMetodologico = new EnfoqueMetodologico();
    private Convocatoria convocatoria = new Convocatoria();
    private String objetivoGeneral;
    private EstadoProyecto estado = new EstadoProyecto();
    private Date fechaCreacion;
    private Usuario usuarioCreacion = new Usuario();
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date fechaIngresadoSIGEP;
    private ArrayList<CompromisoProyecto> compromisosProyecto = new ArrayList<>();
    private ArrayList<EstudianteProyecto> estudiantesProyecto = new ArrayList<>();
    private ArrayList<ObjetivoEspecifico> objetivosEspecificos = new ArrayList<>();
    private ArrayList<PersonalExternoProyecto> personalExternoProyecto = new ArrayList<>();
    private ArrayList<ProfesorProyecto> profesoresProyecto = new ArrayList<>();
    private ArrayList<ActaProyecto> actasProyecto = new ArrayList<>();
    private ArrayList<ProrrogaProyecto> prorrogasProyecto = new ArrayList<>();
    private ArrayList<AdendaIngresoProyecto> adendasIngresoProyecto = new ArrayList<>();
    private ArrayList<AdendaCambioProyecto> adendasCambioProyecto = new ArrayList<>();
    private ArrayList<AdendaRetiroProyecto> adendasRetiroProyecto = new ArrayList<>();
    private ArrayList<AdicionProyecto> adicionesProyecto = new ArrayList<>();
    private ArrayList<PlazoProyecto> plazosProyecto = new ArrayList<>();
    private ArrayList<GrupoInvestigacionProyecto> gruposInvestigacion = new ArrayList<>();
    private ArrayList<EntidadInternacionalProyecto> entidadesInternacionalesProyecto = new ArrayList<>();
    private ArrayList<FuenteFinanciacionProyecto> fuentesFinanciacionProyecto = new ArrayList<>();
    private ArrayList<CumplimientoCompromisoProyecto> cumplimientoCompromisosProyecto = new ArrayList<>();
    private ArrayList<AlertaAvalProyecto> alertasAvalProyecto = new ArrayList<>();
    private ArrayList<CumplimientoAlertaAvalProyecto> cumplimientosAlertasAvalProyecto = new ArrayList<>();
    private ArrayList<CompromisoHomologadoProyecto> compromisosHomologadosProyecto = new ArrayList<>();
    
    /**
     * @return the idGrupoInvestigacionPrincipal
     */
    public int getIdGrupoInvestigacionPrincipal() {
        return idGrupoInvestigacionPrincipal;
    }

    /**
     * @param idGrupoInvestigacionPrincipal the idGrupoInvestigacionPrincipal to set
     */
    public void setIdGrupoInvestigacionPrincipal(int idGrupoInvestigacionPrincipal) {
        this.idGrupoInvestigacionPrincipal = idGrupoInvestigacionPrincipal;
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
    public Date getFechaInicio() {
        return fechaInicio;
    }

    /**
     * @param fechaInicio the fechaInicio to set
     */
    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    /**
     * @return the fechaFinalizacion
     */
    public Date getFechaFinalizacion() {
        return fechaFinalizacion;
    }

    /**
     * @param fechaFinalizacion the fechaFinalizacion to set
     */
    public void setFechaFinalizacion(Date fechaFinalizacion) {
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
     * @return the fechaCreacion
     */
    public Date getFechaCreacion() {
        return fechaCreacion;
    }

    /**
     * @param fechaCreacion the fechaCreacion to set
     */
    public void setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    /**
     * @return the usuarioCreacion
     */
    public Usuario getUsuarioCreacion() {
        return usuarioCreacion;
    }

    /**
     * @param usuarioCreacion the usuarioCreacion to set
     */
    public void setUsuarioCreacion(Usuario usuarioCreacion) {
        this.usuarioCreacion = usuarioCreacion;
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
     * @return the prorrogasProyecto
     */
    public ArrayList<ProrrogaProyecto> getProrrogasProyecto() {
        return prorrogasProyecto;
    }

    /**
     * @param prorrogasProyecto the prorrogasProyecto to set
     */
    public void setProrrogasProyecto(ArrayList<ProrrogaProyecto> prorrogasProyecto) {
        this.prorrogasProyecto = prorrogasProyecto;
    }

    /**
     * @return the adicionesProyecto
     */
    public ArrayList<AdicionProyecto> getAdicionesProyecto() {
        return adicionesProyecto;
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
     * @return the entidadesInternacionalesProyecto
     */
    public ArrayList<EntidadInternacionalProyecto> getEntidadesInternacionalesProyecto() {
        return entidadesInternacionalesProyecto;
    }

    /**
     * @param entidadesInternacionalesProyecto the entidadesInternacionalesProyecto to set
     */
    public void setEntidadesInternacionalesProyecto(ArrayList<EntidadInternacionalProyecto> entidadesInternacionalesProyecto) {
        this.entidadesInternacionalesProyecto = entidadesInternacionalesProyecto;
    }

    /**
     * @return the gruposInvestigacion
     */
    public ArrayList<GrupoInvestigacionProyecto> getGruposInvestigacion() {
        return gruposInvestigacion;
    }

    /**
     * @param gruposInvestigacion the gruposInvestigacion to set
     */
    public void setGruposInvestigacion(ArrayList<GrupoInvestigacionProyecto> gruposInvestigacion) {
        this.gruposInvestigacion = gruposInvestigacion;
    }

    /**
     * @return the fuentesFinanciacionProyecto
     */
    public ArrayList<FuenteFinanciacionProyecto> getFuentesFinanciacionProyecto() {
        return fuentesFinanciacionProyecto;
    }

    /**
     * @param fuentesFinanciacionProyecto the fuentesFinanciacionProyecto to set
     */
    public void setFuentesFinanciacionProyecto(ArrayList<FuenteFinanciacionProyecto> fuentesFinanciacionProyecto) {
        this.fuentesFinanciacionProyecto = fuentesFinanciacionProyecto;
    }

    /**
     * @return the adendasIngresoProyecto
     */
    public ArrayList<AdendaIngresoProyecto> getAdendasIngresoProyecto() {
        return adendasIngresoProyecto;
    }

    /**
     * @param adendasIngresoProyecto the adendasIngresoProyecto to set
     */
    public void setAdendasIngresoProyecto(ArrayList<AdendaIngresoProyecto> adendasIngresoProyecto) {
        this.adendasIngresoProyecto = adendasIngresoProyecto;
    }

    /**
     * @return the adendasCambioProyecto
     */
    public ArrayList<AdendaCambioProyecto> getAdendasCambioProyecto() {
        return adendasCambioProyecto;
    }

    /**
     * @param adendasCambioProyecto the adendasCambioProyecto to set
     */
    public void setAdendasCambioProyecto(ArrayList<AdendaCambioProyecto> adendasCambioProyecto) {
        this.adendasCambioProyecto = adendasCambioProyecto;
    }

    /**
     * @return the adendasRetiroProyecto
     */
    public ArrayList<AdendaRetiroProyecto> getAdendasRetiroProyecto() {
        return adendasRetiroProyecto;
    }

    /**
     * @param adendasRetiroProyecto the adendasRetiroProyecto to set
     */
    public void setAdendasRetiroProyecto(ArrayList<AdendaRetiroProyecto> adendasRetiroProyecto) {
        this.adendasRetiroProyecto = adendasRetiroProyecto;
    }

    /**
     * @return the cumplimientoCompromisosProyecto
     */
    public ArrayList<CumplimientoCompromisoProyecto> getCumplimientoCompromisosProyecto() {
        return cumplimientoCompromisosProyecto;
    }

    /**
     * @param cumplimientoCompromisosProyecto the cumplimientoCompromisosProyecto to set
     */
    public void setCumplimientoCompromisosProyecto(ArrayList<CumplimientoCompromisoProyecto> cumplimientoCompromisosProyecto) {
        this.cumplimientoCompromisosProyecto = cumplimientoCompromisosProyecto;
    }

    /**
     * @return the alertasAvalProyecto
     */
    public ArrayList<AlertaAvalProyecto> getAlertasAvalProyecto() {
        return alertasAvalProyecto;
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
    public ArrayList<CumplimientoAlertaAvalProyecto> getCumplimientosAlertasAvalProyecto() {
        return cumplimientosAlertasAvalProyecto;
    }

    /**
     * @param cumplimientosAlertasAvalProyecto the cumplimientosAlertasAvalProyecto to set
     */
    public void setCumplimientosAlertasAvalProyecto(ArrayList<CumplimientoAlertaAvalProyecto> cumplimientosAlertasAvalProyecto) {
        this.cumplimientosAlertasAvalProyecto = cumplimientosAlertasAvalProyecto;
    }

    /**
     * @return the fechaIngresadoSIGEP
     */
    public Date getFechaIngresadoSIGEP() {
        return fechaIngresadoSIGEP;
    }

    /**
     * @param fechaIngresadoSIGEP the fechaIngresadoSIGEP to set
     */
    public void setFechaIngresadoSIGEP(Date fechaIngresadoSIGEP) {
        this.fechaIngresadoSIGEP = fechaIngresadoSIGEP;
    }

    /**
     * @return the compromisosHomologadosProyecto
     */
    public ArrayList<CompromisoHomologadoProyecto> getCompromisosHomologadosProyecto() {
        return compromisosHomologadosProyecto;
    }

    /**
     * @param compromisosHomologadosProyecto the compromisosHomologadosProyecto to set
     */
    public void setCompromisosHomologadosProyecto(ArrayList<CompromisoHomologadoProyecto> compromisosHomologadosProyecto) {
        this.compromisosHomologadosProyecto = compromisosHomologadosProyecto;
    }
}
