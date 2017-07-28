<%-- 
    Document   : usuarios
    Created on : 23-jul-2017, 13:19:44
    Author     : William
--%>

<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    

<div class="container">
    <c:if test = "${not empty mensajeError}">
        <div class="alert alert-danger">
            ${mensajeError}
        </div>
    </c:if>    
    <c:if test = "${not empty mensaje}">
        <div class="alert alert-success">
            ${mensaje}
        </div>
    </c:if>    
    <div class = "panel panel-success">
        <div class = "panel-heading ">PRIVILEGIOS</div>   
        <div class = "panel-body">
            <div class="tab-content">
                <div class="tab-pane fade in active" id="tab1success">
                    <form:form>
                        <table class='table table-hover' style='font-size:12px;' id="privilegios"> 
                            <thead>
                                <tr  class='text-success'>
                                    <td align="center" width='20%'><strong>Código</strong></td>
                                    <td align="center" width='20%'><strong>Nombre</strong></td> 
                                    <td align="center" width='20%'><strong>Eliminar</strong></td> 
                                    <td align="center" width='20%'><strong>Editar</strong></td> 
                                </tr> 
                            </thead>
                            <tbody>
                                <c:forEach var="privilegio" items="${privilegios}">   
                                    <tr>
                                        <td>
                                            ${privilegio.getCodigo()}
                                        </td>
                                        <td>
                                            ${privilegio.getNombre()}
                                        </td>
                                        <td align="center">
                                            <a href="JavaScript:mostrarVentanaConfirmacionEliminacionPrivilegio('${pageContext.request.contextPath}/privilegios/eliminar/${privilegio.getIdPrivilegio()}')" class="btn-sm btn-danger">Eliminar</a>
                                        </td>  
                                        <td align="center">
                                            <a href="${pageContext.request.contextPath}/privilegios/editar/${privilegio.getIdPrivilegio()}" class="btn-sm btn-warning">Editar</a>
                                        </td>  
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table> 
                        <div class="modal fade" id="confirmacionEliminacionPrivilegio" tabindex="-1" role="dialog" aria-labelledby="privilegioModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <div class="alert alert-info">
                                            <strong>Eliminar Privilegio</strong>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="modal-body">
                                        ¿Está seguro de eliminar el privilegio?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                        <a class="btn btn-danger btn-ok" onclick="eliminarPrivilegio();">Eliminar</a>
                                    </div>
                                </div>
                            </div>
                        </div>                         
                    </form:form>
                </div>
            </div>
        </div>
        <table class='table table-hover' style='font-size:12px;'> 
            <tr>
                <td align="right">
                    <a href='${pageContext.request.contextPath}/privilegios/crear'  title='Crear privilegio' >
                        <input type='button' class='btn-sm btn-success' value='Crear privilegio' />
                    </a> 
                </td>
            </tr>
        </table>        
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $('#privilegios').paging({limit: 5});
    });

    var urlEliminacion = '';

    $.validate({
        validateOnBlur: false, // disable validation when input looses focus
        errorMessagePosition: 'top', // Instead of 'inline' which is default
        scrollToTopOnError: false // Set this property to true on longer forms
    });

    function mostrarVentanaConfirmacionEliminacionPrivilegio(url) {
        urlEliminacion = url;
        $('#confirmacionEliminacionPrivilegio').modal('toggle');
    }

    function eliminarPrivilegio() {
        window.location.href = urlEliminacion;
    }

</script>