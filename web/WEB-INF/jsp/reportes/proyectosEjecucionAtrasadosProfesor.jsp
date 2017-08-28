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
        <div class = "panel-heading ">PROYECTOS EN EJECUCIÓN/ATRASADOS DOCENTE</div>   
        <div class = "panel-body">
            <div class="tab-content">
                <div class="tab-pane fade in active" id="tab1success">
                    <form:form method="POST" action="${pageContext.request.contextPath}/reportes/proyectosEjecucionAtrasadosProfesor" modelAttribute="busquedaProyectos">
                        <table class="tablaForm"> 
                            <tr>
                                <td align="center">Cédula docente:</td>
                                <td>
                                    <form:input path="cedulaProfesor" class="form-control" maxlength="20" data-validation="required" data-validation-error-msg="Debe ingresar la cédula del docente"/>
                                </td>
                               <td align="right">
                                   <input type="submit" value="Buscar" class="btn-sm btn-success" />
                               </td>
                            </tr>
                        </table>                    
                    </form:form>
                    <table id="proyectos" class="display table-report" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <td align="center"><input type="text" placeholder="" data-index="0" size="10"></td>
                                <td align="center"><input type="text" placeholder="" data-index="1" size="10"></td> 
                                <td align="center"><input type="text" placeholder="" data-index="2" size="10"></td> 
                                <td align="center"><input type="text" placeholder="" data-index="3" size="10"></td> 
                                <td align="center"><input type="text" placeholder="" data-index="4" size="10"></td> 
                                <td align="center"><input type="text" placeholder="" data-index="5" size="10"></td> 
                                <td align="center"><input type="text" placeholder="" data-index="6" size="10"></td> 
                                <td align="center"><input type="text" placeholder="" data-index="7" size="3"></td>
                                <td align="center"><input type="text" placeholder="" data-index="8" size="10"></td> 
                                <td align="center"><input type="text" placeholder="" data-index="9" size="10"></td> 
                                <td align="center"><input type="text" placeholder="" data-index="10" size="10"></td> 
                                <td align="center"><input type="text" placeholder="" data-index="11" size="10"></td> 
                            </tr> 
                            <tr>
                                <td align="center" width='10%'><strong>Cédula</strong></td>
                                <td align="center" width='10%'><strong>Nombre</strong></td> 
                                <td align="center" width='10%'><strong>Total horas dedicación plan</strong></td> 
                                <td align="center" width='10%'><strong>Total horas de dedicación fuera plan</strong></td> 
                                <td align="center" width='10%'><strong>Rol</strong></td> 
                                <td align="center" width='10%'><strong>Código del proyecto</strong></td> 
                                <td align="center" width='20%'><strong>Nombre completo</strong></td> 
                                <td align="center" width='10%'><strong>Estado del proyecto</strong></td> 
                                <td align="center" width='15%'><strong>Fecha de inicio</strong></td> 
                                <td align="center" width='15%'><strong>Fecha de finalización</strong></td> 
                                <td align="center" width='10%'><strong>Número de prórrogas</strong></td> 
                                <td align="center" width='10%'><strong>Numero de Plazos</strong></td> 
                            </tr> 
                        </thead>
                        <tbody>
                            <c:forEach var="reporte" items="${reporte}">   
                                <tr>
                                    <td align="center">
                                        ${reporte.getNumeroIdentificacion()}
                                    </td>
                                    <td align="center">
                                        ${reporte.getNombreProfesor()}
                                    </td>
                                    <td align="center">
                                        ${reporte.getHorasSemana()}
                                    </td>
                                    <td align="center">
                                        ${reporte.getHorasSemanaFueraPlan()}
                                    </td>
                                    <td align="center">
                                        ${reporte.getRol()}
                                    </td>
                                    <td align="center">
                                        ${reporte.getCodigo()}
                                    </td>
                                    <td align="center">
                                        ${reporte.getNombreCompletoProyecto()}
                                    </td>
                                    <td align="center">
                                        ${reporte.getEstadoProyecto()}
                                    </td>   
                                    <td align="center">
                                        ${reporte.getFechaInicioFormateada()}
                                    </td>  
                                    <td align="center">
                                        ${reporte.getFechaFinalizacionFormateada()}
                                    </td>  
                                    <td align="center">
                                        ${reporte.getProrrogas()}
                                    </td>  
                                    <td align="center">
                                        ${reporte.getPlazos()}
                                    </td>  
                                </tr>
                            </c:forEach>
                        </tbody>  
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function() {
        var proyectos = $('#proyectos').DataTable( {
            "dom": 'Bfrtip',
            "buttons": [
                    {
                    extend: 'excel',
                    text: 'Excel'
                    },
                    {
                    extend: 'print',
                    text: 'HTML'
                    }
            ],  
            scrollX: true,
            scrollCollapse: true,
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
        } );
        
        $( proyectos.table().container() ).on( 'keyup', 'thead input', function () {
            proyectos
                .column( $(this).data('index') )
                .search( this.value )
                .draw();
        } );        
    } );
</script>
