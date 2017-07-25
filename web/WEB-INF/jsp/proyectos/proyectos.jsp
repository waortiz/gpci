<%-- 
    Document   : proyectos
    Created on : 14-may-2017, 19:26:44
    Author     : William
--%>

<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    

<div class="container">
    <c:if test = "${not empty mensaje}">
        <div class="alert alert-success">
            ${mensaje}
        </div>
    </c:if>            
    <div class = "panel panel-success">
        <div class = "panel-heading ">PROYECTOS</div>   
        <div class = "panel-body">
            <div class="tab-content">
                <div class="tab-pane fade in active" id="tab1success">
                    <form:form method="POST" action="${pageContext.request.contextPath}/proyectos/proyectos" modelAttribute="busquedaProyectos">
                        <table class='table table-hover' style='font-size:12px;'> 
                            <tr  class='text-success'>
                                <td style="vertical-align: middle">Fecha inicial:</td>
                                <td>
                                    <div class="input-group date">
                                        <form:input path="fechaInicio" class="form-control datepicker" data-validation="required" data-validation-error-msg="Debe ingresar la fecha de inicio" readonly="true" />
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                    </div>
                                </td>
                                <td style="vertical-align: middle">Fecha final:</td>
                                <td>
                                    <div class="input-group date">
                                        <form:input path="fechaFinal" class="form-control datepicker" data-date-format="dd/mm/yyyy" data-validation="required" data-validation-error-msg="Debe ingresar fecha de fin" readonly="true"/>
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                    </div>
                                </td>
                                <td>
                                    <input type="submit" value="Buscar" class="btn-sm btn-success" />
                                </td>
                            </tr>
                        </table>
                        <table class='table table-hover' style='font-size:12px;' id="proyectos"> 
                            <thead>
                                <tr  class='text-success'>
                                    <th width='20%'>Nombre corto</th>
                                    <th width='15%'>Fecha de creación</th> 
                                    <th width='15%'>Fecha de inicio</th> 
                                    <th width='15%'>Fecha finalizaci&oacute;n</th> 
                                    <th width='15%'>Tipo de proyecto</th> 
                                    <th width='10%'>Estado</th> 
                                    <th width='10%'>Modificar</th> 
                                </tr> 
                            </thead>
                            <c:if test = "${proyectos.size() > 0}">
                                <tbody>
                                    <c:forEach var="proyecto" items="${proyectos}">   
                                        <tr>
                                            <td>
                                                ${proyecto.getNombreCortoProyecto()}
                                            </td>
                                            <td>
                                                ${proyecto.getFechaCreacionFormato()}
                                            </td>
                                            <td>
                                                ${proyecto.getFechaInicioFormato()}
                                            </td>
                                            <td>
                                                ${proyecto.getFechaFinalizacionFormato()}
                                            </td>
                                            <td>
                                                ${proyecto.getTipoProyecto()}
                                            </td>   
                                            <td>
                                                ${proyecto.getEstadoProyecto()}
                                            </td>  
                                            <td>
                                                <a href="${pageContext.request.contextPath}/proyectos/editar/${proyecto.getIdProyecto()}" class="btn-sm btn-warning">Editar</a>
                                            </td>  
                                        </tr>
                                    </c:forEach>  
                                </tbody>
                            </c:if>
                            <c:if test = "${proyectos.size() == 0}">
                                <tfoot> 
                                    <tr>
                                        <td colspan="7">No se encontraron proyectos</td>
                                    </tr>
                                </tfoot>
                            </c:if>
                        </table>
                    </form:form>
                </div>
            </div>
        </div>
        <table class='table table-hover' style='font-size:12px;'> 
            <tr>
                <td align="right">
                    <a href='${pageContext.request.contextPath}/proyectos/crear'  title='Registrar Proyecto' >
                        <input type='button' class='btn-sm btn-success' value='Registrar Proyecto' />
                    </a> 
                </td>
            </tr>
        </table>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $('#proyectos').paging({limit: 5});
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
</script>
