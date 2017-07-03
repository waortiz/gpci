/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.entidadesVista;

import co.edu.fnsp.gpci.entidades.CompromisoProyecto;
import co.edu.fnsp.gpci.entidades.ObjetivoEspecifico;
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
    private String grupoInvestigacion;
    private String riesgoEtico;
    private String tipoContrato;
    private String enfoqueMetodologico;
    private String convocatoria;
    private String objetivoGeneral;
    private String estado;
    private ArrayList<ObjetivoEspecifico> objetivosEspecificos = new ArrayList<>();
    private ArrayList<ProfesorProyecto> profesoresProyecto = new ArrayList<>();
    private ArrayList<EstudianteProyecto> estudiantesProyecto = new ArrayList<>();
    private ArrayList<PersonalExternoProyecto> personalExternoProyecto = new ArrayList<>();
    private ArrayList<CompromisoProyecto> compromisosProyecto = new ArrayList<>();

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
     * @return the grupoInvestigacion
     */
    public String getGrupoInvestigacion() {
        return grupoInvestigacion;
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
     * @param grupoInvestigacion the grupoInvestigacion to set
     */
    public void setGrupoInvestigacion(String grupoInvestigacion) {
        this.grupoInvestigacion = grupoInvestigacion;
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
        String jscriptArray = "";

        if (this.objetivosEspecificos.size() > 0) {
            jscriptArray = "[";

            for (int i = 0; i < this.objetivosEspecificos.size(); i++) {
                ObjetivoEspecifico objetivoEspecifico = this.objetivosEspecificos.get(i);
                jscriptArray = jscriptArray
                        + "{idObjetivoEspecifico: ko.observable(" + objetivoEspecifico.getIdObjetivoEspecifico()+ "),"
                        + "descripcion:ko.observable('" + objetivoEspecifico.getDescripcion()+ "'),"
                        + "consecutivo:ko.observable(" + i + ")"
                        + "}";
                if (i < this.objetivosEspecificos.size() - 1) {
                    jscriptArray = jscriptArray + ",";
                }
            }

            jscriptArray = jscriptArray + "]";
        }

        return jscriptArray;

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
        String jscriptArray = "";

        if (this.profesoresProyecto.size() > 0) {
            jscriptArray = "[";

            for (int i = 0; i < this.profesoresProyecto.size(); i++) {
                ProfesorProyecto profesorProyecto = this.profesoresProyecto.get(i);
                jscriptArray = jscriptArray
                        + "{apellidos: ko.observable('" + profesorProyecto.getApellidos() + "'),"
                        + "nombres:ko.observable('" + profesorProyecto.getNombres() + "'),"
                        + "cartaCesionDerechosPatrimonio:ko.observable('" + profesorProyecto.isCartaCesionDerechosPatrimonio()+ "'),"
                        + "codigoVinculacionUdeA:ko.observable('" + profesorProyecto.getCodigoVinculacionUdeA() + "'),"
                        + "contacto:ko.observable('" + profesorProyecto.getContacto() + "'),"
                        + "correoElectronico:ko.observable('" + profesorProyecto.getCorreoElectronico() + "'),"
                        + "descripcionFacultad:ko.observable('" + profesorProyecto.getDescripcionFacultad() + "'),"
                        + "descripcionRol:ko.observable('" + profesorProyecto.getDescripcionRol() + "'),"
                        + "descripcionTipoIdentificacion:ko.observable('" + profesorProyecto.getDescripcionTipoIdentificacion() + "'),"
                        + "horasSemana:ko.observable(" + profesorProyecto.getHorasSemana() + "),"
                        + "horasSemanaFueraPlan:ko.observable('" + profesorProyecto.getHorasSemanaFueraPlan() + "'),"
                        + "idFacultad:ko.observable(" + profesorProyecto.getIdFacultad() + "),"
                        + "idProfesor:ko.observable(" + profesorProyecto.getIdProfesor() + "),"
                        + "idRol:ko.observable(" + profesorProyecto.getIdRol() + "),"
                        + "idTipoIdentificacion:ko.observable(" + profesorProyecto.getIdTipoIdentificacion() + "),"
                        + "mesesDedicados:ko.observable(" + profesorProyecto.getMesesDedicados() + "),"
                        + "mesesFueraPlan:ko.observable('" + profesorProyecto.getMesesFueraPlan() + "'),"
                        + "numeroIdentificacion:ko.observable(" + profesorProyecto.getNumeroIdentificacion() + "),"
                        + "porcentajePI:ko.observable(" + profesorProyecto.getPorcentajePI() + "),"
                        + "consecutivo:ko.observable(" + i + ")"
                        + "}";
                if (i < this.profesoresProyecto.size() - 1) {
                    jscriptArray = jscriptArray + ",";
                }
            }

            jscriptArray = jscriptArray + "]";
        }

        return jscriptArray;
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
        String jscriptArray = "";

        if (this.estudiantesProyecto.size() > 0) {
            jscriptArray = "[";

            for (int i = 0; i < this.estudiantesProyecto.size(); i++) {
                EstudianteProyecto estudianteProyecto = this.estudiantesProyecto.get(i);
                jscriptArray = jscriptArray
                        + "{apellidos: ko.observable('" + estudianteProyecto.getApellidos() + "'),"
                        + "nombres:ko.observable('" + estudianteProyecto.getNombres() + "'),"
                        + "contacto:ko.observable('" + estudianteProyecto.getContacto() + "'),"
                        + "correoElectronico:ko.observable('" + estudianteProyecto.getCorreoElectronico() + "'),"
                        + "descripcionPrograma:ko.observable('" + estudianteProyecto.getDescripcionPrograma()+ "'),"
                        + "descripcionRol:ko.observable('" + estudianteProyecto.getDescripcionRol() + "'),"
                        + "descripcionTipoIdentificacion:ko.observable('" + estudianteProyecto.getDescripcionTipoIdentificacion() + "'),"
                        + "horasSemana:ko.observable(" + estudianteProyecto.getHorasSemana() + "),"
                        + "descripcionTipoEstudiante:ko.observable('" + estudianteProyecto.getDescripcionTipoEstudiante() + "'),"
                        + "idPrograma:ko.observable(" + estudianteProyecto.getIdPrograma()+ "),"
                        + "idEstudiante:ko.observable(" + estudianteProyecto.getIdEstudiante()+ "),"
                        + "idRol:ko.observable(" + estudianteProyecto.getIdRol() + "),"
                        + "idTipoIdentificacion:ko.observable(" + estudianteProyecto.getIdTipoIdentificacion() + "),"
                        + "idTipoEstudiante:ko.observable(" + estudianteProyecto.getIdTipoEstudiante()+ "),"
                        + "mesesDedicados:ko.observable(" + estudianteProyecto.getMesesDedicados() + "),"
                        + "semestre:ko.observable('" + estudianteProyecto.getSemestre()+ "'),"
                        + "numeroIdentificacion:ko.observable(" + estudianteProyecto.getNumeroIdentificacion() + "),"
                        + "porcentajePropiedadIntelectual:ko.observable(" + estudianteProyecto.getPorcentajePropiedadIntelectual()+ "),"
                        + "consecutivo:ko.observable(" + i + ")"
                        + "}";
                if (i < this.estudiantesProyecto.size() - 1) {
                    jscriptArray = jscriptArray + ",";
                }
            }

            jscriptArray = jscriptArray + "]";
        }

        return jscriptArray;
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
        String jscriptArray = "";

        if (this.personalExternoProyecto.size() > 0) {
            jscriptArray = "[";

            for (int i = 0; i < this.personalExternoProyecto.size(); i++) {
                PersonalExternoProyecto personalExternoProyecto = this.personalExternoProyecto.get(i);
                jscriptArray = jscriptArray
                        + "{apellidos: ko.observable('" + personalExternoProyecto.getApellidos() + "'),"
                        + "nombres:ko.observable('" + personalExternoProyecto.getNombres() + "'),"
                        + "cartaCesionDerechosPatrimonio:ko.observable('" + personalExternoProyecto.isCartaCesionDerechosPatrimonio()+ "'),"
                        + "entidad:ko.observable('" + personalExternoProyecto.getEntidad()+ "'),"
                        + "correoElectronico:ko.observable('" + personalExternoProyecto.getCorreoElectronico() + "'),"
                        + "descripcionRol:ko.observable('" + personalExternoProyecto.getDescripcionRol() + "'),"
                        + "descripcionTipoIdentificacion:ko.observable('" + personalExternoProyecto.getDescripcionTipoIdentificacion() + "'),"
                        + "horasSemana:ko.observable(" + personalExternoProyecto.getHorasSemana() + "),"
                        + "idPersonalExterno:ko.observable(" + personalExternoProyecto.getIdPersonalExterno()+ "),"
                        + "idRol:ko.observable(" + personalExternoProyecto.getIdRol() + "),"
                        + "idTipoIdentificacion:ko.observable(" + personalExternoProyecto.getIdTipoIdentificacion() + "),"
                        + "mesesDedicados:ko.observable(" + personalExternoProyecto.getMesesDedicados() + "),"
                        + "numeroIdentificacion:ko.observable(" + personalExternoProyecto.getNumeroIdentificacion() + "),"
                        + "porcentajePropiedadIntelectual:ko.observable(" + personalExternoProyecto.getPorcentajePropiedadIntelectual()+ "),"
                        + "consecutivo:ko.observable(" + i + ")"
                        + "}";
                if (i < this.profesoresProyecto.size() - 1) {
                    jscriptArray = jscriptArray + ",";
                }
            }

            jscriptArray = jscriptArray + "]";
        }

        return jscriptArray;
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
        String jscriptArray = "";

        if (this.compromisosProyecto.size() > 0) {
            jscriptArray = "[";

            for (int i = 0; i < this.compromisosProyecto.size(); i++) {
                CompromisoProyecto compromisoProyecto = this.compromisosProyecto.get(i);
                jscriptArray = jscriptArray
                        + "{idCompromisoProyecto: ko.observable(" + compromisoProyecto.getIdCompromisoProyecto()+ "),"
                        + "descripcion:ko.observable('" + compromisoProyecto.getDescripcion()+ "'),"
                        + "consecutivo:ko.observable(" + i + ")"
                        + "}";
                if (i < this.compromisosProyecto.size() - 1) {
                    jscriptArray = jscriptArray + ",";
                }
            }

            jscriptArray = jscriptArray + "]";
        }

        return jscriptArray;

    }
}
