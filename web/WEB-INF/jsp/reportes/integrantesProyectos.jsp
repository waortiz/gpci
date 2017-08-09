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
        <div class = "panel-heading ">INTEGRANTES PROYECTOS</div>   
        <div class = "panel-body">
            <div class="tab-content">
                <div class="tab-pane fade in active" id="tab1success">
                    <table id="integrantesProyectos" class="display" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <td align="center" width='10%'><strong>Año</strong></td>
                                <td align="center" width='10%'><strong>Código</strong></td> 
                                <td align="center" width='20%'><strong>Nombre</strong></td> 
                                <td align="center" width='10%'><strong>Tipo</strong></td> 
                                <td align="center" width='15%'><strong>Documento</strong></td> 
                                <td align="center" width='20%'><strong>Integrante</strong></td> 
                                <td align="center" width='15%'><strong>Rol</strong></td> 
                            </tr> 
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function() {
        var table = $('#integrantesProyectos').DataTable( {
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
            "processing": true,
            "serverSide": true,
            "ajax": "${pageContext.request.contextPath}/reportes/obtenerIntegrantesProyectos",
            "language": {
            "decimal": ".",
            "thousands": ",",                
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
            },           
            "columns": [
                { "data": "anyoCreacion" },
                { "data": "codigo" },
                { "data": "nombreCortoProyecto" },
                { "data": "tipoIntegrante" },
                { "data": "numeroIdentificacionIntegrante" },
                { "data": "integrante" },
                { "data": "rolIntegrante" }
            ]
        } );
    } );
</script>
