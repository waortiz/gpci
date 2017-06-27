<%-- 
    Document   : crear
    Created on : 21-may-2017, 8:18:12
    Author     : William
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    

<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
    <head>
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
            <c:if test = "${not empty mensajeError}">
                <div class="alert alert-danger">
                    ${mensajeError}
                </div>
            </c:if>
            <c:if test = "${not empty mensajeExitoso}">
                <div class="alert alert-success">
                    ${mensajeExitoso}
                </div>
            </c:if>
            <div class="panel panel-success">
                <div class="panel-heading">Actualización Proyecto</div>
                <div class="panel-body">
                    <form:form method="POST" action="${pageContext.request.contextPath}/proyectos/editar" modelAttribute="proyecto">
                        <table class="tblform3">
                            <tr>
                                <td width="33%">C&oacute;digo:</td>
                                <td width="33%">Nombre corto:</td>
                                <td width="33%">Nombre completo proyecto:</td>
                            </tr>
                            <tr>
                                <td><form:input path="codigo" class="form-control" data-validation="required" data-validation-error-msg="Debe ingresar el código" maxlength="15" /></td>
                                <td><form:input path="nombreCortoProyecto" class="form-control" data-validation="required" data-validation-error-msg="Debe ingresar el nombre corto" maxlength="100" /></td>
                                <td><form:input path="nombreCompletoProyecto" class="form-control" data-validation="required" data-validation-error-msg="Debe ingresar el nombre completo" maxlength="100" /></td>
                            </tr>
                            <tr>
                                <td>Fecha de inicio:</td>
                                <td>Fecha de finalizaci&oacute;n:</td>
                                <td>Area tem&aacute;tica:</td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="input-group date">
                                        <form:input path="fechaInicio" class="form-control" data-validation="required" data-validation-error-msg="Debe ingresar la fecha de inicio" readonly="true" />
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                    </div>
                                </td>
                                <td>
                                    <div class="input-group date">
                                        <form:input path="fechaFinalizacion" class="form-control datepicker" data-date-format="dd/mm/yyyy" data-validation="required" data-validation-error-msg="Debe ingresar fecha de finalización" readonly="true"/>
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                    </div>
                                <td>
                                    <div class="selectContainer">
                                        <form:select path="areaTematica" data-validation="required" data-validation-error-msg="Debe seleccionar el área temática" cssClass="form-control">
                                            <form:option value=""></form:option>
                                            <form:options items="${areasTematicas}" itemLabel="nombre" itemValue="idAreaTematica"/>
                                        </form:select>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Ingresado SIGEP:</td>
                                <td>Ingresado SIIU:</td>
                                <td>ingresado SIU:</td>
                            </tr>
                            <tr>
                                <td><form:checkbox path="ingresadoSIGEP" /></td>
                                <td><form:checkbox path="ingresadoSIIU" /></td>
                                <td><form:checkbox path="ingresadoSIU" /></td>
                            </tr>
                            <tr>
                                <td>C&oacute;digo SIIU:</td>
                                <td>C&oacute;digo COLCIENCIAS:</td>
                                <td>C&oacute;digo SIU</td>
                            </tr>
                            <tr>
                                <td><form:input path="codigoSIIU" class="form-control" maxlength="50" /></td>
                                <td><form:input path="codigoCOLCIENCIAS" class="form-control" data-validation="required" maxlength="50" data-validation-error-msg="Debe ingresar el c&oacute;digo COLCIENCIAS" /></td>
                                <td><form:input path="codigoSIU" class="form-control" data-validation="required" maxlength="50" data-validation-error-msg="Debe ingresar el c&oacute;digo SIU" /></td>
                            </tr>
                            <tr>
                                <td>Participaci&oacute;n internacional:</td>
                                <td>Tipo de proyecto:</td>
                                <td>Grupo de investigaci&oacute;nn:</td>
                            </tr>
                            <tr>
                                <td><form:checkbox path="participacionInternacional" /></td>
                                <td>
                                    <div class="selectContainer">
                                        <form:select path="tipoProyecto" data-validation="required" data-validation-error-msg="Debe seleccionar el tipo de proyecto" cssClass="form-control">
                                            <form:option value=""></form:option>
                                            <form:options items="${tiposProyecto}" itemLabel="nombre" itemValue="idTipoProyecto"/>
                                        </form:select>
                                    </div>
                                </td>
                                <td>
                                    <div class="selectContainer">
                                        <form:select path="grupoInvestigacion" data-validation="required" data-validation-error-msg="Debe seleccionar el grupo de investigación" cssClass="form-control">
                                            <form:option value=""></form:option>
                                            <form:options items="${gruposInvestigacion}" itemLabel="nombre" itemValue="idGrupoInvestigacion"/>
                                        </form:select>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Tipo de contrato:</td>
                                <td>Enfoque metodol&oacute;gico:</td>
                                <td>Convocatoria:</td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="selectContainer">
                                        <form:select path="tipoContrato" data-validation="required" data-validation-error-msg="Debe seleccionar el tipo de contrato" cssClass="form-control">
                                            <form:option value=""></form:option>
                                            <form:options items="${tiposContrato}" itemLabel="nombre" itemValue="idTipoContrato" />
                                        </form:select>
                                    </div>    
                                </td>
                                <td>
                                    <div class="selectContainer">
                                        <form:select path="enfoqueMetodologico" data-validation="required" data-validation-error-msg="Debe seleccionar el enfoque metodológico" cssClass="form-control">
                                            <form:option value=""></form:option>
                                            <form:options items="${enfoquesMetodologicos}" itemLabel="nombre" itemValue="idEnfoqueMetodologico" />
                                        </form:select>  
                                    </div>
                                </td>
                                <td>
                                    <div class="selectContainer">
                                        <form:select path="convocatoria" data-validation="required" data-validation-error-msg="Debe seleccionar la convocatoria" cssClass="form-control">
                                            <form:option value=""></form:option>
                                            <form:options items="${convocatorias}" itemLabel="nombre" itemValue="idConvocatoria" />
                                        </form:select> 
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Objetivo general:</td>
                                <td>Estado:</td>
                                <td>Riesgo &eacute;tico:</td>
                            </tr>
                            <tr>
                                <td><form:input path="objetivoGeneral" class="form-control" maxlength="100" data-validation="required" data-validation-error-msg="Debe ingresar el objetivo general del proyecto" /></td>
                                <td>
                                    <div class="selectContainer">
                                        <form:select path="estado" data-validation="required" data-validation-error-msg="Debe seleccionar el estado" cssClass="form-control">
                                            <form:option value=""></form:option>
                                            <form:options items="${estadosProyecto}" itemLabel="nombre" itemValue="idEstadoProyecto" />
                                        </form:select>
                                    </div>
                                </td>
                                <td>
                                    <div class="selectContainer">
                                        <form:select path="riesgoEtico" data-validation="required" data-validation-error-msg="Debe seleccionar el riesgo ético" cssClass="form-control">
                                            <form:option value=""></form:option>
                                            <form:options items="${riesgosEticos}" itemLabel="nombre" itemValue="idRiesgoEtico"/>
                                        </form:select>
                                    </div>
                                </td>
                            </tr>                            
                        </table>
                        <div class="alert alert-info" style="margin-top:20px;">
                            <strong>Objetivos Específicos</strong>
                        </div>      
                        <div id="alert_placeholder_objetivosEspecificos"></div>
                        <table class="tblform3">
                            <tr>
                                <td>
                                    <textarea id="objetivoEspecifico" name="objetivoEspecifico" class="form-control objetivoEspecifico"></textarea>
                                </td>
                                <td>
                                    <div class="btn-group">
                                        <button class="btn btn-dark" data-bind="click: adicionarObjetivoEspecifico">
                                            <i class="glyphicon glyphicon-plus"></i>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <table class="table table-hover" style="width: 90%" data-bind="foreach: { data: objetivosEspecificos }" align="center">
                            <tr class="table-row">
                                <td style="width: 90%">
                                    <span data-bind="text: descripcion" ></span>
                                    <input type="hidden" class="form-control" data-bind="value: descripcion, attr: { 'name': 'objetivosEspecificos[' + $index() + '].descripcion'  }">
                                </td>
                                <td style="width: 10%">
                                    <button class="btn btn-dark" data-bind="click: $root.eliminarObjetivoEspecifico">
                                        <i class="glyphicon glyphicon-trash"></i>
                                    </button>
                                    <input type="hidden" data-bind="value: idObjetivoEspecifico, attr: { 'name': 'objetivosEspecificos[' + $index() + '].idObjetivoEspecifico'  }" />
                                </td>
                            </tr>
                        </table>
                        <table class='table table-hover' style='font-size:12px;'> 
                            <tr>
                                <td align="right">
                                    <a href='crear'  title='Registrar Proyecto' >
                                        <form:hidden path="idProyecto" />
                                        <input type="submit" value="Actualizar Proyecto" class="btn-sm btn-success" />
                                    </a> 
                                </td>
                            </tr>
                        </table>                                
                    </form:form>
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
            $.validate({
                validateOnBlur: false, // disable validation when input looses focus
                errorMessagePosition: 'top', // Instead of 'inline' which is default
                scrollToTopOnError: false // Set this property to true on longer forms
            });

            $('.input-group.date').datepicker({
                language: "es",
                autoclose: true,
                format: "dd/mm/yyyy",
                todayHighlight: true
            });

            $('.selectpicker').selectpicker({
                size: 4,
                noneSelectedText: ''
            });

            var ObjetivoEspecificoModel = function(objetivosEspecificos) {
                var self = this;
                self.objetivosEspecificos = ko.observableArray(objetivosEspecificos);

                self.adicionarObjetivoEspecifico = function() {
                    if ($('.objetivoEspecifico').val() == "") {
                        bootstrap_alert_objetivosEspecificos.warning('Debe ingresar el objetivo específico');
                        return false;
                    }
                    bootstrap_alert_objetivosEspecificos.removeWarning();            
                    self.objetivosEspecificos.push({
                        idObjetivoEspecifico: 0,
                        idProyecto: 0,
                        descripcion: $('.objetivoEspecifico').val() 
                    });
                    $('.objetivoEspecifico').val("");
                };

                self.eliminarObjetivoEspecifico = function(objetivoEspecifico) {
                    self.objetivosEspecificos.remove(objetivoEspecifico);
                };
            };

            var viewModel = new ObjetivoEspecificoModel();
            <c:if test = "${objetivosEspecificosJSON != null}">
            viewModel = new ObjetivoEspecificoModel(${objetivosEspecificosJSON});
            </c:if>
    
            ko.applyBindings(viewModel);

            bootstrap_alert_objetivosEspecificos = function () { }
            bootstrap_alert_objetivosEspecificos.warning = function (message) {
                $('#alert_placeholder_objetivosEspecificos').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            }
            bootstrap_alert_objetivosEspecificos.removeWarning = function () {
                $('#alert_placeholder_objetivosEspecificos').html('');
            }
        </script>
    </body>
</html>
