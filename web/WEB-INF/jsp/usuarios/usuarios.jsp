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
                                    <td align="center" width='25%'><strong>Nombres</strong></td>
                                    <td align="center" width='25%'><strong>Apellidos</strong></td> 
                                    <td align="center" width='20%'><strong>Usuario</strong></td> 
                                    <td align="center" width='20%'><strong>Correo electrónico</strong></td> 
                                    <td align="center" width='10%'><strong>Privilegios</strong></td> 
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
                                            <td align="center">
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
        <table class='table table-hover' style='font-size:12px;'> 
            <tr>
                <td align="right">
                    <a href='${pageContext.request.contextPath}/usuarios/crear'  title='Crear usuario' >
                        <input type='button' class='btn-sm btn-success' value='Crear usuario' />
                    </a> 
                </td>
            </tr>
        </table>        
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $('#usuarios').paging({limit: 10});
    });

    $.validate({
        validateOnBlur: false, // disable validation when input looses focus
        errorMessagePosition: 'top', // Instead of 'inline' which is default
        scrollToTopOnError: false // Set this property to true on longer forms
    });
</script>
