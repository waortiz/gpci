/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.utilidades;

import co.edu.fnsp.gpci.entidades.ActaProyecto;
import co.edu.fnsp.gpci.entidades.AdendaCambioProyecto;
import co.edu.fnsp.gpci.entidades.AdendaIngresoProyecto;
import co.edu.fnsp.gpci.entidades.AdendaRetiroProyecto;
import co.edu.fnsp.gpci.entidades.AdicionProyecto;
import co.edu.fnsp.gpci.entidades.AlertaAvalProyecto;
import co.edu.fnsp.gpci.entidades.CompromisoProyecto;
import co.edu.fnsp.gpci.entidades.CumplimientoAlertaAvalProyecto;
import co.edu.fnsp.gpci.entidades.CumplimientoCompromisoProyecto;
import co.edu.fnsp.gpci.entidades.EntidadInternacionalProyecto;
import co.edu.fnsp.gpci.entidades.ObjetivoEspecifico;
import co.edu.fnsp.gpci.entidades.PlazoProyecto;
import co.edu.fnsp.gpci.entidades.ProrrogaProyecto;
import co.edu.fnsp.gpci.entidades.EstudianteProyecto;
import co.edu.fnsp.gpci.entidades.FuenteFinanciacionProyecto;
import co.edu.fnsp.gpci.entidades.PersonalExternoProyecto;
import co.edu.fnsp.gpci.entidades.ProfesorProyecto;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author William
 */
public class Util {

    private static final SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
    private static final DecimalFormat decimalFormat = new DecimalFormat("'$'###,###");

    public static String obtenerActasProyectoJSON(ArrayList<ActaProyecto> actasProyecto) {
        String jscriptArray = "";

        if (actasProyecto.size() > 0) {
            jscriptArray = "[";

            for (int i = 0; i < actasProyecto.size(); i++) {
                ActaProyecto actaProyecto = actasProyecto.get(i);
                jscriptArray = jscriptArray
                        + "{idActa: ko.observable(" + actaProyecto.getIdActa() + "),"
                        + "idTipoActa: ko.observable(" + actaProyecto.getIdTipoActa() + "),"
                        + "descripcionTipoActa:ko.observable('" + actaProyecto.getDescripcionTipoActa() + "'),"
                        + "observaciones:ko.observable('" + actaProyecto.getObservaciones() + "'),"
                        + "fechaFormateada:ko.observable('" + simpleDateFormat.format(actaProyecto.getFecha()) + "'),"
                        + "numero:ko.observable('" + actaProyecto.getNumero() + "')"
                        + "}";
                if (i < actasProyecto.size() - 1) {
                    jscriptArray = jscriptArray + ",";
                }
            }

            jscriptArray = jscriptArray + "]";
        }

        return jscriptArray;
    }

    public static String obtenerAdendasCambioProyectoJSON(ArrayList<AdendaCambioProyecto> adendasProyecto) {
        String jscriptArray = "";

        if (adendasProyecto.size() > 0) {
            jscriptArray = "[";

            for (int i = 0; i < adendasProyecto.size(); i++) {
                AdendaCambioProyecto adendaProyecto = adendasProyecto.get(i);
                jscriptArray = jscriptArray
                        + "{idAdenda: ko.observable(" + adendaProyecto.getIdAdenda() + "),"
                        + "idTipoPersona:ko.observable(" + adendaProyecto.getIdTipoPersona() + "),"
                        + "nombreTipoPersona:ko.observable('" + adendaProyecto.getNombreTipoPersona() + "'),"
                        + "idRol:ko.observable(" + adendaProyecto.getIdRol() + "),"
                        + "nombreRol:ko.observable('" + adendaProyecto.getNombreRol() + "'),"
                        + "idTipoIdentificacionPersona:ko.observable(" + adendaProyecto.getIdTipoIdentificacionPersona() + "),"
                        + "nombreTipoIdentificacionPersona:ko.observable('" + adendaProyecto.getNombreTipoIdentificacionPersona() + "'),"
                        + "numeroIdentificacionPersona:ko.observable(" + adendaProyecto.getNumeroIdentificacionPersona() + "),"
                        + "nombresPersona:ko.observable('" + adendaProyecto.getNombresPersona() + "'),"
                        + "apellidosPersona:ko.observable('" + adendaProyecto.getApellidosPersona() + "'),"
                        + "fechaCambioFormateada:ko.observable('" + simpleDateFormat.format(adendaProyecto.getFechaCambio()) + "'),"
                        + "numeroActa:ko.observable('" + adendaProyecto.getNumeroActa() + "'),"
                        + "fechaActaFormateada:ko.observable('" + simpleDateFormat.format(adendaProyecto.getFechaActa()) + "')"
                        + "}";
                if (i < adendasProyecto.size() - 1) {
                    jscriptArray = jscriptArray + ",";
                }
            }

            jscriptArray = jscriptArray + "]";
        }

        return jscriptArray;
    }

    public static String obtenerAdendasIngresoProyectoJSON(ArrayList<AdendaIngresoProyecto> adendasProyecto) {
        String jscriptArray = "";

        if (adendasProyecto.size() > 0) {
            jscriptArray = "[";

            for (int i = 0; i < adendasProyecto.size(); i++) {
                AdendaIngresoProyecto adendaProyecto = adendasProyecto.get(i);
                jscriptArray = jscriptArray
                        + "{idAdenda: ko.observable(" + adendaProyecto.getIdAdenda() + "),"
                        + "idTipoPersona:ko.observable(" + adendaProyecto.getIdTipoPersona() + "),"
                        + "nombreTipoPersona:ko.observable('" + adendaProyecto.getNombreTipoPersona() + "'),"
                        + "idTipoIdentificacionPersona:ko.observable(" + adendaProyecto.getIdTipoIdentificacionPersona() + "),"
                        + "nombreTipoIdentificacionPersona:ko.observable('" + adendaProyecto.getNombreTipoIdentificacionPersona() + "'),"
                        + "numeroIdentificacionPersona:ko.observable(" + adendaProyecto.getNumeroIdentificacionPersona() + "),"
                        + "nombresPersona:ko.observable('" + adendaProyecto.getNombresPersona() + "'),"
                        + "apellidosPersona:ko.observable('" + adendaProyecto.getApellidosPersona() + "'),"
                        + "fechaIngresoFormateada:ko.observable('" + simpleDateFormat.format(adendaProyecto.getFechaIngreso()) + "'),"
                        + "numeroActa:ko.observable('" + adendaProyecto.getNumeroActa() + "'),"
                        + "fechaActaFormateada:ko.observable('" + simpleDateFormat.format(adendaProyecto.getFechaActa()) + "')"
                        + "}";
                if (i < adendasProyecto.size() - 1) {
                    jscriptArray = jscriptArray + ",";
                }
            }

            jscriptArray = jscriptArray + "]";
        }

        return jscriptArray;
    }

    public static String obtenerAdendasRetiroProyectoJSON(ArrayList<AdendaRetiroProyecto> adendasProyecto) {
        String jscriptArray = "";

        if (adendasProyecto.size() > 0) {
            jscriptArray = "[";

            for (int i = 0; i < adendasProyecto.size(); i++) {
                AdendaRetiroProyecto adendaProyecto = adendasProyecto.get(i);
                jscriptArray = jscriptArray
                        + "{idAdenda: ko.observable(" + adendaProyecto.getIdAdenda() + "),"
                        + "motivo:ko.observable('" + adendaProyecto.getMotivo() + "'),"
                        + "idTipoPersona:ko.observable(" + adendaProyecto.getIdTipoPersona() + "),"
                        + "nombreTipoPersona:ko.observable('" + adendaProyecto.getNombreTipoPersona() + "'),"
                        + "idTipoIdentificacionPersona:ko.observable(" + adendaProyecto.getIdTipoIdentificacionPersona() + "),"
                        + "nombreTipoIdentificacionPersona:ko.observable('" + adendaProyecto.getNombreTipoIdentificacionPersona() + "'),"
                        + "numeroIdentificacionPersona:ko.observable(" + adendaProyecto.getNumeroIdentificacionPersona() + "),"
                        + "nombresPersona:ko.observable('" + adendaProyecto.getNombresPersona() + "'),"
                        + "apellidosPersona:ko.observable('" + adendaProyecto.getApellidosPersona() + "'),"
                        + "fechaRetiroFormateada:ko.observable('" + simpleDateFormat.format(adendaProyecto.getFechaRetiro()) + "'),"
                        + "numeroActa:ko.observable('" + adendaProyecto.getNumeroActa() + "'),"
                        + "fechaActaFormateada:ko.observable('" + simpleDateFormat.format(adendaProyecto.getFechaActa()) + "')"
                        + "}";
                if (i < adendasProyecto.size() - 1) {
                    jscriptArray = jscriptArray + ",";
                }
            }

            jscriptArray = jscriptArray + "]";
        }

        return jscriptArray;
    }

    public static String obtenerAdicionesProyectoJSON(ArrayList<AdicionProyecto> adicionesProyecto) {
        String jscriptArray = "";

        if (adicionesProyecto.size() > 0) {
            jscriptArray = "[";

            for (int i = 0; i < adicionesProyecto.size(); i++) {
                AdicionProyecto adicionProyecto = adicionesProyecto.get(i);
                jscriptArray = jscriptArray
                        + "{idAdicion: ko.observable(" + adicionProyecto.getIdAdicion() + "),"
                        + "descripcion:ko.observable('" + adicionProyecto.getDescripcion() + "'),"
                        + "numeroActa:ko.observable('" + adicionProyecto.getNumeroActa() + "'),"
                        + "fechaActaFormateada:ko.observable('" + simpleDateFormat.format(adicionProyecto.getFechaActa()) + "'),"
                        + "numeroActaCODI:ko.observable('" + adicionProyecto.getNumeroActaCODI() + "'),"
                        + "fechaActaCODIFormateada:ko.observable('" + simpleDateFormat.format(adicionProyecto.getFechaActaCODI()) + "'),"
                        + "monto:ko.observable(" + adicionProyecto.getMonto() + "),"
                        + "montoFormateado:ko.observable(" + decimalFormat.format(adicionProyecto.getMonto()) + ")"
                        + "}";
                if (i < adicionesProyecto.size() - 1) {
                    jscriptArray = jscriptArray + ",";
                }
            }

            jscriptArray = jscriptArray + "]";
        }

        return jscriptArray;
    }

    public static String obtenerProrrogasProyectoJSON(ArrayList<ProrrogaProyecto> prorrogasProyecto) {
        String jscriptArray = "";

        if (prorrogasProyecto.size() > 0) {
            jscriptArray = "[";

            for (int i = 0; i < prorrogasProyecto.size(); i++) {
                ProrrogaProyecto prorrogaProyecto = prorrogasProyecto.get(i);
                jscriptArray = jscriptArray
                        + "{idProrroga: ko.observable(" + prorrogaProyecto.getIdProrroga() + "),"
                        + "mesesAprobados:ko.observable(" + prorrogaProyecto.getMesesAprobados() + "),"
                        + "montoAprobado:ko.observable(" + prorrogaProyecto.getMontoAprobado() + "),"
                        + "montoAprobadoFormateado:ko.observable(" + decimalFormat.format(prorrogaProyecto.getMontoAprobado()) + ")"
                        + "numeroActa:ko.observable('" + prorrogaProyecto.getNumeroActa() + "'),"
                        + "fechaActaFormateada:ko.observable('" + simpleDateFormat.format(prorrogaProyecto.getFechaActa()) + "'),"
                        + "numeroActaCODI:ko.observable('" + prorrogaProyecto.getNumeroActaCODI() + "'),"
                        + "fechaActaCODIFormateada:ko.observable('" + simpleDateFormat.format(prorrogaProyecto.getFechaActaCODI()) + "'),"
                        + "descripcion:ko.observable('" + prorrogaProyecto.getDescripcion() + "')"
                        + "}";
                if (i < prorrogasProyecto.size() - 1) {
                    jscriptArray = jscriptArray + ",";
                }
            }

            jscriptArray = jscriptArray + "]";
        }

        return jscriptArray;
    }

    public static String obtenerPlazosProyectoJSON(ArrayList<PlazoProyecto> plazosProyecto) {
        String jscriptArray = "";

        if (plazosProyecto.size() > 0) {
            jscriptArray = "[";

            for (int i = 0; i < plazosProyecto.size(); i++) {
                PlazoProyecto plazoProyecto = plazosProyecto.get(i);
                jscriptArray = jscriptArray
                        + "{idPlazo: ko.observable(" + plazoProyecto.getIdPlazo() + "),"
                        + "mesesAprobados:ko.observable(" + plazoProyecto.getMesesAprobados() + "),"
                        + "descripcion:ko.observable('" + plazoProyecto.getDescripcion() + "'),"
                        + "numeroActa:ko.observable('" + plazoProyecto.getNumeroActa() + "'),"
                        + "fechaActaFormateada:ko.observable('" + simpleDateFormat.format(plazoProyecto.getFechaActa()) + "'),"
                        + "numeroActaCODI:ko.observable('" + plazoProyecto.getNumeroActaCODI() + "'),"
                        + "fechaActaCODIFormateada:ko.observable('" + simpleDateFormat.format(plazoProyecto.getFechaActaCODI()) + "'),"
                        + "}";
                if (i < plazosProyecto.size() - 1) {
                    jscriptArray = jscriptArray + ",";
                }
            }

            jscriptArray = jscriptArray + "]";
        }

        return jscriptArray;
    }

    public static String obtenerCompromisosProyectoJSON(ArrayList<CompromisoProyecto> compromisosProyecto) {
        String jscriptArray = "";

        if (compromisosProyecto.size() > 0) {
            jscriptArray = "[";

            for (int i = 0; i < compromisosProyecto.size(); i++) {
                CompromisoProyecto compromisoProyecto = compromisosProyecto.get(i);
                jscriptArray = jscriptArray
                        + "{idCompromisoProyecto: ko.observable(" + compromisoProyecto.getIdCompromisoProyecto() + "),"
                        + "descripcion:ko.observable('" + compromisoProyecto.getDescripcion() + "'),"
                        + "nombreTipoCompromiso:ko.observable('" + compromisoProyecto.getNombreTipoCompromiso() + "'),"
                        + "idTipoCompromiso:ko.observable(" + compromisoProyecto.getIdTipoCompromiso() + "),"
                        + "consecutivo:ko.observable(" + i + ")"
                        + "}";
                if (i < compromisosProyecto.size() - 1) {
                    jscriptArray = jscriptArray + ",";
                }
            }

            jscriptArray = jscriptArray + "]";
        }

        return jscriptArray;

    }

    public static String obtenerPersonalExternoProyectoJSON(ArrayList<PersonalExternoProyecto> personalExternoProyecto) {
        String jscriptArray = "";

        if (personalExternoProyecto.size() > 0) {
            jscriptArray = "[";

            for (int i = 0; i < personalExternoProyecto.size(); i++) {
                PersonalExternoProyecto personalExterno = personalExternoProyecto.get(i);
                jscriptArray = jscriptArray
                        + "{apellidos: ko.observable('" + personalExterno.getApellidos() + "'),"
                        + "nombres:ko.observable('" + personalExterno.getNombres() + "'),"
                        + "cartaCesionDerechosPatrimonio:ko.observable('" + personalExterno.isCartaCesionDerechosPatrimonio() + "'),"
                        + "entidad:ko.observable('" + personalExterno.getEntidad() + "'),"
                        + "correoElectronico:ko.observable('" + personalExterno.getCorreoElectronico() + "'),"
                        + "descripcionRol:ko.observable('" + personalExterno.getDescripcionRol() + "'),"
                        + "descripcionTipoIdentificacion:ko.observable('" + personalExterno.getDescripcionTipoIdentificacion() + "'),"
                        + "horasSemana:ko.observable(" + personalExterno.getHorasSemana() + "),"
                        + "idPersonalExterno:ko.observable(" + personalExterno.getIdPersonalExterno() + "),"
                        + "idRol:ko.observable(" + personalExterno.getIdRol() + "),"
                        + "idTipoIdentificacion:ko.observable(" + personalExterno.getIdTipoIdentificacion() + "),"
                        + "mesesDedicados:ko.observable(" + personalExterno.getMesesDedicados() + "),"
                        + "numeroIdentificacion:ko.observable(" + personalExterno.getNumeroIdentificacion() + "),"
                        + "porcentajePropiedadIntelectual:ko.observable(" + personalExterno.getPorcentajePropiedadIntelectual() + "),"
                        + "consecutivo:ko.observable(" + i + ")"
                        + "}";
                if (i < personalExternoProyecto.size() - 1) {
                    jscriptArray = jscriptArray + ",";
                }
            }

            jscriptArray = jscriptArray + "]";
        }

        return jscriptArray;
    }

    public static String obtenerEstudiantesProyectoJSON(ArrayList<EstudianteProyecto> estudiantesProyecto) {
        String jscriptArray = "";

        if (estudiantesProyecto.size() > 0) {
            jscriptArray = "[";

            for (int i = 0; i < estudiantesProyecto.size(); i++) {
                EstudianteProyecto estudianteProyecto = estudiantesProyecto.get(i);
                jscriptArray = jscriptArray
                        + "{apellidos: ko.observable('" + estudianteProyecto.getApellidos() + "'),"
                        + "nombres:ko.observable('" + estudianteProyecto.getNombres() + "'),"
                        + "contacto:ko.observable('" + estudianteProyecto.getContacto() + "'),"
                        + "correoElectronico:ko.observable('" + estudianteProyecto.getCorreoElectronico() + "'),"
                        + "descripcionPrograma:ko.observable('" + estudianteProyecto.getDescripcionPrograma() + "'),"
                        + "descripcionRol:ko.observable('" + estudianteProyecto.getDescripcionRol() + "'),"
                        + "descripcionTipoIdentificacion:ko.observable('" + estudianteProyecto.getDescripcionTipoIdentificacion() + "'),"
                        + "horasSemana:ko.observable(" + estudianteProyecto.getHorasSemana() + "),"
                        + "descripcionTipoEstudiante:ko.observable('" + estudianteProyecto.getDescripcionTipoEstudiante() + "'),"
                        + "idPrograma:ko.observable(" + estudianteProyecto.getIdPrograma() + "),"
                        + "idEstudiante:ko.observable(" + estudianteProyecto.getIdEstudiante() + "),"
                        + "idRol:ko.observable(" + estudianteProyecto.getIdRol() + "),"
                        + "idTipoIdentificacion:ko.observable(" + estudianteProyecto.getIdTipoIdentificacion() + "),"
                        + "idTipoEstudiante:ko.observable(" + estudianteProyecto.getIdTipoEstudiante() + "),"
                        + "mesesDedicados:ko.observable(" + estudianteProyecto.getMesesDedicados() + "),"
                        + "semestre:ko.observable('" + estudianteProyecto.getSemestre() + "'),"
                        + "numeroIdentificacion:ko.observable(" + estudianteProyecto.getNumeroIdentificacion() + "),"
                        + "porcentajePropiedadIntelectual:ko.observable(" + estudianteProyecto.getPorcentajePropiedadIntelectual() + "),"
                        + "consecutivo:ko.observable(" + i + ")"
                        + "}";
                if (i < estudiantesProyecto.size() - 1) {
                    jscriptArray = jscriptArray + ",";
                }
            }

            jscriptArray = jscriptArray + "]";
        }

        return jscriptArray;
    }

    public static String obtenerProfesoresProyectoJSON(ArrayList<ProfesorProyecto> profesoresProyecto) {
        String jscriptArray = "";

        if (profesoresProyecto.size() > 0) {
            jscriptArray = "[";

            for (int i = 0; i < profesoresProyecto.size(); i++) {
                ProfesorProyecto profesorProyecto = profesoresProyecto.get(i);
                jscriptArray = jscriptArray
                        + "{apellidos: ko.observable('" + profesorProyecto.getApellidos() + "'),"
                        + "nombres:ko.observable('" + profesorProyecto.getNombres() + "'),"
                        + "cartaCesionDerechosPatrimonio:ko.observable('" + profesorProyecto.isCartaCesionDerechosPatrimonio() + "'),"
                        + "idTipoVinculacion:ko.observable(" + profesorProyecto.getIdTipoVinculacion() + "),"
                        + "nombreTipoVinculacion:ko.observable('" + profesorProyecto.getNombreTipoVinculacion() + "'),"
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
                if (i < profesoresProyecto.size() - 1) {
                    jscriptArray = jscriptArray + ",";
                }
            }

            jscriptArray = jscriptArray + "]";
        }

        return jscriptArray;
    }

    public static String obtenerObjetivosEspecificosJSON(ArrayList<ObjetivoEspecifico> objetivosEspecificos) {
        String jscriptArray = "";

        if (objetivosEspecificos.size() > 0) {
            jscriptArray = "[";

            for (int i = 0; i < objetivosEspecificos.size(); i++) {
                ObjetivoEspecifico objetivoEspecifico = objetivosEspecificos.get(i);
                jscriptArray = jscriptArray
                        + "{idObjetivoEspecifico: ko.observable(" + objetivoEspecifico.getIdObjetivoEspecifico() + "),"
                        + "descripcion:ko.observable('" + objetivoEspecifico.getDescripcion() + "'),"
                        + "consecutivo:ko.observable(" + i + ")"
                        + "}";
                if (i < objetivosEspecificos.size() - 1) {
                    jscriptArray = jscriptArray + ",";
                }
            }

            jscriptArray = jscriptArray + "]";
        }

        return jscriptArray;
    }

    public static String obtenerEntidadesInternacionalesProyectoJSON(ArrayList<EntidadInternacionalProyecto> entidadesInternacionalesProyecto) {
        String jscriptArray = "";

        if (entidadesInternacionalesProyecto.size() > 0) {
            jscriptArray = "[";

            for (int i = 0; i < entidadesInternacionalesProyecto.size(); i++) {
                EntidadInternacionalProyecto entidadInternacional = entidadesInternacionalesProyecto.get(i);
                jscriptArray = jscriptArray
                        + "{idEntidadInternacionalProyecto: ko.observable(" + entidadInternacional.getIdEntidadInternacionalProyecto() + "),"
                        + "nombre:ko.observable('" + entidadInternacional.getNombre() + "'),"
                        + "consecutivo:ko.observable(" + i + ")"
                        + "}";
                if (i < entidadesInternacionalesProyecto.size() - 1) {
                    jscriptArray = jscriptArray + ",";
                }
            }

            jscriptArray = jscriptArray + "]";
        }

        return jscriptArray;
    }

    public static String obtenerFuentesFinanciacionProyectoJSON(ArrayList<FuenteFinanciacionProyecto> fuentesFinanciacionProyecto) {
        String jscriptArray = "";

        if (fuentesFinanciacionProyecto.size() > 0) {
            jscriptArray = "[";

            for (int i = 0; i < fuentesFinanciacionProyecto.size(); i++) {
                FuenteFinanciacionProyecto fuenteFinanciacionProyecto = fuentesFinanciacionProyecto.get(i);
                jscriptArray = jscriptArray
                        + "{idEntidadInternacional: ko.observable(" + fuenteFinanciacionProyecto.getIdFuenteFinanciacionProyecto() + "),"
                        + "idFuenteFinanciacion:ko.observable(" + fuenteFinanciacionProyecto.getIdFuenteFinanciacion() + "),"
                        + "nombreFuenteFinanciacion:ko.observable('" + fuenteFinanciacionProyecto.getNombreFuenteFinanciacion() + "'),"
                        + "idTipoFuenteFinanciacionProyecto:ko.observable(" + fuenteFinanciacionProyecto.getIdTipoFuenteFinanciacionProyecto() + "),"
                        + "nombreTipoFuenteFinanciacionProyecto:ko.observable('" + fuenteFinanciacionProyecto.getNombreTipoFuenteFinanciacionProyecto() + "'),"
                        + "montoFrescos:ko.observable(" + fuenteFinanciacionProyecto.getMontoFrescos() + "),"
                        + "montoEspecies:ko.observable(" + fuenteFinanciacionProyecto.getMontoEspecies() + "),"
                        + "montoFrescosFormateado:ko.observable('" + decimalFormat.format(fuenteFinanciacionProyecto.getMontoFrescos()) + "'),"
                        + "montoEspeciesFormateado:ko.observable('" + decimalFormat.format(fuenteFinanciacionProyecto.getMontoEspecies()) + "'),"
                        + "consecutivo:ko.observable(" + i + ")"
                        + "}";
                if (i < fuentesFinanciacionProyecto.size() - 1) {
                    jscriptArray = jscriptArray + ",";
                }
            }

            jscriptArray = jscriptArray + "]";
        }

        return jscriptArray;
    }

    public static String obtenerCumplimientoCompromisosProyectoJSON(ArrayList<CumplimientoCompromisoProyecto> cumplimientoCompromisosProyecto) {
        String jscriptArray = "";

        if (cumplimientoCompromisosProyecto.size() > 0) {
            jscriptArray = "[";

            for (int i = 0; i < cumplimientoCompromisosProyecto.size(); i++) {
                CumplimientoCompromisoProyecto cumplimientoCompromisoProyecto = cumplimientoCompromisosProyecto.get(i);
                jscriptArray = jscriptArray
                        + "{idCumplimientoCompromisoProyecto: ko.observable(" + cumplimientoCompromisoProyecto.getIdCumplimientoCompromisoProyecto() + "),"
                        + "idCompromisoProyecto:ko.observable(" + cumplimientoCompromisoProyecto.getIdCompromisoProyecto() + "),"
                        + "descripcionCompromisoProyecto:ko.observable('" + cumplimientoCompromisoProyecto.getDescripcionCompromisoProyecto() + "'),"
                        + "numeroActa:ko.observable('" + cumplimientoCompromisoProyecto.getNumeroActa() + "'),"
                        + "fechaActaFormateada:ko.observable('" + simpleDateFormat.format(cumplimientoCompromisoProyecto.getFechaActa()) + "'),"
                        + "consecutivo:ko.observable(" + i + ")"
                        + "}";
                if (i < cumplimientoCompromisosProyecto.size() - 1) {
                    jscriptArray = jscriptArray + ",";
                }
            }

            jscriptArray = jscriptArray + "]";
        }

        return jscriptArray;
    }

    public static String obtenerAlertasAvalProyectoJSON(ArrayList<AlertaAvalProyecto> alertasAvalProyecto) {
        String jscriptArray = "";

        if (alertasAvalProyecto.size() > 0) {
            jscriptArray = "[";

            for (int i = 0; i < alertasAvalProyecto.size(); i++) {
                AlertaAvalProyecto alertaAvalProyecto = alertasAvalProyecto.get(i);
                jscriptArray = jscriptArray
                        + "{idAlertaAvalProyecto: ko.observable(" + alertaAvalProyecto.getIdAlertaAvalProyecto() + "),"
                        + "idTipoAval:ko.observable(" + alertaAvalProyecto.getIdTipoAval() + "),"
                        + "descripcion:ko.observable('" + alertaAvalProyecto.getDescripcion() + "'),"
                        + "nombreTipoAval:ko.observable('" + alertaAvalProyecto.getNombreTipoAval() + "'),"
                        + "numeroActa:ko.observable('" + alertaAvalProyecto.getNumeroActa() + "'),"
                        + "fechaActa:ko.observable('" + simpleDateFormat.format(alertaAvalProyecto.getFechaActa()) + "'),"
                        + "consecutivo:ko.observable(" + i + ")"
                        + "}";
                if (i < alertasAvalProyecto.size() - 1) {
                    jscriptArray = jscriptArray + ",";
                }
            }

            jscriptArray = jscriptArray + "]";
        }

        return jscriptArray;
    }

        public static String obtenerCumplimientosAlertasAvalProyectoJSON(ArrayList<CumplimientoAlertaAvalProyecto> cumplimientosAlertasAvalProyecto) {
        String jscriptArray = "";

        if (cumplimientosAlertasAvalProyecto.size() > 0) {
            jscriptArray = "[";

            for (int i = 0; i < cumplimientosAlertasAvalProyecto.size(); i++) {
                CumplimientoAlertaAvalProyecto cumplimientoAlertaAvalProyecto = cumplimientosAlertasAvalProyecto.get(i);
                jscriptArray = jscriptArray
                        + "{idCumplimientoAlertaAvalProyecto: ko.observable(" + cumplimientoAlertaAvalProyecto.getIdCumplimientoAlertaAvalProyecto() + "),"
                        + "idAlertaAvalProyecto:ko.observable(" + cumplimientoAlertaAvalProyecto.getIdAlertaAvalProyecto() + "),"
                        + "descripcionAlertaAvalProyecto:ko.observable('" + cumplimientoAlertaAvalProyecto.getDescripcionAlertaAvalProyecto()+ "'),"
                        + "numeroActa:ko.observable('" + cumplimientoAlertaAvalProyecto.getNumeroActa() + "'),"
                        + "fechaActaFormateada:ko.observable('" + simpleDateFormat.format(cumplimientoAlertaAvalProyecto.getFechaActa()) + "'),"
                        + "consecutivo:ko.observable(" + i + ")"
                        + "}";
                if (i < cumplimientosAlertasAvalProyecto.size() - 1) {
                    jscriptArray = jscriptArray + ",";
                }
            }

            jscriptArray = jscriptArray + "]";
        }

        return jscriptArray;
    }
    
    public static String obtenerFechaFormateada(Date fecha) {
        if (fecha != null) {
            return simpleDateFormat.format(fecha);
        }

        return "";
    }

    public static Date obtenerFecha(String fecha) throws ParseException {
        return simpleDateFormat.parse(fecha);
    }

    public static String obtenerNumeroFormatoMoneda(Long valor) {
        if (valor != null) {
            return decimalFormat.format(valor);
        }

        return "";
    }

    public static long obtenerNumero(String numero) throws ParseException {
        return (long) decimalFormat.parse(numero);
    }

}
