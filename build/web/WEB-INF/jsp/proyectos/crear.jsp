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
                    <form:form method="POST" action="${pageContext.request.contextPath}/proyectos/crear" modelAttribute="proyecto">
                        <table class="tablaForm">
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
                                        <form:input path="fechaInicio" class="form-control datepicker" data-validation="required" data-validation-error-msg="Debe ingresar la fecha de inicio" readonly="true" />
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
                                <td>Ingresado SIU:</td>
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
                        <ul class="nav nav-tabs">
                          <li class="active"><a data-toggle="tab" href="#objetivosEspecificos">Objetivos Específicos</a></li>
                          <li><a data-toggle="tab" href="#compromisos">Compromisos</a></li>
                          <li><a data-toggle="tab" href="#profesores">Profesores</a></li>
                          <li><a data-toggle="tab" href="#estudiantes">Estudiantes</a></li>
                          <li><a data-toggle="tab" href="#personalExterno">Personal Externo</a></li>
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
                                                            <textarea id="objetivoEspecifico" name="objetivoEspecifico" class="form-control" rows="5"></textarea>
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
                                                        <td>
                                                            <textarea id="compromisoProyecto" name="compromisoProyecto" class="form-control"></textarea>
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
                                            <th style="width: 90%;text-align: center">Compromiso</th>
                                            <th style="width: 5%">&nbsp;</th>
                                            <th style="width: 5%">&nbsp;</th>
                                        </tr>
                                    </thead>
                                    <tbody  data-bind="foreach: { data: compromisosProyecto }">
                                        <tr class="table-row">
                                            <td style="width: 90%">
                                                <span data-bind="text: descripcion" ></span>
                                                <input type="hidden" class="form-control" data-bind="value: descripcion, attr: { 'name': 'compromisosProyecto[' + $index() + '].descripcion'  }">
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
                                                            <input type="text" class="numbersOnly form-control" id="numeroIdentificacionProfesor" name="numeroIdentificacionProfesor" />
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
                                                            <input type="text" id="nombresProfesor" name="nombresProfesor" class="form-control" />
                                                        </td>
                                                        <td>
                                                            <input type="text" id="apellidosProfesor" name="nombresProfesor" class="form-control" />
                                                        </td>                                    
                                                    </tr>
                                                    <tr>
                                                        <td>Correo electrónico:</td>
                                                        <td>Contacto:</td>                                    
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input type="email" id="correoElectronicoProfesor" name="correoElectronicoProfesor" class="form-control" />
                                                        </td>
                                                        <td>
                                                            <input type="text" id="contactoProfesor" name="contactoProfesor" class="form-control" />
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
                                                        <td>Código vinculación U. de A.:</td>
                                                        <td>Carta de cesión de derechos patrimonio:</td>
                                                    </tr>
                                                    <tr>
                                                        <td><input type="text" id="codigoVinculacionUdeAProfesor" name="codigoVinculacionUdeAProfesor" class="form-control" /></td>
                                                        <td><input type="checkbox" id="cartaCesionDerechosPatrimonioProfesor" name="cartaCesionDerechosPatrimonioProfesor" cssClass="form-control" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Porcentaje de propiedad intelectual:</td>
                                                        <td>Horas semana:</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input type="text" id="porcentajePIProfesor" name="porcentajePIProfesor" class="form-control numbersOnly" maxlength="3" />
                                                        </td>
                                                        <td>
                                                            <input type="text" id="horasSemanaProfesor" name="horasSemanaProfesor" class="form-control numbersOnly" maxlength="3" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Meses dedicados:</td>
                                                        <td>Horas semana fuera del plan:</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input type="text" id="mesesDedicadosProfesor" name="mesesDedicadosProfesor" class="form-control numbersOnly" maxlength="5" />
                                                        </td>
                                                        <td>
                                                            <input type="text" id="horasSemanaFueraPlanProfesor" name="horasSemanaFueraPlanProfesor" class="form-control numbersOnly" maxlength="3" />
                                                        </td>
                                                    </tr>                                
                                                    <tr>
                                                        <td colspan="2">Meses fuera plan</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <input type="text" id="mesesFueraPlanProfesor" name="mesesFueraPlanProfesor" class="form-control numbersOnly" maxlength="5" />
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
                                                <input type="hidden" class="form-control" data-bind="value: codigoVinculacionUdeA, attr: { 'name': 'profesoresProyecto[' + $index() + '].codigoVinculacionUdeA'  }">
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
                                                            <input type="text" class="numbersOnly form-control" id="numeroIdentificacionEstudiante" name="numeroIdentificacionEstudiante" />
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
                                                            <input type="text" id="nombresEstudiante" name="nombresEstudiante" class="form-control" />
                                                        </td>
                                                        <td>
                                                            <input type="text" id="apellidosEstudiante" name="nombresEstudiante" class="form-control" />
                                                        </td>                                    
                                                    </tr>
                                                    <tr>
                                                        <td>Correo electrónico:</td>
                                                        <td>Contacto:</td>                                    
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input type="email" id="correoElectronicoEstudiante" name="correoElectronicoEstudiante" class="form-control" />
                                                        </td>
                                                        <td>
                                                            <input type="text" id="contactoEstudiante" name="contactoEstudiante" class="form-control" />
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
                                                    <tr>
                                                        <td>Porcentaje de propiedad intelectual:</td>
                                                        <td>Horas semana:</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input type="text" id="porcentajePropiedadIntelectualEstudiante" name="porcentajePIEstudiante" class="form-control numbersOnly" maxlength="3" />
                                                        </td>
                                                        <td>
                                                            <input type="text" id="horasSemanaEstudiante" name="horasSemanaEstudiante" class="form-control numbersOnly" maxlength="3" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Meses dedicados:</td>
                                                        <td>Semestre:</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input type="text" id="mesesDedicadosEstudiante" name="mesesDedicadosEstudiante" class="form-control numbersOnly" maxlength="5" />
                                                        </td>
                                                        <td>
                                                            <input type="text" id="semestreEstudiante" name="semestreEstudiante" class="form-control numbersOnly" maxlength="2" />
                                                        </td>
                                                    </tr>                                
                                                    <tr>
                                                        <td colspan="2">Programa</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
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
                                                            <input type="text" class="numbersOnly form-control" id="numeroIdentificacionPersonalExterno" name="numeroIdentificacionPersonalExterno" />
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
                                                            <input type="text" id="nombresPersonalExterno" name="nombresPersonalExterno" class="form-control" />
                                                        </td>
                                                        <td>
                                                            <input type="text" id="apellidosPersonalExterno" name="nombresPersonalExterno" class="form-control" />
                                                        </td>                                    
                                                    </tr>
                                                    <tr>
                                                        <td>Correo electrónico:</td>
                                                        <td>Entidad:</td>                                    
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input type="email" id="correoElectronicoPersonalExterno" name="correoElectronicoPersonalExterno" class="form-control" />
                                                        </td>
                                                        <td>
                                                            <input type="text" id="entidadPersonalExterno" name="entidadPersonalExterno" class="form-control" />
                                                        </td>                                    
                                                    </tr>
                                                    <tr>
                                                        <td>Rol</td> 
                                                        <td>Porcentaje de propiedad intelectual:</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <select name="rolPersonalExterno" id="rolPersonalExterno" class="form-control">
                                                                <option value=""></option>
                                                            <c:forEach var="rol" items="${roles}">
                                                                <option value="${rol.getIdRol()}">${rol.getNombre()}</option>
                                                            </c:forEach>
                                                            </select>      
                                                        </td>
                                                        <td>
                                                            <input type="text" id="porcentajePropiedadIntelectualPersonalExterno" name="porcentajePropiedadIntelectualPersonalExterno" class="form-control numbersOnly" maxlength="3" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Horas semana:</td>
                                                        <td>Meses dedicados:</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input type="text" id="horasSemanaPersonalExterno" name="horasSemanaPersonalExterno" class="form-control numbersOnly" maxlength="3" />
                                                        </td>
                                                        <td>
                                                            <input type="text" id="mesesDedicadosPersonalExterno" name="mesesDedicadosPersonalExterno" class="form-control numbersOnly" maxlength="5" />
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
                                    </tbody
                                </table>
                            </div>
                        </div>
                        <table class='table table-hover' style='font-size:12px;'> 
                            <tr>
                                <td align="right">
                                    <a href='crear'  title='Registrar Proyecto' >
                                        <form:hidden path="idProyecto" />
                                        <c:if test = "${proyecto.getIdProyecto() == 0}">
                                            <input type="submit" value="Registrar Proyecto" class="btn-sm btn-success" />
                                        </c:if>
                                        <c:if test = "${proyecto.getIdProyecto() > 0}">
                                            <input type="submit" value="Actualizar Proyecto" class="btn-sm btn-success" />
                                        </c:if>
                                    </a> 
                                </td>
                            </tr>
                        </table>                                  
                        <input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
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
            jQuery('.numbersOnly').keyup(function () {
                this.value = this.value.replace(/[^0-9\.]/g, '');
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

            function eliminarObjetivoEspecifico() {
               proyectoModel.objetivosEspecificos.remove(objetivoEspecificoEliminar);
               $('#confirmacionEliminacionObjetivoEspecifico').modal('toggle');
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

            var ProyectoModel = function (objetivosEspecificos, profesoresProyecto, estudiantesProyecto, personalExternoProyecto, compromisosProyecto) {
                self = this;

                self.objetivosEspecificos = ko.observableArray(objetivosEspecificos);
                self.adicionarObjetivoEspecifico = function () {
                    if ($('#objetivoEspecifico').val() == "") {
                        bootstrap_alert_objetivosEspecificos.warning('Debe ingresar el objetivo específico');
                        return false;
                    }
                    $('#objetivosEspecificosModal').modal('toggle');
                    bootstrap_alert_objetivosEspecificos.removeWarning();
                    if($('#consecutivo').val() == "") {
                        self.objetivosEspecificos.push({
                            idObjetivoEspecifico: ko.observable(0),
                            consecutivo: ko.observable(self.objetivosEspecificos().length + 1),
                            descripcion: ko.observable($('#objetivoEspecifico').val())
                        });
                    } else {
                        var consecutivo = parseInt($('#consecutivo').val(), 10);
                        var indice = 0;
                        for(i = 0; i < self.objetivosEspecificos().length; i++) {
                           if(self.objetivosEspecificos()[i].consecutivo() == consecutivo){
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
                    $('#confirmacionEliminacionObjetivoEspecifico').modal('show');                    
                };
                self.editarObjetivoEspecifico = function (objetivoEspecifico) {
                    $('#objetivoEspecifico').val(objetivoEspecifico.descripcion());
                    $('#consecutivo').val(objetivoEspecifico.consecutivo());
                    $('#objetivosEspecificosModal').modal('show'); 
                };

                self.compromisosProyecto = ko.observableArray(compromisosProyecto);
                self.adicionarCompromisoProyecto = function () {
                    if ($('#compromisoProyecto').val() == "") {
                        bootstrap_alert_compromisos_proyecto.warning('Debe ingresar el compromiso');
                        return false;
                    }
                    $('#compromisosProyectoModal').modal('toggle');
                    bootstrap_alert_compromisos_proyecto.removeWarning();
                    if($('#consecutivo').val() == "") {
                        self.compromisosProyecto.push({
                            idCompromisoProyecto: ko.observable(0),
                            consecutivo: ko.observable(self.compromisosProyecto().length + 1),
                            descripcion: ko.observable($('#compromisoProyecto').val())
                        });
                    } else {
                        var consecutivo = parseInt($('#consecutivo').val(), 10);
                        var indice = 0;
                        for(i = 0; i < self.compromisosProyecto().length; i++) {
                           if(self.compromisosProyecto()[i].consecutivo() == consecutivo){
                              indice = i; 
                              break;
                           }
                        }
                        self.compromisosProyecto()[indice].descripcion($('#compromisoProyecto').val());
                    }
                    
                    limpiarDatosVentanaCompromisoProyecto();
                };
                self.eliminarCompromisoProyecto = function (compromisoProyecto) {
                    compromisoProyectoEliminar = compromisoProyecto;
                    $('#confirmacionEliminacionCompromisoProyecto').modal('show');                    
                };
                self.editarCompromisoProyecto = function (compromisoProyecto) {
                    $('#compromisoProyecto').val(compromisoProyecto.descripcion());
                    $('#consecutivo').val(compromisoProyecto.consecutivo());
                    $('#compromisosProyectoModal').modal('show'); 
                };

                self.profesoresProyecto = ko.observableArray(profesoresProyecto);
                self.adicionarProfesorProyecto = function () {
                    if ($('#tipoIdentificacionProfesor').val() == "") {
                        bootstrap_alert_profesores_proyecto.warning('Debe seleccionar el tipo de identificación');
                        return false;
                    }
                    if ($('#numeroIdentificacionProfesor').val() == "") {
                        bootstrap_alert_profesores_proyecto.warning('Debe ingresar el número de identificación');
                        return false;
                    }
                    if ($('#nombresProfesor').val() == "") {
                        bootstrap_alert_profesores_proyecto.warning('Debe ingresar los nombres');
                        return false;
                    }
                    if ($('#apellidosProfesor').val() == "") {
                        bootstrap_alert_profesores_proyecto.warning('Debe ingresar los apellidos');
                        return false;
                    }                    
                    if ($('#correoElectronicoProfesor').val() == "") {
                        bootstrap_alert_profesores_proyecto.warning('Debe ingresar el correo electrónico');
                        return false;
                    }                    
                    if ($('#contactoProfesor').val() == "") {
                        bootstrap_alert_profesores_proyecto.warning('Debe ingresar el contacto');
                        return false;
                    }                    
                    if ($('#facultadProfesor').val() == "") {
                        bootstrap_alert_profesores_proyecto.warning('Debe seleccionar la facultad');
                        return false;
                    }
                    if ($('#rolProfesor').val() == "") {
                        bootstrap_alert_profesores_proyecto.warning('Debe seleccionar el rol');
                        return false;
                    }
                    if ($('#codigoVinculacionUdeAProfesor').val() == "") {
                        bootstrap_alert_profesores_proyecto.warning('Debe ingresar el código de vinculación a la U de A');
                        return false;
                    }
                    if ($('#porcentajePIProfesor').val() == "") {
                        bootstrap_alert_profesores_proyecto.warning('Debe ingresar el porcentaje de propiedad intelectual');
                        return false;
                    }
                    if ($('#horasSemanaProfesor').val() == "") {
                        bootstrap_alert_profesores_proyecto.warning('Debe ingresar las horas semanales');
                        return false;
                    }
                    if ($('#mesesDedicadosProfesor').val() == "") {
                        bootstrap_alert_profesores_proyecto.warning('Debe ingresar los meses dedicados');
                        return false;
                    }
                    
                    if($('#consecutivo').val() == "") {
                        
                        for(i = 0; i < self.profesoresProyecto().length; i++) {
                            if(self.profesoresProyecto()[i].idTipoIdentificacion() == $('#tipoIdentificacionProfesor').val() && 
                               self.profesoresProyecto()[i].numeroIdentificacion() == $('#numeroIdentificacionProfesor').val()) {
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
                            codigoVinculacionUdeA: ko.observable($('#codigoVinculacionUdeAProfesor').val()),
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
                                if(self.profesoresProyecto()[i].consecutivo() == consecutivo){
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
                            self.profesoresProyecto()[indice].codigoVinculacionUdeA( $('#codigoVinculacionUdeAProfesor').val());
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
                    $('#confirmacionEliminacionProfesorProyecto').modal('show');                    
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
                    $('#codigoVinculacionUdeAProfesor').val(profesorProyecto.codigoVinculacionUdeA());
                    $('#cartaCesionDerechosPatrimonioProfesor').prop('checked', profesorProyecto.cartaCesionDerechosPatrimonio());
                    $('#porcentajePIProfesor').val(profesorProyecto.porcentajePI());
                    $('#horasSemanaProfesor').val(profesorProyecto.horasSemana());
                    $('#mesesDedicadosProfesor').val(profesorProyecto.mesesDedicados());
                    $('#horasSemanaFueraPlanProfesor').val(profesorProyecto.horasSemanaFueraPlan());
                    $('#mesesFueraPlanProfesor').val(profesorProyecto.mesesFueraPlan());
                    
                    $('#profesorProyectoModal').modal('show');
                };

                self.estudiantesProyecto = ko.observableArray(estudiantesProyecto);
                self.adicionarEstudianteProyecto = function () {
                    if ($('#tipoIdentificacionEstudiante').val() == "") {
                        bootstrap_alert_estudiantes_proyecto.warning('Debe seleccionar el tipo de identificación');
                        return false;
                    }
                    if ($('#numeroIdentificacionEstudiante').val() == "") {
                        bootstrap_alert_estudiantes_proyecto.warning('Debe ingresar el número de identificación');
                        return false;
                    }
                    if ($('#nombresEstudiante').val() == "") {
                        bootstrap_alert_estudiantes_proyecto.warning('Debe ingresar los nombres');
                        return false;
                    }
                    if ($('#apellidosEstudiante').val() == "") {
                        bootstrap_alert_estudiantes_proyecto.warning('Debe ingresar los apellidos');
                        return false;
                    }                    
                    if ($('#correoElectronicoEstudiante').val() == "") {
                        bootstrap_alert_estudiantes_proyecto.warning('Debe ingresar el correo electrónico');
                        return false;
                    }                    
                    if ($('#contactoEstudiante').val() == "") {
                        bootstrap_alert_estudiantes_proyecto.warning('Debe ingresar el contacto');
                        return false;
                    }                    
                    if ($('#tipoEstudiante').val() == "") {
                        bootstrap_alert_estudiantes_proyecto.warning('Debe seleccionar el tipo de estudiante');
                        return false;
                    }
                    if ($('#programaEstudiante').val() == "") {
                        bootstrap_alert_estudiantes_proyecto.warning('Debe seleccionar el programa');
                        return false;
                    }
                    if ($('#rolEstudiante').val() == "") {
                        bootstrap_alert_estudiantes_proyecto.warning('Debe seleccionar el rol');
                        return false;
                    }
                    if ($('#porcentajePropiedadIntelectualEstudiante').val() == "") {
                        bootstrap_alert_estudiantes_proyecto.warning('Debe ingresar el porcentaje de propiedad intelectual');
                        return false;
                    }
                    if ($('#horasSemanaEstudiante').val() == "") {
                        bootstrap_alert_estudiantes_proyecto.warning('Debe ingresar las horas semanales');
                        return false;
                    }
                    if ($('#mesesDedicadosEstudiante').val() == "") {
                        bootstrap_alert_estudiantes_proyecto.warning('Debe ingresar los meses dedicados');
                        return false;
                    }
                    
                    if($('#consecutivo').val() == "") {
                        
                        for(i = 0; i < self.estudiantesProyecto().length; i++) {
                            if(self.estudiantesProyecto()[i].idTipoIdentificacion() == $('#tipoIdentificacionEstudiante').val() && 
                               self.estudiantesProyecto()[i].numeroIdentificacion() == $('#numeroIdentificacionEstudiante').val()) {
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
                                if(self.estudiantesProyecto()[i].consecutivo() == consecutivo){
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
                    $('#confirmacionEliminacionEstudianteProyecto').modal('show');                    
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
                    
                    $('#estudianteProyectoModal').modal('show');
                };

                self.personalExternoProyecto = ko.observableArray(personalExternoProyecto);
                self.adicionarPersonalExternoProyecto = function () {
                    if ($('#tipoIdentificacionPersonalExterno').val() == "") {
                        bootstrap_alert_personalExternoProyecto.warning('Debe seleccionar el tipo de identificación');
                        return false;
                    }
                    if ($('#numeroIdentificacionPersonalExterno').val() == "") {
                        bootstrap_alert_personalExterno_proyecto.warning('Debe ingresar el número de identificación');
                        return false;
                    }
                    if ($('#nombresPersonalExterno').val() == "") {
                        bootstrap_alert_personalExterno_proyecto.warning('Debe ingresar los nombres');
                        return false;
                    }
                    if ($('#apellidosPersonalExterno').val() == "") {
                        bootstrap_alert_personalExterno_proyecto.warning('Debe ingresar los apellidos');
                        return false;
                    }                    
                    if ($('#correoElectronicoPersonalExterno').val() == "") {
                        bootstrap_alert_personalExterno_proyecto.warning('Debe ingresar el correo electrónico');
                        return false;
                    }                    
                    if ($('#entidadPersonalExterno').val() == "") {
                        bootstrap_alert_personalExterno_proyecto.warning('Debe ingresar la entidad');
                        return false;
                    }                    
                    if ($('#rolPersonalExterno').val() == "") {
                        bootstrap_alert_personalExterno_proyecto.warning('Debe seleccionar el rol');
                        return false;
                    }
                    if ($('#porcentajePropiedadIntelectualPersonalExterno').val() == "") {
                        bootstrap_alert_personalExterno_proyecto.warning('Debe ingresar el porcentaje de propiedad intelectual');
                        return false;
                    }
                    if ($('#horasSemanaPersonalExterno').val() == "") {
                        bootstrap_alert_personalExterno_proyecto.warning('Debe ingresar las horas semanales');
                        return false;
                    }
                    if ($('#mesesDedicadosPersonalExterno').val() == "") {
                        bootstrap_alert_personalExterno_proyecto.warning('Debe ingresar los meses dedicados');
                        return false;
                    }
                    
                    if($('#consecutivo').val() == "") {
                        
                        for(i = 0; i < self.personalExternoProyecto().length; i++) {
                            if(self.personalExternoProyecto()[i].idTipoIdentificacion() == $('#tipoIdentificacionPersonalExterno').val() && 
                               self.personalExternoProyecto()[i].numeroIdentificacion() == $('#numeroIdentificacionPersonalExterno').val()) {
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
                                if(self.personalExternoProyecto()[i].consecutivo() == consecutivo){
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
                    $('#confirmacionEliminacionPersonalExternoProyecto').modal('show');                    
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
                    
                    $('#personalExternoProyectoModal').modal('show');
                };
            };

            var objetivosEspecificos = new Array();
            var profesoresProyecto = new Array();   
            var estudiantesProyecto = new Array();
            var personalExternoProyecto = new Array();
            var compromisosProyecto = new Array();

            var objetivoEspecificoEliminar = null;
            var profesorProyectoEliminar = null;
            var estudianteProyectoEliminar = null;
            var personalExternoProyectoEliminar = null;
            var compromisoProyectoEliminar = null;

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
                
            var proyectoModel = new ProyectoModel(objetivosEspecificos, profesoresProyecto, estudiantesProyecto, personalExternoProyecto, compromisosProyecto);
            ko.applyBindings(proyectoModel);

            bootstrap_alert_objetivosEspecificos = function () { };
            bootstrap_alert_objetivosEspecificos.warning = function (message) {
                $('#alert_placeholder_objetivosEspecificos').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            bootstrap_alert_objetivosEspecificos.removeWarning = function () {
                $('#alert_placeholder_objetivosEspecificos').html('');
            };
            function mostrarVentanaNuevoObjetivoEspecifico() {
                limpiarDatosVentanaObjetivoEspecifico();
                $('#objetivosEspecificosModal').modal('show'); 
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
                $('#compromisosProyectoModal').modal('show'); 
            }
            function limpiarDatosVentanaCompromisoProyecto() {
                $('#compromisoProyecto').val("");
                $('#consecutivo').val("");
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
                $('#profesorProyectoModal').modal('show'); 
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
                $('#codigoVinculacionUdeAProfesor').val("");
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

                if(tipoIdentificacion != "" && numeroIdentificacion != ""){
                      $.ajax({
                        type: "POST",
                        url: "${pageContext.request.contextPath}/proyectos/buscarProfesor",
                        data: "idTipoIdentificacion=" + tipoIdentificacion + "&numeroIdentificacion=" + numeroIdentificacion,
                        beforeSend: function(xhr){
                           xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                        },                        
                        success: function(response){
                           if(response != "") {
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
                    if ($('#tipoIdentificacionProfesor').val() == "") {
                        bootstrap_alert_profesores_proyecto.warning('Debe seleccionar el tipo de identificación');
                        return false;
                    }
                    if ($('#numeroIdentificacionProfesor').val() == "") {
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
                $('#estudianteProyectoModal').modal('show'); 
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

                if(tipoIdentificacion != "" && numeroIdentificacion != ""){
                      $.ajax({
                        type: "POST",
                        url: "${pageContext.request.contextPath}/proyectos/buscarEstudiante",
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
                    if ($('#tipoIdentificacionEstudiante').val() == "") {
                        bootstrap_alert_estudiantes_proyecto.warning('Debe seleccionar el tipo de identificación');
                        return false;
                    }
                    if ($('#numeroIdentificacionEstudiante').val() == "") {
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
                $('#personalExternoProyectoModal').modal('show'); 
            }
            function limpiarDatosVentanaPersonalExternoProyecto() {
                $('#consecutivo').val("");
                $('#tipoIdentificacionPersonalExterno').val("");
                $('#descripcionTipoIdentificacionPersonalExterno').val("");
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
                        url: "${pageContext.request.contextPath}/proyectos/buscarPersonalExterno",
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
                    if ($('#tipoIdentificacionPersonalExterno').val() == "") {
                        bootstrap_alert_personalExterno_proyecto.warning('Debe seleccionar el tipo de identificación');
                        return false;
                    }
                    if ($('#numeroIdentificacionPersonalExterno').val() == "") {
                        bootstrap_alert_personalExterno_proyecto.warning('Debe ingresar el número de identificación');
                        return false;
                    }
                }
           }
        </script>
