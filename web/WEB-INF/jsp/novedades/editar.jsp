<%-- 
    Document   : editar
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
                <div class="panel-heading">Novedades Proyecto</div>
                <div class="panel-body">
                    <table class="table table-hover tablaForm">
                        <tr>
                            <td width="33%"><strong>C&oacute;digo:</strong> ${proyecto.getCodigo()}</td>
                            <td width="33%"><strong>Nombre corto:</strong> ${proyecto.getNombreCortoProyecto()}</td>
                            <td width="33%"><strong>Convocatoria:</strong> ${proyecto.getConvocatoria()}</td>
                        </tr>
                        <tr>
                           <td colspan="3"><strong>Nombre completo proyecto:</strong> ${proyecto.getNombreCompletoProyecto()}</td>
                        </tr>
                        <tr>
                            <td><strong>Fecha de inicio:</strong> ${proyecto.getFechaInicio()}</td>
                            <td><strong>Fecha de finalizaci&oacute;n:</strong> ${proyecto.getFechaFinalizacion()}</td>
                            <td><strong>Area tem&aacute;tica:</strong> ${proyecto.getAreaTematica()}</td>
                        </tr>
                        <tr>
                            <td><strong>Ingresado SIGEP:</strong>                                
                                <c:if test="${proyecto.isIngresadoSIGEP() == true}">
                                    Sí
                                </c:if>
                                <c:if test="${proyecto.isIngresadoSIGEP() == false}">
                                    No
                                </c:if>
                            </td>
                            <td><strong>Ingresado SIIU:</strong>
                                <c:if test="${proyecto.isIngresadoSIIU() == true}">
                                    Sí
                                </c:if>
                                <c:if test="${proyecto.isIngresadoSIIU() == false}">
                                    No
                                </c:if>
                            </td>
                            <td><strong>Ingresado SIU:</strong>
                                <c:if test="${proyecto.isIngresadoSIU() == true}">
                                    Sí
                                </c:if>
                                <c:if test="${proyecto.isIngresadoSIU() == false}">
                                    No
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Fecha ingresado SIGEP:</<strong> ${proyecto.getFechaIngresadoSIGEP()}</td>
                            <td><strong>C&oacute;digo SIIU:</strong> ${proyecto.getCodigoSIIU()}</td>
                            <td><strong>C&oacute;digo SIU:</strong> ${proyecto.getCodigoSIU()}</td>
                        </tr>
                        <tr>
                            <td><strong>C&oacute;digo COLCIENCIAS:</strong> ${proyecto.getCodigoCOLCIENCIAS()}</td>
                            <td><strong>Participaci&oacute;n internacional:</strong> 
                                <c:if test="${proyecto.isParticipacionInternacional() == true}">
                                    Sí
                                </c:if>
                                <c:if test="${proyecto.isParticipacionInternacional() == false}">
                                    No
                                </c:if>                            
                            </td>
                            <td><strong>Tipo de proyecto:</strong> ${proyecto.getTipoProyecto()}</td>
                        </tr>
                        <tr>
                            <td><strong>Tipo de contrato:</strong> ${proyecto.getTipoContrato()}</td>
                            <td><strong>Enfoque metodol&oacute;gico:</strong> ${proyecto.getEnfoqueMetodologico()}</td>
                            <td><strong>Riesgo &eacute;tico:</strong> ${proyecto.getRiesgoEtico()}</td>
                        </tr>
                        <tr>
                            <td><strong>Estado:</strong> ${proyecto.getEstado()}</td>
                            <td colspan="2"><strong>Objetivo general:</strong> ${proyecto.getObjetivoGeneral()}</td>
                        </tr>
                    </table>
                    <ul class="nav nav-tabs">
                          <li class="active"><a data-toggle="tab" href="#actasTab">Actas</a></li>
                          <li><a data-toggle="tab" href="#adendasCambioTab">Adenda Cambio</a></li>
                          <li><a data-toggle="tab" href="#adendasIngresoTab">Adenda Ingreso</a></li>
                          <li><a data-toggle="tab" href="#adendasRetiroTab">Adenda Retiro</a></li>
                          <li><a data-toggle="tab" href="#adicionesTab">Adiciones</a></li>
                          <li><a data-toggle="tab" href="#prorrogasTab">Prórrogas</a></li>
                          <li><a data-toggle="tab" href="#plazosTab">Plazos</a></li>
                          <li><a data-toggle="tab" href="#cumplimientoCompromisosProyectoTab">Compromisos</a></li>
                          <li><a data-toggle="tab" href="#compromisosHomologadosProyectoTab">Homologaciones</a></li>
                          <li><a data-toggle="tab" href="#cumplimientoAlertasAvalProyectoTab">Alertas aval</a></li>
                    </ul>
                    <div class="tab-content">
                        <div id="actasTab" class="tab-pane fade in active">                            
                            <div class="alert alert-info" style="margin-top:20px;">
                                <strong>Actas</strong>
                                <button class="btn btn-dark" onclick="mostrarVentanaNuevaActa(); return false;">
                                    <i class="glyphicon glyphicon-plus"></i>
                                </button>                            
                            </div>
                            <div id="alert_placeholder_actas"></div>
                            <table class="table table-hover tablaForm" style="width: 90%" align="center" >
                                <thead>          
                                    <tr class="table-row">
                                        <td style="width: 20%;text-align: center"><strong>Tipo</strong></td>
                                        <td style="width: 20%;text-align: center"><strong>Número</strong></td>
                                        <td style="width: 15%;text-align: center"><strong>Fecha</strong></td>
                                        <td style="width: 30%;text-align: center"><strong>Observaciones</strong></td>
                                        <td style="width: 5%">&nbsp;</td>
                                        <td style="width: 5%">&nbsp;</td>
                                        <td style="width: 5%">&nbsp;</td>
                                    </tr>
                                </thead>
                                <tbody data-bind="foreach: { data: actas }">
                                    <tr class="table-row">
                                    <td style="width: 20%">
                                        <span data-bind="text: descripcionTipoActa" ></span>
                                    </td>
                                    <td style="width: 20%">
                                        <span data-bind="text: numero" ></span>
                                    </td>
                                    <td style="width: 15%">
                                        <span data-bind="text: fechaFormateada" ></span>
                                    </td>
                                    <td style="width: 30%">
                                        <span data-bind="text: observaciones" ></span>
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
                                    </td>
                                    <td style="width: 5%">
                                        <button class="btn btn-dark" data-bind="click: $root.editarActa" title="Editar acta">
                                            <i class="glyphicon glyphicon-edit"></i>
                                        </button>
                                    </td>
                                </tr>
                                </tbody>
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
                                                <table class="tablaForm">
                                                    <tr>
                                                        <td>Tipo</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <select name="idTipoActa" id="idTipoActa" class="form-control">
                                                                <option value=""></option>
                                                            <c:forEach var="tipoActa" items="${tiposActa}">
                                                                <option value="${tipoActa.getIdTipoActa()}">${tipoActa.getNombre()}</option>
                                                            </c:forEach>
                                                            </select>      
                                                        </td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td>Número</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input id="numeroActa" name="numeroActa" class="form-control" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Fecha</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="input-group date">
                                                                <input id="fechaActa" name="fechaActa" class="form-control datepicker" readonly="true" />
                                                                <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                                            </div>                                                        
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
                                            <input type="hidden" id="idActa" name="idActa" value="0"/>
                                            <input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                            <input type="hidden" id="idProyecto" name="idProyecto" value="${proyecto.getIdProyecto()}" />
                                        </form:form>
                                    </div>
                                </div>  
                            </div>    
                        </div>
                        <div id="adendasCambioTab" class="tab-pane fade">
                            <div class="alert alert-info" style="margin-top:20px;">
                                <strong>Adendas de Cambio</strong>
                                <button class="btn btn-dark" onclick="mostrarVentanaNuevaAdendaCambio(); return false;">
                                    <i class="glyphicon glyphicon-plus"></i>
                                </button>                            
                            </div>
                            <div id="alert_placeholder_adendas_cambio"></div>
                            <table class="table table-hover tablaForm" style="width: 90%" align="center" >
                              <thead>
                                <tr class="table-row">
                                    <td style="width: 5%;text-align: center"><strong>Tipo persona</strong></td>
                                    <td style="width: 20%;text-align: center"><strong>Tipo de identificación nueva persona</strong></td>
                                    <td style="width: 15%;text-align: center"><strong>Número de identificación nueva persona</strong></td>
                                    <td style="width: 15%;text-align: center"><strong>Nombres nueva persona</strong></td>
                                    <td style="width: 15%;text-align: center"><strong>Apellidos nueva persona</strong></td>
                                    <td style="width: 10%;text-align: center"><strong>Rol</strong></td>
                                    <td style="width: 5%;text-align: center"><strong>Fecha de cambio</strong></td>
                                    <td style="width: 5%">&nbsp;</td>
                                    <td style="width: 5%">&nbsp;</td>
                                    <td style="width: 5%">&nbsp;</td>
                                </tr>
                              </thead>
                              <tbody data-bind="foreach: { data: adendasCambio }">
                                <tr class="table-row">
                                    <td style="width: 5%">
                                        <span data-bind="text: nombreTipoPersona" ></span>
                                    </td>
                                    <td style="width: 20%">
                                        <span data-bind="text: nombreTipoIdentificacionPersona" ></span>
                                    </td>
                                    <td style="width: 15%">
                                        <span data-bind="text: numeroIdentificacionPersona" ></span>
                                    </td>
                                    <td style="width: 15%">
                                        <span data-bind="text: nombresPersona" ></span>
                                    </td>
                                    <td style="width: 15%">
                                        <span data-bind="text: apellidosPersona" ></span>
                                    </td>
                                    <td style="width: 10%">
                                        <span data-bind="text: nombreRol" ></span>
                                    </td>
                                    <td style="width: 5%">
                                        <span data-bind="text: fechaCambioFormateada" ></span>
                                    </td>
                                    <td style="width: 5%">
                                        <button class="btn btn-dark" data-bind="click: $root.verDocumentoAdendaCambio" title="Ver adenda">
                                            <i class="glyphicon glyphicon-download-alt"></i>
                                        </button>
                                    </td>
                                    <td style="width: 5%">
                                        <button class="btn btn-dark" data-bind="click: $root.eliminarAdendaCambio" title="Eliminar adenda">
                                            <i class="glyphicon glyphicon-trash"></i>
                                        </button>
                                    </td>
                                    <td style="width: 5%">
                                        <button class="btn btn-dark" data-bind="click: $root.editarAdendaCambio" title="Editar adenda">
                                            <i class="glyphicon glyphicon-edit"></i>
                                        </button>
                                    </td>
                                </tr>
                              </tbody>
                            </table>
                            <div class="modal fade" id="confirmacionEliminacionAdendaCambio" tabindex="-1" role="dialog" aria-labelledby="adendaCambioModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <div class="alert alert-info">
                                                <strong>Eliminar Adenda</strong>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="modal-body">
                                            ¿Está seguro de eliminar la adenda?
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                            <a class="btn btn-danger btn-ok" onclick="eliminarAdendaCambio();">Eliminar</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal fade" id="adendaCambioModal" tabindex="-1" role="dialog" aria-labelledby="adendaCambioModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <form:form method="POST" action="${pageContext.request.contextPath}/novedades/adendaCambio" modelAttribute="adendaCambioProyecto" enctype="multipart/form-data">
                                            <div class="modal-header">
                                                <div class="alert alert-info">
                                                    <strong>Adenda de Cambio</strong>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="modal-body">
                                                <div id="alert_placeholder_adenda_cambio"></div>
                                                <table class="tablaForm">
                                                    <tr>
                                                        <td colspan="3">Tipo persona</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3">
                                                            <select name="tipoPersonaAdendaCambio" id="tipoPersonaAdendaCambio" class="form-control">
                                                                <option value=""></option>
                                                            <c:forEach var="tipoPersona" items="${tiposPersona}">
                                                                <option value="${tipoPersona.getIdTipoPersona()}">${tipoPersona.getNombre()}</option>
                                                            </c:forEach>
                                                            </select>    
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="45%">Tipo identificación persona anterior:</td>
                                                        <td width="45%">Número identificación persona anterior:</td>
                                                        <td width="10%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <select name="tipoIdentificacionPersonaAnteriorAdendaCambio" id="tipoIdentificacionPersonaAnteriorAdendaCambio" class="form-control">
                                                                <option value=""></option>
                                                            <c:forEach var="tipoIdentificacion" items="${tiposIdentificacion}">
                                                                <option value="${tipoIdentificacion.getIdTipoIdentificacion()}">${tipoIdentificacion.getNombre()}</option>
                                                            </c:forEach>
                                                            </select>    
                                                        </td>
                                                        <td>
                                                            <input type="text" class="numbersOnly form-control" id="numeroIdentificacionPersonaAnteriorAdendaCambio" name="numeroIdentificacionPersonaAnteriorAdendaCambio" maxlength="20"/>
                                                        </td>
                                                        <td>
                                                            <div class="btn-group">
                                                                <button class="btn btn-dark" onclick="buscarPersonaAnteriorAdendaCambio(); return false;">
                                                                    <i class="glyphicon glyphicon-search"></i>
                                                                </button>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <table class="tablaForm">
                                                    <tr>
                                                        <td>Nombres persona anterior:</td>
                                                        <td>Apellidos persona anterior:</td>                                    
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input type="text" id="nombresPersonaAnteriorAdendaCambio" name="nombresPersonaAnteriorAdendaCambio" class="form-control" readonly />
                                                        </td>
                                                        <td>
                                                            <input type="text" id="apellidosPersonaAnteriorAdendaCambio" name="apellidosPersonaAnteriorAdendaCambio" class="form-control" readonly />
                                                        </td>                                    
                                                    </tr>                                                        
                                                </table>
                                                <table class="tablaForm">
                                                    <tr>
                                                        <td width="45%">Tipo identificación nueva persona:</td>
                                                        <td width="45%">Número identificación nueva persona:</td>
                                                        <td width="10%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <select name="tipoIdentificacionPersonaAdendaCambio" id="tipoIdentificacionPersonaAdendaCambio" class="form-control">
                                                                <option value=""></option>
                                                            <c:forEach var="tipoIdentificacion" items="${tiposIdentificacion}">
                                                                <option value="${tipoIdentificacion.getIdTipoIdentificacion()}">${tipoIdentificacion.getNombre()}</option>
                                                            </c:forEach>
                                                            </select>    
                                                        </td>
                                                        <td>
                                                            <input type="text" class="numbersOnly form-control" id="numeroIdentificacionPersonaAdendaCambio" name="numeroIdentificacionPersonaAdendaCambio" maxlength="20"/>
                                                        </td>
                                                        <td>
                                                            <div class="btn-group">
                                                                <button class="btn btn-dark" onclick="buscarPersonaAdendaCambio(); return false;">
                                                                    <i class="glyphicon glyphicon-search"></i>
                                                                </button>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <table class="tablaForm">
                                                    <tr>
                                                        <td>Nombres nueva persona:</td>
                                                        <td>Apellidos nueva persona:</td>                                    
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input type="text" id="nombresPersonaAdendaCambio" name="nombresPersonaAdendaCambio" class="form-control" readonly />
                                                        </td>
                                                        <td>
                                                            <input type="text" id="apellidosPersonaAdendaCambio" name="apellidosPersonaAdendaCambio" class="form-control" readonly />
                                                        </td>                                    
                                                    </tr>                                                        
                                                    <tr>
                                                        <td>Fecha de cambio</td>                                                        
                                                        <td>Rol</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="input-group date">
                                                                <input id="fechaAdendaCambio" name="fechaAdendaCambio" class="form-control datepicker" readonly="true" />
                                                                <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                                            </div>                                                        
                                                        </td>
                                                        <td>
                                                            <select name="rolAdendaCambio" id="rolAdendaCambio" class="form-control">
                                                                <option value=""></option>
                                                            <c:forEach var="rol" items="${roles}">
                                                                <option value="${rol.getIdRol()}">${rol.getNombre()}</option>
                                                            </c:forEach>
                                                            </select>      
                                                        </td>                                                        
                                                    </tr>                                                    
                                                    <tr>
                                                        <td>Fecha acta</td>                                                        
                                                        <td>Número acta</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="input-group date">
                                                                <input id="fechaActaAdendaCambio" name="fechaActaAdendaCambio" class="form-control datepicker" readonly="true" />
                                                                <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                                            </div>                                                        
                                                        </td>
                                                        <td>
                                                            <input type="text" class="form-control" id="numeroActaAdendaCambio" name="numeroActaAdendaCambio" maxlength="45" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">Documento</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <input type="file" id="documentoAdendaCambio" name="documentoAdendaCambio" class="form-control" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">Observaciones</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <textarea id="observacionesAdendaCambio" name="observacionesAdendaCambio" class="form-control" rows="3"></textarea>
                                                        </td>
                                                    </tr>                                                    
                                                </table>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                                <button type="submit" class="btn btn-primary">Aceptar</button>
                                            </div>   
                                            <input type="hidden" id="idAdendaCambio" name="idAdendaCambio" value="0"/>
                                            <input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                            <input type="hidden" id="idProyecto" name="idProyecto" value="${proyecto.getIdProyecto()}" />
                                        </form:form>
                                    </div>
                                </div>  
                            </div>    
                        </div>     
                        <div id="adendasIngresoTab" class="tab-pane fade">
                            <div class="alert alert-info" style="margin-top:20px;">
                                <strong>Adendas de Ingreso</strong>
                                <button class="btn btn-dark" onclick="mostrarVentanaNuevaAdendaIngreso(); return false;">
                                    <i class="glyphicon glyphicon-plus"></i>
                                </button>                            
                            </div>
                            <div id="alert_placeholder_adendas_ingreso"></div>
                            <table class="table table-hover tablaForm" style="width: 90%" align="center" >
                              <thead>
                                <tr class="table-row">
                                    <td style="width: 10%;text-align: center"><strong>Tipo persona</strong></td>
                                    <td style="width: 15%;text-align: center"><strong>Tipo de identificación</strong></td>
                                    <td style="width: 10%;text-align: center"><strong>Número de identificación</strong></td>
                                    <td style="width: 20%;text-align: center"><strong>Nombres</strong></td>
                                    <td style="width: 20%;text-align: center"><strong>Apellidos</strong></td>
                                    <td style="width: 10%;text-align: center"><strong>Fecha de ingreso</strong></td>
                                    <td style="width: 5%">&nbsp;</td>
                                    <td style="width: 5%">&nbsp;</td>
                                    <td style="width: 5%">&nbsp;</td>
                                </tr>
                              </thead>
                              <tbody data-bind="foreach: { data: adendasIngreso }">
                                <tr class="table-row">
                                    <td style="width: 15%">
                                        <span data-bind="text: nombreTipoPersona" ></span>
                                    </td>
                                    <td style="width: 15%">
                                        <span data-bind="text: nombreTipoIdentificacionPersona" ></span>
                                    </td>
                                    <td style="width: 10%">
                                        <span data-bind="text: numeroIdentificacionPersona" ></span>
                                    </td>
                                    <td style="width: 20%">
                                        <span data-bind="text: nombresPersona" ></span>
                                    </td>
                                    <td style="width: 20%">
                                        <span data-bind="text: apellidosPersona" ></span>
                                    </td>
                                    <td style="width: 15%">
                                        <span data-bind="text: fechaIngresoFormateada" ></span>
                                    </td>
                                    <td style="width: 5%">
                                        <button class="btn btn-dark" data-bind="click: $root.verDocumentoAdendaIngreso" title="Ver adenda">
                                            <i class="glyphicon glyphicon-download-alt"></i>
                                        </button>
                                    </td>
                                    <td style="width: 5%">
                                        <button class="btn btn-dark" data-bind="click: $root.eliminarAdendaIngreso" title="Eliminar adenda">
                                            <i class="glyphicon glyphicon-trash"></i>
                                        </button>
                                    </td>
                                    <td style="width: 5%">
                                        <button class="btn btn-dark" data-bind="click: $root.editarAdendaIngreso" title="Editar adenda">
                                            <i class="glyphicon glyphicon-edit"></i>
                                        </button>
                                    </td>
                                </tr>
                              </tbody>
                            </table>
                            <div class="modal fade" id="confirmacionEliminacionAdendaIngreso" tabindex="-1" role="dialog" aria-labelledby="adendaIngresoModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <div class="alert alert-info">
                                                <strong>Eliminar Adenda</strong>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="modal-body">
                                            ¿Está seguro de eliminar la adenda?
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                            <a class="btn btn-danger btn-ok" onclick="eliminarAdendaIngreso();">Eliminar</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal fade" id="adendaIngresoModal" tabindex="-1" role="dialog" aria-labelledby="adendaIngresoModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <form:form method="POST" action="${pageContext.request.contextPath}/novedades/adendaIngreso" modelAttribute="adendaIngresoProyecto" enctype="multipart/form-data">
                                            <div class="modal-header">
                                                <div class="alert alert-info">
                                                    <strong>Adenda de Ingreso</strong>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="modal-body">
                                                <div id="alert_placeholder_adenda_ingreso"></div>
                                                <table class="tablaForm">
                                                    <tr>
                                                        <td colspan="3">Tipo persona</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3">
                                                            <select name="tipoPersonaAdendaIngreso" id="tipoPersonaAdendaIngreso" class="form-control">
                                                                <option value=""></option>
                                                            <c:forEach var="tipoPersona" items="${tiposPersona}">
                                                                <option value="${tipoPersona.getIdTipoPersona()}">${tipoPersona.getNombre()}</option>
                                                            </c:forEach>
                                                            </select>    
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="45%">Tipo de identificación:</td>
                                                        <td width="45%">Número de identificación:</td>
                                                        <td width="10%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <select name="tipoIdentificacionPersonaAdendaIngreso" id="tipoIdentificacionPersonaAdendaIngreso" class="form-control">
                                                                <option value=""></option>
                                                            <c:forEach var="tipoIdentificacion" items="${tiposIdentificacion}">
                                                                <option value="${tipoIdentificacion.getIdTipoIdentificacion()}">${tipoIdentificacion.getNombre()}</option>
                                                            </c:forEach>
                                                            </select>    
                                                        </td>
                                                        <td>
                                                            <input type="text" class="numbersOnly form-control" id="numeroIdentificacionPersonaAdendaIngreso" name="numeroIdentificacionPersonaAdendaIngreso" maxlength="20"/>
                                                        </td>
                                                        <td>
                                                            <div class="btn-group">
                                                                <button class="btn btn-dark" onclick="buscarPersonaAdendaIngreso(); return false;">
                                                                    <i class="glyphicon glyphicon-search"></i>
                                                                </button>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3">Nombres:</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3">
                                                            <input type="text" id="nombresPersonaAdendaIngreso" name="nombresPersonaAdendaIngreso" class="form-control" readonly />
                                                        </td>
                                                    <tr>
                                                        <td colspan="3">Apellidos:</td>                                    
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3">
                                                            <input type="text" id="apellidosPersonaAdendaIngreso" name="apellidosPersonaAdendaIngreso" class="form-control" readonly />
                                                        </td>                                    
                                                    </tr>                                                        
                                                 </table>
                                                <table class="tablaForm">
                                                    <tr>
                                                        <td colspan="2">Fecha de ingreso</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <div class="input-group date">
                                                                <input id="fechaAdendaIngreso" name="fechaAdendaIngreso" class="form-control datepicker" readonly="true" />
                                                                <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                                            </div>                                                        
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Fecha acta</td>                                                        
                                                        <td>Número acta</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="input-group date">
                                                                <input id="fechaActaAdendaIngreso" name="fechaActaAdendaIngreso" class="form-control datepicker" readonly="true" />
                                                                <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                                            </div>                                                        
                                                        </td>
                                                        <td>
                                                            <input type="text" class="form-control" id="numeroActaAdendaIngreso" name="numeroActaAdendaIngreso" maxlength="45"/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">Documento</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <input type="file" id="documentoAdendaIngreso" name="documentoAdendaIngreso" class="form-control" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                                <button type="submit" class="btn btn-primary">Aceptar</button>
                                            </div>   
                                            <input type="hidden" id="idAdendaIngreso" name="idAdendaIngreso" value="0"/>
                                            <input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                            <input type="hidden" id="idProyecto" name="idProyecto" value="${proyecto.getIdProyecto()}" />
                                        </form:form>
                                    </div>
                                </div>  
                            </div>    
                        </div>     
                        <div id="adendasRetiroTab" class="tab-pane fade">
                            <div class="alert alert-info" style="margin-top:20px;">
                                <strong>Adendas de Retiro</strong>
                                <button class="btn btn-dark" onclick="mostrarVentanaNuevaAdendaRetiro(); return false;">
                                    <i class="glyphicon glyphicon-plus"></i>
                                </button>                            
                            </div>
                            <div id="alert_placeholder_adendas_retiro"></div>
                            <table class="table table-hover tablaForm" style="width: 90%" align="center" >
                              <thead>
                                <tr class="table-row">
                                    <td style="width: 5%;text-align: center"><strong>Tipo persona</strong></td>
                                    <td style="width: 10%;text-align: center"><strong>Tipo de identificación</strong></td>
                                    <td style="width: 10%;text-align: center"><strong>Número de identificación</strong></td>
                                    <td style="width: 20%;text-align: center"><strong>Nombres</strong></td>
                                    <td style="width: 20%;text-align: center"><strong>Apellidos</strong></td>
                                    <td style="width: 10%;text-align: center"><strong>Motivo</strong></td>
                                    <td style="width: 10%;text-align: center"><strong>Fecha de retiro</strong></td>
                                    <td style="width: 5%">&nbsp;</td>
                                    <td style="width: 5%">&nbsp;</td>
                                    <td style="width: 5%">&nbsp;</td>
                                </tr>
                              </thead>
                              <tbody data-bind="foreach: { data: adendasRetiro }">
                                <tr class="table-row">
                                    <td style="width: 5%">
                                        <span data-bind="text: nombreTipoPersona" ></span>
                                    </td>
                                    <td style="width: 10%">
                                        <span data-bind="text: nombreTipoIdentificacionPersona" ></span>
                                    </td>
                                    <td style="width: 10%">
                                        <span data-bind="text: numeroIdentificacionPersona" ></span>
                                    </td>
                                    <td style="width: 20%">
                                        <span data-bind="text: nombresPersona" ></span>
                                    </td>
                                    <td style="width: 20%">
                                        <span data-bind="text: apellidosPersona" ></span>
                                    </td>
                                    <td style="width: 10%">
                                        <span data-bind="text: motivo" ></span>
                                    </td>
                                    <td style="width: 10%">
                                        <span data-bind="text: fechaRetiroFormateada" ></span>
                                    </td>
                                    <td style="width: 5%">
                                        <button class="btn btn-dark" data-bind="click: $root.verDocumentoAdendaRetiro" title="Ver adenda">
                                            <i class="glyphicon glyphicon-download-alt"></i>
                                        </button>
                                    </td>
                                    <td style="width: 5%">
                                        <button class="btn btn-dark" data-bind="click: $root.eliminarAdendaRetiro" title="Eliminar adenda">
                                            <i class="glyphicon glyphicon-trash"></i>
                                        </button>
                                    </td>
                                    <td style="width: 5%">
                                        <button class="btn btn-dark" data-bind="click: $root.editarAdendaRetiro" title="Editar adenda">
                                            <i class="glyphicon glyphicon-edit"></i>
                                        </button>
                                    </td>
                                </tr>
                              </tbody>
                            </table>
                            <div class="modal fade" id="confirmacionEliminacionAdendaRetiro" tabindex="-1" role="dialog" aria-labelledby="adendaRetiroModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <div class="alert alert-info">
                                                <strong>Eliminar Adenda</strong>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="modal-body">
                                            ¿Está seguro de eliminar la adenda?
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                            <a class="btn btn-danger btn-ok" onclick="eliminarAdendaRetiro();">Eliminar</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal fade" id="adendaRetiroModal" tabindex="-1" role="dialog" aria-labelledby="adendaRetiroModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <form:form method="POST" action="${pageContext.request.contextPath}/novedades/adendaRetiro" modelAttribute="adendaRetiroProyecto" enctype="multipart/form-data">
                                            <div class="modal-header">
                                                <div class="alert alert-info">
                                                    <strong>Adenda de Retiro</strong>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="modal-body">
                                                <div id="alert_placeholder_adenda_retiro"></div>
                                                <table class="tablaForm">
                                                    <tr>
                                                        <td colspan="3">Tipo persona</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3">
                                                            <select name="tipoPersonaAdendaRetiro" id="tipoPersonaAdendaRetiro" class="form-control">
                                                                <option value=""></option>
                                                            <c:forEach var="tipoPersona" items="${tiposPersona}">
                                                                <option value="${tipoPersona.getIdTipoPersona()}">${tipoPersona.getNombre()}</option>
                                                            </c:forEach>
                                                            </select>    
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="45%">Tipo de identificación:</td>
                                                        <td width="45%">Número de identificación:</td>
                                                        <td width="10%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <select name="tipoIdentificacionPersonaAdendaRetiro" id="tipoIdentificacionPersonaAdendaRetiro" class="form-control">
                                                                <option value=""></option>
                                                            <c:forEach var="tipoIdentificacion" items="${tiposIdentificacion}">
                                                                <option value="${tipoIdentificacion.getIdTipoIdentificacion()}">${tipoIdentificacion.getNombre()}</option>
                                                            </c:forEach>
                                                            </select>    
                                                        </td>
                                                        <td>
                                                            <input type="text" class="numbersOnly form-control" id="numeroIdentificacionPersonaAdendaRetiro" name="numeroIdentificacionPersonaAdendaRetiro" maxlength="20"/>
                                                        </td>
                                                        <td>
                                                            <div class="btn-group">
                                                                <button class="btn btn-dark" onclick="buscarPersonaAdendaRetiro(); return false;">
                                                                    <i class="glyphicon glyphicon-search"></i>
                                                                </button>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3">Nombres:</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3">
                                                            <input type="text" id="nombresPersonaAdendaRetiro" name="nombresPersonaAdendaRetiro" class="form-control" readonly />
                                                        </td>
                                                    </tr>                                                        
                                                    <tr>
                                                        <td colspan="3">Apellidos:</td>                                    
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3">
                                                            <input type="text" id="apellidosPersonaAdendaRetiro" name="apellidosPersonaAdendaRetiro" class="form-control" readonly />
                                                        </td>                                    
                                                    </tr>                                                        
                                                 </table>
                                                <table class="tablaForm">
                                                    <tr>
                                                        <td colspna="2">Fecha de retiro</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td colspna="2">
                                                            <div class="input-group date">
                                                                <input id="fechaAdendaRetiro" name="fechaAdendaRetiro" class="form-control datepicker" readonly="true" />
                                                                <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                                            </div>                                                        
                                                        </td>
                                                    </tr>                                                    
                                                    <tr>
                                                        <td>Fecha acta</td>                                                        
                                                        <td>Número acta</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="input-group date">
                                                                <input id="fechaActaAdendaRetiro" name="fechaActaAdendaRetiro" class="form-control datepicker" readonly="true" />
                                                                <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                                            </div>                                                        
                                                        </td>
                                                        <td>
                                                            <input type="text" class="form-control" id="numeroActaAdendaRetiro" name="numeroActaAdendaRetiro" maxlength="45"/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">Documento</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <input type="file" id="documentoAdendaRetiro" name="documentoAdendaRetiro" class="form-control" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">Motivo</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <textarea id="motivoAdendaRetiro" name="motivoAdendaRetiro" class="form-control" rows="5"></textarea>
                                                        </td>
                                                    </tr>                                                    
                                                </table>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                                <button type="submit" class="btn btn-primary">Aceptar</button>
                                            </div>   
                                            <input type="hidden" id="idAdendaRetiro" name="idAdendaRetiro" value="0"/>
                                            <input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                            <input type="hidden" id="idProyecto" name="idProyecto" value="${proyecto.getIdProyecto()}" />
                                        </form:form>
                                    </div>
                                </div>  
                            </div>    
                        </div>     
                        <div id="adicionesTab" class="tab-pane fade">
                          <div class="alert alert-info" style="margin-top:20px;">
                                <strong>Adiciones</strong>
                                <button class="btn btn-dark" onclick="mostrarVentanaNuevaAdicion(); return false;">
                                    <i class="glyphicon glyphicon-plus"></i>
                                </button>                            
                            </div>
                            <div id="alert_placeholder_adiciones"></div>
                            <table class="table table-hover tablaForm" style="width: 90%" align="center" >
                            <thead>
                                <tr class="table-row">
                                    <td style="width: 25%;text-align: center"><strong>Descripción</strong></td>
                                    <td style="width: 20%;text-align: center"><strong>Monto</strong></td>
                                    <td style="width: 20%;text-align: center"><strong>Fecha acta</strong></td>
                                    <td style="width: 20%;text-align: center"><strong>Número del Acta</strong></td>
                                    <td style="width: 5%">&nbsp;</td>
                                    <td style="width: 5%">&nbsp;</td>
                                    <td style="width: 5%">&nbsp;</td>
                                </tr>
                            </thead>
                            <tbody  data-bind="foreach: { data: adiciones }">
                                <tr class="table-row">
                                    <td style="width: 25%">
                                        <span data-bind="text: descripcion" ></span>
                                    </td>
                                    <td style="width: 20%">
                                        <span data-bind="text: montoFormateado" ></span>
                                    </td>
                                    <td style="width: 20%">
                                        <span data-bind="text: fechaActaFormateada" ></span>
                                    </td>
                                    <td style="width: 20%">
                                        <span data-bind="text: numeroActa" ></span>
                                    </td>
                                    <td style="width: 5%">
                                        <button class="btn btn-dark" data-bind="click: $root.verDocumentoAdicion" title="Ver adicion">
                                            <i class="glyphicon glyphicon-download-alt"></i>
                                        </button>
                                    </td>
                                    <td style="width: 5%">
                                        <button class="btn btn-dark" data-bind="click: $root.eliminarAdicion" title="Eliminar adición">
                                            <i class="glyphicon glyphicon-trash"></i>
                                        </button>
                                    </td>
                                    <td style="width: 5%">
                                        <button class="btn btn-dark" data-bind="click: $root.editarAdicion" title="Editar adición">
                                            <i class="glyphicon glyphicon-edit"></i>
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
                            </table>
                            <div class="modal fade" id="confirmacionEliminacionAdicion" tabindex="-1" role="dialog" aria-labelledby="adicionModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <div class="alert alert-info">
                                                <strong>Eliminar Adición</strong>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="modal-body">
                                            ¿Está seguro de eliminar la adición?
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                            <a class="btn btn-danger btn-ok" onclick="eliminarAdicion();">Eliminar</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal fade" id="adicionModal" tabindex="-1" role="dialog" aria-labelledby="adicionModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <form:form method="POST" action="${pageContext.request.contextPath}/novedades/adicion" modelAttribute="adicionProyecto" enctype="multipart/form-data">
                                            <div class="modal-header">
                                                <div class="alert alert-info">
                                                    <strong>Adicion</strong>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="modal-body">
                                                <div id="alert_placeholder_adicion"></div>
                                                <table class="tablaForm">
                                                    <tr>
                                                        <td colspan="2">Descripción</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <input id="descripcionAdicion" name="descripcionAdicion" class="form-control" maxlength="100" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">Monto</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <input id="montoAdicion" name="montoAdicion" class="form-control currencyField" maxlength="20" />
                                                            <input type="hidden" id="idAdicion" name="idAdicion" value="0"/>
                                                            <input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                            <input type="hidden" id="idProyecto" name="idProyecto" value="${proyecto.getIdProyecto()}" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Fecha acta</td>                                                        
                                                        <td>Número del acta</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="input-group date">
                                                                <input id="fechaActaAdicion" name="fechaActaAdicion" class="form-control datepicker" readonly="true" />
                                                                <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                                            </div>                                                        
                                                        </td>
                                                        <td>
                                                            <input id="numeroActaAdicion" name="numeroActaAdicion" class="form-control datepicker" maxlength="45" />
                                                        </td>
                                                    </tr>                                                    
                                                    <tr>
                                                        <td>Fecha acta CODI</td>                                                        
                                                        <td>Número del acta CODI</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="input-group date">
                                                                <input id="fechaActaCODIAdicion" name="fechaActaCODIAdicion" class="form-control datepicker" readonly="true" />
                                                                <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                                            </div>                                                        
                                                        </td>
                                                        <td>
                                                            <input id="numeroActaCODIAdicion" name="numeroActaCODIAdicion" class="form-control datepicker" maxlength="45" />
                                                        </td>
                                                    </tr>                                                    
                                                    <tr>
                                                        <td colspan="2">Documento</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <input type="file" id="documentoAdicion" name="documentoAdicion" class="form-control" />
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
                        <div id="prorrogasTab" class="tab-pane fade">
                            <div class="alert alert-info" style="margin-top:20px;">
                                <strong>Prórrogas</strong>
                                <button class="btn btn-dark" onclick="mostrarVentanaNuevaProrroga(); return false;">
                                    <i class="glyphicon glyphicon-plus"></i>
                                </button>                            
                            </div>
                            <div id="alert_placeholder_prorrogas"></div>
                            <table class="table table-hover tablaForm" style="width: 90%" align="center" >
                                <thead>
                                    <tr class="table-row">
                                        <td style="width: 25%;text-align: center"><strong>Descripción</strong></td>
                                        <td style="width: 10%;text-align: center"><strong>Meses aprobados</strong></td>
                                        <td style="width: 20%;text-align: center"><strong>Monto aprobado</strong></td>
                                        <td style="width: 15%;text-align: center"><strong>Fecha acta</strong></td>
                                        <td style="width: 15%;text-align: center"><strong>Número del acta</strong></td>
                                        <td style="width: 5%">&nbsp;</td>
                                        <td style="width: 5%">&nbsp;</td>
                                        <td style="width: 5%">&nbsp;</td>
                                    </tr>
                                </thead>
                                <tbody data-bind="foreach: { data: prorrogas }">
                                    <tr class="table-row">
                                    <td style="width: 25%">
                                        <span data-bind="text: descripcion" ></span>
                                    </td>
                                    <td style="width: 10%">
                                        <span data-bind="text: mesesAprobados" ></span>
                                    </td>
                                    <td style="width: 20%">
                                        <span data-bind="text: montoAprobadoFormateado" ></span>
                                    </td>
                                    <td style="width: 15%">
                                        <span data-bind="text: fechaActaFormateada" ></span>
                                    </td>
                                    <td style="width: 15%">
                                        <span data-bind="text: numeroActa" ></span>
                                    </td>
                                    <td style="width: 5%">
                                        <button class="btn btn-dark" data-bind="click: $root.verDocumentoProrroga" title="Ver prórroga">
                                            <i class="glyphicon glyphicon-download-alt"></i>
                                        </button>
                                    </td>
                                    <td style="width: 5%">
                                        <button class="btn btn-dark" data-bind="click: $root.eliminarProrroga" title="Eliminar prórroga">
                                            <i class="glyphicon glyphicon-trash"></i>
                                        </button>
                                        <input type="hidden" data-bind="value: idProrroga, attr: { 'name': 'prorrogas[' + $index() + '].idProrroga'  }" />
                                    </td>
                                    <td style="width: 5%">
                                        <button class="btn btn-dark" data-bind="click: $root.editarProrroga" title="Editar prórroga">
                                            <i class="glyphicon glyphicon-edit"></i>
                                        </button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="modal fade" id="confirmacionEliminacionProrroga" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <div class="alert alert-info">
                                                <strong>Eliminar Prórroga</strong>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="modal-body">
                                            ¿Está seguro de eliminar la prórroga?
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                            <a class="btn btn-danger btn-ok" onclick="eliminarProrroga();">Eliminar</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal fade" id="prorrogaModal" tabindex="-1" role="dialog" aria-labelledby="prorrogaModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <form:form method="POST" action="${pageContext.request.contextPath}/novedades/prorroga" modelAttribute="prorrogaProyecto" enctype="multipart/form-data">
                                            <div class="modal-header">
                                                <div class="alert alert-info">
                                                    <strong>Prórroga</strong>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="modal-body">
                                                <div id="alert_placeholder_prorroga"></div>
                                                <table class="tablaForm">
                                                    <tr>
                                                        <td colspan="2">Descripción</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <input id="descripcionProrroga" name="descripcionProrroga" class="form-control" />
                                                            <input type="hidden" id="idProrroga" name="idProrroga" value="0"/>
                                                            <input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                            <input type="hidden" id="idProyecto" name="idProyecto" value="${proyecto.getIdProyecto()}" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Meses aprobados</td>
                                                        <td>Monto aprobado</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input type="text" id="mesesAprobadosProrroga" name="mesesAprobadosProrroga" class="form-control numbersOnly" maxlength="4">
                                                        </td>
                                                        <td>
                                                            <input id="montoAprobadoProrroga" name="montoAprobadoProrroga" class="form-control currencyField" maxlength="20" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Fecha acta</td>                                                        
                                                        <td>Número del acta</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="input-group date">
                                                                <input id="fechaActaProrroga" name="fechaActaProrroga" class="form-control datepicker" readonly="true" />
                                                                <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                                            </div>                                                        
                                                        </td>
                                                        <td>
                                                            <input id="numeroActaProrroga" name="numeroActaProrroga" class="form-control datepicker" maxlength="45" />
                                                        </td>
                                                    </tr>                                                    
                                                    <tr>
                                                        <td>Fecha acta CODI</td>                                                        
                                                        <td>Número del acta CODI</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="input-group date">
                                                                <input id="fechaActaCODIProrroga" name="fechaActaCODIProrroga" class="form-control datepicker" readonly="true" />
                                                                <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                                            </div>                                                        
                                                        </td>
                                                        <td>
                                                            <input id="numeroActaCODIProrroga" name="numeroActaCODIProrroga" class="form-control datepicker" maxlength="45" />
                                                        </td>
                                                    </tr>                                                    
                                                    <tr>
                                                        <td colspan="2">Documento</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <input type="file" id="documentoProrroga" name="documentoProrroga" class="form-control" />
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
                        <div id="plazosTab" class="tab-pane fade">
                            <div class="alert alert-info" style="margin-top:20px;">
                                <strong>Plazos</strong>
                                <button class="btn btn-dark" onclick="mostrarVentanaNuevaPlazo(); return false;">
                                    <i class="glyphicon glyphicon-plus"></i>
                                </button>                            
                            </div>
                            <div id="alert_placeholder_plazos"></div>
                            <table class="table table-hover tablaForm" style="width: 90%" align="center" >
                                <thead>
                                    <tr class="table-row">
                                        <td style="width: 30%;text-align: center"><strong>Descripción</strong></td>
                                        <td style="width: 20%;text-align: center"><strong>Meses aprobados</strong></td>
                                        <td style="width: 20%;text-align: center"><strong>Fecha acta</strong></td>
                                        <td style="width: 15%;text-align: center"><strong>Número del acta</strong></td>
                                        <td style="width: 5%">&nbsp;</td>
                                        <td style="width: 5%">&nbsp;</td>
                                        <td style="width: 5%">&nbsp;</td>
                                    </tr>
                                </thead>
                                <tbody data-bind="foreach: { data: plazos }">
                                    <tr class="table-row">
                                    <td style="width: 30%">
                                        <span data-bind="text: descripcion" ></span>
                                    </td>
                                    <td style="width: 20%">
                                        <span data-bind="text: mesesAprobados" ></span>
                                    </td>
                                    <td style="width: 20%">
                                        <span data-bind="text: fechaActaFormateada" ></span>
                                    </td>
                                    <td style="width: 15%">
                                        <span data-bind="text: numeroActa" ></span>
                                    </td>
                                    <td style="width: 5%">
                                        <button class="btn btn-dark" data-bind="click: $root.verDocumentoPlazo" title="Ver plazo">
                                            <i class="glyphicon glyphicon-download-alt"></i>
                                        </button>
                                    </td>
                                    <td style="width: 5%">
                                        <button class="btn btn-dark" data-bind="click: $root.eliminarPlazo" title="Eliminar plazo">
                                            <i class="glyphicon glyphicon-trash"></i>
                                        </button>
                                    </td>
                                    <td style="width: 5%">
                                        <button class="btn btn-dark" data-bind="click: $root.editarPlazo" title="Editar plazo">
                                            <i class="glyphicon glyphicon-edit"></i>
                                        </button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="modal fade" id="confirmacionEliminacionPlazo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <div class="alert alert-info">
                                                <strong>Eliminar Plazo</strong>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="modal-body">
                                            ¿Está seguro de eliminar la plazo?
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                            <a class="btn btn-danger btn-ok" onclick="eliminarPlazo();">Eliminar</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal fade" id="plazoModal" tabindex="-1" role="dialog" aria-labelledby="plazoModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <form:form method="POST" action="${pageContext.request.contextPath}/novedades/plazo" modelAttribute="plazoProyecto" enctype="multipart/form-data">
                                            <div class="modal-header">
                                                <div class="alert alert-info">
                                                    <strong>Plazo</strong>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="modal-body">
                                                <div id="alert_placeholder_plazo"></div>
                                                <table class="tablaForm">
                                                    <tr>
                                                        <td colspan="2">Descripción</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <input id="descripcionPlazo" name="descripcionPlazo" class="form-control" maxlength="100" />
                                                            <input type="hidden" id="idPlazo" name="idPlazo" value="0"/>
                                                            <input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                            <input type="hidden" id="idProyecto" name="idProyecto" value="${proyecto.getIdProyecto()}" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">Meses aprobados</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <input type="text" id="mesesAprobadosPlazo" name="mesesAprobadosPlazo" class="form-control numbersOnly" maxlength="4">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Fecha acta</td>                                                        
                                                        <td>Número del acta</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="input-group date">
                                                                <input id="fechaActaPlazo" name="fechaActaPlazo" class="form-control datepicker" readonly="true" />
                                                                <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                                            </div>                                                        
                                                        </td>
                                                        <td>
                                                            <input type="text" id="numeroActaPlazo" name="numeroActaPlazo" class="form-control datepicker" maxlength="45" />
                                                        </td>
                                                    </tr>                                                    
                                                    <tr>
                                                        <td>Fecha acta CODI</td>                                                        
                                                        <td>Número del acta CODI</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="input-group date">
                                                                <input id="fechaActaCODIPlazo" name="fechaActaCODIPlazo" class="form-control datepicker" readonly="true" />
                                                                <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                                            </div>                                                        
                                                        </td>
                                                        <td>
                                                            <input type="text" id="numeroActaCODIPlazo" name="numeroActaCODIPlazo" class="form-control datepicker" maxlength="45" />
                                                        </td>
                                                    </tr>                                                    
                                                    <tr>
                                                        <td colspan="2">Documento</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <input type="file" id="documentoPlazo" name="documentoPlazo" class="form-control" />
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
                        <div id="cumplimientoCompromisosProyectoTab" class="tab-pane fade">
                            <div class="alert alert-info" style="margin-top:20px;">
                                <strong>Cumplimiento de Compromisos</strong>
                                <button class="btn btn-dark" onclick="mostrarVentanaNuevaCumplimientoCompromisoProyecto(); return false;">
                                    <i class="glyphicon glyphicon-plus"></i>
                                </button>                            
                            </div>
                            <div id="alert_placeholder_cumplimiento_compromisos_proyecto"></div>
                            <table class="table table-hover tablaForm" style="width: 90%" align="center" >
                                <thead>
                                    <tr class="table-row">
                                        <td style="width: 45%;text-align: center"><strong>Compromiso</strong></td>
                                        <td style="width: 20%;text-align: center"><strong>Fecha acta</strong></td>
                                        <td style="width: 20%;text-align: center"><strong>Número del acta</strong></td>
                                        <td style="width: 5%">&nbsp;</td>
                                        <td style="width: 5%">&nbsp;</td>
                                        <td style="width: 5%">&nbsp;</td>
                                    </tr>
                                </thead>
                                <tbody data-bind="foreach: { data: cumplimientoCompromisosProyecto }">
                                    <tr class="table-row">
                                    <td style="width: 45%">
                                        <span data-bind="text: descripcionCompromisoProyecto" ></span>
                                    </td>
                                    <td style="width: 20%">
                                        <span data-bind="text: fechaActaFormateada" ></span>
                                    </td>
                                    <td style="width: 20%">
                                        <span data-bind="text: numeroActa" ></span>
                                    </td>
                                    <td style="width: 5%">
                                        <button class="btn btn-dark" data-bind="click: $root.verDocumentoCumplimientoCompromisoProyecto" title="Ver cumplimiento compromiso">
                                            <i class="glyphicon glyphicon-download-alt"></i>
                                        </button>
                                    </td>
                                    <td style="width: 5%">
                                        <button class="btn btn-dark" data-bind="click: $root.eliminarCumplimientoCompromisoProyecto" title="Eliminar cumplimiento compromiso">
                                            <i class="glyphicon glyphicon-trash"></i>
                                        </button>
                                    </td>
                                    <td style="width: 5%">
                                        <button class="btn btn-dark" data-bind="click: $root.editarCumplimientoCompromisoProyecto" title="Editar cumplimiento compromiso">
                                            <i class="glyphicon glyphicon-edit"></i>
                                        </button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="modal fade" id="confirmacionEliminacionCumplimientoCompromisoProyecto" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <div class="alert alert-info">
                                                <strong>Eliminar Cumplimiento de Compromiso</strong>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="modal-body">
                                            ¿Está seguro de eliminar el cumplimiento del compromiso?
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                            <a class="btn btn-danger btn-ok" onclick="eliminarCumplimientoCompromisoProyecto();">Eliminar</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal fade" id="cumplimientoCompromisoProyectoModal" tabindex="-1" role="dialog" aria-labelledby="cumplimientoCompromisoProyectoModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <form:form method="POST" action="${pageContext.request.contextPath}/novedades/cumplimientoCompromiso" modelAttribute="cumplimientoCompromisoProyecto" enctype="multipart/form-data">
                                            <div class="modal-header">
                                                <div class="alert alert-info">
                                                    <strong>Cumplimiento de Compromiso</strong>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="modal-body">
                                                <div id="alert_placeholder_cumplimiento_compromiso_proyecto"></div>
                                                <table class="tablaForm">
                                                    <tr>
                                                        <td colspan="2">Compromiso</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <select name="compromisoProyecto" id="compromisoProyecto" class="form-control">
                                                                <option value=""></option>
                                                            <c:forEach var="compromisoProyecto" items="${compromisosProyecto}">
                                                                <option value="${compromisoProyecto.getIdCompromisoProyecto()}">${compromisoProyecto.getDescripcion()}</option>
                                                            </c:forEach>
                                                            </select>      
                                                            <input type="hidden" id="idCumplimientoCompromisoProyecto" name="idCumplimientoCompromisoProyecto" value="0"/>
                                                            <input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                            <input type="hidden" id="idProyecto" name="idProyecto" value="${proyecto.getIdProyecto()}" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Fecha acta</td>                                                        
                                                        <td>Número del acta</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="input-group date">
                                                                <input id="fechaActaCumplimientoCompromisoProyecto" name="fechaActaCumplimientoCompromisoProyecto" class="form-control datepicker" readonly="true" />
                                                                <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                                            </div>                                                        
                                                        </td>
                                                        <td>
                                                            <input type="text" id="numeroActaCumplimientoCompromisoProyecto" name="numeroActaCumplimientoCompromisoProyecto" class="form-control datepicker" maxlength="45" />
                                                        </td>
                                                    </tr>                                                    
                                                    <tr>
                                                        <td colspan="2">Documento</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <input type="file" id="documentoCumplimientoCompromisoProyecto" name="documentoCumplimientoCompromisoProyecto" class="form-control" />
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
                        <div id="compromisosHomologadosProyectoTab" class="tab-pane fade">
                            <div class="alert alert-info" style="margin-top:20px;">
                                <strong>Compromisos Homologados</strong>
                                <button class="btn btn-dark" onclick="mostrarVentanaNuevaCompromisoHomologadoProyecto(); return false;">
                                    <i class="glyphicon glyphicon-plus"></i>
                                </button>                            
                            </div>
                            <div id="alert_placeholder_compromisos_homologados_proyecto"></div>
                            <table class="table table-hover tablaForm" style="width: 90%" align="center" >
                                <thead>
                                    <tr class="table-row">
                                        <td style="width: 30%;text-align: center"><strong>Compromiso a homologar</strong></td>
                                        <td style="width: 30%;text-align: center"><strong>Nuevo compromiso</strong></td>
                                        <td style="width: 15%;text-align: center"><strong>Fecha acta</strong></td>
                                        <td style="width: 15%;text-align: center"><strong>Número del acta</strong></td>
                                        <td style="width: 5%">&nbsp;</td>
                                        <td style="width: 5%">&nbsp;</td>
                                    </tr>
                                </thead>
                                <tbody data-bind="foreach: { data: compromisosHomologadosProyecto }">
                                    <tr class="table-row">
                                    <td style="width: 30%">
                                        <span data-bind="text: descripcionCompromisoProyectoHomologado" ></span>
                                    </td>
                                    <td style="width: 30%">
                                        <span data-bind="text: descripcionCompromisoProyecto" ></span>
                                    </td>
                                    <td style="width: 15%">
                                        <span data-bind="text: fechaActaFormateada" ></span>
                                    </td>
                                    <td style="width: 15%">
                                        <span data-bind="text: numeroActa" ></span>
                                    </td>
                                    <td style="width: 5%">
                                        <button class="btn btn-dark" data-bind="click: $root.eliminarCompromisoHomologadoProyecto" title="Eliminar homologación del compromiso">
                                            <i class="glyphicon glyphicon-trash"></i>
                                        </button>
                                    </td>
                                    <td style="width: 5%">
                                        <button class="btn btn-dark" data-bind="click: $root.editarCompromisoHomologadoProyecto" title="Editar homologación del compromiso">
                                            <i class="glyphicon glyphicon-edit"></i>
                                        </button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="modal fade" id="confirmacionEliminacionCompromisoHomologadoProyecto" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <div class="alert alert-info">
                                                <strong>Eliminar Cumplimiento de Compromiso</strong>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="modal-body">
                                            ¿Está seguro de eliminar la homologación del compromiso?
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                            <a class="btn btn-danger btn-ok" onclick="eliminarCompromisoHomologadoProyecto();">Eliminar</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal fade" id="compromisoHomologadoProyectoModal" tabindex="-1" role="dialog" aria-labelledby="compromisoHomologadoProyectoModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <form:form method="POST" action="${pageContext.request.contextPath}/novedades/compromisoHomologado" modelAttribute="compromisoHomologadoProyecto">
                                            <div class="modal-header">
                                                <div class="alert alert-info">
                                                    <strong>Homologación de Compromiso</strong>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="modal-body">
                                                <div id="alert_placeholder_compromisos_homologado_proyecto"></div>
                                                <table class="tablaForm">
                                                    <tr>
                                                        <td colspan="2">Compromiso a homologar</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <select name="compromisoProyectoHomologado" id="compromisoProyectoHomologado" class="form-control">
                                                                <option value=""></option>
                                                            <c:forEach var="compromisoProyecto" items="${compromisosProyecto}">
                                                                <option value="${compromisoProyecto.getIdCompromisoProyecto()}">${compromisoProyecto.getDescripcion()}</option>
                                                            </c:forEach>
                                                            </select>      
                                                            <input type="hidden" id="idCompromisoHomologadoProyecto" name="idCompromisoHomologadoProyecto" value="0"/>
                                                            <input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                            <input type="hidden" id="idProyecto" name="idProyecto" value="${proyecto.getIdProyecto()}" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">Compromiso</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <select name="nuevoCompromisoProyecto" id="nuevoCompromisoProyecto" class="form-control">
                                                                <option value=""></option>
                                                            <c:forEach var="compromisoProyecto" items="${compromisosProyecto}">
                                                                <option value="${compromisoProyecto.getIdCompromisoProyecto()}">${compromisoProyecto.getDescripcion()}</option>
                                                            </c:forEach>
                                                            </select>      
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">Descripción</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <input id="descripcionCompromisoHomologadoProyecto" name="descripcionCompromisoHomologadoProyecto" class="form-control" maxlength="200"></textarea>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Fecha acta</td>                                                        
                                                        <td>Número del acta</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="input-group date">
                                                                <input id="fechaActaCompromisoHomologadoProyecto" name="fechaActaCompromisoHomologadoProyecto" class="form-control datepicker" readonly="true" />
                                                                <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                                            </div>                                                        
                                                        </td>
                                                        <td>
                                                            <input type="text" id="numeroActaCompromisoHomologadoProyecto" name="numeroActaCompromisoHomologadoProyecto" class="form-control datepicker" maxlength="45" />
                                                        </td>
                                                    </tr>                                                    
                                                    <tr>
                                                        <td colspan="2">Observaciones</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <textarea id="observacionesCompromisoHomologadoProyecto" name="observacionesCompromisoHomologadoProyecto" class="form-control" rows="3"></textarea>
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
                       <div id="cumplimientoAlertasAvalProyectoTab" class="tab-pane fade">
                            <div class="alert alert-info" style="margin-top:20px;">
                                <strong>Cumplimiento de las Alertas de Aval</strong>
                                <button class="btn btn-dark" onclick="mostrarVentanaNuevaCumplimientoAlertaAvalProyecto(); return false;">
                                    <i class="glyphicon glyphicon-plus"></i>
                                </button>                            
                            </div>
                            <div id="alert_placeholder_cumplimientos_alertas_aval_proyecto"></div>
                            <table class="table table-hover tablaForm" style="width: 90%" align="center" >
                                <thead>
                                    <tr class="table-row">
                                        <td style="width: 45%;text-align: center"><strong>Alerta aval</strong></td>
                                        <td style="width: 20%;text-align: center"><strong>Fecha acta</strong></td>
                                        <td style="width: 20%;text-align: center"><strong>Número del acta</strong></td>
                                        <td style="width: 5%">&nbsp;</td>
                                        <td style="width: 5%">&nbsp;</td>
                                        <td style="width: 5%">&nbsp;</td>
                                    </tr>
                                </thead>
                                <tbody data-bind="foreach: { data: cumplimientoAlertasAvalProyecto }">
                                    <tr class="table-row">
                                    <td style="width: 45%">
                                        <span data-bind="text: descripcionAlertaAvalProyecto" ></span>
                                    </td>
                                    <td style="width: 20%">
                                        <span data-bind="text: fechaActaFormateada" ></span>
                                    </td>
                                    <td style="width: 20%">
                                        <span data-bind="text: numeroActa" ></span>
                                    </td>
                                    <td style="width: 5%">
                                        <button class="btn btn-dark" data-bind="click: $root.verDocumentoCumplimientoAlertaAvalProyecto" title="Ver cumplimiento compromiso">
                                            <i class="glyphicon glyphicon-download-alt"></i>
                                        </button>
                                    </td>
                                    <td style="width: 5%">
                                        <button class="btn btn-dark" data-bind="click: $root.eliminarCumplimientoAlertaAvalProyecto" title="Eliminar cumplimiento compromiso">
                                            <i class="glyphicon glyphicon-trash"></i>
                                        </button>
                                    </td>
                                    <td style="width: 5%">
                                        <button class="btn btn-dark" data-bind="click: $root.editarCumplimientoAlertaAvalProyecto" title="Editar cumplimiento compromiso">
                                            <i class="glyphicon glyphicon-edit"></i>
                                        </button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="modal fade" id="confirmacionEliminacionCumplimientoAlertaAvalProyecto" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <div class="alert alert-info">
                                                <strong>Eliminar Cumplimiento de la Alerta de Aval</strong>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="modal-body">
                                            ¿Está seguro de eliminar el cumplimiento de la alerta de aval?
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                            <a class="btn btn-danger btn-ok" onclick="eliminarCumplimientoAlertaAvalProyecto();">Eliminar</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal fade" id="cumplimientoAlertaAvalProyectoModal" tabindex="-1" role="dialog" aria-labelledby="cumplimientoAlertaAvalProyectoModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <form:form method="POST" action="${pageContext.request.contextPath}/novedades/cumplimientoAlertaAval" modelAttribute="cumplimientoAlertaAvalProyecto" enctype="multipart/form-data">
                                            <div class="modal-header">
                                                <div class="alert alert-info">
                                                    <strong>Cumplimiento de Alerta Aval</strong>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="modal-body">
                                                <div id="alert_placeholder_cumplimiento_alerta_aval_proyecto"></div>
                                                <table class="tablaForm">
                                                    <tr>
                                                        <td colspan="2">Alerta Aval</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <select name="alertaAvalProyecto" id="alertaAvalProyecto" class="form-control">
                                                                <option value=""></option>
                                                            <c:forEach var="alertaAvalProyecto" items="${alertasAvalProyecto}">
                                                                <option value="${alertaAvalProyecto.getIdAlertaAvalProyecto()}">${alertaAvalProyecto.getDescripcion()}</option>
                                                            </c:forEach>
                                                            </select>      
                                                            <input type="hidden" id="idCumplimientoAlertaAvalProyecto" name="idCumplimientoAlertaAvalProyecto" value="0"/>
                                                            <input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                            <input type="hidden" id="idProyecto" name="idProyecto" value="${proyecto.getIdProyecto()}" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Fecha acta</td>                                                        
                                                        <td>Número del acta</td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="input-group date">
                                                                <input id="fechaActaCumplimientoAlertaAvalProyecto" name="fechaActaCumplimientoAlertaAvalProyecto" class="form-control datepicker" readonly="true" />
                                                                <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                                            </div>                                                        
                                                        </td>
                                                        <td>
                                                            <input type="text" id="numeroActaCumplimientoAlertaAvalProyecto" name="numeroActaCumplimientoAlertaAvalProyecto" class="form-control datepicker" maxlength="45" />
                                                        </td>
                                                    </tr>                                                    
                                                    <tr>
                                                        <td colspan="2">Documento</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <input type="file" id="documentoCumplimientoAlertaAvalProyecto" name="documentoCumplimientoAlertaAvalProyecto" class="form-control" />
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
                    </div>
                </div>
        </div>
        <script>
            var optsFC = { decimalSymbol: ',', digitGroupSymbol: '.', roundToDecimalPlace: 0  };
            $(document).ready(function () {
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
            });

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

            $('#actaProyecto').submit(function (evt) {
                evt.preventDefault();
                var formData = new FormData(this);
                if ($('#nombreActa').val() == "") {
                    bootstrap_alert_acta.warning('Debe ingresar el nombre');
                    return false;
                }
                if ($('#idTipoActa').val() == "") {
                    bootstrap_alert_acta.warning('Debe seleccionar el tipo de acta');
                    return false;
                }
                if ($('#numeroActa').val() == "") {
                    bootstrap_alert_acta.warning('Debe ingresar el número');
                    return false;
                }
                if ($('#fechaActa').val() == "") {
                    bootstrap_alert_acta.warning('Debe ingresar la fecha');
                    return false;
                }
                if ($('#idActa').val() == 0 && $('#documentoActa').prop('files').length == 0) {
                    bootstrap_alert_acta.warning('Debe seleccionar el archivo');
                    return false;
                }
                $('#actaModal').modal('toggle');
                bootstrap_alert_acta.removeWarning();
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/novedades/acta",
                    data: formData,
                    processData: false,
                    contentType: false,
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                    },
                    success: function (response) {
                        bootstrap_alert_actas.success("Acta almacenada exitosamente");
                        limpiarDatosVentanaActa();
                        if (response != "") {
                            proyectoModel.actas.removeAll();
                            var actas = JSON.parse(response);
                            for (var i = 0; i < actas.length; i++) {
                                proyectoModel.actas.push(
                                        {
                                            idActa: ko.observable(actas[i].idActa),
                                            idTipoActa: ko.observable(actas[i].idTipoActa),
                                            descripcionTipoActa : ko.observable(actas[i].descripcionTipoActa),
                                            nombre: ko.observable(actas[i].nombre),
                                            numero: ko.observable(actas[i].numero),
                                            observaciones: ko.observable(actas[i].observaciones),
                                            fechaFormateada: ko.observable(actas[i].fechaFormateada),
                                        }
                                );
                            }
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        bootstrap_alert_actas.warning("Error al almacenar el acta");
                    }});
            });

            function eliminarActa () {
                $('#confirmacionEliminacionActa').modal('toggle');
                $.ajax({
                    type: 'GET',
                    url: "${pageContext.request.contextPath}/novedades/eliminarActa/" + $('#idProyecto').val() + "/" + actaEliminar.idActa(),
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                    },
                    success: function (response) {
                        bootstrap_alert_actas.success("Acta eliminada exitosamente");
                        if (response != "") {
                            proyectoModel.actas.removeAll();
                            var actas = JSON.parse(response);
                            for (var i = 0; i < actas.length; i++) {
                                proyectoModel.actas.push(
                                        {
                                            idActa: ko.observable(actas[i].idActa),
                                            idTipoActa: ko.observable(actas[i].idTipoActa),
                                            descripcionTipoActa : ko.observable(actas[i].descripcionTipoActa),
                                            nombre: ko.observable(actas[i].nombre),
                                            observaciones: ko.observable(actas[i].observaciones),
                                            fechaFormateada: ko.observable(actas[i].fechaFormateada),
                                        }
                                );
                            }
                        }                        
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        bootstrap_alert_actas.warning("Error al eliminar el acta");
                    }});
            }

          function buscarPersonaAnteriorAdendaCambio() {
          
                if ($('#tipoPersonaAdendaCambio').val() == "") {
                    bootstrap_alert_adenda_cambio.warning('Debe seleccionar el tipo de persona');
                    return false;
                }
                if ($('#tipoIdentificacionPersonaAnteriorAdendaCambio').val() == "") {
                    bootstrap_alert_adenda_cambio.warning('Debe seleccionar el tipo de identificación de la persona a retirar');
                    return false;
                }
                if ($('#numeroIdentificacionPersonaAnteriorAdendaCambio').val() == "") {
                    bootstrap_alert_adenda_cambio.warning('Debe ingresar el número de identificación de la persona a retirar');
                    return false;
                }

                var tipoIdentificacion = $('#tipoIdentificacionPersonaAnteriorAdendaCambio').val();
                var numeroIdentificacion = $('#numeroIdentificacionPersonaAnteriorAdendaCambio').val();
                var tipoPersona = "";
                if ($('#tipoPersonaAdendaCambio').val() == "1") {
                    tipoPersona = "profesores";
                } else if ($('#tipoPersonaAdendaCambio').val() == "2") {
                    tipoPersona = "estudiantes";
                } else if ($('#tipoPersonaAdendaCambio').val() == "3") {
                    tipoPersona = "personalExterno";
                }

                $.ajax({
                        type: "POST",
                        url: "${pageContext.request.contextPath}/proyectos/" + tipoPersona,
                        data: "idTipoIdentificacion=" + tipoIdentificacion + "&numeroIdentificacion=" + numeroIdentificacion,
                        beforeSend: function(xhr){
                           xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                        },                        
                        success: function(response){
                           if(response != "") {
                             var estudiante = JSON.parse(response);
                             $('#nombresPersonaAnteriorAdendaCambio').val(estudiante.nombres);
                             $('#apellidosPersonaAnteriorAdendaCambio').val(estudiante.apellidos);
                           } else {
                             $('#nombresPersonaAnteriorAdendaCambio').val("");
                             $('#apellidosPersonaAnteriorAdendaCambio').val("");
                           }    
                        },
                        error: function(e){
                            bootstrap_alert_adenda_cambio.warning(e);
                        }
                    });
           }

          function buscarPersonaAdendaCambio() {
          
                if ($('#tipoPersonaAdendaCambio').val() == "") {
                    bootstrap_alert_adenda_cambio.warning('Debe seleccionar el tipo de persona');
                    return false;
                }
                if ($('#tipoIdentificacionPersonaAdendaCambio').val() == "") {
                    bootstrap_alert_adenda_cambio.warning('Debe seleccionar el tipo de identificación');
                    return false;
                }
                if ($('#numeroIdentificacionPersonaAdendaCambio').val() == "") {
                    bootstrap_alert_adenda_cambio.warning('Debe ingresar el número de identificación');
                    return false;
                }

                var tipoIdentificacion = $('#tipoIdentificacionPersonaAdendaCambio').val();
                var numeroIdentificacion = $('#numeroIdentificacionPersonaAdendaCambio').val();
                var tipoPersona = "";
                if ($('#tipoPersonaAdendaCambio').val() == "1") {
                    tipoPersona = "profesores";
                } else if ($('#tipoPersonaAdendaCambio').val() == "2") {
                    tipoPersona = "estudiantes";
                } else if ($('#tipoPersonaAdendaCambio').val() == "3") {
                    tipoPersona = "personalExterno";
                }

                $.ajax({
                        type: "POST",
                        url: "${pageContext.request.contextPath}/proyectos/" + tipoPersona,
                        data: "idTipoIdentificacion=" + tipoIdentificacion + "&numeroIdentificacion=" + numeroIdentificacion,
                        beforeSend: function(xhr){
                           xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                        },                        
                        success: function(response){
                           if(response != "") {
                             var estudiante = JSON.parse(response);
                             $('#nombresPersonaAdendaCambio').val(estudiante.nombres);
                             $('#apellidosPersonaAdendaCambio').val(estudiante.apellidos);
                           } else {
                             $('#nombresPersonaAdendaCambio').val("");
                             $('#apellidosPersonaAdendaCambio').val("");
                           }    
                        },
                        error: function(e){
                            bootstrap_alert_adenda_cambio.warning(e);
                        }
                    });
           }

            $('#adendaCambioProyecto').submit(function (evt) {
                evt.preventDefault();
                var formData = new FormData(this);
                if ($('#tipoPersonaAdendaCambio').val() == "") {
                    bootstrap_alert_adenda_cambio.warning('Debe seleccionar el tipo de persona');
                    return false;
                }
                if ($('#tipoIdentificacionPersonaAnteriorAdendaCambio').val() == "") {
                    bootstrap_alert_adenda_cambio.warning('Debe seleccionar el tipo de identificación de la persona a retirar');
                    return false;
                }
                if ($('#numeroIdentificacionPersonaAnteriorAdendaCambio').val() == "") {
                    bootstrap_alert_adenda_cambio.warning('Debe ingresar el número de identificación de la persona a retirar');
                    return false;
                }
                if ($('#tipoIdentificacionPersonaAdendaCambio').val() == "") {
                    bootstrap_alert_adenda_cambio.warning('Debe seleccionar el tipo de identificación');
                    return false;
                }
                if ($('#numeroIdentificacionPersonaAdendaCambio').val() == "") {
                    bootstrap_alert_adenda_cambio.warning('Debe ingresar el número de identificación');
                    return false;
                }
                if ($('#tipoIdentificacionPersonaAnteriorAdendaCambio').val() == $('#tipoIdentificacionPersonaAdendaCambio').val() &&
                    $('#numeroIdentificacionPersonaAnteriorAdendaCambio').val() == $('#numeroIdentificacionPersonaAdendaCambio').val()){
                    bootstrap_alert_adenda_cambio.warning('Las persona deben ser diferentes');
                    return false;
                }
                if ($('#rolAdendaCambio').val() == "") {
                    bootstrap_alert_adenda_cambio.warning('Debe seleccionar el rol');
                    return false;
                }
                if ($('#fechaAdendaCambio').val() == "") {
                    bootstrap_alert_adenda_cambio.warning('Debe ingresar la fecha de cambio');
                    return false;
                }
                if ($('#fechaActaAdendaCambio').val() == "") {
                    bootstrap_alert_adenda_cambio.warning('Debe ingresar la fecha del acta');
                    return false;
                }
                if ($('#numeroActaAdendaCambio').val() == "") {
                    bootstrap_alert_adenda_cambio.warning('Debe ingresar el número del acta');
                    return false;
                }
                if ($('#idAdendaCambio').val() == 0 && $('#documentoAdendaCambio').prop('files').length == 0) {
                    bootstrap_alert_adenda_cambio.warning('Debe seleccionar el archivo');
                    return false;
                }
                $('#adendaCambioModal').modal('toggle');
                bootstrap_alert_adenda_cambio.removeWarning();
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/novedades/adendaCambio",
                    data: formData,
                    processData: false,
                    contentType: false,
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                    },
                    success: function (response) {
                        var error = JSON.parse(response);
                        if(error.error != null) {
                            bootstrap_alert_adendas_cambio.warning(error.error);
                        } else {
                            bootstrap_alert_adendas_cambio.success("Adenda almacenada exitosamente");
                            limpiarDatosVentanaAdendaCambio();
                            if (response != "") {
                                proyectoModel.adendasCambio.removeAll();
                                var adendas = JSON.parse(response);
                                for (var i = 0; i < adendas.length; i++) {
                                    proyectoModel.adendasCambio.push(
                                            {
                                                idAdenda: ko.observable(adendas[i].idAdenda),
                                                idTipoPersona: ko.observable(adendas[i].idTipoPersona),
                                                nombreTipoPersona: ko.observable(adendas[i].nombreTipoPersona),
                                                idTipoIdentificacionPersona: ko.observable(adendas[i].idTipoIdentificacionPersona),
                                                nombreTipoIdentificacionPersona: ko.observable(adendas[i].nombreTipoIdentificacionPersona),
                                                numeroIdentificacionPersona: ko.observable(adendas[i].numeroIdentificacionPersona),
                                                nombresPersona: ko.observable(adendas[i].nombresPersona),
                                                apellidosPersona: ko.observable(adendas[i].apellidosPersona),
                                                idRol: ko.observable(adendas[i].idRol),
                                                nombreRol: ko.observable(adendas[i].nombreRol),
                                                fechaActaFormateada: ko.observable(adendas[i].fechaActaFormateada),
                                                fechaCambioFormateada: ko.observable(adendas[i].fechaCambioFormateada)
                                            }
                                    );
                                }
                            }
                    }
                },
                    error: function (xhr, ajaxOptions, thrownError) {
                        bootstrap_alert_adendas_cambio.warning("Error al almacenar la adenda.");
                    }});
            });

            function eliminarAdendaCambio () {
                $('#confirmacionEliminacionAdendaCambio').modal('toggle');
                $.ajax({
                    type: 'GET',
                    url: "${pageContext.request.contextPath}/novedades/eliminarAdendaCambio/" + $('#idProyecto').val() + "/" + adendaCambioEliminar.idAdenda(),
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                    },
                    success: function (response) {
                        bootstrap_alert_adendas_cambio.success("Adenda eliminada exitosamente");
                        if (response != "") {
                            proyectoModel.adendasCambio.removeAll();
                            var adendas = JSON.parse(response);
                            for (var i = 0; i < adendas.length; i++) {
                                proyectoModel.adendasCambio.push(
                                        {
                                            idAdenda: ko.observable(adendas[i].idAdenda),
                                            idTipoPersona: ko.observable(adendas[i].idTipoPersona),
                                            nombreTipoPersona: ko.observable(adendas[i].nombreTipoPersona),
                                            idTipoIdentificacionPersona: ko.observable(adendas[i].idTipoIdentificacionPersona),
                                            nombreTipoIdentificacionPersona: ko.observable(adendas[i].nombreTipoIdentificacionPersona),
                                            numeroIdentificacionPersona: ko.observable(adendas[i].numeroIdentificacionPersona),
                                            nombresPersona: ko.observable(adendas[i].nombresPersona),
                                            apellidosPersona: ko.observable(adendas[i].apellidosPersona),
                                            idRol: ko.observable(adendas[i].idRol),
                                            nombreRol: ko.observable(adendas[i].nombreRol),
                                            fechaActaFormateada: ko.observable(adendas[i].fechaActaFormateada),
                                            fechaCambioFormateada: ko.observable(adendas[i].fechaCambioFormateada)
                                        }
                                );
                            }
                        }
                        
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        bootstrap_alert_adendas_cambio.warning("Error al eliminar la adenda");
                    }});
            }

          function buscarPersonaAdendaRetiro() {
          
                if ($('#tipoPersonaAdendaRetiro').val() == "") {
                    bootstrap_alert_adenda_retiro.warning('Debe seleccionar el tipo de persona');
                    return false;
                }
                if ($('#tipoIdentificacionPersonaAdendaRetiro').val() == "") {
                    bootstrap_alert_adenda_retiro.warning('Debe seleccionar el tipo de identificación');
                    return false;
                }
                if ($('#numeroIdentificacionPersonaAdendaRetiro').val() == "") {
                    bootstrap_alert_adenda_retiro.warning('Debe ingresar el número de identificación');
                    return false;
                }

                var tipoIdentificacion = $('#tipoIdentificacionPersonaAdendaRetiro').val();
                var numeroIdentificacion = $('#numeroIdentificacionPersonaAdendaRetiro').val();
                var tipoPersona = "";
                if ($('#tipoPersonaAdendaRetiro').val() == "1") {
                    tipoPersona = "profesores";
                } else if ($('#tipoPersonaAdendaRetiro').val() == "2") {
                    tipoPersona = "estudiantes";
                } else if ($('#tipoPersonaAdendaRetiro').val() == "3") {
                    tipoPersona = "personalExterno";
                }

                $.ajax({
                        type: "POST",
                        url: "${pageContext.request.contextPath}/proyectos/" + tipoPersona,
                        data: "idTipoIdentificacion=" + tipoIdentificacion + "&numeroIdentificacion=" + numeroIdentificacion,
                        beforeSend: function(xhr){
                           xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                        },                        
                        success: function(response){
                           if(response != "") {
                             var estudiante = JSON.parse(response);
                             $('#nombresPersonaAdendaRetiro').val(estudiante.nombres);
                             $('#apellidosPersonaAdendaRetiro').val(estudiante.apellidos);
                           } else {
                             $('#nombresPersonaAdendaRetiro').val("");
                             $('#apellidosPersonaAdendaRetiro').val("");
                           }    
                        },
                        error: function(e){
                            bootstrap_alert_adenda_retiro.warning(e);
                        }
                    });
           }

           $('#adendaRetiroProyecto').submit(function (evt) {
                evt.preventDefault();
                var formData = new FormData(this);
                if ($('#tipoPersonaAdendaRetiro').val() == "") {
                    bootstrap_alert_adenda_retiro.warning('Debe seleccionar el tipo de persona');
                    return false;
                }
                if ($('#tipoIdentificacionPersonaAdendaRetiro').val() == "") {
                    bootstrap_alert_adenda_retiro.warning('Debe seleccionar el tipo de identificación');
                    return false;
                }
                if ($('#numeroIdentificacionPersonaAdendaRetiro').val() == "") {
                    bootstrap_alert_adenda_retiro.warning('Debe ingresar el número de identificación');
                    return false;
                }
                if ($('#rolAdendaRetiro').val() == "") {
                    bootstrap_alert_adenda_retiro.warning('Debe seleccionar el rol');
                    return false;
                }
                if ($('#fechaAdendaRetiro').val() == "") {
                    bootstrap_alert_adenda_retiro.warning('Debe ingresar la fecha de retiro');
                    return false;
                }
                if ($('#motivoAdendaRetiro').val() == "") {
                    bootstrap_alert_adenda_retiro.warning('Debe ingresar el motivo del retiro');
                    return false;
                }
                if ($('#numeroActaAdendaRetiro').val() == "") {
                    bootstrap_alert_adenda_retiro.warning('Debe ingresar el número del acta');
                    return false;
                }
                if ($('#fechaActaAdendaRetiro').val() == "") {
                    bootstrap_alert_adenda_retiro.warning('Debe ingresar la fecha del acta de retiro');
                    return false;
                }
                if ($('#idAdendaRetiro').val() == 0 && $('#documentoAdendaRetiro').prop('files').length == 0) {
                    bootstrap_alert_adenda_retiro.warning('Debe seleccionar el archivo');
                    return false;
                }
                $('#adendaRetiroModal').modal('toggle');
                bootstrap_alert_adenda_retiro.removeWarning();
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/novedades/adendaRetiro",
                    data: formData,
                    processData: false,
                    contentType: false,
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                    },
                    success: function (response) {
                        var error = JSON.parse(response);
                        if(error.error != null) {
                            bootstrap_alert_adendas_retiro.warning(error.error);
                        } else {
                            bootstrap_alert_adendas_retiro.success("Adenda almacenada exitosamente");
                            limpiarDatosVentanaAdendaRetiro();
                            if (response != "") {
                                proyectoModel.adendasRetiro.removeAll();
                                var adendas = JSON.parse(response);
                                for (var i = 0; i < adendas.length; i++) {
                                    proyectoModel.adendasRetiro.push(
                                            {
                                                idAdenda: ko.observable(adendas[i].idAdenda),
                                                idTipoPersona: ko.observable(adendas[i].idTipoPersona),
                                                nombreTipoPersona: ko.observable(adendas[i].nombreTipoPersona),
                                                idTipoIdentificacionPersona: ko.observable(adendas[i].idTipoIdentificacionPersona),
                                                nombreTipoIdentificacionPersona: ko.observable(adendas[i].nombreTipoIdentificacionPersona),
                                                numeroIdentificacionPersona: ko.observable(adendas[i].numeroIdentificacionPersona),
                                                nombresPersona: ko.observable(adendas[i].nombresPersona),
                                                apellidosPersona: ko.observable(adendas[i].apellidosPersona),
                                                motivo: ko.observable(adendas[i].motivo),
                                                numeroActa: ko.observable(adendas[i].numeroActa),
                                                fechaActaFormateada: ko.observable(adendas[i].fechaActaFormateada),
                                                fechaRetiroFormateada: ko.observable(adendas[i].fechaRetiroFormateada)
                                            }
                                    );
                                }
                            }
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        bootstrap_alert_adendas_retiro.warning("Error al almacenar la adenda.");
                    }});
            });

            function eliminarAdendaRetiro() {
                $('#confirmacionEliminacionAdendaRetiro').modal('toggle');
                $.ajax({
                    type: 'GET',
                    url: "${pageContext.request.contextPath}/novedades/eliminarAdendaRetiro/" + $('#idProyecto').val() + "/" + adendaRetiroEliminar.idAdenda(),
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                    },
                    success: function (response) {
                        bootstrap_alert_adendas_retiro.success("Adenda eliminada exitosamente");
                        if (response != "") {
                            proyectoModel.adendasRetiro.removeAll();
                            var adendas = JSON.parse(response);
                            for (var i = 0; i < adendas.length; i++) {
                                proyectoModel.adendasRetiro.push(
                                        {
                                            idAdenda: ko.observable(adendas[i].idAdenda),
                                            idTipoPersona: ko.observable(adendas[i].idTipoPersona),
                                            nombreTipoPersona: ko.observable(adendas[i].nombreTipoPersona),
                                            idTipoIdentificacionPersona: ko.observable(adendas[i].idTipoIdentificacionPersona),
                                            nombreTipoIdentificacionPersona: ko.observable(adendas[i].nombreTipoIdentificacionPersona),
                                            numeroIdentificacionPersona: ko.observable(adendas[i].numeroIdentificacionPersona),
                                            nombresPersona: ko.observable(adendas[i].nombresPersona),
                                            apellidosPersona: ko.observable(adendas[i].apellidosPersona),
                                            numeroActa: ko.observable(adendas[i].numeroActa),
                                            fechaActaFormateada: ko.observable(adendas[i].fechaActaFormateada),
                                            motivo: ko.observable(adendas[i].motivo),
                                            fechaRetiroFormateada: ko.observable(adendas[i].fechaRetiroFormateada)
                                        }
                                );
                            }
                        }
                        
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        bootstrap_alert_adendas_retiro.warning("Error al eliminar la adenda");
                    }});
            }
            
          function buscarPersonaAdendaIngreso() {
          
                if ($('#tipoPersonaAdendaIngreso').val() == "") {
                    bootstrap_alert_adenda_ingreso.warning('Debe seleccionar el tipo de persona');
                    return false;
                }
                if ($('#tipoIdentificacionPersonaAdendaIngreso').val() == "") {
                    bootstrap_alert_adenda_ingreso.warning('Debe seleccionar el tipo de identificación');
                    return false;
                }
                if ($('#numeroIdentificacionPersonaAdendaIngreso').val() == "") {
                    bootstrap_alert_adenda_ingreso.warning('Debe ingresar el número de identificación');
                    return false;
                }

                var tipoIdentificacion = $('#tipoIdentificacionPersonaAdendaIngreso').val();
                var numeroIdentificacion = $('#numeroIdentificacionPersonaAdendaIngreso').val();
                var tipoPersona = "";
                if ($('#tipoPersonaAdendaIngreso').val() == "1") {
                    tipoPersona = "profesores";
                } else if ($('#tipoPersonaAdendaIngreso').val() == "2") {
                    tipoPersona = "estudiantes";
                } else if ($('#tipoPersonaAdendaIngreso').val() == "3") {
                    tipoPersona = "personalExterno";
                }

                $.ajax({
                        type: "POST",
                        url: "${pageContext.request.contextPath}/proyectos/" + tipoPersona,
                        data: "idTipoIdentificacion=" + tipoIdentificacion + "&numeroIdentificacion=" + numeroIdentificacion,
                        beforeSend: function(xhr){
                           xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                        },                        
                        success: function(response){
                           if(response != "") {
                             var persona = JSON.parse(response);
                             $('#nombresPersonaAdendaIngreso').val(persona.nombres);
                             $('#apellidosPersonaAdendaIngreso').val(persona.apellidos);
                           } else {
                             $('#nombresPersonaAdendaIngreso').val("");
                             $('#apellidosPersonaAdendaIngreso').val("");
                           }    
                        },
                        error: function(e){
                            bootstrap_alert_adenda_ingreso.warning(e);
                        }
                    });
           }

            $('#adendaIngresoProyecto').submit(function (evt) {
                evt.preventDefault();
                var formData = new FormData(this);
                if ($('#tipoPersonaAdendaIngreso').val() == "") {
                    bootstrap_alert_adenda_ingreso.warning('Debe seleccionar el tipo de persona');
                    return false;
                }
                if ($('#tipoIdentificacionPersonaAdendaIngreso').val() == "") {
                    bootstrap_alert_adenda_ingreso.warning('Debe seleccionar el tipo de identificación');
                    return false;
                }
                if ($('#numeroIdentificacionPersonaAdendaIngreso').val() == "") {
                    bootstrap_alert_adenda_ingreso.warning('Debe ingresar el número de identificación');
                    return false;
                }
                if ($('#fechaAdendaIngreso').val() == "") {
                    bootstrap_alert_adenda_ingreso.warning('Debe ingresar la fecha de ingreso');
                    return false;
                }
                if ($('#fechaActaAdendaIngreso').val() == "") {
                    bootstrap_alert_adenda_ingreso.warning('Debe ingresar la fecha del acta');
                    return false;
                }
                if ($('#numeroActaAdendaIngreso').val() == "") {
                    bootstrap_alert_adenda_ingreso.warning('Debe ingresar el número del acta');
                    return false;
                }
                if ($('#idAdendaIngreso').val() == 0 && $('#documentoAdendaIngreso').prop('files').length == 0) {
                    bootstrap_alert_adenda_ingreso.warning('Debe seleccionar el archivo');
                    return false;
                }
                $('#adendaIngresoModal').modal('toggle');
                bootstrap_alert_adenda_ingreso.removeWarning();
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/novedades/adendaIngreso",
                    data: formData,
                    processData: false,
                    contentType: false,
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                    },
                    success: function (response) {
                        var error = JSON.parse(response);
                        if(error.error != null) {
                            bootstrap_alert_adendas_ingreso.warning(error.error);
                        } else {
                            bootstrap_alert_adendas_ingreso.success("Adenda almacenada exitosamente");
                            limpiarDatosVentanaAdendaIngreso();
                            if (response != "") {
                                proyectoModel.adendasIngreso.removeAll();
                                var adendas = JSON.parse(response);
                                for (var i = 0; i < adendas.length; i++) {
                                    proyectoModel.adendasIngreso.push(
                                            {
                                                idAdenda: ko.observable(adendas[i].idAdenda),
                                                idTipoPersona: ko.observable(adendas[i].idTipoPersona),
                                                nombreTipoPersona: ko.observable(adendas[i].nombreTipoPersona),
                                                idTipoIdentificacionPersona: ko.observable(adendas[i].idTipoIdentificacionPersona),
                                                nombreTipoIdentificacionPersona: ko.observable(adendas[i].nombreTipoIdentificacionPersona),
                                                numeroIdentificacionPersona: ko.observable(adendas[i].numeroIdentificacionPersona),
                                                nombresPersona: ko.observable(adendas[i].nombresPersona),
                                                apellidosPersona: ko.observable(adendas[i].apellidosPersona),
                                                numeroActa: ko.observable(adendas[i].numeroActa),
                                                fechaActaFormateada: ko.observable(adendas[i].fechaActaFormateada),
                                                fechaIngresoFormateada: ko.observable(adendas[i].fechaIngresoFormateada)
                                            }
                                    );
                                }
                            }
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        bootstrap_alert_adendas_ingreso.warning("Error al almacenar la adenda.");
                    }});
            });

            function eliminarAdendaIngreso () {
                $('#confirmacionEliminacionAdendaIngreso').modal('toggle');
                $.ajax({
                    type: 'GET',
                    url: "${pageContext.request.contextPath}/novedades/eliminarAdendaIngreso/" + $('#idProyecto').val() + "/" + adendaIngresoEliminar.idAdenda(),
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                    },
                    success: function (response) {
                        bootstrap_alert_adendas_ingreso.success("Adenda eliminada exitosamente");
                        if (response != "") {
                            proyectoModel.adendasIngreso.removeAll();
                            var adendas = JSON.parse(response);
                            for (var i = 0; i < adendas.length; i++) {
                                proyectoModel.adendasIngreso.push(
                                        {
                                            idAdenda: ko.observable(adendas[i].idAdenda),
                                            idTipoPersona: ko.observable(adendas[i].idTipoPersona),
                                            nombreTipoPersona: ko.observable(adendas[i].nombreTipoPersona),
                                            idTipoIdentificacionPersona: ko.observable(adendas[i].idTipoIdentificacionPersona),
                                            nombreTipoIdentificacionPersona: ko.observable(adendas[i].nombreTipoIdentificacionPersona),
                                            numeroIdentificacionPersona: ko.observable(adendas[i].numeroIdentificacionPersona),
                                            nombresPersona: ko.observable(adendas[i].nombresPersona),
                                            apellidosPersona: ko.observable(adendas[i].apellidosPersona),
                                            numeroActa: ko.observable(adendas[i].numeroActa),
                                            fechaActaFormateada: ko.observable(adendas[i].fechaActaFormateada),
                                            fechaIngresoFormateada: ko.observable(adendas[i].fechaIngresoFormateada)
                                        }
                                );
                            }
                        }
                        
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        bootstrap_alert_adendas_ingreso.warning("Error al eliminar la adenda");
                    }});
            }            
            
          $('#adicionProyecto').submit(function (evt) {
                evt.preventDefault();
                var formData = new FormData(this);
                if ($('#montoAdicion').val() == "") {
                    bootstrap_alert_adicion.warning('Debe ingresar el monto');
                    return false;
                }
                if ($('#fechaActaAdicion').val() == "") {
                    bootstrap_alert_adicion.warning('Debe ingresar la fecha del acta');
                    return false;
                }
                if ($('#numeroActaAdicion').val() == "") {
                    bootstrap_alert_adicion.warning('Debe ingresar el número del acta');
                    return false;
                }
                if ($('#fechaActaCODIAdicion').val() == "") {
                    bootstrap_alert_adicion.warning('Debe ingresar la fecha del acta CODI');
                    return false;
                }
                if ($('#numeroActaCODIAdicion').val() == "") {
                    bootstrap_alert_adicion.warning('Debe ingresar el número del acta CODI');
                    return false;
                }
                if ($('#descripcionAdicion').val() == "") {
                    bootstrap_alert_adicion.warning('Debe ingresar la descripción');
                    return false;
                }
                if ($('#idAdicion').val() == 0 && $('#documentoAdicion').prop('files').length == 0) {
                    bootstrap_alert_adicion.warning('Debe seleccionar el archivo');
                    return false;
                }
                $('#adicionModal').modal('toggle');
                bootstrap_alert_adicion.removeWarning();
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/novedades/adicion",
                    data: formData,
                    processData: false,
                    contentType: false,
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                    },
                    success: function (response) {
                        bootstrap_alert_adiciones.success("Adición almacenada exitosamente");
                        limpiarDatosVentanaAdicion();
                        if (response != "") {
                            proyectoModel.adiciones.removeAll();
                            var adiciones = JSON.parse(response);
                            for (var i = 0; i < adiciones.length; i++) {
                                proyectoModel.adiciones.push(
                                        {
                                            idAdicion: ko.observable(adiciones[i].idAdicion),
                                            monto: ko.observable(adiciones[i].monto),
                                            montoFormateado: ko.observable(adiciones[i].montoFormateado),
                                            descripcion : ko.observable(adiciones[i].descripcion),
                                            fechaActaFormateada: ko.observable(adiciones[i].fechaActaFormateada),
                                            numeroActa : ko.observable(adiciones[i].numeroActa),
                                            fechaActaCODIFormateada : ko.observable(adiciones[i].fechaActaCODIFormateada),
                                            numeroActaCODI : ko.observable(adiciones[i].numeroActaCODI)
                                        }
                                );
                            }
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        bootstrap_alert_adiciones.warning("Error al almacenar la adición");
                    }});
            });

            function eliminarAdicion () {
                $('#confirmacionEliminacionAdicion').modal('toggle');
                $.ajax({
                    type: 'GET',
                    url: "${pageContext.request.contextPath}/novedades/eliminarAdicion/" + $('#idProyecto').val() + "/" + adicionEliminar.idAdicion(),
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                    },
                    success: function (response) {
                        bootstrap_alert_adiciones.success("Adición eliminada exitosamente");
                        if (response != "") {
                            proyectoModel.adiciones.removeAll();
                            var adiciones = JSON.parse(response);
                            for (var i = 0; i < adiciones.length; i++) {
                                proyectoModel.adiciones.push(
                                        {
                                            idAdicion: ko.observable(adiciones[i].idAdicion),
                                            monto: ko.observable(adiciones[i].monto),
                                            montoFormateado: ko.observable(adiciones[i].montoFormateado),
                                            fechaActaFormateada: ko.observable(adiciones[i].fechaActaFormateada),
                                            numeroActa : ko.observable(adiciones[i].numeroActa),
                                            descripcion : ko.observable(adiciones[i].descripcion),
                                            numeroActaCODI : ko.observable(adiciones[i].numeroActaCODI),
                                            fechaActaCODIFormateada : ko.observable(adiciones[i].fechaActaCODIFormateada)
                                        }
                                );
                            }
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        bootstrap_alert_adiciones.warning("Error al eliminar la adición");
                    }});
            }

          $('#prorrogaProyecto').submit(function (evt) {
                evt.preventDefault();
                var formData = new FormData(this);
                if ($('#descripcionProrroga').val() == "") {
                    bootstrap_alert_prorroga.warning('Debe ingresar la descripción');
                    return false;
                }
                if ($('#mesesAprobadosProrroga').val() == "") {
                    bootstrap_alert_prorroga.warning('Debe ingresar los meses aprobados');
                    return false;
                }
                if ($('#montoAprobadoProrroga').val() == "") {
                    bootstrap_alert_prorroga.warning('Debe ingresar el monto aprobado');
                    return false;
                }
                if ($('#fechaActaProrroga').val() == "") {
                    bootstrap_alert_prorroga.warning('Debe ingresar la fecha del acta');
                    return false;
                }
                if ($('#numeroActaProrroga').val() == "") {
                    bootstrap_alert_prorroga.warning('Debe ingresar el número del acta');
                    return false;
                }
                if ($('#fechaActaCODIProrroga').val() == "") {
                    bootstrap_alert_prorroga.warning('Debe ingresar la fecha del acta CODI');
                    return false;
                }
                if ($('#numeroActaCODIProrroga').val() == "") {
                    bootstrap_alert_prorroga.warning('Debe ingresar el número del acta CODI');
                    return false;
                }
                if ($('#idProrroga').val() == 0 && $('#documentoProrroga').prop('files').length == 0) {
                    bootstrap_alert_prorroga.warning('Debe seleccionar el archivo');
                    return false;
                }
                $('#prorrogaModal').modal('toggle');
                bootstrap_alert_prorroga.removeWarning();
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/novedades/prorroga",
                    data: formData,
                    processData: false,
                    contentType: false,
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                    },
                    success: function (response) {
                        bootstrap_alert_prorrogas.success("Prórroga almacenada exitosamente");
                        limpiarDatosVentanaProrroga();
                        if (response != "") {
                            proyectoModel.prorrogas.removeAll();
                            var prorrogas = JSON.parse(response);
                            for (var i = 0; i < prorrogas.length; i++) {
                                proyectoModel.prorrogas.push(
                                        {
                                            idProrroga: ko.observable(prorrogas[i].idProrroga),
                                            descripcion: ko.observable(prorrogas[i].descripcion),
                                            mesesAprobados: ko.observable(prorrogas[i].mesesAprobados),
                                            montoAprobado: ko.observable(prorrogas[i].montoAprobado),
                                            montoAprobadoFormateado: ko.observable(prorrogas[i].montoAprobadoFormateado),
                                            fechaActaFormateada: ko.observable(prorrogas[i].fechaActaFormateada),
                                            numeroActa: ko.observable(prorrogas[i].numeroActa),
                                            fechaActaCODIFormateada: ko.observable(prorrogas[i].fechaActaCODIFormateada),
                                            numeroActaCODI: ko.observable(prorrogas[i].numeroActaCODI)
                                        }
                                );
                            }
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        bootstrap_alert_prorrogas.warning("Error al almacenar el prórroga");
                    }});
            });

            function eliminarProrroga () {
                $('#confirmacionEliminacionProrroga').modal('toggle');
                $.ajax({
                    type: 'GET',
                    url: "${pageContext.request.contextPath}/novedades/eliminarProrroga/" + $('#idProyecto').val() + "/" + prorrogaEliminar.idProrroga(),
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                    },
                    success: function (response) {
                        bootstrap_alert_prorrogas.success("Prórroga eliminada exitosamente");
                        if (response != "") {
                            proyectoModel.prorrogas.removeAll();
                            var prorrogas = JSON.parse(response);
                            for (var i = 0; i < prorrogas.length; i++) {
                                proyectoModel.prorrogas.push(
                                        {
                                            idProrroga: ko.observable(prorrogas[i].idProrroga),
                                            descripcion: ko.observable(prorrogas[i].descripcion),
                                            mesesAprobados: ko.observable(prorrogas[i].mesesAprobados),
                                            fechaActaFormateada: ko.observable(prorrogas[i].fechaActaFormateada),
                                            numeroActa: ko.observable(prorrogas[i].numeroActa),
                                            fechaActaCODIFormateada: ko.observable(prorrogas[i].fechaActaCODIFormateada),
                                            numeroActaCODI: ko.observable(prorrogas[i].numeroActaCODI)
                                        }
                                );
                            }
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        bootstrap_alert_prorrogas.warning("Error al eliminar el prórroga");
                    }});
            }

        $('#plazoProyecto').submit(function (evt) {
                evt.preventDefault();
                var formData = new FormData(this);
                if ($('#descripcionPlazo').val() == "") {
                    bootstrap_alert_plazo.warning('Debe ingresar la descripción');
                    return false;
                }
                if ($('#mesesAprobadosPlazo').val() == "") {
                    bootstrap_alert_plazo.warning('Debe ingresar los meses aprobados');
                    return false;
                }
                if ($('#fechaActaPlazo').val() == "") {
                    bootstrap_alert_plazo.warning('Debe ingresar la fecha del acta');
                    return false;
                }
                if ($('#numeroActaPlazo').val() == "") {
                    bootstrap_alert_plazo.warning('Debe ingresar el número del acta');
                    return false;
                }
                if ($('#fechaActaCODIPlazo').val() == "") {
                    bootstrap_alert_plazo.warning('Debe ingresar la fecha del acta CODI');
                    return false;
                }
                if ($('#numeroActaCODIPlazo').val() == "") {
                    bootstrap_alert_plazo.warning('Debe ingresar el número del acta CODI');
                    return false;
                }
                if ($('#idPlazo').val() == 0 && $('#documentoPlazo').prop('files').length == 0) {
                    bootstrap_alert_plazo.warning('Debe seleccionar el archivo');
                    return false;
                }
                $('#plazoModal').modal('toggle');
                bootstrap_alert_plazo.removeWarning();
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/novedades/plazo",
                    data: formData,
                    processData: false,
                    contentType: false,
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                    },
                    success: function (response) {
                        bootstrap_alert_plazos.success("Plazo almacenado exitosamente");
                        limpiarDatosVentanaPlazo();
                        if (response != "") {
                            proyectoModel.plazos.removeAll();
                            var plazos = JSON.parse(response);
                            for (var i = 0; i < plazos.length; i++) {
                                proyectoModel.plazos.push(
                                        {
                                            idPlazo: ko.observable(plazos[i].idPlazo),
                                            descripcion: ko.observable(plazos[i].descripcion),
                                            mesesAprobados: ko.observable(plazos[i].mesesAprobados),
                                            fechaActaFormateada: ko.observable(plazos[i].fechaActaFormateada),
                                            numeroActa: ko.observable(plazos[i].numeroActa),
                                            fechaActaCODIFormateada: ko.observable(plazos[i].fechaActaCODIFormateada),
                                            numeroActaCODI: ko.observable(plazos[i].numeroActaCODI)
                                        }
                                );
                            }
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        bootstrap_alert_plazos.warning("Error al almacenar el plazo");
                    }});
            });

            function eliminarPlazo () {
                $('#confirmacionEliminacionPlazo').modal('toggle');
                $.ajax({
                    type: 'GET',
                    url: "${pageContext.request.contextPath}/novedades/eliminarPlazo/" + $('#idProyecto').val() + "/" + plazoEliminar.idPlazo(),
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                    },
                    success: function (response) {
                        bootstrap_alert_plazos.success("Plazo eliminado exitosamente");
                        if (response != "") {
                            proyectoModel.plazos.removeAll();
                            var plazos = JSON.parse(response);
                            for (var i = 0; i < plazos.length; i++) {
                                proyectoModel.plazos.push(
                                        {
                                            idPlazo: ko.observable(plazos[i].idPlazo),
                                            descripcion: ko.observable(plazos[i].descripcion),
                                            mesesAprobados: ko.observable(plazos[i].mesesAprobados),
                                            fechaActaFormateada: ko.observable(plazos[i].fechaActaFormateada),
                                            numeroActa: ko.observable(plazos[i].numeroActa),
                                            fechaActaCODIFormateada: ko.observable(plazos[i].fechaActaCODIFormateada),
                                            numeroActaCODI: ko.observable(plazos[i].numeroActaCODI)
                                        }
                                );
                            }
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        bootstrap_alert_plazos.warning("Error al eliminar el plazo");
                    }});
            }

      $('#cumplimientoCompromisoProyecto').submit(function (evt) {
                evt.preventDefault();
                var formData = new FormData(this);
                if ($('#compromisoProyecto').val() == "") {
                    alert_placeholder_cumplimiento_compromiso_proyecto.warning('Debe seleccionar el compromiso');
                    return false;
                }
                if ($('#fechaActaCumplimientoCompromisoProyecto').val() == "") {
                    alert_placeholder_cumplimiento_compromiso_proyecto.warning('Debe ingresar la fecha del acta');
                    return false;
                }
                if ($('#numeroActaCumplimientoCompromisoProyecto').val() == "") {
                    alert_placeholder_cumplimiento_compromiso_proyecto.warning('Debe ingresar el número del acta');
                    return false;
                }
                if ($('#idCumplimientoCompromisoProyecto').val() == 0 && $('#documentoCumplimientoCompromisoProyecto').prop('files').length == 0) {
                    alert_placeholder_cumplimiento_compromiso_proyecto.warning('Debe seleccionar el archivo');
                    return false;
                }
                $('#cumplimientoCompromisoProyectoModal').modal('toggle');
                alert_placeholder_cumplimiento_compromiso_proyecto.removeWarning();
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/novedades/cumplimientoCompromiso",
                    data: formData,
                    processData: false,
                    contentType: false,
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                    },
                    success: function (response) {
                        alert_placeholder_cumplimiento_compromisos_proyecto.success("Cumplimiento del compromiso almacenado exitosamente");
                        limpiarDatosVentanaCumplimientoCompromisoProyecto();
                        if (response != "") {
                            proyectoModel.cumplimientoCompromisosProyecto.removeAll();
                            var cumplimientoCompromisosProyecto = JSON.parse(response);
                            for (var i = 0; i < cumplimientoCompromisosProyecto.length; i++) {
                                proyectoModel.cumplimientoCompromisosProyecto.push(
                                        {
                                            idCumplimientoCompromisoProyecto: ko.observable(cumplimientoCompromisosProyecto[i].idCumplimientoCompromisoProyecto),
                                            idCompromisoProyecto: ko.observable(cumplimientoCompromisosProyecto[i].idCompromisoProyecto),
                                            descripcionCompromisoProyecto: ko.observable(cumplimientoCompromisosProyecto[i].descripcionCompromisoProyecto),
                                            fechaActaFormateada: ko.observable(cumplimientoCompromisosProyecto[i].fechaActaFormateada),
                                            numeroActa: ko.observable(cumplimientoCompromisosProyecto[i].numeroActa)
                                        }
                                );
                            }
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert_placeholder_cumplimiento_compromisos_proyecto.warning("Error al almacenar el cumplimiento del compromiso");
                    }});
            });

            function eliminarCumplimientoCompromisoProyecto () {
                $('#confirmacionEliminacionCumplimientoCompromisoProyecto').modal('toggle');
                $.ajax({
                    type: 'GET',
                    url: "${pageContext.request.contextPath}/novedades/eliminarCumplimientoCompromiso/" + $('#idProyecto').val() + "/" + cumplimientoCompromisoEliminarProyecto.idCumplimientoCompromisoProyecto(),
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                    },
                    success: function (response) {
                        alert_placeholder_cumplimiento_compromisos_proyecto.success("Cumplimiento del compromiso eliminado exitosamente");
                        if (response != "") {
                            proyectoModel.cumplimientoCompromisosProyecto.removeAll();
                            var cumplimientoCompromisosProyecto = JSON.parse(response);
                            for (var i = 0; i < cumplimientoCompromisosProyecto.length; i++) {
                                proyectoModel.cumplimientoCompromisosProyecto.push(
                                        {
                                            idCumplimientoCompromisoProyecto: ko.observable(cumplimientoCompromisosProyecto[i].idCumplimientoCompromisoProyecto),
                                            idCompromisoProyecto: ko.observable(cumplimientoCompromisosProyecto[i].idCompromisoProyecto),
                                            descripcionCompromisoProyecto: ko.observable(cumplimientoCompromisosProyecto[i].descripcionCompromisoProyecto),
                                            fechaActaFormateada: ko.observable(cumplimientoCompromisosProyecto[i].fechaActaFormateada),
                                            numeroActa: ko.observable(cumplimientoCompromisosProyecto[i].numeroActa)
                                        }
                                );
                            }
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert_placeholder_cumplimiento_compromisos_proyecto.warning("Error al eliminar el cumplimiento del compromiso");
                    }});
            }

      $('#compromisoHomologadoProyecto').submit(function (evt) {
                evt.preventDefault();
                var formData = new FormData(this);
                if ($('#compromisoProyectoHomologado').val() == "") {
                    alert_placeholder_compromisos_homologado_proyecto.warning('Debe seleccionar el compromiso a homologar');
                    return false;
                }
                if ($('#nuevoCompromisoProyecto').val() == "") {
                    alert_placeholder_compromisos_homologado_proyecto.warning('Debe seleccionar el compromiso');
                    return false;
                }
                if ($('#compromisoProyectoHomologado').val() == $('#nuevoCompromisoProyecto').val()) {
                    alert_placeholder_compromisos_homologado_proyecto.warning('Los compromisos debe ser diferentes');
                    return false;
                }
                if ($('#descripcionCompromisoHomologadoProyecto').val() == "") {
                    alert_placeholder_compromisos_homologado_proyecto.warning('Debe ingresar la descripción');
                    return false;
                }
                if ($('#fechaActaCompromisoHomologadoProyecto').val() == "") {
                    alert_placeholder_compromisos_homologado_proyecto.warning('Debe ingresar la fecha del acta');
                    return false;
                }
                if ($('#numeroActaCompromisoHomologadoProyecto').val() == "") {
                    alert_placeholder_compromisos_homologado_proyecto.warning('Debe ingresar el número del acta');
                    return false;
                }
                $('#compromisoHomologadoProyectoModal').modal('toggle');
                alert_placeholder_compromisos_homologado_proyecto.removeWarning();
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/novedades/compromisoHomologado",
                    data: formData,
                    processData: false,
                    contentType: false,
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                    },
                    success: function (response) {
                        alert_placeholder_compromisos_homologados_proyecto.success("La homologación del compromiso se ha almacenado exitosamente");
                        limpiarDatosVentanaCompromisoHomologadoProyecto();
                        if (response != "") {
                            proyectoModel.compromisosHomologadosProyecto.removeAll();
                            var compromisosHomologadosProyecto = JSON.parse(response);
                            for (var i = 0; i < compromisosHomologadosProyecto.length; i++) {
                                proyectoModel.compromisosHomologadosProyecto.push(
                                        {
                                            idCompromisoHomologadoProyecto: ko.observable(compromisosHomologadosProyecto[i].idCompromisoHomologadoProyecto),
                                            idCompromisoProyectoHomologado: ko.observable(compromisosHomologadosProyecto[i].idCompromisoProyectoHomologado),
                                            descripcionCompromisoProyectoHomologado: ko.observable(compromisosHomologadosProyecto[i].descripcionCompromisoProyectoHomologado),
                                            idCompromisoProyecto: ko.observable(compromisosHomologadosProyecto[i].idCompromisoProyecto),
                                            descripcionCompromisoProyecto: ko.observable(compromisosHomologadosProyecto[i].descripcionCompromisoProyecto),
                                            descripcion: ko.observable(compromisosHomologadosProyecto[i].descripcion),
                                            observaciones: ko.observable(compromisosHomologadosProyecto[i].observaciones),
                                            fechaActaFormateada: ko.observable(compromisosHomologadosProyecto[i].fechaActaFormateada),
                                            numeroActa: ko.observable(compromisosHomologadosProyecto[i].numeroActa)
                                        }
                                );
                            }
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert_placeholder_compromisos_homologados_proyecto.warning("Error al almacenar la homologación del compromiso");
                    }});
            });

            function eliminarCompromisoHomologadoProyecto () {
                $('#confirmacionEliminacionCompromisoHomologadoProyecto').modal('toggle');
                $.ajax({
                    type: 'GET',
                    url: "${pageContext.request.contextPath}/novedades/eliminarCompromisoHomologado/" + $('#idProyecto').val() + "/" + compromisoHomologadoEliminarProyecto.idCompromisoHomologadoProyecto(),
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                    },
                    success: function (response) {
                        alert_placeholder_compromisos_homologados_proyecto.success("Homologación del compromiso eliminada exitosamente");
                        if (response != "") {
                            proyectoModel.compromisosHomologadosProyecto.removeAll();
                            var compromisosHomologadosProyecto = JSON.parse(response);
                            for (var i = 0; i < compromisosHomologadosProyecto.length; i++) {
                                proyectoModel.compromisosHomologadosProyecto.push(
                                        {
                                            idCompromisoHomologadoProyecto: ko.observable(compromisosHomologadosProyecto[i].idCompromisoHomologadoProyecto),
                                            idCompromisoProyectoHomologado: ko.observable(compromisosHomologadosProyecto[i].idCompromisoProyectoHomologado),
                                            descripcionCompromisoProyectoHomologado: ko.observable(compromisosHomologadosProyecto[i].descripcionCompromisoProyectoHomologado),
                                            idCompromisoProyecto: ko.observable(compromisosHomologadosProyecto[i].idCompromisoProyecto),
                                            descripcionCompromisoProyecto: ko.observable(compromisosHomologadosProyecto[i].descripcionCompromisoProyecto),
                                            descripcion: ko.observable(compromisosHomologadosProyecto[i].descripcion),
                                            observaciones: ko.observable(compromisosHomologadosProyecto[i].observaciones),
                                            fechaActaFormateada: ko.observable(compromisosHomologadosProyecto[i].fechaActaFormateada),
                                            numeroActa: ko.observable(compromisosHomologadosProyecto[i].numeroActa)
                                        }
                                );
                            }
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert_placeholder_compromisos_homologados_proyecto.warning("Error al eliminar la homologación del compromiso");
                    }});
            }

      $('#cumplimientoAlertaAvalProyecto').submit(function (evt) {
                evt.preventDefault();
                var formData = new FormData(this);
                if ($('#alertaAvalProyecto').val() == "") {
                    alert_placeholder_cumplimiento_alerta_aval_proyecto.warning('Debe seleccionar la alerta de aval');
                    return false;
                }
                if ($('#fechaActaCumplimientoAlertaAvalProyecto').val() == "") {
                    alert_placeholder_cumplimiento_alerta_aval_proyecto.warning('Debe ingresar la fecha del acta');
                    return false;
                }
                if ($('#numeroActaCumplimientoAlertaAvalProyecto').val() == "") {
                    alert_placeholder_cumplimiento_alerta_aval_proyecto.warning('Debe ingresar el número del acta');
                    return false;
                }
                if ($('#idCumplimientoAlertaAvalProyecto').val() == 0 && $('#documentoCumplimientoAlertaAvalProyecto').prop('files').length == 0) {
                    alert_placeholder_cumplimiento_alerta_aval_proyecto.warning('Debe seleccionar el archivo');
                    return false;
                }
                $('#cumplimientoAlertaAvalProyectoModal').modal('toggle');
                alert_placeholder_cumplimiento_alerta_aval_proyecto.removeWarning();
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/novedades/cumplimientoAlertaAval",
                    data: formData,
                    processData: false,
                    contentType: false,
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                    },
                    success: function (response) {
                        alert_placeholder_cumplimientos_alertas_aval_proyecto.success("Cumplimiento de la alerta de aval almacenado exitosamente");
                        limpiarDatosVentanaCumplimientoAlertaAvalProyecto();
                        if (response != "") {
                            proyectoModel.cumplimientoAlertasAvalProyecto.removeAll();
                            var cumplimientoAlertasAvalProyecto = JSON.parse(response);
                            for (var i = 0; i < cumplimientoAlertasAvalProyecto.length; i++) {
                                proyectoModel.cumplimientoAlertasAvalProyecto.push(
                                        {
                                            idCumplimientoAlertaAvalProyecto: ko.observable(cumplimientoAlertasAvalProyecto[i].idCumplimientoAlertaAvalProyecto),
                                            idAlertaAvalProyecto: ko.observable(cumplimientoAlertasAvalProyecto[i].idAlertaAvalProyecto),
                                            descripcionAlertaAvalProyecto: ko.observable(cumplimientoAlertasAvalProyecto[i].descripcionAlertaAvalProyecto),
                                            fechaActaFormateada: ko.observable(cumplimientoAlertasAvalProyecto[i].fechaActaFormateada),
                                            numeroActa: ko.observable(cumplimientoAlertasAvalProyecto[i].numeroActa)
                                        }
                                );
                            }
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert_placeholder_cumplimientos_alertas_aval_proyecto.warning("Error al almacenar el cumplimiento de la alerta de aval");
                    }});
            });

            function eliminarCumplimientoAlertaAvalProyecto () {
                $('#confirmacionEliminacionCumplimientoAlertaAvalProyecto').modal('toggle');
                $.ajax({
                    type: 'GET',
                    url: "${pageContext.request.contextPath}/novedades/eliminarCumplimientoAlertaAval/" + $('#idProyecto').val() + "/" + cumplimientoAlertaAvalEliminarProyecto.idCumplimientoAlertaAvalProyecto(),
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                    },
                    success: function (response) {
                        alert_placeholder_cumplimientos_alertas_aval_proyecto.success("Cumplimiento de la alerta de aval eliminado exitosamente");
                        if (response != "") {
                            proyectoModel.cumplimientoAlertasAvalProyecto.removeAll();
                            var cumplimientoAlertasAvalProyecto = JSON.parse(response);
                            for (var i = 0; i < cumplimientoAlertasAvalProyecto.length; i++) {
                                proyectoModel.cumplimientoAlertasAvalProyecto.push(
                                        {
                                            idCumplimientoAlertaAvalProyecto: ko.observable(cumplimientoAlertasAvalProyecto[i].idCumplimientoAlertaAvalProyecto),
                                            idAlertaAvalProyecto: ko.observable(cumplimientoAlertasAvalProyecto[i].idAlertaAvalProyecto),
                                            descripcionAlertaAvalProyecto: ko.observable(cumplimientoAlertasAvalProyecto[i].descripcionAlertaAvalProyecto),
                                            fechaActaFormateada: ko.observable(cumplimientoAlertasAvalProyecto[i].fechaActaFormateada),
                                            numeroActa: ko.observable(cumplimientoAlertasAvalProyecto[i].numeroActa)
                                        }
                                );
                            }
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert_placeholder_cumplimientos_alertas_aval_proyecto.warning("Error al eliminar el cumplimiento de la alerta de aval");
                    }});
            }

            var ProyectoModel = function (actas, adendasIngreso, adendasIngreso, adendasRetiro, adiciones, prorrogas, plazos, cumplimientoCompromisosProyecto, compromisosHomologadosProyecto, cumplimientoAlertasAvalProyecto) {
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
                    $('#idTipoActa').val(acta.idTipoActa());
                    $('#numeroActa').val(acta.numero());
                    $('#fechaActa').val(acta.fechaFormateada());
                    $('#observacionesActa').val(acta.observaciones());
                    $('#actaModal').modal('show');
                };

                self.adendasCambio = ko.observableArray(adendasCambio);
                self.verDocumentoAdendaCambio = function (adenda) {
                    window.location.href = "${pageContext.request.contextPath}/novedades/documentoAdendaCambio/" + adenda.idAdenda();
                };
                self.eliminarAdendaCambio = function (adenda) {
                    adendaCambioEliminar = adenda;
                    $('#confirmacionEliminacionAdendaCambio').modal('show');
                };
                self.editarAdendaCambio = function (adenda) {
                    $('#idAdendaCambio').val(adenda.idAdenda());
                    $('#fechaAdendaCambio').val(adenda.fechaCambioFormateada());
                    $('#tipoPersonaAdendaCambio').val(adenda.idTipoPersona());
                    $('#rolAdendaCambio').val(adenda.idRol());
                    $('#tipoIdentificacionPersonaAnteriorAdendaCambio').val(adenda.idTipoIdentificacionPersonaAnterior());
                    $('#numeroIdentificacionPersonaAnteriorAdendaCambio').val(adenda.numeroIdentificacionPersonaAnterior());
                    $('#nombresPersonaAnteriorAdendaCambio').val(adenda.nombresPersonaAnterior());
                    $('#apellidosPersonaAnteriorAdendaCambio').val(adenda.apellidosPersonaAnterior());
                    $('#tipoIdentificacionPersonaAdendaCambio').val(adenda.idTipoIdentificacionPersona());
                    $('#numeroIdentificacionPersonaAdendaCambio').val(adenda.numeroIdentificacionPersona());
                    $('#nombresPersonaAdendaCambio').val(adenda.nombresPersona());
                    $('#apellidosPersonaAdendaCambio').val(adenda.apellidosPersona());
                    $('#fechaActaAdendaCambio').val(adenda.fechaActaFormateada());
                    $('#numeroActaAdendaCambio').val(adenda.numeroActa());
                    $('#observacionesAdendaCambio').val(adenda.observaciones());
                    $('#adendaCambioModal').modal('show');
                };

                self.adendasIngreso = ko.observableArray(adendasIngreso);
                self.verDocumentoAdendaIngreso = function (adenda) {
                    window.location.href = "${pageContext.request.contextPath}/novedades/documentoAdendaIngreso/" + adenda.idAdenda();
                };
                self.eliminarAdendaIngreso = function (adenda) {
                    adendaIngresoEliminar = adenda;
                    $('#confirmacionEliminacionAdendaIngreso').modal('show');
                };
                self.editarAdendaIngreso = function (adenda) {
                    $('#idAdendaIngreso').val(adenda.idAdenda());
                    $('#fechaAdendaIngreso').val(adenda.fechaIngresoFormateada());
                    $('#tipoPersonaAdendaIngreso').val(adenda.idTipoPersona());
                    $('#tipoIdentificacionPersonaAdendaIngreso').val(adenda.idTipoIdentificacionPersona());
                    $('#numeroIdentificacionPersonaAdendaIngreso').val(adenda.numeroIdentificacionPersona());
                    $('#fechaActaAdendaIngreso').val(adenda.fechaActaFormateada());
                    $('#nombresPersonaAdendaIngreso').val(adenda.nombresPersona());
                    $('#apellidosPersonaAdendaIngreso').val(adenda.apellidosPersona());
                    $('#numeroActaAdendaIngreso').val(adenda.numeroActa());
                    $('#adendaIngresoModal').modal('show');
                };

                self.adendasRetiro = ko.observableArray(adendasRetiro);
                self.verDocumentoAdendaRetiro = function (adenda) {
                    window.location.href = "${pageContext.request.contextPath}/novedades/documentoAdendaRetiro/" + adenda.idAdenda();
                };
                self.eliminarAdendaRetiro = function (adenda) {
                    adendaRetiroEliminar = adenda;
                    $('#confirmacionEliminacionAdendaRetiro').modal('show');
                };
                self.editarAdendaRetiro = function (adenda) {
                    $('#idAdendaRetiro').val(adenda.idAdenda());
                    $('#fechaAdendaRetiro').val(adenda.fechaRetiroFormateada());
                    $('#tipoPersonaAdendaRetiro').val(adenda.idTipoPersona());
                    $('#tipoIdentificacionPersonaAdendaRetiro').val(adenda.idTipoIdentificacionPersona());
                    $('#numeroIdentificacionPersonaAdendaRetiro').val(adenda.numeroIdentificacionPersona());
                    $('#fechaActaAdendaRetiro').val(adenda.fechaActaFormateada());
                    $('#nombresPersonaAdendaRetiro').val(adenda.nombresPersona());
                    $('#apellidosPersonaAdendaRetiro').val(adenda.apellidosPersona());
                    $('#numeroActaAdendaRetiro').val(adenda.numeroActa());
                    $('#motivoAdendaRetiro').val(adenda.motivo());
                    $('#adendaRetiroModal').modal('show');
                };

                self.adiciones = ko.observableArray(adiciones);
                self.verDocumentoAdicion = function (adicion) {
                    window.location.href = "${pageContext.request.contextPath}/novedades/documentoAdicion/" + adicion.idAdicion();
                };
                self.eliminarAdicion = function (adicion) {
                    adicionEliminar = adicion;
                    $('#confirmacionEliminacionAdicion').modal('show');
                };
                self.editarAdicion = function (adicion) {
                    $('#idAdicion').val(adicion.idAdicion());
                    $('#descripcionAdicion').val(adicion.descripcion());
                    $('#montoAdicion').val(adicion.montoFormateado());
                    $('#fechaActaCODIAdicion').val(adicion.fechaActaCODIFormateada());
                    $('#numeroActaCODIAdicion').val(adicion.numeroActaCODI());
                    $('#fechaActaAdicion').val(adicion.fechaActaFormateada());
                    $('#numeroActaAdicion').val(adicion.numeroActa());
                    $('#adicionModal').modal('show');
                };

                self.prorrogas = ko.observableArray(prorrogas);
                self.verDocumentoProrroga = function (prorroga) {
                    window.location.href = "${pageContext.request.contextPath}/novedades/documentoProrroga/" + prorroga.idProrroga();
                };
                self.eliminarProrroga = function (prorroga) {
                    prorrogaEliminar = prorroga;
                    $('#confirmacionEliminacionProrroga').modal('show');
                };
                self.editarProrroga = function (prorroga) {
                    $('#idProrroga').val(prorroga.idProrroga());
                    $('#descripcionProrroga').val(prorroga.descripcion());
                    $('#mesesAprobadosProrroga').val(prorroga.mesesAprobados());
                    $('#montoAprobadoProrroga').val(prorroga.montoAprobadoFormateado());
                    $('#fechaActaCODIProrroga').val(prorroga.fechaActaCODIFormateada());
                    $('#numeroActaCODIProrroga').val(prorroga.numeroActaCODI());
                    $('#fechaActaProrroga').val(prorroga.fechaActaFormateada());
                    $('#numeroActaProrroga').val(prorroga.numeroActa());
                    $('#prorrogaModal').modal('show');
                };
                
                self.plazos = ko.observableArray(plazos);
                self.verDocumentoPlazo = function (plazo) {
                    window.location.href = "${pageContext.request.contextPath}/novedades/documentoPlazo/" + plazo.idPlazo();
                };
                self.eliminarPlazo = function (plazo) {
                    plazoEliminar = plazo;
                    $('#confirmacionEliminacionPlazo').modal('show');
                };
                self.editarPlazo = function (plazo) {
                    $('#idPlazo').val(plazo.idPlazo());
                    $('#descripcionPlazo').val(plazo.descripcion());
                    $('#mesesAprobadosPlazo').val(plazo.mesesAprobados());
                    $('#fechaActaCODIPlazo').val(plazo.fechaActaCODIFormateada());
                    $('#numeroActaCODIPlazo').val(plazo.numeroActaCODI());
                    $('#fechaActaPlazo').val(plazo.fechaActaFormateada());
                    $('#numeroActaPlazo').val(plazo.numeroActa());
                    $('#plazoModal').modal('show');
                };                
                
                self.cumplimientoCompromisosProyecto = ko.observableArray(cumplimientoCompromisosProyecto);
                self.verDocumentoCumplimientoCompromisoProyecto = function (cumplimientoCompromisoProyecto) {
                    window.location.href = "${pageContext.request.contextPath}/novedades/documentoCumplimientoCompromiso/" + cumplimientoCompromisoProyecto.idCumplimientoCompromisoProyecto();
                };
                self.eliminarCumplimientoCompromisoProyecto = function (cumplimientoCompromisoProyecto) {
                    cumplimientoCompromisoEliminarProyecto = cumplimientoCompromisoProyecto;
                    $('#confirmacionEliminacionCumplimientoCompromisoProyecto').modal('show');
                };
                self.editarCumplimientoCompromisoProyecto = function (cumplimientoCompromisoProyecto) {
                    $('#idCumplimientoCompromisoProyecto').val(cumplimientoCompromisoProyecto.idCumplimientoCompromisoProyecto());
                    $('#compromisoProyecto').val(cumplimientoCompromisoProyecto.idCompromisoProyecto());
                    $('#fechaActaCumplimientoCompromisoProyecto').val(cumplimientoCompromisoProyecto.fechaActaFormateada());
                    $('#numeroActaCumplimientoCompromisoProyecto').val(cumplimientoCompromisoProyecto.numeroActa());
                    $('#cumplimientoCompromisoProyectoModal').modal('show');
                };                 

                self.compromisosHomologadosProyecto = ko.observableArray(compromisosHomologadosProyecto);
                self.eliminarCompromisoHomologadoProyecto = function (compromisoHomologadoProyecto) {
                    compromisoHomologadoEliminarProyecto = compromisoHomologadoProyecto;
                    $('#confirmacionEliminacionCompromisoHomologadoProyecto').modal('show');
                };
                self.editarCompromisoHomologadoProyecto = function (compromisoHomologadoProyecto) {
                    $('#idCompromisoHomologadoProyecto').val(compromisoHomologadoProyecto.idCompromisoHomologadoProyecto());
                    $('#compromisoProyectoHomologado').val(compromisoHomologadoProyecto.idCompromisoProyectoHomologado());
                    $('#nuevoCompromisoProyecto').val(compromisoHomologadoProyecto.idCompromisoProyecto());
                    $('#fechaActaCompromisoHomologadoProyecto').val(compromisoHomologadoProyecto.fechaActaFormateada());
                    $('#numeroActaCompromisoHomologadoProyecto').val(compromisoHomologadoProyecto.numeroActa());
                    $('#descripcionCompromisoHomologadoProyecto').val(compromisoHomologadoProyecto.descripcion());
                    $('#observacionesCompromisoHomologadoProyecto').val(compromisoHomologadoProyecto.observaciones());
                    $('#compromisoHomologadoProyectoModal').modal('show');
                };                 

                self.cumplimientoAlertasAvalProyecto = ko.observableArray(cumplimientoAlertasAvalProyecto);
                self.verDocumentoCumplimientoAlertaAvalProyecto = function (cumplimientoAlertaAvalProyecto) {
                    window.location.href = "${pageContext.request.contextPath}/novedades/documentoCumplimientoAlertaAval/" + cumplimientoAlertaAvalProyecto.idCumplimientoAlertaAvalProyecto();
                };
                self.eliminarCumplimientoAlertaAvalProyecto = function (cumplimientoAlertaAvalProyecto) {
                    cumplimientoAlertaAvalEliminarProyecto = cumplimientoAlertaAvalProyecto;
                    $('#confirmacionEliminacionCumplimientoAlertaAvalProyecto').modal('show');
                };
                self.editarCumplimientoAlertaAvalProyecto = function (cumplimientoAlertaAvalProyecto) {
                    $('#idCumplimientoAlertaAvalProyecto').val(cumplimientoAlertaAvalProyecto.idCumplimientoAlertaAvalProyecto());
                    $('#alertaAvalProyecto').val(cumplimientoAlertaAvalProyecto.idAlertaAvalProyecto());
                    $('#fechaActaCumplimientoAlertaAvalProyecto').val(cumplimientoAlertaAvalProyecto.fechaActaFormateada());
                    $('#numeroActaCumplimientoAlertaAvalProyecto').val(cumplimientoAlertaAvalProyecto.numeroActa());
                    $('#cumplimientoAlertaAvalProyectoModal').modal('show');
                };                  
            };

            var actas = new Array();
            var actaEliminar = null; 
            var adendasCambio = new Array();
            var adendaCambioEliminar = null; 
            var adendasIngreso = new Array();
            var adendaIngresoEliminar = null; 
            var adendasRetiro = new Array();
            var adendaRetiroEliminar = null; 
            var adiciones = new Array();
            var adicionEliminar = null; 
            var prorrogas = new Array();
            var prorrogaEliminar = null; 
            var plazos = new Array();
            var plazoEliminar = null; 
            var cumplimientoCompromisosProyecto = new Array();
            var cumplimientoCompromisoEliminarProyecto = null; 
            var compromisosHomologadosProyecto = new Array();
            var compromisoHomologadoEliminarProyecto = null; 
            var cumplimientoAlertasAvalProyecto = new Array();
            var cumplimientoAlertaAvalEliminarProyecto = null; 
            <c:if test = "${actasProyectoJSON != null}">
            actas = ${actasProyectoJSON};
            </c:if>
            <c:if test = "${adendasCambioProyectoJSON != null}">
            adendasCambio = ${adendasCambioProyectoJSON};
            </c:if>
            <c:if test = "${adendasRetiroProyectoJSON != null}">
            adendasRetiro = ${adendasRetiroProyectoJSON};
            </c:if>
            <c:if test = "${adendasIngresoProyectoJSON != null}">
            adendasIngreso = ${adendasIngresoProyectoJSON};
            </c:if>
            <c:if test = "${adicionesProyectoJSON != null}">
            adiciones = ${adicionesProyectoJSON};
            </c:if>
            <c:if test = "${prorrogasProyectoJSON != null}">
            prorrogas = ${prorrogasProyectoJSON};
            </c:if>
            <c:if test = "${plazosProyectoJSON != null}">
            plazos = ${plazosProyectoJSON};
            </c:if>
            <c:if test = "${cumplimientoCompromisosProyectoJSON != null}">
            cumplimientoCompromisosProyecto = ${cumplimientoCompromisosProyectoJSON};
            </c:if>
            <c:if test = "${compromisosHomologadosProyectoJSON != null}">
            compromisosHomologadosProyecto = ${compromisosHomologadosProyectoJSON};
            </c:if>
            <c:if test = "${cumplimientoAlertasAvalProyectoJSON != null}">
            cumplimientoAlertasAvalProyecto = ${cumplimientoAlertasAvalProyectoJSON};
            </c:if>
            var proyectoModel = new ProyectoModel(actas, adendasCambio, adendasIngreso, adendasRetiro, adiciones, prorrogas, plazos, cumplimientoCompromisosProyecto, compromisosHomologadosProyecto, cumplimientoAlertasAvalProyecto);
            ko.applyBindings(proyectoModel);

            bootstrap_alert_actas = function () { };
            bootstrap_alert_actas.warning = function (message) {
                $('#alert_placeholder_actas').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            bootstrap_alert_actas.success = function (message) {
                $('#alert_placeholder_actas').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
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
                $('#idTipoActa').val("");
                $('#observacionesActa').val("");
                $('#nombreActa').val("");
                $('#fechaActa').val("");
                $('#numeroActa').val("");
                $('#documentoActa').val("");
            }

            bootstrap_alert_adendas_cambio = function () { };
            bootstrap_alert_adendas_cambio.warning = function (message) {
                $('#alert_placeholder_adendas_cambio').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            bootstrap_alert_adendas_cambio.success = function (message) {
                $('#alert_placeholder_adendas_cambio').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            bootstrap_alert_adendas_cambio.removeWarning = function () {
                $('#alert_placeholder_adendas_cambio').html('');
            };
            bootstrap_alert_adenda_cambio = function () { };
            bootstrap_alert_adenda_cambio.warning = function (message) {
                $('#alert_placeholder_adenda_cambio').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            bootstrap_alert_adenda_cambio.removeWarning = function () {
                $('#alert_placeholder_adenda_cambio').html('');
            };
            function mostrarVentanaNuevaAdendaCambio() {
                limpiarDatosVentanaAdendaCambio();
                $('#adendaCambioModal').modal('show');
            }
            function limpiarDatosVentanaAdendaCambio() {
                $('#idAdendaCambio').val(0);
                $('#fechaAdendaCambio').val("");
                $('#tipoPersonaAdendaCambio').val("");
                $('#rolAdendaCambio').val("");
                $('#tipoIdentificacionPersonaAnteriorAdendaCambio').val("");
                $('#numeroIdentificacionPersonaAnteriorAdendaCambio').val("");
                $('#nombresPersonaAnteriorAdendaCambio').val("");
                $('#apellidosPersonaAnteriorAdendaCambio').val("");
                $('#tipoIdentificacionPersonaAdendaCambio').val("");
                $('#numeroIdentificacionPersonaAdendaCambio').val("");
                $('#fechaActaAdendaCambio').val("");
                $('#nombresPersonaAdendaCambio').val("");
                $('#apellidosPersonaAdendaCambio').val("");
                $('#numeroActaAdendaCambio').val("");
                $('#observacionesAdendaCambio').val("");
                $('#documentoAdendaCambio').val("");
            }

            bootstrap_alert_adendas_ingreso = function () { };
            bootstrap_alert_adendas_ingreso.warning = function (message) {
                $('#alert_placeholder_adendas_ingreso').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            bootstrap_alert_adendas_ingreso.success = function (message) {
                $('#alert_placeholder_adendas_ingreso').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            bootstrap_alert_adendas_ingreso.removeWarning = function () {
                $('#alert_placeholder_adendas').html('');
            };
            bootstrap_alert_adenda_ingreso = function () { };
            bootstrap_alert_adenda_ingreso.warning = function (message) {
                $('#alert_placeholder_adenda').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            bootstrap_alert_adenda_ingreso.removeWarning = function () {
                $('#alert_placeholder_adenda').html('');
            };
            function mostrarVentanaNuevaAdendaIngreso() {
                limpiarDatosVentanaAdendaIngreso();
                $('#adendaIngresoModal').modal('show');
            }
            function limpiarDatosVentanaAdendaIngreso() {
                $('#idAdendaIngreso').val(0);
                $('#fechaAdendaIngreso').val("");
                $('#tipoPersonaAdendaIngreso').val("");
                $('#tipoIdentificacionPersonaAdendaIngreso').val("");
                $('#numeroIdentificacionPersonaAdendaIngreso').val("");
                $('#fechaActaAdendaIngreso').val("");
                $('#nombresPersonaAdendaIngreso').val("");
                $('#apellidosPersonaAdendaIngreso').val("");
                $('#numeroActaAdendaIngreso').val("");
                $('#observacionesAdendaIngreso').val("");
                $('#documentoAdendaIngreso').val("");
            }
            
            bootstrap_alert_adendas_retiro = function () { };
            bootstrap_alert_adendas_retiro.warning = function (message) {
                $('#alert_placeholder_adendas_retiro').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            bootstrap_alert_adendas_retiro.success = function (message) {
                $('#alert_placeholder_adendas_retiro').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            bootstrap_alert_adendas_retiro.removeWarning = function () {
                $('#alert_placeholder_adendas_retiro').html('');
            };
            bootstrap_alert_adenda_retiro = function () { };
            bootstrap_alert_adenda_retiro.warning = function (message) {
                $('#alert_placeholder_adenda_retiro').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            bootstrap_alert_adenda_retiro.removeWarning = function () {
                $('#alert_placeholder_adenda_retiro').html('');
            };
            function mostrarVentanaNuevaAdendaRetiro() {
                limpiarDatosVentanaAdendaRetiro();
                $('#adendaRetiroModal').modal('show');
            }
            function limpiarDatosVentanaAdendaRetiro() {
                $('#idAdendaRetiro').val(0);
                $('#fechaAdendaRetiro').val("");
                $('#tipoPersonaAdendaRetiro').val("");
                $('#tipoIdentificacionPersonaAdendaRetiro').val("");
                $('#numeroIdentificacionPersonaAdendaRetiro').val("");
                $('#fechaActaAdendaRetiro').val("");
                $('#nombresPersonaAdendaRetiro').val("");
                $('#apellidosPersonaAdendaRetiro').val("");
                $('#numeroActaAdendaRetiro').val("");
                $('#motivoAdendaRetiro').val("");
                $('#documentoAdendaRetiro').val("");
            }            

            bootstrap_alert_adiciones = function () { };
            bootstrap_alert_adiciones.warning = function (message) {
                $('#alert_placeholder_adiciones').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            bootstrap_alert_adiciones.success = function (message) {
                $('#alert_placeholder_adiciones').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            bootstrap_alert_adiciones.removeWarning = function () {
                $('#alert_placeholder_adiciones').html('');
            };
            bootstrap_alert_adicion = function () { };
            bootstrap_alert_adicion.warning = function (message) {
                $('#alert_placeholder_adicion').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            bootstrap_alert_adicion.removeWarning = function () {
                $('#alert_placeholder_adicion').html('');
            };
            function mostrarVentanaNuevaAdicion() {
                limpiarDatosVentanaActa();
                $('#adicionModal').modal('show');
            }
            function limpiarDatosVentanaAdicion() {
                $('#idAdicion').val(0);
                $('#descripcionAdicion').val("");
                $('#montoAdicion').val("");
                $('#fechaActaAdicion').val("");
                $('#numeroActaAdicion').val("");
                $('#fechaActaCODIAdicion').val("");
                $('#numeroActaCODIAdicion').val("");
                $('#descripcionAdicion').val("");
            }   
            
            bootstrap_alert_prorrogas = function () { };
            bootstrap_alert_prorrogas.warning = function (message) {
                $('#alert_placeholder_prorrogas').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            bootstrap_alert_prorrogas.success = function (message) {
                $('#alert_placeholder_prorrogas').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            bootstrap_alert_prorrogas.removeWarning = function () {
                $('#alert_placeholder_prorrogas').html('');
            };
            bootstrap_alert_prorroga = function () { };
            bootstrap_alert_prorroga.warning = function (message) {
                $('#alert_placeholder_prorroga').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            bootstrap_alert_prorroga.removeWarning = function () {
                $('#alert_placeholder_prorroga').html('');
            };
            function mostrarVentanaNuevaProrroga() {
                limpiarDatosVentanaProrroga();
                $('#prorrogaModal').modal('show');
            }
            function limpiarDatosVentanaProrroga() {
                $('#idProrroga').val(0);
                $('#descripcionProrroga').val("");
                $('#mesesAprobadosProrroga').val("");
                $('#montoAprobadoProrroga').val("");
                $('#documentoProrroga').val("");
                $('#fechaActaProrroga').val("");
                $('#numeroActaProrroga').val("");
                $('#fechaActaCODIProrroga').val("");
                $('#numeroActaCODIProrroga').val("");
            } 
            
            bootstrap_alert_plazos = function () { };
            bootstrap_alert_plazos.warning = function (message) {
                $('#alert_placeholder_plazos').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            bootstrap_alert_plazos.success = function (message) {
                $('#alert_placeholder_plazos').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            bootstrap_alert_plazos.removeWarning = function () {
                $('#alert_placeholder_plazos').html('');
            };
            bootstrap_alert_plazo = function () { };
            bootstrap_alert_plazo.warning = function (message) {
                $('#alert_placeholder_plazo').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            bootstrap_alert_plazo.removeWarning = function () {
                $('#alert_placeholder_plazo').html('');
            };
            function mostrarVentanaNuevaPlazo() {
                limpiarDatosVentanaPlazo();
                $('#plazoModal').modal('show');
            }
            function limpiarDatosVentanaPlazo() {
                $('#idPlazo').val(0);
                $('#descripcionPlazo').val("");
                $('#mesesAprobadosPlazo').val("");
                $('#documentoPlazo').val("");
                $('#fechaActaPlazo').val("");
                $('#numeroActaPlazo').val("");
                $('#fechaActaCODIPlazo').val("");
                $('#numeroActaCODIPlazo').val("");
            }              
            
            alert_placeholder_cumplimiento_compromisos_proyecto = function () { };
            alert_placeholder_cumplimiento_compromisos_proyecto.warning = function (message) {
                $('#alert_placeholder_cumplimiento_compromisos_proyecto').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            alert_placeholder_cumplimiento_compromisos_proyecto.success = function (message) {
                $('#alert_placeholder_cumplimiento_compromisos_proyecto').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            alert_placeholder_cumplimiento_compromisos_proyecto.removeWarning = function () {
                $('#alert_placeholder_cumplimiento_compromisos_proyecto').html('');
            };
            alert_placeholder_cumplimiento_compromiso_proyecto = function () { };
            alert_placeholder_cumplimiento_compromiso_proyecto.warning = function (message) {
                $('#alert_placeholder_cumplimiento_compromiso_proyecto').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            alert_placeholder_cumplimiento_compromiso_proyecto.removeWarning = function () {
                $('#alert_placeholder_cumplimiento_compromiso_proyecto').html('');
            };
            function mostrarVentanaNuevaCumplimientoCompromisoProyecto() {
                limpiarDatosVentanaCumplimientoCompromisoProyecto();
                $('#cumplimientoCompromisoProyectoModal').modal('show');
            }
            function limpiarDatosVentanaCumplimientoCompromisoProyecto() {
                $('#idCumplimientoCompromisoProyecto').val(0);
                $('#cumplimientoCompromiso').val("");
                $('#documentoCumplimientoCompromisoProyecto').val("");
                $('#fechaActaCumplimientoCompromisoProyecto').val("");
                $('#numeroActaCumplimientoCompromisoProyecto').val("");
            }
            
            alert_placeholder_compromisos_homologados_proyecto = function () { };
            alert_placeholder_compromisos_homologados_proyecto.warning = function (message) {
                $('#alert_placeholder_compromisos_homologados_proyecto').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            alert_placeholder_compromisos_homologados_proyecto.success = function (message) {
                $('#alert_placeholder_compromisos_homologados_proyecto').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            alert_placeholder_compromisos_homologados_proyecto.removeWarning = function () {
                $('#alert_placeholder_compromisos_homologados_proyecto').html('');
            };
            alert_placeholder_compromisos_homologado_proyecto = function () { };
            alert_placeholder_compromisos_homologado_proyecto.warning = function (message) {
                $('#alert_placeholder_compromisos_homologado_proyecto').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            alert_placeholder_compromisos_homologado_proyecto.removeWarning = function () {
                $('#alert_placeholder_compromisos_homologado_proyecto').html('');
            };
            function mostrarVentanaNuevaCompromisoHomologadoProyecto() {
                limpiarDatosVentanaCompromisoHomologadoProyecto();
                $('#compromisoHomologadoProyectoModal').modal('show');
            }
            function limpiarDatosVentanaCompromisoHomologadoProyecto() {
                $('#idCompromisoHomologadoProyecto').val(0);
                $('#compromisoProyectoHomologado').val("");
                $('#nuevoCompromisoProyecto').val("");
                $('#documentoCompromisoHomologadoProyecto').val("");
                $('#fechaActaCompromisoHomologadoProyecto').val("");
                $('#numeroActaCompromisoHomologadoProyecto').val("");
                $('#descripcionCompromisoHomologadoProyecto').val("");
                $('#observacionesCompromisoHomologadoProyecto').val("");
            }
            
            alert_placeholder_cumplimientos_alertas_aval_proyecto = function () { };
            alert_placeholder_cumplimientos_alertas_aval_proyecto.warning = function (message) {
                $('#alert_placeholder_cumplimientos_alertas_aval_proyecto').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            alert_placeholder_cumplimientos_alertas_aval_proyecto.success = function (message) {
                $('#alert_placeholder_cumplimientos_alertas_aval_proyecto').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            alert_placeholder_cumplimientos_alertas_aval_proyecto.removeWarning = function () {
                $('#alert_placeholder_cumplimientos_alertas_aval_proyecto').html('');
            };
            alert_placeholder_cumplimiento_alerta_aval_proyecto = function () { };
            alert_placeholder_cumplimiento_alerta_aval_proyecto.warning = function (message) {
                $('#alert_placeholder_cumplimiento_alerta_aval_proyecto').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            alert_placeholder_cumplimiento_alerta_aval_proyecto.removeWarning = function () {
                $('#alert_placeholder_cumplimiento_alerta_aval_proyecto').html('');
            };
            function mostrarVentanaNuevaCumplimientoAlertaAvalProyecto() {
                limpiarDatosVentanaCumplimientoAlertaAvalProyecto();
                $('#cumplimientoAlertaAvalProyectoModal').modal('show');
            }
            function limpiarDatosVentanaCumplimientoAlertaAvalProyecto() {
                $('#idCumplimientoAlertaAvalProyecto').val(0);
                $('#alertaAvalProyecto').val("");
                $('#documentoCumplimientoAlertaAvalProyecto').val("");
                $('#fechaActaCumplimientoAlertaAvalProyecto').val("");
                $('#numeroActaCumplimientoAlertaAvalProyecto').val("");
            }             
        </script>
