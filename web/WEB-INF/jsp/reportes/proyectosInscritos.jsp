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
        <div class = "panel-heading ">PROYECTOS INSCRITOS</div>   
        <div class = "panel-body">
            <div class="tab-content">
                <div class="tab-pane fade in active" id="tab1success">
                    <table id="proyectos" class="display table-report" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <td align="center"><input type="text" placeholder="" data-index="0" size="10"></td>
                                <td align="center"><input type="text" placeholder="" data-index="1" size="20"></td> 
                                <td align="center"><input type="text" placeholder="" data-index="2" size="20"></td> 
                                <td align="center"><input type="text" placeholder="" data-index="3" size="10"></td> 
                                <td align="center"><input type="text" placeholder="" data-index="4" size="10"></td> 
                                <td align="center"><input type="text" placeholder="" data-index="5" size="10"></td> 
                                <td align="center"><input type="text" placeholder="" data-index="6" size="10"></td> 
                            </tr> 
                            <tr>
                                <td align="center" width='10%'><strong>Código</strong></td> 
                                <td align="center" width='20%'><strong>Nombre completo</strong></td> 
                                <td align="center" width='20%'><strong>Investigador principal</strong></td> 
                                <td align="center" width='10%'><strong>SIGEP</strong></td> 
                                <td align="center" width='10%'><strong>SIIU</strong></td> 
                                <td align="center" width='20%'><strong>Código SIIU</strong></td> 
                                <td align="center" width='10%'><strong>SIU</strong></td> 
                            </tr> 
                        </thead>
                        <tbody>
                            <c:forEach var="reporte" items="${reporte}">   
                                <tr>
                                    <td align="center">
                                        ${reporte.getCodigo()}
                                    </td>
                                    <td align="center">
                                        ${reporte.getNombreCompletoProyecto()}
                                    </td>
                                    <td align="center">
                                        ${reporte.getInvestigadorPrincipal()}
                                    </td>
                                    <td align="center">
                                        ${reporte.getIngresadoSIGEP()}
                                    </td>
                                    <td align="center">
                                        ${reporte.getIngresadoSIIU()}
                                    </td>   
                                    <td align="center">
                                        ${reporte.getCodigoSIIU()}
                                    </td>  
                                    <td align="center">
                                        ${reporte.getIngresadoSIU()}
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
