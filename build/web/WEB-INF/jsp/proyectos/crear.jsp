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
                <div class="panel-heading">Registro Proyecto</div>
                <div class="panel-body">
                    <form:form method="POST" action="${pageContext.request.contextPath}/proyectos/crear" modelAttribute="proyecto">
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
                                        <table class="tblform3">
                                            <tr>
                                                <td>
                                                    <textarea id="objetivoEspecifico" name="objetivoEspecifico" class="form-control"></textarea>
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
                        <table class="table table-hover" style="width: 90%" align="center">
                            <tr class="table-row">
                                <th style="width: 90%;text-align: center">Objetivo</th>
                                <th style="width: 5%">&nbsp;</th>
                                <th style="width: 5%">&nbsp;</th>
                            </tr>
                            <tr class="table-row" data-bind="foreach: { data: objetivosEspecificos }">
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
                        </table>
                        <div class="alert alert-info" style="margin-top:20px;">
                            <strong>Profesores</strong>
                            <button class="btn btn-dark" onclick="mostrarVentanaNuevoProfesorProyecto(); return false;">
                                <i class="glyphicon glyphicon-plus"></i>
                            </button>
                        </div>
                        <div class="modal fade" id="profesoresModal" tabindex="-1" role="dialog" aria-labelledby="profesorModalLabel" aria-hidden="true">
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
                                        <div id="alert_placeholder_profesores"></div>
                                        <table class="tblform3">
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
                                        <table class="tblform3">
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
                                                <td>Porcentaje PI:</td>
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
                        <table class="table table-hover" style="width: 90%" align="center">
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
                            <tr class="table-row" data-bind="foreach: { data: profesoresProyecto }">
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

            var ProyectoModel = function (objetivosEspecificos, profesoresProyectoArray) {
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
                    self.objetivosEspecificos.remove(objetivoEspecifico);
                };
                
                self.editarObjetivoEspecifico = function (objetivoEspecifico) {
                    $('#objetivoEspecifico').val(objetivoEspecifico.descripcion());
                    $('#consecutivo').val(objetivoEspecifico.consecutivo());
                    $('#objetivosEspecificosModal').modal('show'); 
                };

                self.profesoresProyecto = ko.observableArray(profesoresProyectoArray);

                self.adicionarProfesorProyecto = function () {
                    if ($('#tipoIdentificacionProfesor').val() == "") {
                        bootstrap_alert_profesoresProyecto.warning('Debe seleccionar el tipo de identificación');
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
                        bootstrap_alert_profesores_proyecto.warning('Debe ingresar el porcentaje PI');
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

                   $('#profesoresModal').modal('toggle');
                   bootstrap_alert_profesores_proyecto.removeWarning();
                   limpiarDatosVentanaProfesorProyecto();
                };

                self.eliminarProfesorProyecto = function (profesor) {
                    self.profesoresProyecto.remove(profesor);
                };

                self.editarProfesorProyecto = function (profesorProyecto) {
                    $('#consecutivo').val(pprofesorProyecto.consecutivo());
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
                    
                    $('#profesoresModal').modal('show');
                };
            };

            var objetivosEspecificos = Array();
        
            var profesoresProyecto = new Array();   
            <c:if test = "${objetivosEspecificosJSON != null && profesoresProyectoJSON != null}">
            objetivosEspecificos = ${objetivosEspecificosJSON};
            </c:if>

            <c:if test = "${profesoresProyectoJSON != null}">
            profesoresProyecto = ${profesoresProyectoJSON};
            </c:if>

            var proyectoModel = new ProyectoModel(objetivosEspecificos, profesoresProyecto);
            ko.applyBindings(proyectoModel);

            bootstrap_alert_objetivosEspecificos = function () { };
            bootstrap_alert_objetivosEspecificos.warning = function (message) {
                $('#alert_placeholder_objetivosEspecificos').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            bootstrap_alert_objetivosEspecificos.removeWarning = function () {
                $('#alert_placeholder_objetivosEspecificos').html('');
            };

            bootstrap_alert_profesores_proyecto = function () { };
            bootstrap_alert_profesores_proyecto.warning = function (message) {
                $('#alert_placeholder_profesores').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
            };
            bootstrap_alert_profesores_proyecto.removeWarning = function () {
                $('#alert_placeholder_profesores').html('');
            };
        
           function mostrarVentanaNuevoProfesorProyecto() {
                limpiarDatosVentanaProfesorProyecto();
                $('#profesoresModal').modal('show'); 
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
        
            function mostrarVentanaNuevoObjetivoEspecifico() {
                limpiarDatosVentanaObjetivoEspecifico();
                $('#objetivosEspecificosModal').modal('show'); 
            }
        
            function limpiarDatosVentanaObjetivoEspecifico() {
                $('#objetivoEspecifico').val("");
                $('#consecutivo').val("");
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
                            bootstrap_alert_profesoresProyecto.warning(e);
                        }
                    });
                } else {
                    if ($('#tipoIdentificacionProfesor').val() == "") {
                        bootstrap_alert_profesoresProyecto.warning('Debe seleccionar el tipo de identificación');
                        return false;
                    }
                    if ($('#numeroIdentificacionProfesor').val() == "") {
                        bootstrap_alert_profesores_proyecto.warning('Debe ingresar el número de identificación');
                        return false;
                    }
                }
           }
        </script>
    </body>
</html>
