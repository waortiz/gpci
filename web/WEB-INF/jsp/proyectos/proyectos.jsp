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
        <div class = "panel-heading ">Proyectos</div>   
        <div class = "panel-body">
            <div class="tab-content">
                <div class="tab-pane fade in active" id="tab1success">
                    <form:form method="POST" action="${pageContext.request.contextPath}/proyectos/proyectos" modelAttribute="busquedaProyectos">
                        <table class='table' style='font-size:12px;'> 
                            <tr  class='text-success'>
                                <td align="center"><b>Fecha inicial</b></td>
                                <td align="center"><b>Fecha final</b></td>
                                <td align="center"><b>Código</b></td>
                                <td align="center"><b>Documento investigador principal</b></td>
                            </tr>
                            <tr  class='text-success'>
                                <td>
                                    <div class="input-group date">
                                        <form:input path="fechaInicial" class="form-control datepicker" data-validation="required" data-validation-error-msg="Debe ingresar la fecha de inicio" readonly="true" />
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                    </div>
                                </td>
                                <td>
                                    <div class="input-group date">
                                        <form:input path="fechaFinal" class="form-control datepicker" data-date-format="dd/mm/yyyy" data-validation="required" data-validation-error-msg="Debe ingresar fecha de fin" readonly="true"/>
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                    </div>
                                </td>
                                <td>
                                    <form:input path="codigo" class="form-control" maxlength="15" />
                                </td>
                                <td>
                                    <form:input path="documentoInvestigadorPrincipal" class="form-control" maxlength="20" />
                                </td>
                            </tr>
                            <tr>
                               <td colspan="4" align="right" style="vertical-align: middle">
                                   <input type="submit" value="Buscar" class="btn-sm btn-success" />
                               </td>
                            </tr>
                        </table>
                        <table class='table table-hover' style='font-size:12px;' id="proyectos"> 
                            <thead>
                                <tr>
                                    <td align="center"><input type="text" placeholder="" data-index="0" size="30"></td>
                                    <td align="center"><input type="text" placeholder="" data-index="1" size="10"></td> 
                                    <td align="center"><input type="text" placeholder="" data-index="2" size="10"></td> 
                                    <td align="center"><input type="text" placeholder="" data-index="3" size="10"></td> 
                                    <td align="center"><input type="text" placeholder="" data-index="4" size="10"></td> 
                                    <td align="center"><input type="text" placeholder="" data-index="5" size="10"></td> 
                                    <td align="center"><input type="text" placeholder="" data-index="6" size="10"></td> 
                                    <td align="center">&nbsp;</td> 
                                </tr>                                 
                                <tr  class='text-success'>
                                    <td align="center" width='20%'><strong>Nombre corto</strong></td>
                                    <td align="center" width='10%'><strong>Código</strong></td>
                                    <td align="center" width='10%'><strong>Fecha de creación</strong></td> 
                                    <td align="center" width='10%'><strong>Fecha de inicio</strong></td> 
                                    <td align="center" width='15%'><strong>Fecha finalizaci&oacute;n</strong></td> 
                                    <td align="center" width='15%'><strong>Tipo de proyecto</strong></td> 
                                    <td align="center" width='10%'><strong>Estado</strong></td> 
                                    <td align="center" width='10%'><strong>Modificar</strong></td> 
                                </tr> 
                            </thead>
                            <tbody>
                                <c:forEach var="proyecto" items="${proyectos}">   
                                    <tr>
                                        <td>
                                            ${proyecto.getNombreCortoProyecto()}
                                        </td>
                                        <td align="center">
                                            ${proyecto.getCodigo()}
                                        </td>
                                        <td align="center">
                                            ${proyecto.getFechaCreacionFormateada()}
                                        </td>
                                        <td align="center">
                                            ${proyecto.getFechaInicioFormateada()}
                                        </td>
                                        <td align="center">
                                            ${proyecto.getFechaFinalizacionFormateada()}
                                        </td>
                                        <td align="center">
                                            ${proyecto.getTipoProyecto()}
                                        </td>   
                                        <td align="center">
                                            ${proyecto.getEstadoProyecto()}
                                        </td>  
                                        <td align="center">
                                            <a href="${pageContext.request.contextPath}/proyectos/editar/${proyecto.getIdProyecto()}" class="btn-sm btn-warning">Editar</a>
                                        </td>  
                                    </tr>
                                </c:forEach>  
                            </tbody>
                        </table>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        var proyectos = $('#proyectos').DataTable({
            "language": {
                "decimal": ".",
                "thousands": ",",
                "processing": "<span><b>Buscando registros</b></span>",
                "lengthMenu": "Mostrar _MENU_ registros por página",
                "zeroRecords": "No se encontraron registros",
                "info": "Mostrando página _PAGE_ de _PAGES_",
                "infoEmpty": "No hay registros disponibles",
                "infoFiltered": "(Filtrado de _MAX_ registros totales)",
                "search": "Buscar:",
                "paginate": {
                    "first": "Primero",
                    "last": "Último",
                    "next": "Próximo",
                    "previous": "Anterior"
                }
            }
        });

        $(proyectos.table().container()).on('keyup', 'thead input', function () {
            proyectos
                    .column($(this).data('index'))
                    .search(this.value)
                    .draw();
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
</script>
