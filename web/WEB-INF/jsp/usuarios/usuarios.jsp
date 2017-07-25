<%-- 
    Document   : usuarios
    Created on : 23-jul-2017, 13:19:44
    Author     : William
--%>

<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    

<div class="container">
    <div class = "panel panel-success">
        <div class = "panel-heading ">USUARIOS</div>   
        <div class = "panel-body">
            <div class="tab-content">
                <div class="tab-pane fade in active" id="tab1success">
                    <form:form>
                        <table class='table table-hover' style='font-size:12px;' id="usuarios"> 
                            <thead>
                                <tr  class='text-success'>
                                    <th width='25%'>Nombres</th>
                                    <th width='25%'>Apellidos</th> 
                                    <th width='20%'>Usuario</th> 
                                    <th width='20%'>Correo electrónico</th> 
                                    <th width='10%'>Privilegios</th> 
                                </tr> 
                            </thead>
                                <tbody>
                                    <c:forEach var="usuario" items="${usuarios}">   
                                        <tr>
                                            <td>
                                                ${usuario.getNombres()}
                                            </td>
                                            <td>
                                                ${usuario.getApellidos()}
                                            </td>
                                            <td>
                                                ${usuario.getNombreUsuario()}
                                            </td>
                                            <td>
                                                ${usuario.getCorreoElectronico()}
                                            </td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/usuarios/privilegios/${usuario.getIdUsuario()}" class="btn-sm btn-warning">Editar</a>
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
        $('#usuarios').paging({limit: 5});
    });

    $.validate({
        validateOnBlur: false, // disable validation when input looses focus
        errorMessagePosition: 'top', // Instead of 'inline' which is default
        scrollToTopOnError: false // Set this property to true on longer forms
    });
</script>
