<%-- 
    Document   : editar
    Created on : 21-may-2017, 8:18:12
    Author     : William
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    

<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>GPCI: Gestión de Proyectos</title>
        <link rel="icon" href='<c:url value="/resources/imagenes/favicon.ico" />' type="image/x-icon" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/estilos.css" />'>
        <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/bootstrap-datepicker3.min.css" />'>
        <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/bootstrap-select.css" />'>
    </head>
    <body>
        <nav class="navbar barraPrincipal">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#inverseNavbar1" aria-expanded="false">
                        <span class="sr-only"></span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                    </button>
                    <a class="barraPrincipal-text" href="#">GPCI <small> FNSP</small></a>
                </div>
                <div class="collapse navbar-collapse" id="inverseNavbar1">

                    <ul class="nav navbar-nav navbar-right">

                    </ul>

                </div>
            </div>
        </nav>        
        <div class="container">
            <c:if test = "${not empty mensaje}">
                <div class="alert alert-danger">
                    ${mensaje}
                </div>
            </c:if>
            <div class="panel panel-success">
                <div class="panel-heading">Novedades Proyecto</div>
                <div class="panel-body">
                    <table class="tblform3">
                        <tr>
                            <th width="33%">C&oacute;digo:</th>
                            <th width="33%">Nombre corto:</th>
                            <th width="33%">Nombre completo proyecto:</th>
                        </tr>
                        <tr>
                            <td>${proyecto.getCodigo()}</td>
                            <td>${proyecto.getNombreCortoProyecto()}</td>
                            <td>${proyecto.getNombreCompletoProyecto()}</td>
                        </tr>
                        <tr>
                            <th>Fecha de inicio:</th>
                            <th>Fecha de finalizaci&oacute;n:</th>
                            <th>Area tem&aacute;tica:</th>
                        </tr>
                        <tr>
                            <td>
                                ${proyecto.getFechaInicio()}
                            </td>
                            <td>
                                ${proyecto.getFechaFinalizacion()}
                            <td>
                                ${proyecto.getAreaTematica()}
                            </td>
                        </tr>
                        <tr>
                            <th>Ingresado SIGEP:</th>
                            <th>Ingresado SIIU:</th>
                            <th>ingresado SIU:</th>
                        </tr>
                        <tr>
                            <td>
                                <c:if test="${proyecto.isIngresadoSIGEP() == true}">
                                    Sí
                                </c:if>
                                <c:if test="${proyecto.isIngresadoSIGEP() == false}">
                                    No
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${proyecto.isIngresadoSIIU() == true}">
                                    Sí
                                </c:if>
                                <c:if test="${proyecto.isIngresadoSIIU() == false}">
                                    No
                                </c:if>
                            <td>
                                <c:if test="${proyecto.isIngresadoSIU() == true}">
                                    Sí
                                </c:if>
                                <c:if test="${proyecto.isIngresadoSIU() == false}">
                                    No
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th>C&oacute;digo SIIU:</th>
                            <th>C&oacute;digo COLCIENCIAS:</th>
                            <th>C&oacute;digo SIU</th>
                        </tr>
                        <tr>
                            <td>${proyecto.getCodigoSIIU()}</td>
                            <td>${proyecto.getCodigoCOLCIENCIAS()}</td>
                            <td>${proyecto.getCodigoSIU()}</td>
                        </tr>
                        <tr>
                            <th>Participaci&oacute;n internacional:</th>
                            <th>Tipo de proyecto:</th>
                            <th>Grupo de investigaci&oacute;nn:</th>
                        </tr>
                        <tr>
                            <td>
                                <c:if test="${proyecto.isParticipacionInternacional() == true}">
                                    Sí
                                </c:if>
                                <c:if test="${proyecto.isParticipacionInternacional() == false}">
                                    No
                                </c:if>
                            </td>
                            <td>
                                ${proyecto.getTipoProyecto()}
                            </td>
                            <td>
                                ${proyecto.getGrupoInvestigacion()}
                            </td>
                        </tr>
                        <tr>
                            <th>Tipo de contrato:</th>
                            <th>Enfoque metodol&oacute;gico:</th>
                            <th>Convocatoria:</th>
                        </tr>
                        <tr>
                            <td>
                                ${proyecto.getTipoContrato()}
                            </td>
                            <td>
                                ${proyecto.getEnfoqueMetodologico()}
                            </td>
                            <td>
                                ${proyecto.getConvocatoria()}
                            </td>
                        </tr>
                        <tr>
                            <th>Objetivo general:</th>
                            <th>Estado:</th>
                            <th>Riesgo &eacute;tico:</th>
                        </tr>
                        <tr>
                            <td>
                                ${proyecto.getObjetivoGeneral()}
                            </td>
                            <td>
                                ${proyecto.getEstado()}
                            </td>
                            <td>
                                ${proyecto.getRiesgoEtico()}
                            </td>
                        </tr>                            
                    </table>
                    <div class="alert alert-info" style="margin-top:20px;">
                        <strong>Actas</strong>
                        <button class="btn btn-dark" onclick="mostrarVentanaNuevaActa(); return false;">
                            <i class="glyphicon glyphicon-plus"></i>
                        </button>                            
                    </div>
                    <div id="alert_placeholder_actas"></div>
                    <table class="table table-hover" style="width: 90%" align="center" >
                        <tr class="table-row">
                            <th style="width: 20%;text-align: center">Nombre</th>
                            <th style="width: 50%;text-align: center">Observaciones</th>
                            <th style="width: 15%;text-align: center">Fecha</th>
                            <th style="width: 5%;text-align: center">&nbsp;</th>
                            <th style="width: 5%">&nbsp;</th>
                            <th style="width: 5%">&nbsp;</th>
                        </tr>
                    </table>
                    <table class="table table-hover" style="width: 90%" align="center"  data-bind="foreach: { data: actas }">
                        <tr class="table-row">
                            <td style="width: 20%">
                                <span data-bind="text: nombre" ></span>
                                <input type="hidden" class="form-control" data-bind="value: nombre, attr: { 'name': 'actas[' + $index() + '].nombre'  }">
                            </td>
                            <td style="width: 50%">
                                <span data-bind="text: observaciones" ></span>
                                <input type="hidden" class="form-control" data-bind="value: observaciones, attr: { 'name': 'actas[' + $index() + '].observaciones'  }">
                            </td>
                            <td style="width: 15%">
                                <span data-bind="text: fecha" ></span>
                                <input type="hidden" class="form-control" data-bind="value: fechaFormateada, attr: { 'name': 'actas[' + $index() + '].fechaFormateada'  }">
                            </td>
                            <td style="width: 5%">
                                <button class="btn btn-dark" data-bind="click: $root.verDocumentoActa" title="Ver acta">
                                    <i class="glyphicon glyphicon-download-alt"></i>
                                </button>
                            </td>
                            <td style="width: 5%">
                                <button class="btn btn-dark" data-bind="click: $root.eliminarActa" title="Eliminar acta">
                                    <i class="glyphicon glyphicon-trash"></i>
                                </button>
                                <input type="hidden" data-bind="value: idActa, attr: { 'name': 'actas[' + $index() + '].idActa'  }" />
                            </td>
                            <td style="width: 5%">
                                <button class="btn btn-dark" data-bind="click: $root.editarActa" title="Editar acta">
                                    <i class="glyphicon glyphicon-edit"></i>
                                </button>
                            </td>
                        </tr>
                    </table>
                    <div class="modal fade" id="confirmacionEliminacionActa" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <div class="alert alert-info">
                                        <strong>Eliminar Acta</strong>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                </div>
                                <div class="modal-body">
                                    ¿Está seguro de eliminar el acta?
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                    <a class="btn btn-danger btn-ok" onclick="eliminarActa();">Eliminar</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade" id="actaModal" tabindex="-1" role="dialog" aria-labelledby="actaModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <form:form method="POST" action="${pageContext.request.contextPath}/novedades/actaProyecto" modelAttribute="actaProyecto" enctype="multipart/form-data">
                                    <div class="modal-header">
                                        <div class="alert alert-info">
                                            <strong>Acta</strong>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="modal-body">
                                        <div id="alert_placeholder_acta"></div>
                                        <table class="tblform3">
                                            <tr>
                                                <td>Nombre</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input id="nombreActa" name="nombreActa" class="form-control" />
                                                    <input type="hidden" id="idActa" name="idActa" value="0"/>
                                                    <input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                    <input type="hidden" id="idProyecto" name="idProyecto" value="${proyecto.getIdProyecto()}" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Documento</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input type="file" id="documentoActa" name="documentoActa" class="form-control" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Observaciones</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <textarea id="observacionesActa" name="observacionesActa" class="form-control" rows="5"></textarea>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                        <button type="submit" class="btn btn-primary">Aceptar</button>
                                    </div>   
                                </form:form>
                            </div>
                        </div>  
                    </div>                        
                </div>
            </div>  <!-- InstanceEndEditable -->
        </div>

        <script src='<c:url value="/resources/js/jquery-3.2.1.js" />'></script>
        <script src='<c:url value="/resources/js/jquery-ui.js" />'></script>
        <script src='<c:url value="/resources/js/jquery.form-validator.min.js" />'></script>
        <script src='<c:url value="/resources/js/bootstrap.js" />'></script>  
        <script src='<c:url value="/resources/js/bootstrap-datepicker.min.js" />'></script>  
        <script src='<c:url value="/resources/js/bootstrap-datepicker.es.min.js" />' charset="UTF-8"></script>
        <script src='<c:url value="/resources/js/bootstrap-select.js" />'></script>
        <script src='<c:url value="/resources/js/knockout-3.4.2.js" />'></script>
        <script>
            jQuery('.numbersOnly').keyup(function () {
                this.value = this.value.replace(/[^0-9\.]/g, '');
            });

            $.validate({
                validateOnBlur: false, // disable validation when input looses focus
                errorMessagePosition: 'top', // Instead of 'inline' which is default
                scrollToTopOnError: false // Set this property to true on longer forms
            });

            $('#actaProyecto').submit(function (evt) {
                evt.preventDefault();
                var formData = new FormData(this);
                if ($('#nombreActa').val() == "") {
                    bootstrap_alert_acta.warning('Debe ingresar el nombre');
                    return false;
                }
                if ($('#documentoActa').prop('files').length == 0) {
                    bootstrap_alert_acta.warning('Debe seleccionar el archivo');
                    return false;
                }
                if ($('#observacionesActa').val() == "") {
                    bootstrap_alert_acta.warning('Debe ingresar las observaciones');
                    return false;
                }
                $('#actaModal').modal('toggle');
                bootstrap_alert_acta.removeWarning();
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/novedades/actaProyecto",
                    data: formData,
                    processData: false,
                    contentType: false,
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                    },
                    success: function (response) {
                        bootstrap_alert_actas.warning("Acta almacenada exitosamente");
                        limpiarDatosVentanaActa();
                        proyectoModel.actas.removeAll();
                        if (response != "") {
                            var actas = JSON.parse(response);
                            for (var i = 0; i < actas.length; i++) {
                                proyectoModel.actas.push(
                                        {
                                            idActa: ko.observable(actas[i].idActa),
                                            nombre: ko.observable(actas[i].nombre),
                                            observaciones: ko.observable(actas[i].observaciones),
                                            fechaFormateada: ko.observable(actas[i].fecha),
                                        }
                                );
                            }
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        bootstrap_alert_actas.warning("Error al ingresar el acta: " + thrownError);
                    }});
            });

            function eliminarActa () {
                $.ajax({
                    type: 'GET',
                    url: "${pageContext.request.contextPath}/novedades/eliminarActa/" + actaEliminar.idActa(),
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                    },
                    success: function (response) {
                        bootstrap_alert_actas.warning("Acta eliminada exitosamente");
                        proyectoModel.actas.remove(actaEliminar);
                        $('#confirmacionEliminacionActa').modal('toggle');
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        bootstrap_alert_actas.warning("Error al eliminar el acta: " + thrownError);
                    }});
            }

            var ProyectoModel = function (actas) {
                self = this;
                self.actas = ko.observableArray(actas);
                self.verDocumentoActa = function (acta) {
                    window.location.href = "${pageContext.request.contextPath}/novedades/documentoActa/" + acta.idActa();
                };
                self.eliminarActa = function (acta) {
                    actaEliminar = acta;
                    $('#confirmacionEliminacionActa').modal('show');
                };
                self.editarActa = function (acta) {
                    $('#idActa').val(acta.idActa());
                    $('#observacionesActa').val(acta.observaciones());
                    $('#nombreActa').val(acta.nombre());
                    $('#actaModal').modal('show');
                };
            };

            var actas = new Array();
            var actaEliminar = null; 
            <c:if test = "${actasProyectoJSON != null}">
            actas = ${actasProyectoJSON};
            </c:if>

            var proyectoModel = new ProyectoModel(actas);
            ko.applyBindings(proyectoModel);

            bootstrap_alert_actas = function () { };
            bootstrap_alert_actas.warning = function (message) {
                $('#alert_placeholder_actas').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            bootstrap_alert_actas.removeWarning = function () {
                $('#alert_placeholder_actas').html('');
            };
            bootstrap_alert_acta = function () { };
            bootstrap_alert_acta.warning = function (message) {
                $('#alert_placeholder_acta').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            bootstrap_alert_acta.removeWarning = function () {
                $('#alert_placeholder_acta').html('');
            };
            function mostrarVentanaNuevaActa() {
                limpiarDatosVentanaActa();
                $('#actaModal').modal('show');
            }
            function limpiarDatosVentanaActa() {
                $('#idActa').val(0);
                $('#observacionesActa').val("");
                $('#nombreActa').val("");
                $('#documentoActa').val("");
            }
        </script>
    </body>
</html>
