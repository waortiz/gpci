<%-- 
    Document   : crear
    Created on : 21-may-2017, 8:18:12
    Author     : William
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    

        <div class="container">
            <c:if test = "${not empty mensaje}">
                <div class="alert alert-danger">
                    ${mensaje}
                </div>
            </c:if>
            <div class="panel panel-success">
                <div class="panel-heading">Registro Proyecto</div>
                <div class="panel-body">
                    <div id="alert_placeholder_proyecto"></div>
                    <form:form method="POST" action="${pageContext.request.contextPath}/proyectos/crear" modelAttribute="proyecto">
                        <table class="tablaForm">
                            <tr>
                                <td>C&oacute;digo:</td>
                                <td colspan="2">Número del acta:</td>
                                <td>Fecha de elaboración acta:</td>
                            </tr>
                            <tr>
                                <td><form:input path="codigo" class="form-control" data-validation="required" data-validation-error-msg="Debe ingresar el código" maxlength="15" /></td>
                                <td colspan="2"><form:input path="numeroActa" class="form-control" data-validation="required" data-validation-error-msg="Debe ingresar el número del acta" maxlength="20" /></td>
                                <td>
                                    <div class="input-group date">
                                        <form:input path="fechaElaboracionActa" class="form-control datepicker" data-validation="required" data-validation-error-msg="Debe ingresar la fecha de elaboración del acta" readonly="true" />
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">Nombre del proyecto:</td>
                                <td>Nombre corto:</td>
                            </tr>
                            <tr>
                                <td colspan="3"><form:input path="nombreCompletoProyecto" class="form-control" data-validation="required" data-validation-error-msg="Debe ingresar el nombre completo" maxlength="300" /></td>
                                <td><form:input path="nombreCortoProyecto" class="form-control" data-validation="required" data-validation-error-msg="Debe ingresar el nombre corto" maxlength="100" /></td>
                            </tr>
                            <tr>
                                <td colspan="4">Nombre de la convocatoria</td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <div class="selectContainer">  
                                        <form:select path="convocatoria" data-validation="required" data-validation-error-msg="Debe seleccionar la convocatoria" cssClass="form-control">
                                            <form:option value=""></form:option>
                                            <form:options items="${convocatorias}" itemLabel="nombre" itemValue="idConvocatoria" />
                                        </form:select>
                                    </div>
                                </td>
                                <td>
                                    <button class="btn btn-dark" onclick="mostrarVentanaNuevaConvocatoria(); return false;">
                                        <i class="glyphicon glyphicon-plus"></i>
                                    </button>                                       
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">Número convocatoria:</td>
                                <td colspan="2">Año convocatoria:</td>
                            </tr>
                            <tr>
                                <td colspan="2"><form:input path="numeroConvocatoria" data-validation="required" data-validation-error-msg="Debe ingresar el número de la convocatoria" name="numeroConvocatoria" class="form-control" maxlength="20" /></td>
                                <td colspan="2"><form:input path="anyoConvocatoria" data-validation="required" data-validation-error-msg="Debe ingresar e año de la convocatoria" name="anyoConvocatoria" class="form-control integersOnly" maxlength="4" /></td>
                            </tr>
                            <tr>
                                <td colspan="4">Grupos de investigación/Cod COL</td>
                            </tr> 
                            <tr>
                                <td colspan="4">
                                    <table align="center">
                                        <tr>
                                            <td rowspan="2">
                                                <select name="gruposInvestigacionPorAsignar" id="gruposInvestigacionPorAsignar" class="form-control" multiple="true" style="width:500px; height: 80px">
                                                    <c:forEach var="grupoInvestigacion" items="${gruposInvestigacionPorAsignar}">
                                                        <option value="${grupoInvestigacion.getIdGrupoInvestigacion()}">${grupoInvestigacion.getNombre()}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                            <td>
                                                <a href="JavaScript:void(0);" id="asignarGrupoInvestigacion"><span class="glyphicon glyphicon-arrow-right"></span></a><br><br>
                                                <a href="JavaScript:void(0);" id="removerGrupoInvestigacion"><span class="glyphicon glyphicon-arrow-left"></span></a>
                                            </td>
                                            <td rowspan="2" style="vertical-align: top">
                                                <table class="table table-striped header-fixed" style="width: 500px" align="center" id="tablaGruposInvestigacion">
                                                    <thead>
                                                        <tr class="table-row">
                                                            <th style="width: 70%;text-align: center">Grupo investigación/Cod COL</th>
                                                            <th style="width: 20%;text-align: center">Principal</th>
                                                            <th style="width: 10%;text-align: center" align="center"><input type="checkbox" id="seleccionarTodosGruposInvestigacion" title="Seleccionar todos" /></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody data-bind="foreach: { data: gruposInvestigacion }">
                                                        <tr class="table-row">
                                                            <td style="width: 70%">
                                                                <span data-bind="text: nombre" ></span>
                                                                <input type="hidden" class="form-control" data-bind="value: nombre, attr: { 'name': 'gruposInvestigacion[' + $index() + '].nombre'  }">
                                                            </td>
                                                            <td style="width: 20%" align="center">
                                                                <input type="radio" data-bind="attr : {'name': 'principal'}, value: idGrupoInvestigacion, checked: $root.idGrupoInvestigacionPrincipal">
                                                                <input type="hidden" data-bind="value: idGrupoInvestigacion, attr: { 'name': 'gruposInvestigacion[' + $index() + '].idGrupoInvestigacion'  }" />
                                                            </td>
                                                            <td style="width: 10%" align="center">
                                                                <input type="checkbox" class="seleccionGrupoInvestigacion" data-bind="checked: seleccionado" />
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>                            
                         </table>
                         <table class="tablaForm">  
                            <tr>
                                <td>Tipo de proyecto:</td>
                                <td>Tipo de contrato:</td>
                                <td colspan="2">Area tem&aacute;tica:</td>
                            </tr>
                            <tr>
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
                                        <form:select path="tipoContrato" data-validation="required" data-validation-error-msg="Debe seleccionar el tipo de contrato" cssClass="form-control">
                                            <form:option value=""></form:option>
                                            <form:options items="${tiposContrato}" itemLabel="nombre" itemValue="idTipoContrato" />
                                        </form:select>
                                    </div>  
                                </td>
                                <td>
                                    <div class="selectContainer">
                                        <form:select path="areaTematica" data-validation="required" data-validation-error-msg="Debe seleccionar el área temática" cssClass="form-control">
                                            <form:option value=""></form:option>
                                            <form:options items="${areasTematicas}" itemLabel="nombre" itemValue="idAreaTematica"/>
                                        </form:select>
                                    </div>     
                                </td>
                                <td>
                                    <button class="btn btn-dark" onclick="mostrarVentanaNuevaAreaTematica(); return false;">
                                        <i class="glyphicon glyphicon-plus"></i>
                                    </button>                                       
                                </td>
                            </tr>
                         </table>
                         <table class="tablaForm">  
                            <tr>
                                <td>Fecha de inicio:</td>
                                <td>Fecha de finalizaci&oacute;n:</td>
                                <td>Tiempo (meses)</td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="input-group date">
                                        <form:input path="fechaInicio" class="form-control datepicker" data-validation="required" data-validation-error-msg="Debe ingresar la fecha de inicio" readonly="true" onchange="calcularMeses()" />
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                    </div>
                                </td>
                                <td>
                                    <div class="input-group date">
                                        <form:input path="fechaFinalizacion" class="form-control datepicker" data-date-format="dd/mm/yyyy" data-validation="required" data-validation-error-msg="Debe ingresar fecha de finalización" readonly="true" onchange="calcularMeses()"/>
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                    </div>
                                </td>
                                <td>
                                    <form:input path="tiempoProyecto" class="form-control" readonly="true"/>
                                </td>
                            </tr>
                         </table>
                         <table class="tablaForm">  
                            <tr>
                                <td>C&oacute;digo COLCIENCIAS:</td>
                                <td>Participaci&oacute;n internacional:</td>
                            </tr>
                            <tr>
                                <td><form:input path="codigoCOLCIENCIAS" class="form-control" maxlength="50" /></td>
                                <td><form:checkbox path="participacionInternacional" /></td>
                            </tr>
                         </table>                            
                         <table class="tablaForm">  
                            <tr>
                                <td>Enfoque metodol&oacute;gico:</td>
                                <td>Riesgo &eacute;tico:</td>
                                <td>Estado:</td>
                            </tr>
                            <tr>
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
                                        <form:select path="riesgoEtico" data-validation="required" data-validation-error-msg="Debe seleccionar el riesgo ético" cssClass="form-control">
                                            <form:option value=""></form:option>
                                            <form:options items="${riesgosEticos}" itemLabel="nombre" itemValue="idRiesgoEtico"/>
                                        </form:select>
                                    </div>
                                </td>
                                <td>
                                    <div class="selectContainer">  
                                        <form:select path="estado" cssClass="form-control" disabled="true">
                                            <form:option value=""></form:option>
                                            <form:options items="${estadosProyecto}" itemLabel="nombre" itemValue="idEstadoProyecto" />
                                        </form:select>  
                                    </div>
                                </td>
                            </tr>
                         </table>  
                         <table class="tablaForm">  
                            <tr>
                                <td>Ingresado SIGEP:</td>
                                <td>Ingresado SIIU:</td>
                                <td>Ingresado SIU:</td>
                            </tr>
                            <tr>
                                <td><form:checkbox path="ingresadoSIGEP" disabled="true" /></td>
                                <td><form:checkbox path="ingresadoSIIU" /></td>
                                <td><form:checkbox path="ingresadoSIU" /></td>
                            </tr>
                            <tr>
                                <td>Fecha ingresado SIGEP:</td>
                                <td>C&oacute;digo SIIU:</td>
                                <td>C&oacute;digo SIU</td>
                            </tr>
                            <tr>
                                <td>
                                    <form:input path="fechaIngresadoSIGEP" class="form-control" readonly="true"/>
                                </td>
                                <td><form:input path="codigoSIIU" maxlength="50" class="form-control" /></td>
                                <td><form:input path="codigoSIU"  maxlength="50" class="form-control" /></td>
                            </tr>
                         </table>                            
                         <table class="tablaForm">  
                            <tr>
                                <td colspan="3">Objetivo general:</td>
                            </tr>
                            <tr>
                                <td colspan="3"><form:input path="objetivoGeneral" class="form-control" maxlength="300" data-validation="required" data-validation-error-msg="Debe ingresar el objetivo general del proyecto" /></td>
                            </tr>                            
                        </table>
                        <br />
                        <ul class="nav nav-tabs">
                          <li class="active"><a data-toggle="tab" href="#objetivosEspecificos">Objetivos Específicos</a></li>
                          <li><a data-toggle="tab" href="#compromisos">Compromisos</a></li>
                          <li><a data-toggle="tab" href="#profesores">Profesores</a></li>
                          <li><a data-toggle="tab" href="#estudiantes">Estudiantes</a></li>
                          <li><a data-toggle="tab" href="#personalExterno">Personal Externo</a></li>
                          <li><a data-toggle="tab" href="#fuentesFinanciacion">Fuentes Financiación</a></li>
                          <li><a data-toggle="tab" href="#alertasAval">Alertas Aval</a></li>
                          <li id="elementoEntidadesInternacionales"><a data-toggle="tab" href="#entidadesInternacionalesProyecto">Entidades</a></li>
                        </ul>
                        <div class="tab-content">
                            <div id="objetivosEspecificos" class="tab-pane fade in active">
                                <div class="alert alert-info" style="margin-top:20px;">
                                    <strong>Objetivos Específicos</strong>
                                    <button class="btn btn-dark" onclick="mostrarVentanaNuevoObjetivoEspecifico(); return false;">
                                        <i class="glyphicon glyphicon-plus"></i>
                                    </button>                            
                                </div>  
                                <div class="modal fade" id="objetivosEspecificosModal" tabindex="-1" role="dialog" aria-labelledby="objetivoEspecificoModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <div class="alert alert-info">
                                                    <strong>Objetivo Específico</strong>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="modal-body">
                                                <div id="alert_placeholder_objetivosEspecificos"></div>
                                                <table class="tablaForm">
                                                    <tr>
                                                        <td>
                                                            <input id="objetivoEspecifico" name="objetivoEspecifico" class="form-control" maxlength="800" />
                                                            <input type="hidden" id="consecutivo" name="consecutivo" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                                <button type="button" class="btn btn-primary" data-bind="click: adicionarObjetivoEspecifico">Aceptar</button>
                                            </div>                                    
                                        </div>
                                    </div>  
                                </div>
                                <div class="modal fade" id="confirmacionEliminacionObjetivoEspecifico" tabindex="-1" role="dialog" aria-labelledby="objetivoEspecificoModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <div class="alert alert-info">
                                                    <strong>Eliminar Objetivo Específico</strong>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="modal-body">
                                                ¿Está seguro de eliminar el objetivo específico?
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                                <a class="btn btn-danger btn-ok" onclick="eliminarObjetivoEspecifico();">Eliminar</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>                                
                                <table class="table table-hover tablaForm" style="width: 90%" align="center" >
                                    <thead>
                                        <tr class="table-row">
                                            <th style="width: 90%;text-align: center">Objetivo</th>
                                            <th style="width: 5%">&nbsp;</th>
                                            <th style="width: 5%">&nbsp;</th>
                                        </tr>
                                    </thead>
                                    <tbody data-bind="foreach: { data: objetivosEspecificos }">
                                        <tr class="table-row">
                                            <td style="width: 90%">
                                                <span data-bind="text: descripcion" ></span>
                                                <input type="hidden" class="form-control" data-bind="value: descripcion, attr: { 'name': 'objetivosEspecificos[' + $index() + '].descripcion'  }">
                                            </td>
                                            <td style="width: 5%">
                                                <button class="btn btn-dark" data-bind="click: $root.eliminarObjetivoEspecifico">
                                                    <i class="glyphicon glyphicon-trash"></i>
                                                </button>
                                                <input type="hidden" data-bind="value: idObjetivoEspecifico, attr: { 'name': 'objetivosEspecificos[' + $index() + '].idObjetivoEspecifico'  }" />
                                                <input type="hidden" data-bind="value: consecutivo, attr: { 'name': 'objetivosEspecificos[' + $index() + '].consecutivo'  }" />
                                            </td>
                                            <td style="width: 5%">
                                                <button class="btn btn-dark" data-bind="click: $root.editarObjetivoEspecifico">
                                                    <i class="glyphicon glyphicon-edit"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div id="compromisos" class="tab-pane fade">
                                <div class="alert alert-info" style="margin-top:20px;">
                                    <strong>Compromisos</strong>
                                    <button class="btn btn-dark" onclick="mostrarVentanaNuevoCompromisoProyecto(); return false;">
                                        <i class="glyphicon glyphicon-plus"></i>
                                    </button>                            
                                </div>  
                                <div class="modal fade" id="compromisosProyectoModal" tabindex="-1" role="dialog" aria-labelledby="compromisoProyectoModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <div class="alert alert-info">
                                                    <strong>Compromiso</strong>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="modal-body">
                                                <div id="alert_placeholder_compromisos_proyecto"></div>
                                                <table class="tablaForm">
                                                    <tr>
                                                        <td>Tipo de compromiso</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <select name="tipoCompromiso" id="tipoCompromiso" class="form-control">
                                                                <option value=""></option>
                                                            <c:forEach var="tipoCompromiso" items="${tiposCompromiso}">
                                                                <option value="${tipoCompromiso.getIdTipoCompromiso()}">${tipoCompromiso.getNombre()}</option>
                                                            </c:forEach>
                                                            </select>                                                            </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Descripción</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input id="compromisoProyecto" name="compromisoProyecto" class="form-control" maxlength="800"></input>
                                                            <input type="hidden" id="consecutivo" name="consecutivo" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Soporte</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input id="soporteCompromisoProyecto" name="soporteCompromisoProyecto" class="form-control" maxlength="800"></input>
                                                            <input type="hidden" id="consecutivo" name="consecutivo" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                                <button type="button" class="btn btn-primary" data-bind="click: adicionarCompromisoProyecto">Aceptar</button>
                                            </div>                                    
                                        </div>
                                    </div>  
                                </div>
                                <div class="modal fade" id="confirmacionEliminacionCompromisoProyecto" tabindex="-1" role="dialog" aria-labelledby="compromisoProyectoModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <div class="alert alert-info">
                                                    <strong>Eliminar Compromiso</strong>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="modal-body">
                                                ¿Está seguro de eliminar el compromiso?
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                                <a class="btn btn-danger btn-ok" onclick="eliminarCompromisoProyecto();">Eliminar</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>                                   
                                <table class="table table-hover tablaForm" style="width: 90%" align="center" >
                                    <thead>
                                        <tr class="table-row">
                                            <th style="width: 50%;text-align: center">Tipo</th>
                                            <th style="width: 40%;text-align: center">Compromiso</th>
                                            <th style="width: 5%">&nbsp;</th>
                                            <th style="width: 5%">&nbsp;</th>
                                        </tr>
                                    </thead>
                                    <tbody  data-bind="foreach: { data: compromisosProyecto }">
                                        <tr class="table-row">
                                            <td style="width: 50%">
                                                <span data-bind="text: nombreTipoCompromiso" ></span>
                                                <input type="hidden" class="form-control" data-bind="value: nombreTipoCompromiso, attr: { 'name': 'compromisosProyecto[' + $index() + '].nombreTipoCompromiso'  }">
                                                <input type="hidden" class="form-control" data-bind="value: idTipoCompromiso, attr: { 'name': 'compromisosProyecto[' + $index() + '].idTipoCompromiso'  }">
                                            </td>
                                            <td style="width: 40%">
                                                <span data-bind="text: descripcion" ></span>
                                                <input type="hidden" class="form-control" data-bind="value: descripcion, attr: { 'name': 'compromisosProyecto[' + $index() + '].descripcion'  }">
                                                <input type="hidden" class="form-control" data-bind="value: soporte, attr: { 'name': 'compromisosProyecto[' + $index() + '].soporte'  }">
                                            </td>
                                            <td style="width: 5%">
                                                <button class="btn btn-dark" data-bind="click: $root.eliminarCompromisoProyecto">
                                                    <i class="glyphicon glyphicon-trash"></i>
                                                </button>
                                                <input type="hidden" data-bind="value: idCompromisoProyecto, attr: { 'name': 'compromisosProyecto[' + $index() + '].idCompromisoProyecto'  }" />
                                                <input type="hidden" data-bind="value: consecutivo, attr: { 'name': 'compromisosProyecto[' + $index() + '].consecutivo'  }" />
                                            </td>
                                            <td style="width: 5%">
                                                <button class="btn btn-dark" data-bind="click: $root.editarCompromisoProyecto">
                                                    <i class="glyphicon glyphicon-edit"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div id="profesores" class="tab-pane fade">
                                <div class="alert alert-info" style="margin-top:20px;">
                                    <strong>Profesores</strong>
                                    <button class="btn btn-dark" onclick="mostrarVentanaNuevoProfesorProyecto(); return false;">
                                        <i class="glyphicon glyphicon-plus"></i>
                                    </button>
                                </div>
                                <div class="modal fade" id="profesorProyectoModal" tabindex="-1" role="dialog" aria-labelledby="profesorProyectoModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <div class="alert alert-info">
                                                    <strong>Datos Profesor</strong>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="modal-body">
                                                <div id="alert_placeholder_profesores_proyecto"></div>
                                                <table class="tablaForm">
                                                    <tr>
                                                        <td width="45%">Tipo de identificación:</td>
                                                        <td width="45%">Número de identificación:</td>
                                                        <td width="10%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <select name="tipoIdentificacionProfesor" id="tipoIdentificacionProfesor" class="form-control">
                                                                <option value=""></option>
                                                            <c:forEach var="tipoIdentificacion" items="${tiposIdentificacion}">
                                                                <option value="${tipoIdentificacion.getIdTipoIdentificacion()}">${tipoIdentificacion.getNombre()}</option>
                                                            </c:forEach>
                                                            </select>    
                                                        </td>
                                                        <td>
                                                            <input type="text" class="form-control" id="numeroIdentificacionProfesor" name="numeroIdentificacionProfesor" maxlength="20"/>
                                                        </td>
                                                        <td>
                                                            <div class="btn-group">
                                                                <button class="btn btn-dark" onclick="buscarProfesor(); return false;">
                                                                    <i class="glyphicon glyphicon-search"></i>
                                                                </button>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                 </table>
                                                <table class="tablaForm">
                                                    <tr>
                                                        <td>Nombres:</td>
                                                        <td>Apellidos:</td>                                    
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input type="text" id="nombresProfesor" name="nombresProfesor" class="form-control" maxlength="250" />
                                                        </td>
                                                        <td>
                                                            <input type="text" id="apellidosProfesor" name="nombresProfesor" class="form-control" maxlength="250"/>
                                                        </td>                                    
                                                    </tr>
                                                    <tr>
                                                        <td>Correo electrónico:</td>
                                                        <td>Contacto:</td>                                    
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input type="email" id="correoElectronicoProfesor" name="correoElectronicoProfesor" class="form-control" maxlength="250"/>
                                                        </td>
                                                        <td>
                                                            <input type="text" id="contactoProfesor" name="contactoProfesor" class="form-control" maxlength="100"/>
                                                        </td>                                    
                                                    </tr>
                                                    <tr>
                                                        <td>Facultad</td>
                                                        <td>Rol</td> 
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <select name="facultadProfesor" id="facultadProfesor" class="form-control">
                                                                <option value=""></option>
                                                            <c:forEach var="facultad" items="${facultades}">
                                                                <option value="${facultad.getIdFacultad()}">${facultad.getNombre()}</option>
                                                            </c:forEach>
                                                            </select>                                                        
                                                        </td>
                                                        <td>
                                                            <select name="rolProfesor" id="rolProfesor" class="form-control">
                                                                <option value=""></option>
                                                            <c:forEach var="rol" items="${roles}">
                                                                <option value="${rol.getIdRol()}">${rol.getNombre()}</option>
                                                            </c:forEach>
                                                            </select>      
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Tipo vinculación U. de A.:</td>
                                                        <td>Carta de cesión de derechos patrimonio:</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <select name="tipoVinculacionProfesor" id="tipoVinculacionProfesor" class="form-control">
                                                                <option value=""></option>
                                                                <c:forEach var="tipoVinculacion" items="${tiposVinculacion}">
                                                                    <option value="${tipoVinculacion.getIdTipoVinculacion()}">${tipoVinculacion.getNombre()}</option>
                                                                </c:forEach>
                                                            </select>      
                                                        </td>
                                                        <td><input type="checkbox" id="cartaCesionDerechosPatrimonioProfesor" name="cartaCesionDerechosPatrimonioProfesor" cssClass="form-control" /></td>
                                                    </tr>
                                                </table>
                                                <br />
                                                <table class="tablaForm table">
                                                    <tr>
                                                        <td colspan="2" align="center">Plan de trabajo</td>
                                                        <td colspan="2" align="center">Fuera plan</td>
                                                        <td rowspan="2" align="center" style="vertical-align: middle">%PI</td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center">Horas</td>
                                                        <td align="center">Meses</td>
                                                        <td align="center">Horas</td>
                                                        <td align="center">Meses</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input type="text" id="horasSemanaProfesor" name="horasSemanaProfesor" class="form-control integersOnly" maxlength="3" />
                                                        </td>
                                                        <td>
                                                            <input type="text" id="mesesDedicadosProfesor" name="mesesDedicadosProfesor" class="form-control integersOnly" maxlength="5" />
                                                        </td>
                                                        <td>
                                                            <input type="text" id="horasSemanaFueraPlanProfesor" name="horasSemanaFueraPlanProfesor" class="form-control integersOnly" maxlength="3" />
                                                        </td>
                                                        <td>
                                                            <input type="text" id="mesesFueraPlanProfesor" name="mesesFueraPlanProfesor" class="form-control integersOnly" maxlength="5" />
                                                        </td>
                                                        <td>
                                                            <input type="text" id="porcentajePIProfesor" name="porcentajePIProfesor" class="form-control numbersOnly" maxlength="3" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                                <button type="button" class="btn btn-primary" data-bind="click: adicionarProfesorProyecto">Aceptar</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>   
                                <div class="modal fade" id="confirmacionEliminacionProfesorProyecto" tabindex="-1" role="dialog" aria-labelledby="compromisoProfesorModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <div class="alert alert-info">
                                                    <strong>Eliminar Profesor</strong>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="modal-body">
                                                ¿Está seguro de eliminar el profesor?
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                                <a class="btn btn-danger btn-ok" onclick="eliminarProfesorProyecto();">Eliminar</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>                                  
                                <table class="table table-hover tablaForm" style="width: 90%" align="center">
                                    <thead>
                                        <tr class="table-row">
                                            <th style="width: 20%;text-align: center">Tipo de identificación</th>
                                            <th style="width: 20%;text-align: center">Número de identificación</th>
                                            <th style="width: 18%;text-align: center">Nombres</th>
                                            <th style="width: 17%;text-align: center">Apellidos</th>
                                            <th style="width: 5%;text-align: center">Rol</th>
                                            <th style="width: 10%;text-align: center">Facultad</th>
                                            <th style="width: 5%">&nbsp;</th>
                                            <th style="width: 5%">&nbsp;</th>
                                        </tr>
                                    </thead>
                                    <tbody data-bind="foreach: { data: profesoresProyecto }">
                                        <tr class="table-row">
                                            <td style="width: 20%">
                                                <span data-bind="text: descripcionTipoIdentificacion" ></span>
                                                <input type="hidden" class="form-control" data-bind="value: descripcionTipoIdentificacion, attr: { 'name': 'profesoresProyecto[' + $index() + '].descripcionTipoIdentificacion'  }">
                                                <input type="hidden" class="form-control" data-bind="value: idTipoIdentificacion, attr: { 'name': 'profesoresProyecto[' + $index() + '].idTipoIdentificacion'  }">
                                            </td>
                                            <td style="width: 20%">
                                                <span data-bind="text: numeroIdentificacion" ></span>
                                                <input type="hidden" class="form-control" data-bind="value: numeroIdentificacion, attr: { 'name': 'profesoresProyecto[' + $index() + '].numeroIdentificacion'  }">
                                            </td>
                                            <td style="width: 18%">
                                                <span data-bind="text: nombres" ></span>
                                                <input type="hidden" class="form-control" data-bind="value: nombres, attr: { 'name': 'profesoresProyecto[' + $index() + '].nombres'  }">
                                            </td>
                                            <td style="width: 17%">
                                                <span data-bind="text: apellidos" ></span>
                                                <input type="hidden" class="form-control" data-bind="value: apellidos, attr: { 'name': 'profesoresProyecto[' + $index() + '].apellidos'  }">
                                            </td>
                                            <td style="width: 5%">
                                                <span data-bind="text: descripcionRol" ></span>
                                                <input type="hidden" class="form-control" data-bind="value: descripcionRol, attr: { 'name': 'profesoresProyecto[' + $index() + '].descripcionRol'  }">
                                                <input type="hidden" class="form-control" data-bind="value: idRol, attr: { 'name': 'profesoresProyecto[' + $index() + '].idRol'  }">
                                            </td>
                                            <td style="width: 10%">
                                                <span data-bind="text: descripcionFacultad" ></span>
                                                <input type="hidden" class="form-control" data-bind="value: correoElectronico, attr: { 'name': 'profesoresProyecto[' + $index() + '].correoElectronico'  }">
                                                <input type="hidden" class="form-control" data-bind="value: contacto, attr: { 'name': 'profesoresProyecto[' + $index() + '].contacto'  }">
                                                <input type="hidden" class="form-control" data-bind="value: descripcionFacultad, attr: { 'name': 'profesoresProyecto[' + $index() + '].descripcionFacultad'  }">
                                                <input type="hidden" class="form-control" data-bind="value: idFacultad, attr: { 'name': 'profesoresProyecto[' + $index() + '].idFacultad'  }">
                                                <input type="hidden" class="form-control" data-bind="value: idTipoVinculacion, attr: { 'name': 'profesoresProyecto[' + $index() + '].idTipoVinculacion'  }">
                                                <input type="hidden" class="form-control" data-bind="value: nombreTipoVinculacion, attr: { 'name': 'profesoresProyecto[' + $index() + '].nombreTipoVinculacion'  }">
                                                <input type="hidden" class="form-control" data-bind="value: cartaCesionDerechosPatrimonio, attr: { 'name': 'profesoresProyecto[' + $index() + '].cartaCesionDerechosPatrimonio'  }">
                                                <input type="hidden" class="form-control" data-bind="value: porcentajePI, attr: { 'name': 'profesoresProyecto[' + $index() + '].porcentajePI' }">
                                                <input type="hidden" class="form-control" data-bind="value: horasSemana, attr: { 'name': 'profesoresProyecto[' + $index() + '].horasSemana' }">
                                                <input type="hidden" class="form-control" data-bind="value: mesesDedicados, attr: { 'name': 'profesoresProyecto[' + $index() + '].mesesDedicados' }">
                                                <input type="hidden" class="form-control" data-bind="value: horasSemanaFueraPlan, attr: { 'name': 'profesoresProyecto[' + $index() + '].horasSemanaFueraPlan' }">
                                                <input type="hidden" class="form-control" data-bind="value: mesesFueraPlan, attr: { 'name': 'profesoresProyecto[' + $index() + '].mesesFueraPlan' }">
                                                <input type="hidden" data-bind="value: idProfesor, attr: { 'name': 'profesoresProyecto[' + $index() + '].idProfesor'  }" />
                                                <input type="hidden" data-bind="value: consecutivo, attr: { 'name': 'profesoresProyecto[' + $index() + '].consecutivo'  }" />
                                            </td>
                                            <td style="width: 5%" align="center">
                                                <button class="btn btn-dark" data-bind="click: $root.eliminarProfesorProyecto">
                                                    <i class="glyphicon glyphicon-trash"></i>
                                                </button>
                                            </td>
                                            <td style="width: 5%" align="center">
                                                <button class="btn btn-dark" data-bind="click: $root.editarProfesorProyecto">
                                                    <i class="glyphicon glyphicon-edit"></i>
                                                </button>
                                            </td>
                                        </tr>   
                                    </tbody>
                                </table>
                            </div>
                            <div id="estudiantes" class="tab-pane fade">
                                <div class="alert alert-info" style="margin-top:20px;">
                                    <strong>Estudiantes</strong>
                                    <button class="btn btn-dark" onclick="mostrarVentanaNuevoEstudianteProyecto(); return false;">
                                        <i class="glyphicon glyphicon-plus"></i>
                                    </button>
                                </div>
                                <div class="modal fade" id="estudianteProyectoModal" tabindex="-1" role="dialog" aria-labelledby="estudianteModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <div class="alert alert-info">
                                                    <strong>Datos Estudiante</strong>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="modal-body">
                                                <div id="alert_placeholder_estudiantes_proyecto"></div>
                                                <table class="tablaForm">
                                                    <tr>
                                                        <td width="45%">Tipo de identificación:</td>
                                                        <td width="45%">Número de identificación:</td>
                                                        <td width="10%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <select name="tipoIdentificacionEstudiante" id="tipoIdentificacionEstudiante" class="form-control">
                                                                <option value=""></option>
                                                            <c:forEach var="tipoIdentificacion" items="${tiposIdentificacion}">
                                                                <option value="${tipoIdentificacion.getIdTipoIdentificacion()}">${tipoIdentificacion.getNombre()}</option>
                                                            </c:forEach>
                                                            </select>    
                                                        </td>
                                                        <td>
                                                            <input type="text" class="form-control" id="numeroIdentificacionEstudiante" name="numeroIdentificacionEstudiante" maxlength="20"/>
                                                        </td>
                                                        <td>
                                                            <div class="btn-group">
                                                                <button class="btn btn-dark" onclick="buscarEstudiante(); return false;">
                                                                    <i class="glyphicon glyphicon-search"></i>
                                                                </button>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                 </table>
                                                <table class="tablaForm">
                                                    <tr>
                                                        <td>Nombres:</td>
                                                        <td>Apellidos:</td>                                    
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input type="text" id="nombresEstudiante" name="nombresEstudiante" class="form-control" maxlength="250"/>
                                                        </td>
                                                        <td>
                                                            <input type="text" id="apellidosEstudiante" name="nombresEstudiante" class="form-control" maxlength="250"/>
                                                        </td>                                    
                                                    </tr>
                                                    <tr>
                                                        <td>Correo electrónico:</td>
                                                        <td>Contacto:</td>                                    
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input type="email" id="correoElectronicoEstudiante" name="correoElectronicoEstudiante" class="form-control" maxlength="250"/>
                                                        </td>
                                                        <td>
                                                            <input type="text" id="contactoEstudiante" name="contactoEstudiante" class="form-control" maxlength="100"/>
                                                        </td>                                    
                                                    </tr>
                                                    <tr>
                                                        <td>Tipo de estudiante</td>
                                                        <td>Rol</td> 
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <select name="tipoEstudiante" id="tipoEstudiante" class="form-control">
                                                                <option value=""></option>
                                                            <c:forEach var="tipoEstudiante" items="${tiposEstudiante}">
                                                                <option value="${tipoEstudiante.getIdTipoEstudiante()}">${tipoEstudiante.getNombre()}</option>
                                                            </c:forEach>
                                                            </select>                                                        
                                                        </td>
                                                        <td>
                                                            <select name="rolEstudiante" id="rolEstudiante" class="form-control">
                                                                <option value=""></option>
                                                            <c:forEach var="rol" items="${roles}">
                                                                <option value="${rol.getIdRol()}">${rol.getNombre()}</option>
                                                            </c:forEach>
                                                            </select>      
                                                        </td>
                                                    </tr>
                                                 </table>
                                                 <table class="tablaForm">
                                                    <tr>
                                                        <td>% PI:</td>
                                                        <td>Horas semana:</td>
                                                        <td>Meses dedicados:</td>
                                                        <td>Semestre:</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input type="text" id="porcentajePropiedadIntelectualEstudiante" name="porcentajePIEstudiante" class="form-control numbersOnly" maxlength="3" />
                                                        </td>
                                                        <td>
                                                            <input type="text" id="horasSemanaEstudiante" name="horasSemanaEstudiante" class="form-control integersOnly" maxlength="3" />
                                                        </td>
                                                        <td>
                                                            <input type="text" id="mesesDedicadosEstudiante" name="mesesDedicadosEstudiante" class="form-control integersOnly" maxlength="5" />
                                                        </td>
                                                        <td>
                                                            <input type="text" id="semestreEstudiante" name="semestreEstudiante" class="form-control integersOnly" maxlength="2" />
                                                        </td>
                                                    </tr>                                
                                                    <tr>
                                                        <td colspan="4">Programa</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="4">
                                                            <select name="programaEstudiante" id="programaEstudiante" class="form-control">
                                                                <option value=""></option>
                                                            <c:forEach var="programa" items="${programas}">
                                                                <option value="${programa.getIdPrograma()}">${programa.getNombre()}</option>
                                                            </c:forEach>
                                                            </select>      
                                                        </td>
                                                    </tr>                            
                                                </table>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                                <button type="button" class="btn btn-primary" data-bind="click: adicionarEstudianteProyecto">Aceptar</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>  
                                <div class="modal fade" id="confirmacionEliminacionEstudianteProyecto" tabindex="-1" role="dialog" aria-labelledby="estudianteProyectoModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <div class="alert alert-info">
                                                    <strong>Eliminar Estudiante</strong>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="modal-body">
                                                ¿Está seguro de eliminar el estudiante?
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                                <a class="btn btn-danger btn-ok" onclick="eliminarEstudianteProyecto();">Eliminar</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>                                  
                                <table class="table table-hover tablaForm" style="width: 90%" align="center">
                                    <thead>
                                        <tr class="table-row">
                                            <th style="width: 20%;text-align: center">Tipo de identificación</th>
                                            <th style="width: 20%;text-align: center">Número de identificación</th>
                                            <th style="width: 18%;text-align: center">Nombres</th>
                                            <th style="width: 17%;text-align: center">Apellidos</th>
                                            <th style="width: 5%;text-align: center">Rol</th>
                                            <th style="width: 10%;text-align: center">Programa</th>
                                            <th style="width: 5%">&nbsp;</th>
                                            <th style="width: 5%">&nbsp;</th>
                                        </tr>
                                    </thead>
                                    <tbody data-bind="foreach: { data: estudiantesProyecto }">
                                        <tr class="table-row">
                                            <td style="width: 20%">
                                                <span data-bind="text: descripcionTipoIdentificacion" ></span>
                                                <input type="hidden" class="form-control" data-bind="value: descripcionTipoIdentificacion, attr: { 'name': 'estudiantesProyecto[' + $index() + '].descripcionTipoIdentificacion'  }">
                                                <input type="hidden" class="form-control" data-bind="value: idTipoIdentificacion, attr: { 'name': 'estudiantesProyecto[' + $index() + '].idTipoIdentificacion'  }">
                                            </td>
                                            <td style="width: 20%">
                                                <span data-bind="text: numeroIdentificacion" ></span>
                                                <input type="hidden" class="form-control" data-bind="value: numeroIdentificacion, attr: { 'name': 'estudiantesProyecto[' + $index() + '].numeroIdentificacion'  }">
                                            </td>
                                            <td style="width: 18%">
                                                <span data-bind="text: nombres" ></span>
                                                <input type="hidden" class="form-control" data-bind="value: nombres, attr: { 'name': 'estudiantesProyecto[' + $index() + '].nombres'  }">
                                            </td>
                                            <td style="width: 17%">
                                                <span data-bind="text: apellidos" ></span>
                                                <input type="hidden" class="form-control" data-bind="value: apellidos, attr: { 'name': 'estudiantesProyecto[' + $index() + '].apellidos'  }">
                                            </td>
                                            <td style="width: 5%">
                                                <span data-bind="text: descripcionRol" ></span>
                                                <input type="hidden" class="form-control" data-bind="value: descripcionRol, attr: { 'name': 'estudiantesProyecto[' + $index() + '].descripcionRol'  }">
                                                <input type="hidden" class="form-control" data-bind="value: idRol, attr: { 'name': 'estudiantesProyecto[' + $index() + '].idRol'  }">
                                            </td>
                                            <td style="width: 10%">
                                                <span data-bind="text: descripcionPrograma" ></span>
                                                <input type="hidden" class="form-control" data-bind="value: correoElectronico, attr: { 'name': 'estudiantesProyecto[' + $index() + '].correoElectronico'  }">
                                                <input type="hidden" class="form-control" data-bind="value: contacto, attr: { 'name': 'estudiantesProyecto[' + $index() + '].contacto'  }">
                                                <input type="hidden" class="form-control" data-bind="value: descripcionTipoEstudiante, attr: { 'name': 'estudiantesProyecto[' + $index() + '].descripcionTipoEstudiante'  }">
                                                <input type="hidden" class="form-control" data-bind="value: idTipoEstudiante, attr: { 'name': 'estudiantesProyecto[' + $index() + '].idTipoEstudiante'  }">
                                                <input type="hidden" class="form-control" data-bind="value: descripcionPrograma, attr: { 'name': 'estudiantesProyecto[' + $index() + '].descripcionPrograma'  }">
                                                <input type="hidden" class="form-control" data-bind="value: idPrograma, attr: { 'name': 'estudiantesProyecto[' + $index() + '].idPrograma'  }">
                                                <input type="hidden" class="form-control" data-bind="value: porcentajePropiedadIntelectual, attr: { 'name': 'estudiantesProyecto[' + $index() + '].porcentajePropiedadIntelectual' }">
                                                <input type="hidden" class="form-control" data-bind="value: horasSemana, attr: { 'name': 'estudiantesProyecto[' + $index() + '].horasSemana' }">
                                                <input type="hidden" class="form-control" data-bind="value: mesesDedicados, attr: { 'name': 'estudiantesProyecto[' + $index() + '].mesesDedicados' }">
                                                <input type="hidden" class="form-control" data-bind="value: semestre, attr: { 'name': 'estudiantesProyecto[' + $index() + '].semestre' }">
                                                <input type="hidden" data-bind="value: idEstudiante, attr: { 'name': 'estudiantesProyecto[' + $index() + '].idEstudiante'  }" />
                                                <input type="hidden" data-bind="value: consecutivo, attr: { 'name': 'estudiantesProyecto[' + $index() + '].consecutivo'  }" />
                                            </td>
                                            <td style="width: 5%" align="center">
                                                <button class="btn btn-dark" data-bind="click: $root.eliminarEstudianteProyecto">
                                                    <i class="glyphicon glyphicon-trash"></i>
                                                </button>
                                            </td>
                                            <td style="width: 5%" align="center">
                                                <button class="btn btn-dark" data-bind="click: $root.editarEstudianteProyecto">
                                                    <i class="glyphicon glyphicon-edit"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div id="personalExterno" class="tab-pane fade">
                                <div class="alert alert-info" style="margin-top:20px;">
                                    <strong>Personal Externo</strong>
                                    <button class="btn btn-dark" onclick="mostrarVentanaNuevoPersonalExternoProyecto(); return false;">
                                        <i class="glyphicon glyphicon-plus"></i>
                                    </button>
                                </div>
                                <div class="modal fade" id="personalExternoProyectoModal" tabindex="-1" role="dialog" aria-labelledby="personalExternoProyectoModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <div class="alert alert-info">
                                                    <strong>Datos Personal Externo</strong>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="modal-body">
                                                <div id="alert_placeholder_personalExterno_proyecto"></div>
                                                <table class="tablaForm">
                                                    <tr>
                                                        <td width="45%">Tipo de identificación:</td>
                                                        <td width="45%">Número de identificación:</td>
                                                        <td width="10%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <select name="tipoIdentificacionPersonalExterno" id="tipoIdentificacionPersonalExterno" class="form-control">
                                                                <option value=""></option>
                                                            <c:forEach var="tipoIdentificacion" items="${tiposIdentificacion}">
                                                                <option value="${tipoIdentificacion.getIdTipoIdentificacion()}">${tipoIdentificacion.getNombre()}</option>
                                                            </c:forEach>
                                                            </select>    
                                                        </td>
                                                        <td>
                                                            <input type="text" class="form-control" id="numeroIdentificacionPersonalExterno" name="numeroIdentificacionPersonalExterno" maxlength="20"/>
                                                        </td>
                                                        <td>
                                                            <div class="btn-group">
                                                                <button class="btn btn-dark" onclick="buscarPersonalExterno(); return false;">
                                                                    <i class="glyphicon glyphicon-search"></i>
                                                                </button>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                 </table>
                                                <table class="tablaForm">
                                                    <tr>
                                                        <td>Nombres:</td>
                                                        <td>Apellidos:</td>                                    
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input type="text" id="nombresPersonalExterno" name="nombresPersonalExterno" class="form-control" maxlength="250"/>
                                                        </td>
                                                        <td>
                                                            <input type="text" id="apellidosPersonalExterno" name="nombresPersonalExterno" class="form-control" maxlength="250"/>
                                                        </td>                                    
                                                    </tr>
                                                    <tr>
                                                        <td>Correo electrónico:</td>
                                                        <td>Rol</td> 
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input type="email" id="correoElectronicoPersonalExterno" name="correoElectronicoPersonalExterno" class="form-control" maxlength="250"/>
                                                        </td>
                                                        <td>
                                                            <select name="rolPersonalExterno" id="rolPersonalExterno" class="form-control">
                                                                <option value=""></option>
                                                            <c:forEach var="rol" items="${roles}">
                                                                <option value="${rol.getIdRol()}">${rol.getNombre()}</option>
                                                            </c:forEach>
                                                            </select>      
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">Entidad:</td>                                    
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <input type="text" id="entidadPersonalExterno" name="entidadPersonalExterno" class="form-control" maxlength="100"/>
                                                        </td>                                    
                                                    </tr>
                                                </table>
                                                <table class="tablaForm">
                                                    <tr>
                                                        <td>% PI:</td>
                                                        <td>Horas semana:</td>
                                                        <td>Meses dedicados:</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input type="text" id="porcentajePropiedadIntelectualPersonalExterno" name="porcentajePropiedadIntelectualPersonalExterno" class="form-control numbersOnly" maxlength="3" />
                                                        </td>
                                                        <td>
                                                            <input type="text" id="horasSemanaPersonalExterno" name="horasSemanaPersonalExterno" class="form-control integersOnly" maxlength="3" />
                                                        </td>
                                                        <td>
                                                            <input type="text" id="mesesDedicadosPersonalExterno" name="mesesDedicadosPersonalExterno" class="form-control integersOnly" maxlength="5" />
                                                        </td>
                                                    </tr>                                
                                                </table>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                                <button type="button" class="btn btn-primary" data-bind="click: adicionarPersonalExternoProyecto">Aceptar</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>   
                                <div class="modal fade" id="confirmacionEliminacionPersonalExternoProyecto" tabindex="-1" role="dialog" aria-labelledby="personalExternoProyectoModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <div class="alert alert-info">
                                                    <strong>Eliminar Personal Externo</strong>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="modal-body">
                                                ¿Está seguro de eliminar el personal externo?
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                                <a class="btn btn-danger btn-ok" onclick="eliminarPersonalExternoProyecto();">Eliminar</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>                                  
                                <table class="table table-hover tablaForm" style="width: 90%" align="center">
                                    <thead>
                                        <tr class="table-row">
                                            <th style="width: 20%;text-align: center">Tipo de identificación</th>
                                            <th style="width: 20%;text-align: center">Número de identificación</th>
                                            <th style="width: 18%;text-align: center">Nombres</th>
                                            <th style="width: 17%;text-align: center">Apellidos</th>
                                            <th style="width: 5%;text-align: center">Rol</th>
                                            <th style="width: 10%;text-align: center">Entidad</th>
                                            <th style="width: 5%">&nbsp;</th>
                                            <th style="width: 5%">&nbsp;</th>
                                        </tr>
                                    </thead>
                                    <tbody data-bind="foreach: { data: personalExternoProyecto }">
                                        <tr class="table-row">
                                            <td style="width: 20%">
                                                <span data-bind="text: descripcionTipoIdentificacion" ></span>
                                                <input type="hidden" class="form-control" data-bind="value: descripcionTipoIdentificacion, attr: { 'name': 'personalExternoProyecto[' + $index() + '].descripcionTipoIdentificacion'  }">
                                                <input type="hidden" class="form-control" data-bind="value: idTipoIdentificacion, attr: { 'name': 'personalExternoProyecto[' + $index() + '].idTipoIdentificacion'  }">
                                            </td>
                                            <td style="width: 20%">
                                                <span data-bind="text: numeroIdentificacion" ></span>
                                                <input type="hidden" class="form-control" data-bind="value: numeroIdentificacion, attr: { 'name': 'personalExternoProyecto[' + $index() + '].numeroIdentificacion'  }">
                                            </td>
                                            <td style="width: 18%">
                                                <span data-bind="text: nombres" ></span>
                                                <input type="hidden" class="form-control" data-bind="value: nombres, attr: { 'name': 'personalExternoProyecto[' + $index() + '].nombres'  }">
                                            </td>
                                            <td style="width: 17%">
                                                <span data-bind="text: apellidos" ></span>
                                                <input type="hidden" class="form-control" data-bind="value: apellidos, attr: { 'name': 'personalExternoProyecto[' + $index() + '].apellidos'  }">
                                            </td>
                                            <td style="width: 5%">
                                                <span data-bind="text: descripcionRol" ></span>
                                                <input type="hidden" class="form-control" data-bind="value: descripcionRol, attr: { 'name': 'personalExternoProyecto[' + $index() + '].descripcionRol'  }">
                                                <input type="hidden" class="form-control" data-bind="value: idRol, attr: { 'name': 'personalExternoProyecto[' + $index() + '].idRol'  }">
                                            </td>
                                            <td style="width: 10%">
                                                <span data-bind="text: entidad" ></span>
                                                <input type="hidden" class="form-control" data-bind="value: entidad, attr: { 'name': 'personalExternoProyecto[' + $index() + '].entidad'  }">
                                                <input type="hidden" class="form-control" data-bind="value: correoElectronico, attr: { 'name': 'personalExternoProyecto[' + $index() + '].correoElectronico'  }">
                                                <input type="hidden" class="form-control" data-bind="value: cartaCesionDerechosPatrimonio, attr: { 'name': 'personalExternoProyecto[' + $index() + '].cartaCesionDerechosPatrimonio'  }">
                                                <input type="hidden" class="form-control" data-bind="value: porcentajePropiedadIntelectual, attr: { 'name': 'personalExternoProyecto[' + $index() + '].porcentajePropiedadIntelectual' }">
                                                <input type="hidden" class="form-control" data-bind="value: horasSemana, attr: { 'name': 'personalExternoProyecto[' + $index() + '].horasSemana' }">
                                                <input type="hidden" class="form-control" data-bind="value: mesesDedicados, attr: { 'name': 'personalExternoProyecto[' + $index() + '].mesesDedicados' }">
                                                <input type="hidden" data-bind="value: idPersonalExterno, attr: { 'name': 'personalExternoProyecto[' + $index() + '].idPersonalExterno'  }" />
                                                <input type="hidden" data-bind="value: consecutivo, attr: { 'name': 'personalExternoProyecto[' + $index() + '].consecutivo'  }" />
                                            </td>
                                            <td style="width: 5%" align="center">
                                                <button class="btn btn-dark" data-bind="click: $root.eliminarPersonalExternoProyecto">
                                                    <i class="glyphicon glyphicon-trash"></i>
                                                </button>
                                            </td>
                                            <td style="width: 5%" align="center">
                                                <button class="btn btn-dark" data-bind="click: $root.editarPersonalExternoProyecto">
                                                    <i class="glyphicon glyphicon-edit"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div id="fuentesFinanciacion" class="tab-pane fade">
                                <div class="alert alert-info" style="margin-top:20px;">
                                    <strong>Fuentes de Financiación</strong>
                                    <button class="btn btn-dark" onclick="mostrarVentanaNuevaFuenteFinanciacionProyecto(); return false;">
                                        <i class="glyphicon glyphicon-plus"></i>
                                    </button>
                                </div>
                                <div class="modal fade" id="fuenteFinanciacionProyectoModal" tabindex="-1" role="dialog" aria-labelledby="fuenteFinanciacionProyectoModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <div class="alert alert-info">
                                                    <strong>Fuente Financiación</strong>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="modal-body">
                                                <div id="alert_placeholder_fuentesFinanciacion_proyecto"></div>
                                                <table class="tablaForm">
                                                    <tr>
                                                        <td colspan="2">Fuente:</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <select name="fuenteFinanciacion" id="fuenteFinanciacion" class="form-control">
                                                                <option value=""></option>
                                                            <c:forEach var="fuenteFinanciacion" items="${fuentesFinanciacion}">
                                                                <option value="${fuenteFinanciacion.getIdFuenteFinanciacion()}">${fuenteFinanciacion.getNombre()}</option>
                                                            </c:forEach>
                                                            </select>    
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">Tipo de fuente:</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <select name="tipoFuenteFinanciacionProyecto" id="tipoFuenteFinanciacionProyecto" class="form-control">
                                                                <option value=""></option>
                                                            <c:forEach var="tipoFuenteFinanciacion" items="${tiposFuenteFinanciacionProyecto}">
                                                                <option value="${tipoFuenteFinanciacion.getIdTipoFuenteFinanciacionProyecto()}">${tipoFuenteFinanciacion.getNombre()}</option>
                                                            </c:forEach>
                                                            </select>    
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Monto en recursos frescos:</td>
                                                        <td>Monto en especies:</td>                                    
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                           <input type="text" class="form-control currencyField" id="montoFrescos" name="montoFrescos" maxlength="20"/>
                                                        </td>
                                                        <td>
                                                           <input type="text" class="form-control currencyField" id="montoEspecies" name="montoEspecies" maxlength="20" />
                                                        </td>                                    
                                                    </tr>
                                                </table>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                                <button type="button" class="btn btn-primary" data-bind="click: adicionarFuenteFinanciacionProyecto">Aceptar</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>  
                                <div class="modal fade" id="confirmacionEliminacionFuenteFinanciacionProyecto" tabindex="-1" role="dialog" aria-labelledby="fuenteFinanciacionProyectoModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <div class="alert alert-info">
                                                    <strong>Eliminar Fuente Financiación</strong>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="modal-body">
                                                ¿Está seguro de eliminar la fuente de financiación?
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                                <a class="btn btn-danger btn-ok" onclick="eliminarFuenteFinanciacionProyecto();">Eliminar</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>                                  
                                <table class="table table-hover tablaForm" style="width: 90%" align="center">
                                    <thead>
                                        <tr class="table-row">
                                            <th style="width: 20%;text-align: center">Fuente financiación</th>
                                            <th style="width: 20%;text-align: center">Tipo de fuente</th>
                                            <th style="width: 20%;text-align: center">Monto en recursos frescos</th>
                                            <th style="width: 20%;text-align: center">Monto en especies</th>
                                            <th style="width: 10%">&nbsp;</th>
                                            <th style="width: 10%">&nbsp;</th>
                                        </tr>
                                    </thead>
                                    <tbody data-bind="foreach: { data: fuentesFinanciacionProyecto }">
                                        <tr class="table-row">
                                            <td style="width: 20%">
                                                <span data-bind="text: nombreFuenteFinanciacion" ></span>
                                                <input type="hidden" class="form-control" data-bind="value: nombreFuenteFinanciacion, attr: { 'name': 'fuentesFinanciacionProyecto[' + $index() + '].nombreFuenteFinanciacion'  }">
                                                <input type="hidden" class="form-control" data-bind="value: idFuenteFinanciacion, attr: { 'name': 'fuentesFinanciacionProyecto[' + $index() + '].idFuenteFinanciacion'  }">
                                            </td>
                                            <td style="width: 20%">
                                                <span data-bind="text: nombreTipoFuenteFinanciacionProyecto" ></span>
                                                <input type="hidden" class="form-control" data-bind="value: idTipoFuenteFinanciacionProyecto, attr: { 'name': 'fuentesFinanciacionProyecto[' + $index() + '].idTipoFuenteFinanciacionProyecto'  }">
                                                <input type="hidden" class="form-control" data-bind="value: nombreTipoFuenteFinanciacionProyecto, attr: { 'name': 'fuentesFinanciacionProyecto[' + $index() + '].nombreTipoFuenteFinanciacionProyecto'  }">
                                            </td>
                                            <td style="width: 20%">
                                                <span data-bind="text: montoFrescosFormateado" ></span>
                                                <input type="hidden" class="form-control" data-bind="value: montoFrescos, attr: { 'name': 'fuentesFinanciacionProyecto[' + $index() + '].montoFrescos'  }">
                                            </td>
                                            <td style="width: 20%">
                                                <span data-bind="text: montoEspeciesFormateado" ></span>
                                                <input type="hidden" class="form-control" data-bind="value: montoEspecies, attr: { 'name': 'fuentesFinanciacionProyecto[' + $index() + '].montoEspecies'  }">
                                                <input type="hidden" data-bind="value: consecutivo, attr: { 'name': 'fuentesFinanciacionProyecto[' + $index() + '].consecutivo'  }" />
                                            </td>
                                            <td style="width: 5%" align="center">
                                                <button class="btn btn-dark" data-bind="click: $root.eliminarFuenteFinanciacionProyecto">
                                                    <i class="glyphicon glyphicon-trash"></i>
                                                </button>
                                            </td>
                                            <td style="width: 5%" align="center">
                                                <button class="btn btn-dark" data-bind="click: $root.editarFuenteFinanciacionProyecto">
                                                    <i class="glyphicon glyphicon-edit"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div id="alertasAval" class="tab-pane fade">
                                <div class="alert alert-info" style="margin-top:20px;">
                                    <strong>Alertas Aval Condicionado</strong>
                                    <button class="btn btn-dark" onclick="mostrarVentanaNuevaAlertaAvalProyecto(); return false;">
                                        <i class="glyphicon glyphicon-plus"></i>
                                    </button>                            
                                </div>  
                                <div class="modal fade" id="alertasAvalProyectoModal" tabindex="-1" role="dialog" aria-labelledby="alertasAvalModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <div class="alert alert-info">
                                                    <strong>Alerta Aval Condicionado</strong>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="modal-body">
                                                <div id="alert_placeholder_alertas_aval_proyecto"></div>
                                                <table class="tablaForm">
                                                    <tr>
                                                        <td colspan="2">Tipo de aval</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <select name="tipoAvalProyecto" id="tipoAvalProyecto" class="form-control">
                                                                <option value=""></option>
                                                            <c:forEach var="tipoAval" items="${tiposAval}">
                                                                <option value="${tipoAval.getIdTipoAval()}">${tipoAval.getNombre()}</option>
                                                            </c:forEach>
                                                            </select>                                                            
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">Descripción</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <input id="descripcionAlertaAvalProyecto" name="descripcionAlertaAvalProyecto" class="form-control" maxlength="200" />
                                                            <input type="hidden" id="consecutivo" name="consecutivo" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Fecha acta</td>                                                        
                                                        <td>Número de acta</td>                                                                                                                
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="input-group date">
                                                                <input id="fechaActaAlertaAvalProyecto" name="fechaActaAlertaAvalProyecto" class="form-control datepicker" readonly="true" />
                                                                <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                                            </div>                                                        
                                                        </td>
                                                        <td>
                                                            <input id="numeroActaAlertaAvalProyecto" name="numeroActaAlertaAvalProyecto" class="form-control datepicker" maxlength="45" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                                <button type="button" class="btn btn-primary" data-bind="click: adicionarAlertaAvalProyecto">Aceptar</button>
                                            </div>                                    
                                        </div>
                                    </div>  
                                </div>
                                <div class="modal fade" id="confirmacionEliminacionAlertaAvalProyecto" tabindex="-1" role="dialog" aria-labelledby="alertaAvalProyectoModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <div class="alert alert-info">
                                                    <strong>Eliminar Alerta Aval de Cumplimiento</strong>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="modal-body">
                                                ¿Está seguro de eliminar la alerta de aval de cumplimiento?
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                                <a class="btn btn-danger btn-ok" onclick="eliminarAlertaAvalProyecto();">Eliminar</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>                                   
                                <table class="table table-hover tablaForm" style="width: 90%" align="center" >
                                    <thead>
                                        <tr class="table-row">
                                            <th style="width: 30%;text-align: center">Descripción</th>
                                            <th style="width: 20%;text-align: center">Tipo de aval</th>
                                            <th style="width: 20%;text-align: center">Fecha acta</th>
                                            <th style="width: 20%;text-align: center">Número de acta</th>
                                            <th style="width: 5%">&nbsp;</th>
                                            <th style="width: 5%">&nbsp;</th>
                                        </tr>
                                    </thead>
                                    <tbody  data-bind="foreach: { data: alertasAvalProyecto }">
                                        <tr class="table-row">
                                            <td style="width: 30%">
                                                <span data-bind="text: descripcion" ></span>
                                                <input type="hidden" class="form-control" data-bind="value: descripcion, attr: { 'name': 'alertasAvalProyecto[' + $index() + '].descripcion'  }">
                                            </td>
                                            <td style="width: 20%">
                                                <span data-bind="text: nombreTipoAval" ></span>
                                                <input type="hidden" class="form-control" data-bind="value: nombreTipoAval, attr: { 'name': 'alertasAvalProyecto[' + $index() + '].nombreTipoAval'  }">
                                                <input type="hidden" class="form-control" data-bind="value: idTipoAval, attr: { 'name': 'alertasAvalProyecto[' + $index() + '].idTipoAval'  }">
                                            </td>
                                            <td style="width: 20%">
                                                <span data-bind="text: fechaActa" ></span>
                                                <input type="hidden" class="form-control" data-bind="value: fechaActa, attr: { 'name': 'alertasAvalProyecto[' + $index() + '].fechaActa'  }">
                                            </td>
                                            <td style="width: 20%">
                                                <span data-bind="text: numeroActa" ></span>
                                                <input type="hidden" class="form-control" data-bind="value: numeroActa, attr: { 'name': 'alertasAvalProyecto[' + $index() + '].numeroActa'  }">
                                            </td>
                                            <td style="width: 5%">
                                                <button class="btn btn-dark" data-bind="click: $root.eliminarAlertaAvalProyecto">
                                                    <i class="glyphicon glyphicon-trash"></i>
                                                </button>
                                                <input type="hidden" data-bind="value: idAlertaAvalProyecto, attr: { 'name': 'alertasAvalProyecto[' + $index() + '].idAlertaAvalProyecto'  }" />
                                                <input type="hidden" data-bind="value: consecutivo, attr: { 'name': 'alertasAvalProyecto[' + $index() + '].consecutivo'  }" />
                                            </td>
                                            <td style="width: 5%">
                                                <button class="btn btn-dark" data-bind="click: $root.editarAlertaAvalProyecto">
                                                    <i class="glyphicon glyphicon-edit"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div id="entidadesInternacionalesProyecto" class="tab-pane fade">
                                <div class="alert alert-info" style="margin-top:20px;">
                                    <strong>Entidades Internacionales</strong>
                                    <button class="btn btn-dark" onclick="mostrarVentanaNuevaEntidadInternacionalProyecto(); return false;">
                                        <i class="glyphicon glyphicon-plus"></i>
                                    </button>                            
                                </div>  
                                <div class="modal fade" id="entidadesInternacionalesModal" tabindex="-1" role="dialog" aria-labelledby="entidadesInternacionalesLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <div class="alert alert-info">
                                                    <strong>Entidad Internacional</strong>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="modal-body">
                                                <div id="alert_placeholder_entidadInternacional_proyecto"></div>
                                                <table class="tablaForm">
                                                    <tr>
                                                        <td>
                                                            <input type="text" id="entidadInternacionalProyecto" name="entidadInternacionalProyecto" class="form-control" maxlength="200" />
                                                            <input type="hidden" id="consecutivo" name="consecutivo" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                                <button type="button" class="btn btn-primary" data-bind="click: adicionarEntidadInternacional">Aceptar</button>
                                            </div>                                    
                                        </div>
                                    </div>  
                                </div>
                                <div class="modal fade" id="confirmacionEliminacionEntidadInternacionalProyecto" tabindex="-1" role="dialog" aria-labelledby="EntidadInternacionalModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <div class="alert alert-info">
                                                    <strong>Eliminar Entidad Internacional</strong>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="modal-body">
                                                ¿Está seguro de eliminar la entidad internacional?
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                                <a class="btn btn-danger btn-ok" onclick="eliminarEntidadInternacionalProyecto();">Eliminar</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>                                
                                <table class="table table-hover tablaForm" style="width: 90%" align="center" >
                                    <thead>
                                        <tr class="table-row">
                                            <th style="width: 90%;text-align: center">Entidad Internacional</th>
                                            <th style="width: 5%">&nbsp;</th>
                                            <th style="width: 5%">&nbsp;</th>
                                        </tr>
                                    </thead>
                                    <tbody data-bind="foreach: { data: entidadesInternacionalesProyecto }">
                                        <tr class="table-row">
                                            <td style="width: 90%">
                                                <span data-bind="text: nombre" ></span>
                                                <input type="hidden" class="form-control" data-bind="value: nombre, attr: { 'name': 'entidadesInternacionalesProyecto[' + $index() + '].nombre'  }">
                                            </td>
                                            <td style="width: 5%">
                                                <button class="btn btn-dark" data-bind="click: $root.eliminarEntidadInternacionalProyecto">
                                                    <i class="glyphicon glyphicon-trash"></i>
                                                </button>
                                                <input type="hidden" data-bind="value: idEntidadInternacionalProyecto, attr: { 'name': 'entidadesInternacionalesProyecto[' + $index() + '].idEntidadInternacionalProyecto'  }" />
                                                <input type="hidden" data-bind="value: consecutivo, attr: { 'name': 'entidadesInternacionalesProyecto[' + $index() + '].consecutivo'  }" />
                                            </td>
                                            <td style="width: 5%">
                                                <button class="btn btn-dark" data-bind="click: $root.editarEntidadInternacionalProyecto">
                                                    <i class="glyphicon glyphicon-edit"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div> 
                        </div>
                        <table class='table table-hover' style='font-size:12px;'> 
                            <tr>
                                <td align="right">
                                    <a href='crear'  title='Registrar Proyecto' >
                                        <form:hidden path="idProyecto" />
                                        <c:if test = "${proyecto.getIdProyecto() == 0}">
                                            <input type="submit" value="Registrar proyecto" class="btn-sm btn-success" />
                                        </c:if>
                                        <c:if test = "${proyecto.getIdProyecto() > 0}">
                                            <input type="submit" value="Actualizar proyecto" class="btn-sm btn-success" />
                                        </c:if>
                                    </a> 
                                </td>
                            </tr>
                        </table>                                  
                        <input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <form:hidden path="idGrupoInvestigacionPrincipal" data-bind="value: idGrupoInvestigacionPrincipal" />
                    </form:form>
                    <div class="modal fade" id="confirmacionAlmacenamientoProyecto" tabindex="-1" role="dialog" aria-labelledby="confirmacionAlmacenamientoProyectoLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <div class="alert alert-info">
                                        <strong>
                                        <c:if test = "${proyecto.getIdProyecto() == 0}">
                                            Registro Proyecto
                                        </c:if>
                                        <c:if test = "${proyecto.getIdProyecto() > 0}">
                                            Actualización Proyecto
                                        </c:if>
                                        </strong>
                                    </div>
                                </div>
                                <div class="modal-body">
                                        <c:if test = "${proyecto.getIdProyecto() == 0}">
                                            El proyecto se ha registrado exitosamente
                                        </c:if>
                                        <c:if test = "${proyecto.getIdProyecto() > 0}">
                                            El proyecto se ha actualizado exitosamente
                                        </c:if>
                                </div>
                                <div class="modal-footer">
                                    <a class="btn btn-success btn-ok" onclick="mostrarVentanaListadoProyectos();">Aceptar</a>
                                </div>
                            </div>
                        </div>
                    </div>                           
                    <form id="convocatoriaForm">
                        <div class="modal fade" id="convocatoriaModal" tabindex="-1" role="dialog" aria-labelledby="convocatoriaModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <div class="alert alert-info">
                                            <strong>Convocatoria</strong>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="modal-body">
                                        <div id="alert_placeholder_convocatoria"></div>
                                        <table class="tablaForm">
                                            <tr>
                                                <td>
                                                    <input id="nombreConvocatoria" name="nombreConvocatoria" class="form-control" maxlength="250" />
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="modal-footer">
                                        <input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                        <button type="submit" class="btn btn-primary">Aceptar</button>
                                    </div>                                    
                                </div>
                            </div>  
                        </div>
                    </form>
                    <form id="areaTematicaForm">
                        <div class="modal fade" id="areaTematicaModal" tabindex="-1" role="dialog" aria-labelledby="areaTematicaModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <div class="alert alert-info">
                                            <strong>Área Temática</strong>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="modal-body">
                                        <div id="alert_placeholder_areaTematica"></div>
                                        <table class="tablaForm">
                                            <tr>
                                                <td>
                                                    <input id="nombreAreaTematica" name="nombreAreaTematica" class="form-control" maxlength="250" />
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="modal-footer">
                                        <input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                        <button type="submit" class="btn btn-primary">Aceptar</button>
                                    </div>                                    
                                </div>
                            </div>  
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script>
            var optsFC = { decimalSymbol: ',', digitGroupSymbol: '.', roundToDecimalPlace: 0 };
            $(document).ready(function () {
                $('#seleccionarTodosGruposInvestigacion').click(function() {
                    for(i = 0; i < proyectoModel.gruposInvestigacion().length; i++) {
                        proyectoModel.gruposInvestigacion()[i].seleccionado(this.checked);
                    }                    
                });
                $('.currencyField').css('text-align', 'right');
                $('.currencyField').blur(function() {
                    $(this).formatCurrency(optsFC);
		}).keyup(function(e) {
                  var e = window.event || e;
                  var keyUnicode = e.charCode || e.keyCode;
                  if (e !== undefined) {
                        switch (keyUnicode) {
                                case 16: break; // Shift
                                case 27: this.value = ''; break; // Esc: clear entry
                                case 35: break; // End
                                case 36: break; // Home
                                case 37: break; // cursor left
                                case 38: break; // cursor up
                                case 39: break; // cursor right
                                case 40: break; // cursor down
                                case 78: break; // N (Opera 9.63+ maps the "." from the number key section to the "N" key too!) (See: http://unixpapa.com/js/key.html search for ". Del")
                                case 110: break; // . number block (Opera 9.63+ maps the "." from the number block to the "N" key (78) !!!)
                                case 190: break; // .
                                default: $(this).formatCurrency(optsFC);
                        }
                  }
                });
                $('#participacionInternacional1').click(function () {
                    if ($(this).is(':checked')) {
                        $("#elementoEntidadesInternacionales").removeClass('hidden');
                        $("#entidadesInternacionalesProyecto").removeClass('hidden');
                    } else {
                        $("#elementoEntidadesInternacionales").addClass('hidden');
                        $("#entidadesInternacionalesProyecto").addClass('hidden');
                    }
                });
                
                <c:if test = "${proyecto.isParticipacionInternacional() == false}">
                $("#elementoEntidadesInternacionales").addClass('hidden');
                $("#entidadesInternacionalesProyecto").addClass('hidden');
                </c:if>
                    
                $('#asignarGrupoInvestigacion').click(function () {
                    $('#gruposInvestigacionPorAsignar option:selected').each(function () {
                        proyectoModel.gruposInvestigacion.push(
                                {
                                idGrupoInvestigacion: ko.observable($(this).val()),
                                nombre: ko.observable($(this).text()),
                                seleccionado: ko.observable(false),
                                principal: ko.observable(false)
                                });
                        $(this).remove();
                    });
                    var existePrincipal = false;
                    for(i = 0; i < proyectoModel.gruposInvestigacion().length; i++) {
                        if(proyectoModel.gruposInvestigacion()[i].principal()) {
                           existePrincipal = true;
                           break; 
                        }
                    }
                    if(!existePrincipal) {
                       proyectoModel.gruposInvestigacion()[0].principal(true); 
                       proyectoModel.idGrupoInvestigacionPrincipal(proyectoModel.gruposInvestigacion()[0].idGrupoInvestigacion());
                    }
                });
                $('#removerGrupoInvestigacion').click(function () {
                   var gruposInvestigacionRemover = [];
                   var contador = 0;
                   for(i = 0; i < proyectoModel.gruposInvestigacion().length; i++) {
                      if(proyectoModel.gruposInvestigacion()[i].seleccionado()) {
                        gruposInvestigacionRemover[contador] = proyectoModel.gruposInvestigacion()[i];
                        contador++;
                        $('#gruposInvestigacionPorAsignar').append("<option value='" + proyectoModel.gruposInvestigacion()[i].idGrupoInvestigacion() + "'>" + proyectoModel.gruposInvestigacion()[i].nombre() + "</option>");
                      }
                   }
                   for(i = 0; i < gruposInvestigacionRemover.length; i++) {
                        proyectoModel.gruposInvestigacion.remove(gruposInvestigacionRemover[i]);
                   }
                   if(proyectoModel.gruposInvestigacion().length > 0) {
                      var existePrincipal = false;
                      for(i = 0; i < proyectoModel.gruposInvestigacion().length; i++) {
                         if(proyectoModel.gruposInvestigacion()[i].principal()) {
                            existePrincipal = true;
                            break; 
                         }
                      }
                      if(!existePrincipal) {
                         proyectoModel.gruposInvestigacion()[0].principal(true); 
                         proyectoModel.idGrupoInvestigacionPrincipal(proyectoModel.gruposInvestigacion()[0].idGrupoInvestigacion());
                      }
                   } else {
                     proyectoModel.idGrupoInvestigacionPrincipal(0);
                   }    
                   $('#seleccionarTodosGruposInvestigacion').prop('checked' , false);
                   ordenarOpciones($('#gruposInvestigacionPorAsignar option'));
                });                    
            });
            
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
            
            $('.numbersOnly').keyup(function () {
                this.value = this.value.replace(/[^0-9\.]/g, '');
            });

            $('.integersOnly').keyup(function () {
                this.value = this.value.replace(/[^0-9]/g, '');
            });

            $('#proyecto').submit(function (evt) {
                if (proyectoModel.gruposInvestigacion().length === 0) {
                    bootstrap_alert_proyecto.warning('Debe asignar al menos un grupo de investigación');
                    return false;
                }
                                
                if ($('#ingresadoSIGEP1').is(':checked') && $('#fechaIngresadoSIGEP').val() === "") {
                    bootstrap_alert_proyecto.warning('Debe ingresar la fecha de ingresado SIGEP');
                    return false;
                } 

                if ($('#ingresadoSIIU1').is(':checked') && $('#codigoSIIU').val() === "") {
                    bootstrap_alert_proyecto.warning('Debe ingresar el código SIIU');
                    return false;
                } 

                if ($('#ingresadoSIU1').is(':checked') && $('#codigoSIU').val() === "") {
                    bootstrap_alert_proyecto.warning('Debe ingresar el código SIU');
                    return false;
                } 
                evt.preventDefault();
                var formData = new FormData(this);
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/proyectos/crear",
                    data: formData,
                    processData: false,
                    contentType: false,
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                    },
                    success: function (response) {
                       if(response === "") {
                          $('#confirmacionAlmacenamientoProyecto').modal({backdrop: 'static', keyboard: false}) ;
                       } else {
                          bootstrap_alert_proyecto.warning(response);
                       }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        bootstrap_alert_proyecto.warning("Error al almacenar el proyecto.");
                    }});
            });
            
           function mostrarVentanaListadoProyectos() {
              $('#confirmacionAlmacenamientoProyecto').modal('toggle');
              window.location.href = '${pageContext.request.contextPath}/proyectos/proyectos';
           }
            
           $('#convocatoriaForm').submit(function (evt) {
                evt.preventDefault();
                var formData = new FormData(this);
                if ($('#nombreConvocatoria').val() === "") {
                    bootstrap_alert_convocatoria.warning('Debe ingresar el nombre');
                    return false;
                }
                $('#convocatoriaModal').modal('toggle');
                bootstrap_alert_convocatoria.removeWarning();
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/maestros/convocatoria",
                    data: formData,
                    processData: false,
                    contentType: false,
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                    },
                    success: function (response) {
                            bootstrap_alert_proyecto.success("Convocatoria almacenada exitosamente");
                            $('#nombreConvocatoria').val("");
                            var convocatoria = JSON.parse(response);
                            $('#convocatoria').append("<option value='" + convocatoria.idConvocatoria + "'>" + convocatoria.nombre + "</option>");
                            ordenarOpciones($('#convocatoria option'));
                            $('#convocatoria').val(convocatoria.idConvocatoria);
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        bootstrap_alert_convocatoria.warning("Error al almacenar la convocatoria.");
                    }});
            });            

           $('#areaTematicaForm').submit(function (evt) {
                evt.preventDefault();
                var formData = new FormData(this);
                if ($('#nombreAreaTematica').val() === "") {
                    bootstrap_alert_areaTematica.warning('Debe ingresar el nombre');
                    return false;
                }
                $('#areaTematicaModal').modal('toggle');
                bootstrap_alert_areaTematica.removeWarning();
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/maestros/areaTematica",
                    data: formData,
                    processData: false,
                    contentType: false,
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                    },
                    success: function (response) {
                            bootstrap_alert_proyecto.success("Área temática almacenada exitosamente");
                            $('#nombreConvocatoria').val("");
                            var areaTematica = JSON.parse(response);
                            $('#areaTematica').append("<option value='" + areaTematica.idAreaTematica + "'>" + areaTematica.nombre + "</option>");
                            ordenarOpciones($('#areaTematica option'));
                            $('#areaTematica').val(areaTematica.idAreaTematica);
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        bootstrap_alert_areaTematica.warning("Error al almacenar el área temática.");
                    }});
            });            

            function ordenarOpciones(options) {
                var arr = options.map(function (_, o) {
                    return {
                        t: $(o).text(),
                        v: o.value
                    };
                }).get();
                arr.sort(function (o1, o2) {
                    return o1.t > o2.t ? 1 : o1.t < o2.t ? -1 : 0;
                });
                options.each(function (i, o) {
                    o.value = arr[i].v;
                    $(o).text(arr[i].t);
                });
            }
            
            function eliminarObjetivoEspecifico() {
               proyectoModel.objetivosEspecificos.remove(objetivoEspecificoEliminar);
               $('#confirmacionEliminacionObjetivoEspecifico').modal('toggle');
            }    

            function eliminarEntidadInternacionalProyecto() {
               proyectoModel.entidadesInternacionalesProyecto.remove(entidadInternacionalProyectoEliminar);
               $('#confirmacionEliminacionEntidadInternacionalProyecto').modal('toggle');
            }   

            function eliminarProfesorProyecto() {
               proyectoModel.profesoresProyecto.remove(profesorProyectoEliminar);
               $('#confirmacionEliminacionProfesorProyecto').modal('toggle');
            }    

            function eliminarEstudianteProyecto() {
               proyectoModel.estudiantesProyecto.remove(estudianteProyectoEliminar);
               $('#confirmacionEliminacionEstudianteProyecto').modal('toggle');
            }    

            function eliminarPersonalExternoProyecto() {
               proyectoModel.personalExternoProyecto.remove(personalExternoProyectoEliminar);
               $('#confirmacionEliminacionPersonalExternoProyecto').modal('toggle');
            }    

            function eliminarCompromisoProyecto() {
               proyectoModel.compromisosProyecto.remove(compromisoProyectoEliminar);
               $('#confirmacionEliminacionCompromisoProyecto').modal('toggle');
            }    

            function eliminarFuenteFinanciacionProyecto() {
               proyectoModel.fuentesFinanciacionProyecto.remove(fuenteFinanciacionProyectoEliminar);
               $('#confirmacionEliminacionFuenteFinanciacionProyecto').modal('toggle');
            } 

            function eliminarAlertaAvalProyecto() {
               proyectoModel.alertasAvalProyecto.remove(alertaAvalProyectoEliminar);
               $('#confirmacionEliminacionAlertaAvalProyecto').modal('toggle');
            }  

            var ProyectoModel = function (objetivosEspecificos, profesoresProyecto, estudiantesProyecto, personalExternoProyecto, compromisosProyecto, entidadesInternacionalesProyecto, fuentesFinanciacionProyecto, alertasAvalProyecto, gruposInvestigacion, idGrupoInvestigacionPrincipal) {
                self = this;

                self.gruposInvestigacion = ko.observableArray(gruposInvestigacion);
                self.idGrupoInvestigacionPrincipal = ko.observable(idGrupoInvestigacionPrincipal);
                self.objetivosEspecificos = ko.observableArray(objetivosEspecificos);
                self.adicionarObjetivoEspecifico = function () {
                    if ($('#objetivoEspecifico').val() === "") {
                        bootstrap_alert_objetivosEspecificos.warning('Debe ingresar el objetivo específico');
                        return false;
                    }
                    $('#objetivosEspecificosModal').modal('toggle');
                    bootstrap_alert_objetivosEspecificos.removeWarning();
                    if($('#consecutivo').val() === "") {
                        self.objetivosEspecificos.push({
                            idObjetivoEspecifico: ko.observable(0),
                            consecutivo: ko.observable(self.objetivosEspecificos().length + 1),
                            descripcion: ko.observable($('#objetivoEspecifico').val())
                        });
                    } else {
                        var consecutivo = parseInt($('#consecutivo').val(), 10);
                        var indice = 0;
                        for(i = 0; i < self.objetivosEspecificos().length; i++) {
                           if(self.objetivosEspecificos()[i].consecutivo() === consecutivo){
                              indice = i; 
                              break;
                           }
                        }
                        self.objetivosEspecificos()[indice].descripcion($('#objetivoEspecifico').val());
                    }
                    
                    limpiarDatosVentanaObjetivoEspecifico();
                };
                self.eliminarObjetivoEspecifico = function (objetivoEspecifico) {
                    objetivoEspecificoEliminar = objetivoEspecifico;
                    $('#confirmacionEliminacionObjetivoEspecifico').modal({backdrop: 'static', keyboard: false}) ;                    
                };
                self.editarObjetivoEspecifico = function (objetivoEspecifico) {
                    $('#objetivoEspecifico').val(objetivoEspecifico.descripcion());
                    $('#consecutivo').val(objetivoEspecifico.consecutivo());
                    $('#objetivosEspecificosModal').modal({backdrop: 'static', keyboard: false}) ; 
                };

                self.compromisosProyecto = ko.observableArray(compromisosProyecto);
                self.adicionarCompromisoProyecto = function () {
                    if ($('#compromisoProyecto').val() === "") {
                        bootstrap_alert_compromisos_proyecto.warning('Debe ingresar el compromiso');
                        return false;
                    }
                    if ($('#tipoCompromiso').val() === "") {
                        bootstrap_alert_compromisos_proyecto.warning('Debe seleccionar el tipo de compromiso');
                        return false;
                    }
                    $('#compromisosProyectoModal').modal('toggle');
                    bootstrap_alert_compromisos_proyecto.removeWarning();
                    if($('#consecutivo').val() === "") {
                        self.compromisosProyecto.push({
                            idCompromisoProyecto: ko.observable(0),
                            consecutivo: ko.observable(self.compromisosProyecto().length + 1),
                            descripcion: ko.observable($('#compromisoProyecto').val()),
                            soporte: ko.observable($('#soporteCompromisoProyecto').val()),
                            nombreTipoCompromiso: ko.observable($('#tipoCompromiso option:selected').text()),
                            idTipoCompromiso: ko.observable($('#tipoCompromiso').val())
                        });
                    } else {
                        var consecutivo = parseInt($('#consecutivo').val(), 10);
                        var indice = 0;
                        for(i = 0; i < self.compromisosProyecto().length; i++) {
                           if(self.compromisosProyecto()[i].consecutivo() === consecutivo){
                              indice = i; 
                              break;
                           }
                        }
                        self.compromisosProyecto()[indice].descripcion($('#compromisoProyecto').val());
                        self.compromisosProyecto()[indice].soporte($('#soporteCompromisoProyecto').val());
                    }
                    
                    limpiarDatosVentanaCompromisoProyecto();
                };
                self.eliminarCompromisoProyecto = function (compromisoProyecto) {
                    compromisoProyectoEliminar = compromisoProyecto;
                    $('#confirmacionEliminacionCompromisoProyecto').modal({backdrop: 'static', keyboard: false}) ;                    
                };
                self.editarCompromisoProyecto = function (compromisoProyecto) {
                    $('#compromisoProyecto').val(compromisoProyecto.descripcion());
                    $('#soporteCompromisoProyecto').val(compromisoProyecto.soporte());
                    $('#consecutivo').val(compromisoProyecto.consecutivo());
                    $('#tipoCompromiso').val(compromisoProyecto.idTipoCompromiso());
                    $('#compromisosProyectoModal').modal({backdrop: 'static', keyboard: false}) ; 
                };

                self.profesoresProyecto = ko.observableArray(profesoresProyecto);
                self.adicionarProfesorProyecto = function () {
                    if ($('#tipoIdentificacionProfesor').val() === "") {
                        bootstrap_alert_profesores_proyecto.warning('Debe seleccionar el tipo de identificación');
                        return false;
                    }
                    if ($('#numeroIdentificacionProfesor').val() === "") {
                        bootstrap_alert_profesores_proyecto.warning('Debe ingresar el número de identificación');
                        return false;
                    }
                    if ($('#nombresProfesor').val() === "") {
                        bootstrap_alert_profesores_proyecto.warning('Debe ingresar los nombres');
                        return false;
                    }
                    if ($('#apellidosProfesor').val() === "") {
                        bootstrap_alert_profesores_proyecto.warning('Debe ingresar los apellidos');
                        return false;
                    }                    
                    if ($('#correoElectronicoProfesor').val() === "") {
                        bootstrap_alert_profesores_proyecto.warning('Debe ingresar el correo electrónico');
                        return false;
                    }                    
                    if ($('#contactoProfesor').val() === "") {
                        bootstrap_alert_profesores_proyecto.warning('Debe ingresar el contacto');
                        return false;
                    }                    
                    if ($('#facultadProfesor').val() === "") {
                        bootstrap_alert_profesores_proyecto.warning('Debe seleccionar la facultad');
                        return false;
                    }
                    if ($('#rolProfesor').val() === "") {
                        bootstrap_alert_profesores_proyecto.warning('Debe seleccionar el rol');
                        return false;
                    }
                    if ($('#tipoVinculacion').val() === "") {
                        bootstrap_alert_profesores_proyecto.warning('Debe seleccionar el tipo vinculación a la U de A');
                        return false;
                    }
                    if ($('#porcentajePIProfesor').val() === "") {
                        bootstrap_alert_profesores_proyecto.warning('Debe ingresar el porcentaje de propiedad intelectual');
                        return false;
                    }
                    if ($('#horasSemanaProfesor').val() === "") {
                        bootstrap_alert_profesores_proyecto.warning('Debe ingresar las horas semanales');
                        return false;
                    }
                    if ($('#mesesDedicadosProfesor').val() === "") {
                        bootstrap_alert_profesores_proyecto.warning('Debe ingresar los meses dedicados');
                        return false;
                    }
                    
                    if($('#consecutivo').val() === "") {
                        
                        for(i = 0; i < self.profesoresProyecto().length; i++) {
                            if(self.profesoresProyecto()[i].idTipoIdentificacion() === $('#tipoIdentificacionProfesor').val() && 
                               self.profesoresProyecto()[i].numeroIdentificacion() === $('#numeroIdentificacionProfesor').val()) {
                               bootstrap_alert_profesores_proyecto.warning('El profesor ya hace parte del proyecto');
                               return false;                               
                            }
                        }
                        
                        self.profesoresProyecto.push({
                            idProfesor: ko.observable(0),
                            idTipoIdentificacion: ko.observable($('#tipoIdentificacionProfesor').val()),
                            descripcionTipoIdentificacion: ko.observable($('#tipoIdentificacionProfesor option:selected').text()),
                            numeroIdentificacion: ko.observable($('#numeroIdentificacionProfesor').val()),
                            nombres: ko.observable($('#nombresProfesor').val()),
                            apellidos: ko.observable($('#apellidosProfesor').val()),
                            correoElectronico : ko.observable($('#correoElectronicoProfesor').val()),
                            contacto : ko.observable($('#contactoProfesor').val()),
                            idFacultad: ko.observable($('#facultadProfesor').val()),
                            descripcionFacultad: ko.observable($('#facultadProfesor option:selected').text()),
                            idRol: ko.observable($('#rolProfesor').val()),
                            descripcionRol: ko.observable($('#rolProfesor option:selected').text()),
                            nombreTipoVinculacion: ko.observable($('#tipoVinculacionProfesor option:selected').text()),
                            idTipoVinculacion: ko.observable($('#tipoVinculacionProfesor').val()),
                            cartaCesionDerechosPatrimonio: ko.observable($('#cartaCesionDerechosPatrimonioProfesor').is(":checked")),
                            porcentajePI: ko.observable($('#porcentajePIProfesor').val()),
                            horasSemana: ko.observable($('#horasSemanaProfesor').val()),
                            mesesDedicados: ko.observable($('#mesesDedicadosProfesor').val()),
                            horasSemanaFueraPlan: ko.observable($('#horasSemanaFueraPlanProfesor').val()),
                            mesesFueraPlan: ko.observable($('#mesesFueraPlanProfesor').val()),
                            consecutivo: ko.observable(self.profesoresProyecto().length + 1)
                        });
                    } else {
                            var consecutivo = parseInt($('#consecutivo').val(), 10);
                            var indice = 0;
                            for(i = 0; i < self.profesoresProyecto().length; i++) {
                                if(self.profesoresProyecto()[i].consecutivo() === consecutivo){
                                   indice = i; 
                                   break;
                                }
                            }
                            self.profesoresProyecto()[indice].idTipoIdentificacion($('#tipoIdentificacionProfesor').val());
                            self.profesoresProyecto()[indice].descripcionTipoIdentificacion($('#tipoIdentificacionProfesor option:selected').text());
                            self.profesoresProyecto()[indice].numeroIdentificacion($('#numeroIdentificacionProfesor').val());
                            self.profesoresProyecto()[indice].nombres( $('#nombresProfesor').val());
                            self.profesoresProyecto()[indice].apellidos( $('#apellidosProfesor').val());
                            self.profesoresProyecto()[indice].correoElectronico( $('#correoElectronicoProfesor').val());
                            self.profesoresProyecto()[indice].contacto($('#contactoProfesor').val());
                            self.profesoresProyecto()[indice].idFacultad( $('#facultadProfesor').val());
                            self.profesoresProyecto()[indice].descripcionFacultad( $('#facultadProfesor option:selected').text());
                            self.profesoresProyecto()[indice].idRol( $('#rolProfesor').val());
                            self.profesoresProyecto()[indice].descripcionRol($('#rolProfesor option:selected').text());
                            self.profesoresProyecto()[indice].idTipoVinculacion( $('#tipoVinculacionProfesor').val());
                            self.profesoresProyecto()[indice].nombreTipoVinculacion($('#tipoVinculacionProfesor option:selected').text());
                            self.profesoresProyecto()[indice].cartaCesionDerechosPatrimonio( $('#cartaCesionDerechosPatrimonioProfesor').is(":checked"));
                            self.profesoresProyecto()[indice].porcentajePI( $('#porcentajePIProfesor').val());
                            self.profesoresProyecto()[indice].horasSemana( $('#horasSemanaProfesor').val());
                            self.profesoresProyecto()[indice].mesesDedicados( $('#mesesDedicadosProfesor').val());
                            self.profesoresProyecto()[indice].horasSemanaFueraPlan($('#horasSemanaFueraPlanProfesor').val());
                            self.profesoresProyecto()[indice].mesesFueraPlan( $('#mesesFueraPlanProfesor').val());
                    }

                   $('#profesorProyectoModal').modal('toggle');
                   bootstrap_alert_profesores_proyecto.removeWarning();
                   limpiarDatosVentanaProfesorProyecto();
                };
                self.eliminarProfesorProyecto = function (profesorProyecto) {
                    profesorProyectoEliminar = profesorProyecto;
                    $('#confirmacionEliminacionProfesorProyecto').modal({backdrop: 'static', keyboard: false}) ;                    
                };
                self.editarProfesorProyecto = function (profesorProyecto) {
                    $('#consecutivo').val(profesorProyecto.consecutivo());
                    $('#tipoIdentificacionProfesor').val(profesorProyecto.idTipoIdentificacion());
                    $('#numeroIdentificacionProfesor').val(profesorProyecto.numeroIdentificacion());
                    $('#nombresProfesor').val(profesorProyecto.nombres());
                    $('#apellidosProfesor').val(profesorProyecto.apellidos());
                    $('#correoElectronicoProfesor').val(profesorProyecto.correoElectronico());
                    $('#contactoProfesor').val(profesorProyecto.contacto());
                    $('#facultadProfesor').val(profesorProyecto.idFacultad());
                    $('#rolProfesor').val(profesorProyecto.idRol());
                    $('#tipoVinculacionProfesor').val(profesorProyecto.idTipoVinculacion());
                    $('#cartaCesionDerechosPatrimonioProfesor').prop('checked', profesorProyecto.cartaCesionDerechosPatrimonio());
                    $('#porcentajePIProfesor').val(profesorProyecto.porcentajePI());
                    $('#horasSemanaProfesor').val(profesorProyecto.horasSemana());
                    $('#mesesDedicadosProfesor').val(profesorProyecto.mesesDedicados());
                    $('#horasSemanaFueraPlanProfesor').val(profesorProyecto.horasSemanaFueraPlan());
                    $('#mesesFueraPlanProfesor').val(profesorProyecto.mesesFueraPlan());
                    
                    $('#profesorProyectoModal').modal({backdrop: 'static', keyboard: false}) ;
                };

                self.estudiantesProyecto = ko.observableArray(estudiantesProyecto);
                self.adicionarEstudianteProyecto = function () {
                    if ($('#tipoIdentificacionEstudiante').val() === "") {
                        bootstrap_alert_estudiantes_proyecto.warning('Debe seleccionar el tipo de identificación');
                        return false;
                    }
                    if ($('#numeroIdentificacionEstudiante').val() === "") {
                        bootstrap_alert_estudiantes_proyecto.warning('Debe ingresar el número de identificación');
                        return false;
                    }
                    if ($('#nombresEstudiante').val() === "") {
                        bootstrap_alert_estudiantes_proyecto.warning('Debe ingresar los nombres');
                        return false;
                    }
                    if ($('#apellidosEstudiante').val() === "") {
                        bootstrap_alert_estudiantes_proyecto.warning('Debe ingresar los apellidos');
                        return false;
                    }                    
                    if ($('#correoElectronicoEstudiante').val() === "") {
                        bootstrap_alert_estudiantes_proyecto.warning('Debe ingresar el correo electrónico');
                        return false;
                    }                    
                    if ($('#contactoEstudiante').val() === "") {
                        bootstrap_alert_estudiantes_proyecto.warning('Debe ingresar el contacto');
                        return false;
                    }                    
                    if ($('#tipoEstudiante').val() === "") {
                        bootstrap_alert_estudiantes_proyecto.warning('Debe seleccionar el tipo de estudiante');
                        return false;
                    }
                    if ($('#programaEstudiante').val() === "") {
                        bootstrap_alert_estudiantes_proyecto.warning('Debe seleccionar el programa');
                        return false;
                    }
                    if ($('#rolEstudiante').val() === "") {
                        bootstrap_alert_estudiantes_proyecto.warning('Debe seleccionar el rol');
                        return false;
                    }
                    if ($('#porcentajePropiedadIntelectualEstudiante').val() === "") {
                        bootstrap_alert_estudiantes_proyecto.warning('Debe ingresar el porcentaje de propiedad intelectual');
                        return false;
                    }
                    if ($('#horasSemanaEstudiante').val() === "") {
                        bootstrap_alert_estudiantes_proyecto.warning('Debe ingresar las horas semanales');
                        return false;
                    }
                    if ($('#mesesDedicadosEstudiante').val() === "") {
                        bootstrap_alert_estudiantes_proyecto.warning('Debe ingresar los meses dedicados');
                        return false;
                    }
                    
                    if($('#consecutivo').val() === "") {
                        
                        for(i = 0; i < self.estudiantesProyecto().length; i++) {
                            if(self.estudiantesProyecto()[i].idTipoIdentificacion() === $('#tipoIdentificacionEstudiante').val() && 
                               self.estudiantesProyecto()[i].numeroIdentificacion() === $('#numeroIdentificacionEstudiante').val()) {
                               bootstrap_alert_estudiantes_proyecto.warning('El estudiante ya hace parte del proyecto');
                               return false;                               
                            }
                        }
                        self.estudiantesProyecto.push({
                            idEstudiante: ko.observable(0),
                            idTipoIdentificacion: ko.observable($('#tipoIdentificacionEstudiante').val()),
                            descripcionTipoIdentificacion: ko.observable($('#tipoIdentificacionEstudiante option:selected').text()),
                            numeroIdentificacion: ko.observable($('#numeroIdentificacionEstudiante').val()),
                            nombres: ko.observable($('#nombresEstudiante').val()),
                            apellidos: ko.observable($('#apellidosEstudiante').val()),
                            correoElectronico : ko.observable($('#correoElectronicoEstudiante').val()),
                            contacto : ko.observable($('#contactoEstudiante').val()),
                            idTipoEstudiante: ko.observable($('#tipoEstudiante').val()),
                            descripcionTipoEstudiante: ko.observable($('#tipoEstudiante option:selected').text()),
                            idPrograma: ko.observable($('#programaEstudiante').val()),
                            descripcionPrograma: ko.observable($('#programaEstudiante option:selected').text()),
                            idRol: ko.observable($('#rolEstudiante').val()),
                            descripcionRol: ko.observable($('#rolEstudiante option:selected').text()),
                            porcentajePropiedadIntelectual: ko.observable($('#porcentajePropiedadIntelectualEstudiante').val()),
                            horasSemana: ko.observable($('#horasSemanaEstudiante').val()),
                            mesesDedicados: ko.observable($('#mesesDedicadosEstudiante').val()),
                            semestre: ko.observable($('#semestreEstudiante').val()),
                            consecutivo: ko.observable(self.estudiantesProyecto().length + 1)
                        });
                    } else {
                            var consecutivo = parseInt($('#consecutivo').val(), 10);
                            var indice = 0;
                            for(i = 0; i < self.estudiantesProyecto().length; i++) {
                                if(self.estudiantesProyecto()[i].consecutivo() === consecutivo){
                                   indice = i; 
                                   break;
                                }
                            }
                            self.estudiantesProyecto()[indice].idTipoIdentificacion($('#tipoIdentificacionEstudiante').val());
                            self.estudiantesProyecto()[indice].descripcionTipoIdentificacion($('#tipoIdentificacionEstudiante option:selected').text());
                            self.estudiantesProyecto()[indice].numeroIdentificacion($('#numeroIdentificacionEstudiante').val());
                            self.estudiantesProyecto()[indice].nombres( $('#nombresEstudiante').val());
                            self.estudiantesProyecto()[indice].apellidos( $('#apellidosEstudiante').val());
                            self.estudiantesProyecto()[indice].correoElectronico( $('#correoElectronicoEstudiante').val());
                            self.estudiantesProyecto()[indice].contacto($('#contactoEstudiante').val());
                            self.estudiantesProyecto()[indice].idTipoEstudiante( $('#tipoEstudiante').val());
                            self.estudiantesProyecto()[indice].descripcionTipoEstudiante( $('#tipoEstudiante option:selected').text());
                            self.estudiantesProyecto()[indice].idPrograma( $('#programaEstudiante').val());
                            self.estudiantesProyecto()[indice].descripcionPrograma( $('#programaEstudiante option:selected').text());
                            self.estudiantesProyecto()[indice].idRol( $('#rolEstudiante').val());
                            self.estudiantesProyecto()[indice].descripcionRol($('#rolEstudiante option:selected').text());
                            self.estudiantesProyecto()[indice].porcentajePropiedadIntelectual( $('#porcentajePropiedadIntelectualEstudiante').val());
                            self.estudiantesProyecto()[indice].horasSemana( $('#horasSemanaEstudiante').val());
                            self.estudiantesProyecto()[indice].mesesDedicados( $('#mesesDedicadosEstudiante').val());
                            self.estudiantesProyecto()[indice].semestre($('#semestreEstudiante').val());
                    }

                   $('#estudianteProyectoModal').modal('toggle');
                   bootstrap_alert_estudiantes_proyecto.removeWarning();
                   limpiarDatosVentanaEstudianteProyecto();
                };
                self.eliminarEstudianteProyecto = function (estudianteProyecto) {
                    estudianteProyectoEliminar = estudianteProyecto;
                    $('#confirmacionEliminacionEstudianteProyecto').modal({backdrop: 'static', keyboard: false}) ;                    
                };
                self.editarEstudianteProyecto = function (estudianteProyecto) {
                    $('#consecutivo').val(estudianteProyecto.consecutivo());
                    $('#tipoIdentificacionEstudiante').val(estudianteProyecto.idTipoIdentificacion());
                    $('#numeroIdentificacionEstudiante').val(estudianteProyecto.numeroIdentificacion());
                    $('#nombresEstudiante').val(estudianteProyecto.nombres());
                    $('#apellidosEstudiante').val(estudianteProyecto.apellidos());
                    $('#correoElectronicoEstudiante').val(estudianteProyecto.correoElectronico());
                    $('#contactoEstudiante').val(estudianteProyecto.contacto());
                    $('#programaEstudiante').val(estudianteProyecto.idPrograma());
                    $('#tipoEstudiante').val(estudianteProyecto.idTipoEstudiante());
                    $('#rolEstudiante').val(estudianteProyecto.idRol());
                    $('#porcentajePropiedadIntelectualEstudiante').val(estudianteProyecto.porcentajePropiedadIntelectual());
                    $('#horasSemanaEstudiante').val(estudianteProyecto.horasSemana());
                    $('#mesesDedicadosEstudiante').val(estudianteProyecto.mesesDedicados());
                    $('#semestreEstudiante').val(estudianteProyecto.semestre());
                    
                    $('#estudianteProyectoModal').modal({backdrop: 'static', keyboard: false}) ;
                };

                self.personalExternoProyecto = ko.observableArray(personalExternoProyecto);
                self.adicionarPersonalExternoProyecto = function () {
                    if ($('#tipoIdentificacionPersonalExterno').val() === "") {
                        bootstrap_alert_personalExternoProyecto.warning('Debe seleccionar el tipo de identificación');
                        return false;
                    }
                    if ($('#numeroIdentificacionPersonalExterno').val() === "") {
                        bootstrap_alert_personalExterno_proyecto.warning('Debe ingresar el número de identificación');
                        return false;
                    }
                    if ($('#nombresPersonalExterno').val() === "") {
                        bootstrap_alert_personalExterno_proyecto.warning('Debe ingresar los nombres');
                        return false;
                    }
                    if ($('#apellidosPersonalExterno').val() === "") {
                        bootstrap_alert_personalExterno_proyecto.warning('Debe ingresar los apellidos');
                        return false;
                    }                    
                    if ($('#correoElectronicoPersonalExterno').val() === "") {
                        bootstrap_alert_personalExterno_proyecto.warning('Debe ingresar el correo electrónico');
                        return false;
                    }                    
                    if ($('#entidadPersonalExterno').val() === "") {
                        bootstrap_alert_personalExterno_proyecto.warning('Debe ingresar la entidad');
                        return false;
                    }                    
                    if ($('#rolPersonalExterno').val() === "") {
                        bootstrap_alert_personalExterno_proyecto.warning('Debe seleccionar el rol');
                        return false;
                    }
                    if ($('#porcentajePropiedadIntelectualPersonalExterno').val() === "") {
                        bootstrap_alert_personalExterno_proyecto.warning('Debe ingresar el porcentaje de propiedad intelectual');
                        return false;
                    }
                    if ($('#horasSemanaPersonalExterno').val() === "") {
                        bootstrap_alert_personalExterno_proyecto.warning('Debe ingresar las horas semanales');
                        return false;
                    }
                    if ($('#mesesDedicadosPersonalExterno').val() === "") {
                        bootstrap_alert_personalExterno_proyecto.warning('Debe ingresar los meses dedicados');
                        return false;
                    }
                    
                    if($('#consecutivo').val() === "") {
                        
                        for(i = 0; i < self.personalExternoProyecto().length; i++) {
                            if(self.personalExternoProyecto()[i].idTipoIdentificacion() === $('#tipoIdentificacionPersonalExterno').val() && 
                               self.personalExternoProyecto()[i].numeroIdentificacion() === $('#numeroIdentificacionPersonalExterno').val()) {
                               bootstrap_alert_personalExterno_proyecto.warning('El personal externo ya hace parte del proyecto');
                               return false;                               
                            }
                        }
                        self.personalExternoProyecto.push({
                            idPersonalExterno: ko.observable(0),
                            idTipoIdentificacion: ko.observable($('#tipoIdentificacionPersonalExterno').val()),
                            descripcionTipoIdentificacion: ko.observable($('#tipoIdentificacionPersonalExterno option:selected').text()),
                            numeroIdentificacion: ko.observable($('#numeroIdentificacionPersonalExterno').val()),
                            nombres: ko.observable($('#nombresPersonalExterno').val()),
                            apellidos: ko.observable($('#apellidosPersonalExterno').val()),
                            correoElectronico : ko.observable($('#correoElectronicoPersonalExterno').val()),
                            entidad : ko.observable($('#entidadPersonalExterno').val()),
                            idRol: ko.observable($('#rolPersonalExterno').val()),
                            descripcionRol: ko.observable($('#rolPersonalExterno option:selected').text()),
                            cartaCesionDerechosPatrimonio: ko.observable($('#cartaCesionDerechosPatrimonioPersonalExterno').is(":checked")),
                            porcentajePropiedadIntelectual: ko.observable($('#porcentajePropiedadIntelectualPersonalExterno').val()),
                            horasSemana: ko.observable($('#horasSemanaPersonalExterno').val()),
                            mesesDedicados: ko.observable($('#mesesDedicadosPersonalExterno').val()),
                            consecutivo: ko.observable(self.personalExternoProyecto().length + 1)
                        });
                    } else {
                            var consecutivo = parseInt($('#consecutivo').val(), 10);
                            var indice = 0;
                            for(i = 0; i < self.personalExternoProyecto().length; i++) {
                                if(self.personalExternoProyecto()[i].consecutivo() === consecutivo){
                                   indice = i; 
                                   break;
                                }
                            }
                            self.personalExternoProyecto()[indice].idTipoIdentificacion($('#tipoIdentificacionPersonalExterno').val());
                            self.personalExternoProyecto()[indice].descripcionTipoIdentificacion($('#tipoIdentificacionPersonalExterno option:selected').text());
                            self.personalExternoProyecto()[indice].numeroIdentificacion($('#numeroIdentificacionPersonalExterno').val());
                            self.personalExternoProyecto()[indice].nombres( $('#nombresPersonalExterno').val());
                            self.personalExternoProyecto()[indice].apellidos( $('#apellidosPersonalExterno').val());
                            self.personalExternoProyecto()[indice].correoElectronico( $('#correoElectronicoPersonalExterno').val());
                            self.personalExternoProyecto()[indice].entidad($('#entidadPersonalExterno').val());
                            self.personalExternoProyecto()[indice].idRol( $('#rolPersonalExterno').val());
                            self.personalExternoProyecto()[indice].descripcionRol($('#rolPersonalExterno option:selected').text());
                            self.personalExternoProyecto()[indice].cartaCesionDerechosPatrimonio( $('#cartaCesionDerechosPatrimonioPersonalExterno').is(":checked"));
                            self.personalExternoProyecto()[indice].porcentajePropiedadIntelectual( $('#porcentajePropiedadIntelectualPersonalExterno').val());
                            self.personalExternoProyecto()[indice].horasSemana( $('#horasSemanaPersonalExterno').val());
                            self.personalExternoProyecto()[indice].mesesDedicados( $('#mesesDedicadosPersonalExterno').val());
                    }

                   $('#personalExternoProyectoModal').modal('toggle');
                   bootstrap_alert_personalExterno_proyecto.removeWarning();
                   limpiarDatosVentanaPersonalExternoProyecto();
                };
                self.eliminarPersonalExternoProyecto = function (personalExternoProyecto) {
                    personalExternoProyectoEliminar = personalExternoProyecto;
                    $('#confirmacionEliminacionPersonalExternoProyecto').modal({backdrop: 'static', keyboard: false}) ;                    
                };
                self.editarPersonalExternoProyecto = function (personalExterno) {
                    $('#consecutivo').val(personalExterno.consecutivo());
                    $('#tipoIdentificacionPersonalExterno').val(personalExterno.idTipoIdentificacion());
                    $('#numeroIdentificacionPersonalExterno').val(personalExterno.numeroIdentificacion());
                    $('#nombresPersonalExterno').val(personalExterno.nombres());
                    $('#apellidosPersonalExterno').val(personalExterno.apellidos());
                    $('#correoElectronicoPersonalExterno').val(personalExterno.correoElectronico());
                    $('#entidadPersonalExterno').val(personalExterno.entidad());
                    $('#rolPersonalExterno').val(personalExterno.idRol());
                    $('#porcentajePropiedadIntelectualPersonalExterno').val(personalExterno.porcentajePropiedadIntelectual());
                    $('#horasSemanaPersonalExterno').val(personalExterno.horasSemana());
                    $('#mesesDedicadosPersonalExterno').val(personalExterno.mesesDedicados());
                    $('#cartaCesionDerechosPatrimonioPersonalExterno').prop('checked', personalExterno.cartaCesionDerechosPatrimonio());
                    
                    $('#personalExternoProyectoModal').modal({backdrop: 'static', keyboard: false}) ;
                };
 
                self.entidadesInternacionalesProyecto = ko.observableArray(entidadesInternacionalesProyecto);
                self.adicionarEntidadInternacional = function () {
                    if ($('#entidadInternacionalProyecto').val() === "") {
                        bootstrap_alert_entidadInternacional_proyecto.warning('Debe ingresar la entidad internacional');
                        return false;
                    }
                    $('#entidadesInternacionalesModal').modal('toggle');
                    bootstrap_alert_entidadInternacional_proyecto.removeWarning();
                    if($('#consecutivo').val() === "") {
                        self.entidadesInternacionalesProyecto.push({
                            idEntidadInternacionalProyecto: ko.observable(0),
                            consecutivo: ko.observable(self.entidadesInternacionalesProyecto().length + 1),
                            nombre: ko.observable($('#entidadInternacionalProyecto').val())
                        });
                    } else {
                        var consecutivo = parseInt($('#consecutivo').val(), 10);
                        var indice = 0;
                        for(i = 0; i < self.entidadesInternacionalesProyecto().length; i++) {
                           if(self.entidadesInternacionalesProyecto()[i].consecutivo() === consecutivo){
                              indice = i; 
                              break;
                           }
                        }
                        self.entidadesInternacionalesProyecto()[indice].nombre($('#entidadInternacionalProyecto').val());
                    }
                    
                    limpiarDatosVentanaEntidadInternacional();
                };
                self.eliminarEntidadInternacionalProyecto = function (entidadInternacionalProyecto) {
                    entidadInternacionalProyectoEliminar = entidadInternacionalProyecto;
                    $('#confirmacionEliminacionEntidadInternacionalProyecto').modal({backdrop: 'static', keyboard: false}) ;                    
                };
                self.editarEntidadInternacionalProyecto = function (entidadInternacionalProyecto) {
                    $('#entidadInternacionalProyecto').val(entidadInternacionalProyecto.nombre());
                    $('#consecutivo').val(entidadInternacionalProyecto.consecutivo());
                    $('#entidadesInternacionalesModal').modal({backdrop: 'static', keyboard: false}) ; 
                };

                self.fuentesFinanciacionProyecto = ko.observableArray(fuentesFinanciacionProyecto);
                self.adicionarFuenteFinanciacionProyecto = function () {
                    if ($('#fuenteFinanciacion').val() === "") {
                        bootstrap_alert_fuenteFinanciacion_proyecto.warning('Debe seleccionar la fuente de financiación');
                        return false;
                    }
                    if ($('#tipoFuenteFinanciacionProyecto').val() === "") {
                        bootstrap_alert_fuenteFinanciacion_proyecto.warning('Debe seleccionar el tipo de fuente de financiación');
                        return false;
                    }
                    if ($('#montoEspecies').val() === "") {
                        bootstrap_alert_fuenteFinanciacion_proyecto.warning('Debe ingresar el monto en especies');
                        return false;
                    }
                    if ($('#montoFrescos').val() === "") {
                        bootstrap_alert_fuenteFinanciacion_proyecto.warning('Debe ingresar el monto en recursos frescos');
                        return false;
                    }                    
                    if($('#consecutivo').val() === "") {
                        self.fuentesFinanciacionProyecto.push({
                            idFuenteFinanciacionProyecto: ko.observable(0),
                            idFuenteFinanciacion: ko.observable($('#fuenteFinanciacion').val()),
                            nombreFuenteFinanciacion: ko.observable($('#fuenteFinanciacion option:selected').text()),
                            idTipoFuenteFinanciacionProyecto: ko.observable($('#tipoFuenteFinanciacionProyecto').val()),
                            nombreTipoFuenteFinanciacionProyecto: ko.observable($('#tipoFuenteFinanciacionProyecto option:selected').text()),
                            montoEspecies : ko.observable($('#montoEspecies').val().replace("$", "").replace(/\./g, "")),
                            montoEspeciesFormateado : ko.observable($('#montoEspecies').val()),
                            montoFrescos : ko.observable($('#montoFrescos').val().replace("$", "").replace(/\./g, "")),
                            montoFrescosFormateado : ko.observable($('#montoFrescos').val()),
                            consecutivo: ko.observable(self.profesoresProyecto().length + 1)
                        });
                    } else {
                            var consecutivo = parseInt($('#consecutivo').val(), 10);
                            var indice = 0;
                            for(i = 0; i < self.fuentesFinanciacionProyecto().length; i++) {
                                if(self.fuentesFinanciacionProyecto()[i].consecutivo() === consecutivo){
                                   indice = i; 
                                   break;
                                }
                            }
                            self.fuentesFinanciacionProyecto()[indice].idFuenteFinanciacion($('#fuenteFinanciacion').val());
                            self.fuentesFinanciacionProyecto()[indice].nombreFuenteFinanciacion($('#fuenteFinanciacion option:selected').text());
                            self.fuentesFinanciacionProyecto()[indice].idTipoFuenteFinanciacionProyecto($('#tipoFuenteFinanciacionProyecto').val());
                            self.fuentesFinanciacionProyecto()[indice].nombreTipoFuenteFinanciacionProyecto( $('#tipoFuenteFinanciacionProyecto option:selected').text());
                            self.fuentesFinanciacionProyecto()[indice].montoEspecies( $('#montoEspecies').val().replace("$", "").replace(/\./g, ""));
                            self.fuentesFinanciacionProyecto()[indice].montoFrescos( $('#montoFrescos').val().replace("$", "").replace(/\./g, ""));
                            self.fuentesFinanciacionProyecto()[indice].montoEspeciesFormateado( $('#montoEspecies').val());
                            self.fuentesFinanciacionProyecto()[indice].montoFrescosFormateado( $('#montoFrescos').val());
                    }

                   $('#fuenteFinanciacionProyectoModal').modal('toggle');
                   bootstrap_alert_fuenteFinanciacion_proyecto.removeWarning();
                   limpiarDatosVentanaFuenteFinanciacionProyecto();
                };
                self.eliminarFuenteFinanciacionProyecto = function (fuenteFinanciacionProyecto) {
                    fuenteFinanciacionProyectoEliminar = fuenteFinanciacionProyecto;
                    $('#confirmacionEliminacionFuenteFinanciacionProyecto').modal({backdrop: 'static', keyboard: false}) ;                    
                };
                self.editarFuenteFinanciacionProyecto = function (fuenteFinanciacionProyecto) {
                    $('#consecutivo').val(fuenteFinanciacionProyecto.consecutivo());
                    $('#fuenteFinanciacion').val(fuenteFinanciacionProyecto.idFuenteFinanciacion());
                    $('#tipoFuenteFinanciacionProyecto').val(fuenteFinanciacionProyecto.idTipoFuenteFinanciacionProyecto());
                    $('#montoEspecies').val(fuenteFinanciacionProyecto.montoEspeciesFormateado());
                    $('#montoFrescos').val(fuenteFinanciacionProyecto.montoFrescosFormateado());
                    
                    $('#fuenteFinanciacionProyectoModal').modal({backdrop: 'static', keyboard: false}) ;
                };
                
                self.alertasAvalProyecto = ko.observableArray(alertasAvalProyecto);
                self.adicionarAlertaAvalProyecto = function () {
                    if ($('#descripcionAlertaAvalProyecto').val() === "") {
                        bootstrap_alert_alertas_aval_proyecto.warning('Debe ingresar la descripción');
                        return false;
                    }
                    if ($('#tipoAvalProyecto').val() === "") {
                        bootstrap_alert_alertas_aval_proyecto.warning('Debe seleccionar el tipo de aval');
                        return false;
                    }
                    if ($('#fechaActaAlertaAvalProyecto').val() === "") {
                        bootstrap_alert_alertas_aval_proyecto.warning('Debe ingresar la fecha del acta');
                        return false;
                    }
                    if ($('#numeroActaAlertaAvalProyecto').val() === "") {
                        bootstrap_alert_alertas_aval_proyecto.warning('Debe ingresar el número de acta');
                        return false;
                    }
                    $('#alertasAvalProyectoModal').modal('toggle');
                    bootstrap_alert_alertas_aval_proyecto.removeWarning();
                    if($('#consecutivo').val() === "") {
                        self.alertasAvalProyecto.push({
                            idAlertaAvalProyecto: ko.observable(0),
                            consecutivo: ko.observable(self.alertasAvalProyecto().length + 1),
                            descripcion: ko.observable($('#descripcionAlertaAvalProyecto').val()),
                            nombreTipoAval: ko.observable($('#tipoAvalProyecto option:selected').text()),
                            idTipoAval: ko.observable($('#tipoAvalProyecto').val()),
                            fechaActa: ko.observable($('#fechaActaAlertaAvalProyecto').val()),
                            numeroActa: ko.observable($('#numeroActaAlertaAvalProyecto').val())
                        });
                    } else {
                        var consecutivo = parseInt($('#consecutivo').val(), 10);
                        var indice = 0;
                        for(i = 0; i < self.alertasAvalProyecto().length; i++) {
                           if(self.alertasAvalProyecto()[i].consecutivo() === consecutivo){
                              indice = i; 
                              break;
                           }
                        }
                        self.alertasAvalProyecto()[indice].descripcion($('#descripcionAlertaAvalProyecto').val());
                        self.alertasAvalProyecto()[indice].fechaActa($('#fechaActaAlertaAvalProyecto').val());
                        self.alertasAvalProyecto()[indice].numeroActa($('#numeroActaAlertaAvalProyecto').val());
                        self.alertasAvalProyecto()[indice].idTipoAval($('#tipoAvalProyecto').val());
                        self.alertasAvalProyecto()[indice].nombreTipoAval($('#tipoAvalProyecto option:selected').text());
                    }
                    
                    limpiarDatosVentanaAlertaAvalProyecto();
                };
                self.eliminarAlertaAvalProyecto = function (alertaAvalProyecto) {
                    alertaAvalProyectoEliminar = alertaAvalProyecto;
                    $('#confirmacionEliminacionAlertaAvalProyecto').modal({backdrop: 'static', keyboard: false}) ;                    
                };
                self.editarAlertaAvalProyecto = function (alertaAvalProyecto) {
                    $('#descripcionAlertaAvalProyecto').val(alertaAvalProyecto.descripcion());
                    $('#consecutivo').val(alertaAvalProyecto.consecutivo());
                    $('#tipoAvalProyecto').val(alertaAvalProyecto.idTipoAval());
                    $('#fechaActaAlertaAvalProyecto').val(alertaAvalProyecto.fechaActa());
                    $('#numeroActaAlertaAvalProyecto').val(alertaAvalProyecto.numeroActa());
                    $('#alertasAvalProyectoModal').modal({backdrop: 'static', keyboard: false}) ; 
                };
            };

            var objetivosEspecificos = [];
            var profesoresProyecto = [];   
            var estudiantesProyecto = [];
            var personalExternoProyecto = [];
            var compromisosProyecto = [];
            var entidadesInternacionalesProyecto = [];
            var fuentesFinanciacionProyecto = [];
            var alertasAvalProyecto = [];
            var gruposInvestigacion = [];
            
            var objetivoEspecificoEliminar = null;
            var profesorProyectoEliminar = null;
            var estudianteProyectoEliminar = null;
            var personalExternoProyectoEliminar = null;
            var compromisoProyectoEliminar = null;
            var entidadInternacionalProyectoEliminar = null;
            var fuenteFinanciacionProyectoEliminar = null;
            var alertaAvalProyectoEliminar = null;

            <c:if test = "${objetivosEspecificosJSON != null}">
            objetivosEspecificos = ${objetivosEspecificosJSON};
            </c:if>
            <c:if test = "${profesoresProyectoJSON != null}">
            profesoresProyecto = ${profesoresProyectoJSON};
            </c:if>
            <c:if test = "${estudiantesProyectoJSON != null}">
            estudiantesProyecto = ${estudiantesProyectoJSON};
            </c:if>
            <c:if test = "${personalExternoProyectoJSON != null}">
            personalExternoProyecto = ${personalExternoProyectoJSON};
            </c:if>
            <c:if test = "${compromisosProyectoJSON != null}">
            compromisosProyecto = ${compromisosProyectoJSON};
            </c:if>
            <c:if test = "${entidadesInternacionalesProyectoJSON != null}">
            entidadesInternacionalesProyecto = ${entidadesInternacionalesProyectoJSON};
            </c:if>
            <c:if test = "${fuentesFinanciacionProyectoJSON != null}">
            fuentesFinanciacionProyecto = ${fuentesFinanciacionProyectoJSON};
            </c:if>
            <c:if test = "${alertasAvalProyectoJSON != null}">
            alertasAvalProyecto = ${alertasAvalProyectoJSON};
            </c:if>
            <c:if test = "${gruposInvestigacionJSON != null}">
            gruposInvestigacion = ${gruposInvestigacionJSON};
            </c:if>
                
            var proyectoModel = new ProyectoModel(objetivosEspecificos, profesoresProyecto, estudiantesProyecto, personalExternoProyecto, compromisosProyecto, entidadesInternacionalesProyecto, fuentesFinanciacionProyecto, alertasAvalProyecto, gruposInvestigacion, ${proyecto.getIdGrupoInvestigacionPrincipal()});
            ko.applyBindings(proyectoModel);

            bootstrap_alert_convocatoria = function () { };
            bootstrap_alert_convocatoria.warning = function (message) {
                $('#alert_placeholder_convocatoria').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            bootstrap_alert_convocatoria.removeWarning = function () {
                $('#alert_placeholder_convocatoria').html('');
            };
            function mostrarVentanaNuevaConvocatoria() {
                $('#convocatoriaModal').modal({backdrop: 'static', keyboard: false}) ; 
            }

            bootstrap_alert_areaTematica = function () { };
            bootstrap_alert_areaTematica.warning = function (message) {
                $('#alert_placeholder_areaTematica').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            bootstrap_alert_areaTematica.removeWarning = function () {
                $('#alert_placeholder_areaTematica').html('');
            };
            function mostrarVentanaNuevaAreaTematica() {
                $('#areaTematicaModal').modal({backdrop: 'static', keyboard: false}) ; 
            }

            bootstrap_alert_objetivosEspecificos = function () { };
            bootstrap_alert_objetivosEspecificos.warning = function (message) {
                $('#alert_placeholder_objetivosEspecificos').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            bootstrap_alert_objetivosEspecificos.removeWarning = function () {
                $('#alert_placeholder_objetivosEspecificos').html('');
            };
            function mostrarVentanaNuevoObjetivoEspecifico() {
                limpiarDatosVentanaObjetivoEspecifico();
                $('#objetivosEspecificosModal').modal({backdrop: 'static', keyboard: false}) ; 
            }
            function limpiarDatosVentanaObjetivoEspecifico() {
                $('#objetivoEspecifico').val("");
                $('#consecutivo').val("");
            }

            bootstrap_alert_compromisos_proyecto = function () { };
            bootstrap_alert_compromisos_proyecto.warning = function (message) {
                $('#alert_placeholder_compromisos_proyecto').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            bootstrap_alert_compromisos_proyecto.removeWarning = function () {
                $('#alert_placeholder_compromisos_proyecto').html('');
            };
            function mostrarVentanaNuevoCompromisoProyecto() {
                limpiarDatosVentanaCompromisoProyecto();
                $('#compromisosProyectoModal').modal({backdrop: 'static', keyboard: false}) ; 
            }
            function limpiarDatosVentanaCompromisoProyecto() {
                $('#consecutivo').val("");
                $('#tipoCompromiso').val("");
                $('#compromisoProyecto').val("");
                $('#soporteCompromisoProyecto').val("");
            }

            bootstrap_alert_profesores_proyecto = function () { };
            bootstrap_alert_profesores_proyecto.warning = function (message) {
                $('#alert_placeholder_profesores_proyecto').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            bootstrap_alert_profesores_proyecto.removeWarning = function () {
                $('#alert_placeholder_profesores_proyecto').html('');
            };
            function mostrarVentanaNuevoProfesorProyecto() {
                limpiarDatosVentanaProfesorProyecto();
                $('#profesorProyectoModal').modal({backdrop: 'static', keyboard: false}) ; 
            }
            function limpiarDatosVentanaProfesorProyecto() {
                $('#consecutivo').val("");
                $('#tipoIdentificacionProfesor').val("");
                $('#descripcionTipoIdentificacionProfesor').val("");
                $('#numeroIdentificacionProfesor').val("");
                $('#nombresProfesor').val("");
                $('#apellidosProfesor').val("");
                $('#contactoProfesor').val("");
                $('#correoElectronicoProfesor').val("");
                $('#facultadProfesor').val("");
                $('#rolProfesor').val("");
                $('#tipoVinculacionProfesor').val("");
                $('#cartaCesionDerechosPatrimonioProfesor').prop('checked', false);
                $('#porcentajePIProfesor').val("");
                $('#horasSemanaProfesor').val("");
                $('#mesesDedicadosProfesor').val("");
                $('#horasSemanaFueraPlanProfesor').val("");
                $('#mesesFueraPlanProfesor').val("");            
            }
            function buscarProfesor() {
                var tipoIdentificacion = $('#tipoIdentificacionProfesor').val();
                var numeroIdentificacion = $('#numeroIdentificacionProfesor').val();

                if(tipoIdentificacion !== "" && numeroIdentificacion !== ""){
                      $.ajax({
                        type: "POST",
                        url: "${pageContext.request.contextPath}/proyectos/profesores",
                        data: "idTipoIdentificacion=" + tipoIdentificacion + "&numeroIdentificacion=" + numeroIdentificacion,
                        beforeSend: function(xhr){
                           xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                        },                        
                        success: function(response){
                           if(response !== "") {
                             var profesor = JSON.parse(response);
                             $('#nombresProfesor').val(profesor.nombres);
                             $('#apellidosProfesor').val(profesor.apellidos);
                             $('#correoElectronicoProfesor').val(profesor.correoElectronico);
                             $('#contactoProfesor').val(profesor.contacto);
                           } else {
                             $('#nombresProfesor').val("");
                             $('#apellidosProfesor').val("");
                             $('#contactoProfesor').val("");
                             $('#correoElectronicoProfesor').val("");
                           }    
                        },
                        error: function(e){
                            bootstrap_alert_profesores_proyecto.warning(e);
                        }
                    });
                } else {
                    if ($('#tipoIdentificacionProfesor').val() === "") {
                        bootstrap_alert_profesores_proyecto.warning('Debe seleccionar el tipo de identificación');
                        return false;
                    }
                    if ($('#numeroIdentificacionProfesor').val() === "") {
                        bootstrap_alert_profesores_proyecto.warning('Debe ingresar el número de identificación');
                        return false;
                    }
                }
           }
           
            bootstrap_alert_estudiantes_proyecto = function () { };
            bootstrap_alert_estudiantes_proyecto.warning = function (message) {
                $('#alert_placeholder_estudiantes_proyecto').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            bootstrap_alert_estudiantes_proyecto.removeWarning = function () {
                $('#alert_placeholder_estudiantes_proyecto').html('');
            };
            function mostrarVentanaNuevoEstudianteProyecto() {
                limpiarDatosVentanaEstudianteProyecto();
                $('#estudianteProyectoModal').modal({backdrop: 'static', keyboard: false}) ; 
            }
            function limpiarDatosVentanaEstudianteProyecto() {
                $('#consecutivo').val("");
                $('#tipoIdentificacionEstudiante').val("");
                $('#descripcionTipoIdentificacionEstudiante').val("");
                $('#numeroIdentificacionEstudiante').val("");
                $('#nombresEstudiante').val("");
                $('#apellidosEstudiante').val("");
                $('#contactoEstudiante').val("");
                $('#correoElectronicoEstudiante').val("");
                $('#programaEstudiante').val("");
                $('#rolEstudiante').val("");
                $('#tipoEstudiante').val("");
                $('#porcentajePropiedadIntelectualEstudiante').val("");
                $('#horasSemanaEstudiante').val("");
                $('#mesesDedicadosEstudiante').val("");
                $('#semestreEstudiante').val("");            
            }
            function buscarEstudiante() {
                var tipoIdentificacion = $('#tipoIdentificacionEstudiante').val();
                var numeroIdentificacion = $('#numeroIdentificacionEstudiante').val();

                if(tipoIdentificacion !== "" && numeroIdentificacion !== ""){
                      $.ajax({
                        type: "POST",
                        url: "${pageContext.request.contextPath}/proyectos/estudiantes",
                        data: "idTipoIdentificacion=" + tipoIdentificacion + "&numeroIdentificacion=" + numeroIdentificacion,
                        beforeSend: function(xhr){
                           xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                        },                        
                        success: function(response){
                           if(response != "") {
                             var estudiante = JSON.parse(response);
                             $('#nombresEstudiante').val(estudiante.nombres);
                             $('#apellidosEstudiante').val(estudiante.apellidos);
                             $('#correoElectronicoEstudiante').val(estudiante.correoElectronico);
                             $('#contactoEstudiante').val(estudiante.contacto);
                             $('#tipoEstudiante').val(estudiante.idTipoEstudiante);
                           } else {
                             $('#nombresEstudiante').val("");
                             $('#apellidosEstudiante').val("");
                             $('#contactoEstudiante').val("");
                             $('#correoElectronicoEstudiante').val("");
                             $('#tipoEstudiante').val("");
                           }    
                        },
                        error: function(e){
                            bootstrap_alert_estudiantes_proyecto.warning(e);
                        }
                    });
                } else {
                    if ($('#tipoIdentificacionEstudiante').val() === "") {
                        bootstrap_alert_estudiantes_proyecto.warning('Debe seleccionar el tipo de identificación');
                        return false;
                    }
                    if ($('#numeroIdentificacionEstudiante').val() === "") {
                        bootstrap_alert_estudiantes_proyecto.warning('Debe ingresar el número de identificación');
                        return false;
                    }
                }
           }
           
            bootstrap_alert_personalExterno_proyecto = function () { };
            bootstrap_alert_personalExterno_proyecto.warning = function (message) {
                $('#alert_placeholder_personalExterno_proyecto').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            bootstrap_alert_personalExterno_proyecto.removeWarning = function () {
                $('#alert_placeholder_personalExterno_proyecto').html('');
            };
            function mostrarVentanaNuevoPersonalExternoProyecto() {
                limpiarDatosVentanaPersonalExternoProyecto();
                $('#personalExternoProyectoModal').modal({backdrop: 'static', keyboard: false}) ; 
            }
            function limpiarDatosVentanaPersonalExternoProyecto() {
                $('#consecutivo').val("");
                $('#tipoIdentificacionPersonalExterno').val("");
                $('#numeroIdentificacionPersonalExterno').val("");
                $('#nombresPersonalExterno').val("");
                $('#apellidosPersonalExterno').val("");
                $('#entidadPersonalExterno').val("");
                $('#correoElectronicoPersonalExterno').val("");
                $('#rolPersonalExterno').val("");
                $('#porcentajePropiedadIntelectualPersonalExterno').val("");
                $('#horasSemanaPersonalExterno').val("");
                $('#mesesDedicadosPersonalExterno').val("");
                $('#cartaCesionDerechosPatrimonioPersonalExterno').prop('checked', false);
            }
            function buscarPersonalExterno() {
                var tipoIdentificacion = $('#tipoIdentificacionPersonalExterno').val();
                var numeroIdentificacion = $('#numeroIdentificacionPersonalExterno').val();

                if(tipoIdentificacion != "" && numeroIdentificacion != ""){
                      $.ajax({
                        type: "POST",
                        url: "${pageContext.request.contextPath}/proyectos/personalExterno",
                        data: "idTipoIdentificacion=" + tipoIdentificacion + "&numeroIdentificacion=" + numeroIdentificacion,
                        beforeSend: function(xhr){
                           xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                        },                        
                        success: function(response){
                           if(response != "") {
                             var personalExterno = JSON.parse(response);
                             $('#nombresPersonalExterno').val(personalExterno.nombres);
                             $('#apellidosPersonalExterno').val(personalExterno.apellidos);
                             $('#correoElectronicoPersonalExterno').val(personalExterno.correoElectronico);
                             $('#entidadPersonalExterno').val(personalExterno.entidad);
                           } else {
                             $('#nombresPersonalExterno').val("");
                             $('#apellidosPersonalExterno').val("");
                             $('#correoElectronicoPersonalExterno').val("");
                             $('#entidadPersonalExterno').val("");
                           }    
                        },
                        error: function(e){
                            bootstrap_alert_personalExterno_proyecto.warning(e);
                        }
                    });
                } else {
                    if ($('#tipoIdentificacionPersonalExterno').val() === "") {
                        bootstrap_alert_personalExterno_proyecto.warning('Debe seleccionar el tipo de identificación');
                        return false;
                    }
                    if ($('#numeroIdentificacionPersonalExterno').val() === "") {
                        bootstrap_alert_personalExterno_proyecto.warning('Debe ingresar el número de identificación');
                        return false;
                    }
                }
           }
            
            bootstrap_alert_entidadInternacional_proyecto = function () { };
            bootstrap_alert_entidadInternacional_proyecto.warning = function (message) {
                $('#alert_placeholder_entidadInternacional_proyecto').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            bootstrap_alert_entidadInternacional_proyecto.removeWarning = function () {
                $('#alert_placeholder_entidadInternacional_proyecto').html('');
            };
            function mostrarVentanaNuevaEntidadInternacionalProyecto() {
                limpiarDatosVentanaEntidadInternacional();
                $('#entidadesInternacionalesModal').modal({backdrop: 'static', keyboard: false}) ; 
            }
            function limpiarDatosVentanaEntidadInternacional() {
                $('#entidadInternacionalProyecto').val("");
                $('#consecutivo').val("");
            }            
            
            bootstrap_alert_fuenteFinanciacion_proyecto = function () { };
            bootstrap_alert_fuenteFinanciacion_proyecto.warning = function (message) {
                $('#alert_placeholder_fuentesFinanciacion_proyecto').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            bootstrap_alert_fuenteFinanciacion_proyecto.removeWarning = function () {
                $('#alert_placeholder_fuentesFinanciacion_proyecto').html('');
            };
            function mostrarVentanaNuevaFuenteFinanciacionProyecto() {
                limpiarDatosVentanaFuenteFinanciacionProyecto();
                $('#fuenteFinanciacionProyectoModal').modal({backdrop: 'static', keyboard: false}) ; 
            }
            function limpiarDatosVentanaFuenteFinanciacionProyecto() {
                $('#fuenteFinanciacion').val("");
                $('#tipoFuenteFinanciacionProyecto').val("");
                $('#montoEspecies').val("");
                $('#montoFrescos').val("");
                $('#consecutivo').val("");
            }             
            
            bootstrap_alert_alertas_aval_proyecto = function () { };
            bootstrap_alert_alertas_aval_proyecto.warning = function (message) {
                $('#alert_placeholder_alertas_aval_proyecto').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            bootstrap_alert_alertas_aval_proyecto.removeWarning = function () {
                $('#alert_placeholder_alertas_aval_proyecto').html('');
            };
            function mostrarVentanaNuevaAlertaAvalProyecto() {
                limpiarDatosVentanaAlertaAvalProyecto();
                $('#alertasAvalProyectoModal').modal({backdrop: 'static', keyboard: false}) ; 
            }
            function limpiarDatosVentanaAlertaAvalProyecto() {
                $('#consecutivo').val("");
                $('#tipoAvalProyecto').val("");
                $('#descripcionAlertaAvalProyecto').val("");
                $('#fechaActaAlertaAvalProyecto').val("");
                $('#numeroActaAlertaAvalProyecto').val("");
            }
            
            bootstrap_alert_proyecto = function () { };
            bootstrap_alert_proyecto.warning = function (message) {
                $('#alert_placeholder_proyecto').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            bootstrap_alert_proyecto.success = function (message) {
                $('#alert_placeholder_proyecto').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            bootstrap_alert_proyecto.removeWarning = function () {
                $('#alert_placeholder_proyecto').html('');
            };

         function calcularMeses() {
            var partesFechaInicio = $('#fechaInicio').val().split("/");
            var partesFechaFinalizacion = $('#fechaFinalizacion').val().split("/");
            
            var fechaInicio = new Date(partesFechaInicio[2], parseInt(partesFechaInicio[1], 10) - 1, partesFechaInicio[0]);
            var fechaFinalizacion = new Date(partesFechaFinalizacion[2], parseInt(partesFechaFinalizacion[1], 10) - 1, partesFechaFinalizacion[0]);
            
            var months;
            months = (fechaFinalizacion.getFullYear() - fechaInicio.getFullYear()) * 12;
            months -= fechaInicio.getMonth() + 1;
            months += fechaFinalizacion.getMonth();
            // edit: increment months if fechaFinalizacion comes later in its month than d1 in its month
            if (fechaFinalizacion.getDate() >= fechaInicio.getDate())
                months++
            
            // end edit
            months = months <= 0 ? 0 : months;
            $('#tiempoProyecto').val(months);
         }
        </script>
