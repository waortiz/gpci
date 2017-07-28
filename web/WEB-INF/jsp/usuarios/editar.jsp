<%-- 
    Document   : editar
    Created on : 24-jul-2017, 16:00:00
    Author     : William
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    

<div class="container">
    <div class="panel panel-success">
        <div class="panel-heading">Actualizar Usuario</div>
        <div class="panel-body">
            <form:form method="POST" action="${pageContext.request.contextPath}/usuarios/editar" modelAttribute="usuario">
                <div id="alert_placeholder_usuario"></div>
                <input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <form:hidden path="idUsuario" />
                <table class="table table-hover tablaForm" align="center">
                    <tr>
                        <td width="33%"><strong>Usuario:</strong></td>
                        <td width="33%"><strong>Nombres:</strong></td>
                        <td width="33%"><strong>Apellidos:</strong></td>
                    </tr>
                    <tr>
                        <td><form:input path="nombreUsuario" class="form-control" data-validation="required" data-validation-error-msg="Debe ingresar el nombre de usuario" maxlength="100" /></td>
                        <td><form:input path="nombres" class="form-control" data-validation="required" data-validation-error-msg="Debe ingresar los nombres" maxlength="250" /></td>
                        <td><form:input path="apellidos" class="form-control" data-validation="required" data-validation-error-msg="Debe ingresar los apellidos" maxlength="100" /></td>
                    </tr>
                    <tr>
                        <td colspan="3"><strong>Correo electrónico:</strong></td>
                    </tr>
                    <tr>
                        <td colspan="3"><form:input path="correoElectronico" type="email" class="form-control" data-validation="required" data-validation-error-msg="Debe ingresar el correo electrónico" maxlength="100" /></td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-success">Actualizar</button>
            </div>   
        </form:form>
    </div>
</div>
<script>
    $.validate({
        validateOnBlur: false, // disable validation when input looses focus
        errorMessagePosition: 'top', // Instead of 'inline' which is default
        scrollToTopOnError: false // Set this property to true on longer forms
    });

    $('#usuario').submit(function (evt) {
        evt.preventDefault();
        var formData = new FormData(this);
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/usuarios/editar",
            data: formData,
            processData: false,
            contentType: false,
            beforeSend: function (xhr) {
                xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
            },
            success: function (response) {
                if (response != "") {
                    bootstrap_alert_usuario.warning(response);
                } else {
                    bootstrap_alert_usuario.success("Usuario actualizado exitosamente");
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                bootstrap_alert_usuario.warning("Error al actualizar el usuario");
            }});
    });

    bootstrap_alert_usuario = function () { };
    bootstrap_alert_usuario.warning = function (message) {
        $('#alert_placeholder_usuario').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_usuario.success = function (message) {
        $('#alert_placeholder_usuario').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_usuario.removeWarning = function () {
        $('#alert_placeholder_usuarios').html('');
    };
</script>
