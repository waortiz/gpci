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
                            <td width="33%"><strong>C&oacute;digo:</strong></td>
                            <td width="33%"><strong>Nombre corto:</strong></td>
                            <td width="33%"><strong>Nombre completo proyecto:</strong></td>
                        </tr>
                        <tr>
                            <td>${proyecto.getCodigo()}</td>
                            <td>${proyecto.getNombreCortoProyecto()}</td>
                            <td>${proyecto.getNombreCompletoProyecto()}</td>
                        </tr>
                        <tr>
                            <td><strong>Fecha de inicio:</strong></td>
                            <td><strong>Fecha de finalizaci&oacute;n:</strong></td>
                            <td><strong>Area tem&aacute;tica:</strong></td>
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
                            <td><strong>Ingresado SIGEP:</strong></td>
                            <td><strong>Ingresado SIIU:</strong></td>
                            <td><strong>Ingresado SIU:</strong></td>
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
                            <td><strong>C&oacute;digo SIIU:</strong></td>
                            <td><strong>C&oacute;digo COLCIENCIAS:</strong></td>
                            <td><strong>C&oacute;digo SIU:</strong></td>
                        </tr>
                        <tr>
                            <td>${proyecto.getCodigoSIIU()}</td>
                            <td>${proyecto.getCodigoCOLCIENCIAS()}</td>
                            <td>${proyecto.getCodigoSIU()}</td>
                        </tr>
                        <tr>
                            <td><strong>Participaci&oacute;n internacional:</strong></td>
                            <td><strong>Tipo de proyecto:</strong></td>
                            <td><strong>Grupo de investigaci&oacute;n:</strong></td>
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
                            <td><strong>Tipo de contrato:</strong></td>
                            <td><strong>Enfoque metodol&oacute;gico:</strong></td>
                            <td><strong>Convocatoria:</strong></td>
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
                            <td><strong>Objetivo general:</strong></td>
                            <td><strong>Estado:</strong></td>
                            <td><strong>Riesgo &eacute;tico:</strong></td>
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
                    <ul class="nav nav-tabs">
                          <li class="active"><a data-toggle="tab" href="#actasTab">Actas</a></li>
                          <li><a data-toggle="tab" href="#adendasTab">Adendas</a></li>
                          <li><a data-toggle="tab" href="#adicionesTab">Adiciones</a></li>
                          <li><a data-toggle="tab" href="#prorrogasTab">Prórrogas</a></li>
                          <li><a data-toggle="tab" href="#plazosTab">Plazos</a></li>
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
                                        <td style="width: 20%;text-align: center"><strong>Nombre</strong></td>
                                        <td style="width: 10%;text-align: center"><strong>Tipo</strong></td>
                                        <td style="width: 40%;text-align: center"><strong>Observaciones</strong></td>
                                        <td style="width: 15%;text-align: center"><strong>Fecha</strong></td>
                                        <td style="width: 5%;text-align: center">&nbsp;</td>
                                        <td style="width: 5%">&nbsp;</td>
                                        <td style="width: 5%">&nbsp;</td>
                                    </tr>
                                </thead>
                                <tbody data-bind="foreach: { data: actas }">
                                    <tr class="table-row">
                                    <td style="width: 20%">
                                        <span data-bind="text: nombre" ></span>
                                        <input type="hidden" class="form-control" data-bind="value: nombre, attr: { 'name': 'actas[' + $index() + '].nombre'  }">
                                    </td>
                                    <td style="width: 10%">
                                        <span data-bind="text: descripcionTipoActa" ></span>
                                        <input type="hidden" class="form-control" data-bind="value: descripcionTipoActa, attr: { 'name': 'actas[' + $index() + '].descripcionTipoActa'  }">
                                        <input type="hidden" class="form-control" data-bind="value: idTipoActa, attr: { 'name': 'actas[' + $index() + '].idTipoActa'  }">
                                    </td>
                                    <td style="width: 40%">
                                        <span data-bind="text: observaciones" ></span>
                                        <input type="hidden" class="form-control" data-bind="value: observaciones, attr: { 'name': 'actas[' + $index() + '].observaciones'  }">
                                    </td>
                                    <td style="width: 15%">
                                        <span data-bind="text: fechaFormateada" ></span>
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
                        <div id="adendasTab" class="tab-pane fade">
                            <div class="alert alert-info" style="margin-top:20px;">
                                <strong>Adendas</strong>
                                <button class="btn btn-dark" onclick="mostrarVentanaNuevaAdenda(); return false;">
                                    <i class="glyphicon glyphicon-plus"></i>
                                </button>                            
                            </div>
                            <div id="alert_placeholder_adendas"></div>
                            <table class="table table-hover tablaForm" style="width: 90%" align="center" >
                              <thead>
                                <tr class="table-row">
                                    <td style="width: 70%;text-align: center"><strong>Modificación</strong></td>
                                    <td style="width: 15%;text-align: center"><strong>Fecha</strong></td>
                                    <td style="width: 5%;text-align: center">&nbsp;</td>
                                    <td style="width: 5%">&nbsp;</td>
                                    <td style="width: 5%">&nbsp;</td>
                                </tr>
                              </thead>
                              <tbody data-bind="foreach: { data: adendas }">
                                <tr class="table-row">
                                    <td style="width: 70%">
                                        <span data-bind="text: modificacion" ></span>
                                        <input type="hidden" class="form-control" data-bind="value: modificacion, attr: { 'name': 'adendas[' + $index() + '].modificacion'  }">
                                    </td>
                                    <td style="width: 15%">
                                        <span data-bind="text: fechaFormateada" ></span>
                                        <input type="hidden" class="form-control" data-bind="value: fechaFormateada, attr: { 'name': 'adendas[' + $index() + '].fechaFormateada'  }">
                                    </td>
                                    <td style="width: 5%">
                                        <button class="btn btn-dark" data-bind="click: $root.verDocumentoAdenda" title="Ver adenda">
                                            <i class="glyphicon glyphicon-download-alt"></i>
                                        </button>
                                    </td>
                                    <td style="width: 5%">
                                        <button class="btn btn-dark" data-bind="click: $root.eliminarAdenda" title="Eliminar adenda">
                                            <i class="glyphicon glyphicon-trash"></i>
                                        </button>
                                        <input type="hidden" data-bind="value: idAdenda, attr: { 'name': 'adendas[' + $index() + '].idAdenda'  }" />
                                    </td>
                                    <td style="width: 5%">
                                        <button class="btn btn-dark" data-bind="click: $root.editarAdenda" title="Editar adenda">
                                            <i class="glyphicon glyphicon-edit"></i>
                                        </button>
                                    </td>
                                </tr>
                              </tbody>
                            </table>
                            <div class="modal fade" id="confirmacionEliminacionAdenda" tabindex="-1" role="dialog" aria-labelledby="adendaModalLabel" aria-hidden="true">
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
                                            <a class="btn btn-danger btn-ok" onclick="eliminarAdenda();">Eliminar</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal fade" id="adendaModal" tabindex="-1" role="dialog" aria-labelledby="adendaModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <form:form method="POST" action="${pageContext.request.contextPath}/novedades/adendaProyecto" modelAttribute="adendaProyecto" enctype="multipart/form-data">
                                            <div class="modal-header">
                                                <div class="alert alert-info">
                                                    <strong>Adenda</strong>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="modal-body">
                                                <div id="alert_placeholder_adenda"></div>
                                                <table class="tablaForm">
                                                    <tr>
                                                        <td>Modificación</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input id="modificacionAdenda" name="modificacionAdenda" class="form-control" />
                                                            <input type="hidden" id="idAdenda" name="idAdenda" value="0"/>
                                                            <input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                            <input type="hidden" id="idProyecto" name="idProyecto" value="${proyecto.getIdProyecto()}" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Documento</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input type="file" id="documentoAdenda" name="documentoAdenda" class="form-control" />
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
                                    <td style="width: 70%;text-align: center"><strong>Monto</strong></td>
                                    <td style="width: 15%;text-align: center"><strong>Fecha</strong></td>
                                    <td style="width: 5%;text-align: center">&nbsp;</td>
                                    <td style="width: 5%">&nbsp;</td>
                                    <td style="width: 5%">&nbsp;</td>
                                </tr>
                            </thead>
                            <tbody  data-bind="foreach: { data: adiciones }">
                                <tr class="table-row">
                                    <td style="width: 70%">
                                        <span data-bind="text: monto" ></span>
                                        <input type="hidden" class="form-control" data-bind="value: monto, attr: { 'name': 'adiciones[' + $index() + '].monto'  }">
                                    </td>
                                    <td style="width: 15%">
                                        <span data-bind="text: fechaFormateada" ></span>
                                        <input type="hidden" class="form-control" data-bind="value: fechaFormateada, attr: { 'name': 'adiciones[' + $index() + '].fechaFormateada'  }">
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
                                        <input type="hidden" data-bind="value: idAdicion, attr: { 'name': 'adiciones[' + $index() + '].idAdicion'  }" />
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
                                        <form:form method="POST" action="${pageContext.request.contextPath}/novedades/adicionProyecto" modelAttribute="adicionProyecto" enctype="multipart/form-data">
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
                                                        <td>Monto</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input id="montoAdicion" name="montoAdicion" class="form-control numbersOnly" />
                                                            <input type="hidden" id="idAdicion" name="idAdicion" value="0"/>
                                                            <input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                            <input type="hidden" id="idProyecto" name="idProyecto" value="${proyecto.getIdProyecto()}" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Documento</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
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
                                        <td style="width: 50%;text-align: center"><strong>Descripción</strong></td>
                                        <td style="width: 20%;text-align: center"><strong>Meses aprobados</strong></td>
                                        <td style="width: 15%;text-align: center"><strong>Fecha</strong></td>
                                        <td style="width: 5%;text-align: center">&nbsp;</td>
                                        <td style="width: 5%">&nbsp;</td>
                                        <td style="width: 5%">&nbsp;</td>
                                    </tr>
                                </thead>
                                <tbody data-bind="foreach: { data: prorrogas }">
                                    <tr class="table-row">
                                    <td style="width: 50%">
                                        <span data-bind="text: descripcion" ></span>
                                        <input type="hidden" class="form-control" data-bind="value: descripcion, attr: { 'name': 'prorrogas[' + $index() + '].descripcion'  }">
                                    </td>
                                    <td style="width: 20%">
                                        <span data-bind="text: mesesAprobados" ></span>
                                        <input type="hidden" class="form-control" data-bind="value: mesesAprobados, attr: { 'name': 'prorrogas[' + $index() + '].mesesAprobados'  }">
                                    </td>
                                    <td style="width: 15%">
                                        <span data-bind="text: fechaFormateada" ></span>
                                        <input type="hidden" class="form-control" data-bind="value: fechaFormateada, attr: { 'name': 'prorrogas[' + $index() + '].fechaFormateada'  }">
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
                                        <form:form method="POST" action="${pageContext.request.contextPath}/novedades/prorrogaProyecto" modelAttribute="prorrogaProyecto" enctype="multipart/form-data">
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
                                                        <td>Descripción</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input id="descripcionProrroga" name="descripcionProrroga" class="form-control" />
                                                            <input type="hidden" id="idProrroga" name="idProrroga" value="0"/>
                                                            <input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                            <input type="hidden" id="idProyecto" name="idProyecto" value="${proyecto.getIdProyecto()}" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Meses aprobados</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input type="text" id="mesesAprobadosProrroga" name="mesesAprobadosProrroga" class="form-control numbersOnly" maxlength="4"></textarea>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Documento</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
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
                                        <td style="width: 50%;text-align: center"><strong>Descripción</strong></td>
                                        <td style="width: 20%;text-align: center"><strong>Meses aprobados</strong></td>
                                        <td style="width: 15%;text-align: center"><strong>Fecha</strong></td>
                                        <td style="width: 5%;text-align: center">&nbsp;</td>
                                        <td style="width: 5%">&nbsp;</td>
                                        <td style="width: 5%">&nbsp;</td>
                                    </tr>
                                </thead>
                                <tbody data-bind="foreach: { data: plazos }">
                                    <tr class="table-row">
                                    <td style="width: 50%">
                                        <span data-bind="text: descripcion" ></span>
                                        <input type="hidden" class="form-control" data-bind="value: descripcion, attr: { 'name': 'plazos[' + $index() + '].descripcion'  }">
                                    </td>
                                    <td style="width: 20%">
                                        <span data-bind="text: mesesAprobados" ></span>
                                        <input type="hidden" class="form-control" data-bind="value: mesesAprobados, attr: { 'name': 'plazos[' + $index() + '].mesesAprobados'  }">
                                    </td>
                                    <td style="width: 15%">
                                        <span data-bind="text: fechaFormateada" ></span>
                                        <input type="hidden" class="form-control" data-bind="value: fechaFormateada, attr: { 'name': 'plazos[' + $index() + '].fechaFormateada'  }">
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
                                        <input type="hidden" data-bind="value: idPlazo, attr: { 'name': 'plazos[' + $index() + '].idPlazo'  }" />
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
                                        <form:form method="POST" action="${pageContext.request.contextPath}/novedades/plazoProyecto" modelAttribute="plazoProyecto" enctype="multipart/form-data">
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
                                                        <td>Descripción</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input id="descripcionPlazo" name="descripcionPlazo" class="form-control" />
                                                            <input type="hidden" id="idPlazo" name="idPlazo" value="0"/>
                                                            <input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                            <input type="hidden" id="idProyecto" name="idProyecto" value="${proyecto.getIdProyecto()}" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Meses aprobados</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input type="text" id="mesesAprobadosPlazo" name="mesesAprobadosPlazo" class="form-control numbersOnly" maxlength="4"></textarea>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Documento</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
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
                    </div>
                </div>
        </div>
        <script src='<c:url value="/resources/js/jquery-3.2.1.js" />'></script>
        <script src='<c:url value="/resources/js/jquery-ui.js" />'></script>
        <script src='<c:url value="/resources/js/jquery.form-validator.min.js" />'></script>
        <script src='<c:url value="/resources/js/bootstrap.js" />'></script>  
        <script src='<c:url value="/resources/js/bootstrap-datepicker.min.js" />'></script>  
        <script src='<c:url value="/resources/js/bootstrap-datepicker.es.min.js" />' charset="UTF-8"></script>
        <script src='<c:url value="/resources/js/paging.js" />'></script> 
        <script src='<c:url value="/resources/js/bootstrap-select.js" />'></script>
        <script src='<c:url value="/resources/js/knockout-3.4.2.js" />'></script>
        <script src='<c:url value="/resources/js/sb-admin-2.js" />'></script>
        <script src='<c:url value="/resources/js/menu.js" />'></script>
        <script src='<c:url value="/resources/js/metisMenu.min.js" />'></script>
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
                if ($('#idTipoActa').val() == "") {
                    bootstrap_alert_acta.warning('Debe seleccionar el tipo de acta');
                    return false;
                }
                if ($('#idActa').val() == 0 && $('#documentoActa').prop('files').length == 0) {
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
                        bootstrap_alert_actas.warning("Error al almacenar el acta: " + thrownError);
                    }});
            });

            function eliminarActa () {
                $.ajax({
                    type: 'GET',
                    url: "${pageContext.request.contextPath}/novedades/eliminarActa/" + $('#idProyecto').val() + "/" + actaEliminar.idActa(),
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                    },
                    success: function (response) {
                        bootstrap_alert_actas.warning("Acta eliminada exitosamente");
                        $('#confirmacionEliminacionActa').modal('toggle');
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
                        bootstrap_alert_actas.warning("Error al eliminar el acta: " + thrownError);
                    }});
            }

            $('#adendaProyecto').submit(function (evt) {
                evt.preventDefault();
                var formData = new FormData(this);
                if ($('#modificacionAdenda').val() == "") {
                    bootstrap_alert_adenda.warning('Debe ingresar la modificación');
                    return false;
                }
                if ($('#idAdenda').val() == 0 && $('#documentoAdenda').prop('files').length == 0) {
                    bootstrap_alert_adenda.warning('Debe seleccionar el archivo');
                    return false;
                }
                $('#adendaModal').modal('toggle');
                bootstrap_alert_adenda.removeWarning();
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/novedades/adendaProyecto",
                    data: formData,
                    processData: false,
                    contentType: false,
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                    },
                    success: function (response) {
                        bootstrap_alert_adendas.warning("Adenda almacenada exitosamente");
                        limpiarDatosVentanaAdenda();
                        if (response != "") {
                            proyectoModel.adendas.removeAll();
                            var adendas = JSON.parse(response);
                            for (var i = 0; i < adendas.length; i++) {
                                proyectoModel.adendas.push(
                                        {
                                            idAdenda: ko.observable(adendas[i].idAdenda),
                                            modificacion: ko.observable(adendas[i].modificacion),
                                            fechaFormateada: ko.observable(adendas[i].fechaFormateada),
                                        }
                                );
                            }
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        bootstrap_alert_adendas.warning("Error al almacenar la adenda: " + thrownError);
                    }});
            });

            function eliminarAdenda () {
                $.ajax({
                    type: 'GET',
                    url: "${pageContext.request.contextPath}/novedades/eliminarAdenda/" + $('#idProyecto').val() + "/" + adendaEliminar.idAdenda(),
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                    },
                    success: function (response) {
                        bootstrap_alert_adendas.warning("Adenda eliminada exitosamente");
                        $('#confirmacionEliminacionAdenda').modal('toggle');
                        if (response != "") {
                            proyectoModel.adendas.removeAll();
                            var adendas = JSON.parse(response);
                            for (var i = 0; i < adendas.length; i++) {
                                proyectoModel.adendas.push(
                                        {
                                            idAdenda: ko.observable(adendas[i].idAdenda),
                                            modificacion: ko.observable(adendas[i].modificacion),
                                            fechaFormateada: ko.observable(adendas[i].fechaFormateada),
                                        }
                                );
                            }
                        }
                        
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        bootstrap_alert_adendas.warning("Error al eliminar la adenda: " + thrownError);
                    }});
            }

          $('#adicionProyecto').submit(function (evt) {
                evt.preventDefault();
                var formData = new FormData(this);
                if ($('#montoAdicion').val() == "") {
                    bootstrap_alert_adicion.warning('Debe ingresar el monto');
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
                    url: "${pageContext.request.contextPath}/novedades/adicionProyecto",
                    data: formData,
                    processData: false,
                    contentType: false,
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                    },
                    success: function (response) {
                        bootstrap_alert_adiciones.warning("Adición almacenada exitosamente");
                        limpiarDatosVentanaAdicion();
                        if (response != "") {
                            proyectoModel.adiciones.removeAll();
                            var adiciones = JSON.parse(response);
                            for (var i = 0; i < adiciones.length; i++) {
                                proyectoModel.adiciones.push(
                                        {
                                            idAdicion: ko.observable(adiciones[i].idAdicion),
                                            monto: ko.observable(adiciones[i].monto),
                                            fechaFormateada: ko.observable(adiciones[i].fechaFormateada),
                                        }
                                );
                            }
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        bootstrap_alert_adiciones.warning("Error al almacenar la adición: " + thrownError);
                    }});
            });

            function eliminarAdicion () {
                $.ajax({
                    type: 'GET',
                    url: "${pageContext.request.contextPath}/novedades/eliminarAdicion/" + $('#idProyecto').val() + "/" + adicionEliminar.idAdicion(),
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                    },
                    success: function (response) {
                        bootstrap_alert_adiciones.warning("Adición eliminada exitosamente");
                        $('#confirmacionEliminacionAdicion').modal('toggle');
                        if (response != "") {
                            proyectoModel.adiciones.removeAll();
                            var adiciones = JSON.parse(response);
                            for (var i = 0; i < adiciones.length; i++) {
                                proyectoModel.adiciones.push(
                                        {
                                            idAdicion: ko.observable(adiciones[i].idAdicion),
                                            monto: ko.observable(adiciones[i].monto),
                                            fechaFormateada: ko.observable(adiciones[i].fechaFormateada),
                                        }
                                );
                            }
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        bootstrap_alert_adiciones.warning("Error al eliminar la adición: " + thrownError);
                    }});
            }

          $('#prorrogaProyecto').submit(function (evt) {
                evt.preventDefault();
                var formData = new FormData(this);
                if ($('#descripcionProrroga').val() == "") {
                    bootstrap_alert_prorroga.warning('Debe ingresar la descripción');
                    return false;
                }
                if ($('#idProrroga').val() == 0 && $('#documentoProrroga').prop('files').length == 0) {
                    bootstrap_alert_prorroga.warning('Debe seleccionar el archivo');
                    return false;
                }
                if ($('#mesesAprobadosProrroga').val() == "") {
                    bootstrap_alert_prorroga.warning('Debe ingresar los meses aprobados');
                    return false;
                }
                $('#prorrogaModal').modal('toggle');
                bootstrap_alert_prorroga.removeWarning();
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/novedades/prorrogaProyecto",
                    data: formData,
                    processData: false,
                    contentType: false,
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                    },
                    success: function (response) {
                        bootstrap_alert_prorrogas.warning("Prórroga almacenada exitosamente");
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
                                            fechaFormateada: ko.observable(prorrogas[i].fechaFormateada),
                                        }
                                );
                            }
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        bootstrap_alert_prorrogas.warning("Error al almacenar el prórroga: " + thrownError);
                    }});
            });

            function eliminarProrroga () {
                $.ajax({
                    type: 'GET',
                    url: "${pageContext.request.contextPath}/novedades/eliminarProrroga/" + $('#idProyecto').val() + "/" + prorrogaEliminar.idProrroga(),
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                    },
                    success: function (response) {
                        bootstrap_alert_prorrogas.warning("Prórroga eliminada exitosamente");
                        proyectoModel.prorrogas.remove(prorrogaEliminar);
                        $('#confirmacionEliminacionProrroga').modal('toggle');
                        if (response != "") {
                            proyectoModel.prorrogas.removeAll();
                            var prorrogas = JSON.parse(response);
                            for (var i = 0; i < prorrogas.length; i++) {
                                proyectoModel.prorrogas.push(
                                        {
                                            idProrroga: ko.observable(prorrogas[i].idProrroga),
                                            descripcion: ko.observable(prorrogas[i].descripcion),
                                            mesesAprobados: ko.observable(prorrogas[i].mesesAprobados),
                                            fechaFormateada: ko.observable(prorrogas[i].fechaFormateada),
                                        }
                                );
                            }
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        bootstrap_alert_prorrogas.warning("Error al eliminar el prórroga: " + thrownError);
                    }});
            }

        $('#plazoProyecto').submit(function (evt) {
                evt.preventDefault();
                var formData = new FormData(this);
                if ($('#descripcionPlazo').val() == "") {
                    bootstrap_alert_plazo.warning('Debe ingresar la descripción');
                    return false;
                }
                if ($('#idPlazo').val() == 0 && $('#documentoPlazo').prop('files').length == 0) {
                    bootstrap_alert_plazo.warning('Debe seleccionar el archivo');
                    return false;
                }
                if ($('#mesesAprobadosPlazo').val() == "") {
                    bootstrap_alert_plazo.warning('Debe ingresar los meses aprobados');
                    return false;
                }
                $('#plazoModal').modal('toggle');
                bootstrap_alert_plazo.removeWarning();
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/novedades/plazoProyecto",
                    data: formData,
                    processData: false,
                    contentType: false,
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                    },
                    success: function (response) {
                        bootstrap_alert_plazos.warning("Plazo almacenado exitosamente");
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
                                            fechaFormateada: ko.observable(plazos[i].fechaFormateada),
                                        }
                                );
                            }
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        bootstrap_alert_plazos.warning("Error al almacenar el plazo: " + thrownError);
                    }});
            });

            function eliminarPlazo () {
                $.ajax({
                    type: 'GET',
                    url: "${pageContext.request.contextPath}/novedades/eliminarPlazo/" + $('#idProyecto').val() + "/" + plazoEliminar.idPlazo(),
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
                    },
                    success: function (response) {
                        bootstrap_alert_plazos.warning("Plazo eliminado exitosamente");
                        proyectoModel.plazos.remove(plazoEliminar);
                        $('#confirmacionEliminacionPlazo').modal('toggle');
                        if (response != "") {
                            proyectoModel.plazos.removeAll();
                            var plazos = JSON.parse(response);
                            for (var i = 0; i < plazos.length; i++) {
                                proyectoModel.plazos.push(
                                        {
                                            idPlazo: ko.observable(plazos[i].idPlazo),
                                            descripcion: ko.observable(plazos[i].descripcion),
                                            mesesAprobados: ko.observable(plazos[i].mesesAprobados),
                                            fechaFormateada: ko.observable(plazos[i].fechaFormateada),
                                        }
                                );
                            }
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        bootstrap_alert_plazos.warning("Error al eliminar el plazo: " + thrownError);
                    }});
            }

            var ProyectoModel = function (actas, adendas, adiciones, prorrogas, plazos) {
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
                    $('#observacionesActa').val(acta.observaciones());
                    $('#nombreActa').val(acta.nombre());
                    $('#actaModal').modal('show');
                };

                self.adendas = ko.observableArray(adendas);
                self.verDocumentoAdenda = function (adenda) {
                    window.location.href = "${pageContext.request.contextPath}/novedades/documentoAdenda/" + adenda.idAdenda();
                };
                self.eliminarAdenda = function (adenda) {
                    adendaEliminar = adenda;
                    $('#confirmacionEliminacionAdenda').modal('show');
                };
                self.editarAdenda = function (adenda) {
                    $('#idAdenda').val(adenda.idAdenda());
                    $('#modificacionAdenda').val(adenda.modificacion());
                    $('#adendaModal').modal('show');
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
                    $('#montoAdicion').val(adicion.monto());
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
                    $('#plazoModal').modal('show');
                };                
            };

            var actas = new Array();
            var actaEliminar = null; 
            var adendas = new Array();
            var adendaEliminar = null; 
            var adiciones = new Array();
            var adicionEliminar = null; 
            var prorrogas = new Array();
            var prorrogaEliminar = null; 
            var plazos = new Array();
            var plazoEliminar = null; 
            <c:if test = "${actasProyectoJSON != null}">
            actas = ${actasProyectoJSON};
            </c:if>
            <c:if test = "${adendasProyectoJSON != null}">
            adendas = ${adendasProyectoJSON};
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
            var proyectoModel = new ProyectoModel(actas, adendas, adiciones, prorrogas, plazos);
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
                $('#idTipoActa').val("");
                $('#observacionesActa').val("");
                $('#nombreActa').val("");
                $('#documentoActa').val("");
            }

            bootstrap_alert_adendas = function () { };
            bootstrap_alert_adendas.warning = function (message) {
                $('#alert_placeholder_adendas').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            bootstrap_alert_adendas.removeWarning = function () {
                $('#alert_placeholder_adendas').html('');
            };
            bootstrap_alert_adenda = function () { };
            bootstrap_alert_adenda.warning = function (message) {
                $('#alert_placeholder_adenda').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            bootstrap_alert_adenda.removeWarning = function () {
                $('#alert_placeholder_adenda').html('');
            };
            function mostrarVentanaNuevaAdenda() {
                limpiarDatosVentanaActa();
                $('#adendaModal').modal('show');
            }
            function limpiarDatosVentanaAdenda() {
                $('#idActa').val(0);
                $('#modificacionAdenda').val("");
            }

            bootstrap_alert_adiciones = function () { };
            bootstrap_alert_adiciones.warning = function (message) {
                $('#alert_placeholder_adiciones').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
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
                $('#idActa').val(0);
                $('#montoAdicion').val("");
            }   
            
            bootstrap_alert_prorrogas = function () { };
            bootstrap_alert_prorrogas.warning = function (message) {
                $('#alert_placeholder_prorrogas').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
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
                $('#documentoProrroga').val("");
            } 
            
            bootstrap_alert_plazos = function () { };
            bootstrap_alert_plazos.warning = function (message) {
                $('#alert_placeholder_plazos').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
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
            }              
        </script>
