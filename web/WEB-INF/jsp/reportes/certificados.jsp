<%-- 
    Document   : proyectos
    Created on : 14-may-2017, 19:26:44
    Author     : William
--%>

<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    

<div class="container">
    <div class = "panel panel-success">
        <div class = "panel-heading ">CERTIFICADOS</div>   
        <div class = "panel-body">
            <div class="tab-content">
                <div class="tab-pane fade in active" id="tab1success">
                    <form id="certificado" name="certificado">
                        <div id="alert_placeholder"></div>
                        <table class="tablaForm"> 
                            <tr>
                                <td>Tipo persona</td>
                                <td>
                                    <select name="tipoPersona" id="tipoPersona" class="form-control">
                                        <option value=""></option>
                                        <c:forEach var="tipoPersona" items="${tiposPersona}">
                                            <option value="${tipoPersona.getIdTipoPersona()}">${tipoPersona.getNombre()}</option>
                                        </c:forEach>
                                    </select>    
                                </td>
                                <td>Tipo de identificación</td>
                                <td>
                                    <select name="tipoIdentificacion" id="tipoIdentificacion" class="form-control">
                                        <option value=""></option>
                                    <c:forEach var="tipoIdentificacion" items="${tiposIdentificacion}">
                                        <option value="${tipoIdentificacion.getIdTipoIdentificacion()}">${tipoIdentificacion.getNombre()}</option>
                                    </c:forEach>
                                    </select>    
                                </td>                                
                                <td>Número de identificación</td>                                
                                <td>
                                    <input id="numeroIdentificacion" name="numeroIdentificacion" class="form-control" maxlength="20"/>
                                </td>
                                <td align="right">
                                    <input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <button type="button" class="btn-sm btn-success" onclick="generarCertificado()">Generar</button>
                                </td>
                            </tr>
                        </table>                    
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">

    function generarCertificado() {
        bootstrap_alert.removeWarning();
        if ($('#tipoPersona').val() == "") {
            bootstrap_alert.warning('Debe seleccionar el tipo de persona');
            return false;
        }
        if ($('#tipoIdentificacion').val() == "") {
            bootstrap_alert.warning('Debe seleccionar el tipo de identificación');
            return false;
        }
        if ($('#numeroIdentificacion').val() == "") {
            bootstrap_alert.warning('Debe ingresar el número de identificación');
            return false;
        }

        if ($('#tipoPersona').val() == 1) {
            generarCertificadoProfesor();
        }
        if ($('#tipoPersona').val() == 2) {
            generarCertificadoEstudiante();
        }
        if ($('#tipoPersona').val() == 3) {
            generarCertificadoPersonalExterno();
        }

    }

    function generarCertificadoProfesor() {
        var tipoIdentificacion = $('#tipoIdentificacion').val();
        var numeroIdentificacion = $('#numeroIdentificacion').val();

        if (tipoIdentificacion != "" && numeroIdentificacion != "") {
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/proyectos/profesores",
                data: "idTipoIdentificacion=" + tipoIdentificacion + "&numeroIdentificacion=" + numeroIdentificacion,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    if (response != "") {
                        window.location.href = "${pageContext.request.contextPath}/reportes/generarCertificadoProfesor/" + tipoIdentificacion + "/" + numeroIdentificacion;
                    } else {
                        bootstrap_alert.warning('El profesor no existe');
                    }
                },
                error: function (e) {
                    bootstrap_alert.warning(e);
                }
            });
        }
    }

    function generarCertificadoEstudiante() {
        var tipoIdentificacion = $('#tipoIdentificacion').val();
        var numeroIdentificacion = $('#numeroIdentificacion').val();

        if (tipoIdentificacion != "" && numeroIdentificacion != "") {
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/proyectos/estudiantes",
                data: "idTipoIdentificacion=" + tipoIdentificacion + "&numeroIdentificacion=" + numeroIdentificacion,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    if (response != "") {
                        window.location.href = "${pageContext.request.contextPath}/reportes/generarCertificadoEstudiante/" + tipoIdentificacion + "/" + numeroIdentificacion;
                    } else {
                        bootstrap_alert.warning('El estudiante no existe');
                    }
                },
                error: function (e) {
                    bootstrap_alert.warning(e);
                }
            });
        }
    }

    function generarCertificadoPersonalExterno() {
        var tipoIdentificacion = $('#tipoIdentificacion').val();
        var numeroIdentificacion = $('#numeroIdentificacion').val();

        if (tipoIdentificacion != "" && numeroIdentificacion != "") {
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/proyectos/personalExterno",
                data: "idTipoIdentificacion=" + tipoIdentificacion + "&numeroIdentificacion=" + numeroIdentificacion,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                },
                success: function (response) {
                    if (response != "") {
                        window.location.href = "${pageContext.request.contextPath}/reportes/generarCertificadoPersonalExterno/" + tipoIdentificacion + "/" + numeroIdentificacion;
                    } else {
                        bootstrap_alert.warning('El personal externo no existe');
                    }
                },
                error: function (e) {
                    bootstrap_alert.warning(e);
                }
            });
        }
    }


    bootstrap_alert = function () { };
    bootstrap_alert.warning = function (message) {
        $('#alert_placeholder').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert.removeWarning = function () {
        $('#alert_placeholder').html('');
    };

</script>
