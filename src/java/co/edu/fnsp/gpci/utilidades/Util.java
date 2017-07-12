/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.utilidades;

import co.edu.fnsp.gpci.entidades.ActaProyecto;
import co.edu.fnsp.gpci.entidades.AdendaProyecto;
import co.edu.fnsp.gpci.entidades.AdicionProyecto;
import co.edu.fnsp.gpci.entidades.CompromisoProyecto;
import co.edu.fnsp.gpci.entidades.ObjetivoEspecifico;
import co.edu.fnsp.gpci.entidades.ProrrogaProyecto;
import co.edu.fnsp.gpci.entidadesVista.EstudianteProyecto;
import co.edu.fnsp.gpci.entidadesVista.PersonalExternoProyecto;
import co.edu.fnsp.gpci.entidadesVista.ProfesorProyecto;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author William
 */
public class Util {

    public static final SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");

    public static String obtenerActasProyectoJSON(ArrayList<ActaProyecto> actasProyecto) {
        String jscriptArray = "";

        if (actasProyecto.size() > 0) {
            jscriptArray = "[";

            for (int i = 0; i < actasProyecto.size(); i++) {
                ActaProyecto actaProyecto = actasProyecto.get(i);
                jscriptArray = jscriptArray
                        + "{idActa: ko.observable(" + actaProyecto.getIdActa() + "),"
                        + "observaciones:ko.observable('" + actaProyecto.getObservaciones() + "'),"
                        + "fechaFormateada:ko.observable('" + formatter.format(actaProyecto.getFecha()) + "'),"
                        + "nombre:ko.observable('" + actaProyecto.getNombre() + "')"
                        + "}";
                if (i < actasProyecto.size() - 1) {
                    jscriptArray = jscriptArray + ",";
                }
            }

            jscriptArray = jscriptArray + "]";
        }

        return jscriptArray;
    }

    public static String obtenerAdendasProyectoJSON(ArrayList<AdendaProyecto> adendasProyecto) {
        String jscriptArray = "";

        if (adendasProyecto.size() > 0) {
            jscriptArray = "[";

            for (int i = 0; i < adendasProyecto.size(); i++) {
                AdendaProyecto adendaProyecto = adendasProyecto.get(i);
                jscriptArray = jscriptArray
                        + "{idAdenda: ko.observable(" + adendaProyecto.getIdAdenda() + "),"
                        + "modificacion:ko.observable('" + adendaProyecto.getModificacion() + "'),"
                        + "fechaFormateada:ko.observable('" + formatter.format(adendaProyecto.getFecha()) + "')"
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
                        + "fechaFormateada:ko.observable('" + formatter.format(adicionProyecto.getFecha()) + "'),"
                        + "monto:ko.observable('" + adicionProyecto.getMonto() + "')"
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
                        + "fechaFormateada:ko.observable('" + formatter.format(prorrogaProyecto.getFecha()) + "'),"
                        + "mesesAprobados:ko.observable(" + prorrogaProyecto.getMesesAprobados() + "),"
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

    public static String obtenerCompromisosProyectoJSON(ArrayList<CompromisoProyecto> compromisosProyecto) {
        String jscriptArray = "";

        if (compromisosProyecto.size() > 0) {
            jscriptArray = "[";

            for (int i = 0; i < compromisosProyecto.size(); i++) {
                CompromisoProyecto compromisoProyecto = compromisosProyecto.get(i);
                jscriptArray = jscriptArray
                        + "{idCompromisoProyecto: ko.observable(" + compromisoProyecto.getIdCompromisoProyecto() + "),"
                        + "descripcion:ko.observable('" + compromisoProyecto.getDescripcion() + "'),"
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

    public static String obtenerFechaFormateada(Date fecha) {
        return formatter.format(fecha);
    }
}
