<%-- 
    Document   : cambioClave
    Created on : 24-jul-2017, 16:47:00
    Author     : William
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    

<div class="container">
    <div class="panel panel-success">
        <div class="panel-heading">Cambiar Clave</div>
        <div class="panel-body">
            <form:form method="POST" modelAttribute="cambioClave">
                <input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <div id="alert_placeholder_usuario"></div>
                <table class="table table-hover tablaForm" align="center">
                    <tr>
                        <td width="33%"><strong>Clave anterior:</strong></td>
                        <td width="33%"><strong>Nueva clave:</strong></td>
                        <td width="33%"><strong>Repita la nueva clave:</strong></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="password" name="claveAnterior" id="claveAnterior" class="form-control" data-validation="required" data-validation-error-msg="Debe ingresar la clave anterior" maxlength="50"/>
                        </td>
                        <td>
                            <input type="password" name="claveNueva" id="claveNueva" class="form-control" data-validation="required" data-validation-error-msg="Debe ingresar la nueva clave" maxlength="50"/>
                        </td>
                        <td>
                            <input type="password" name="claveRepetida" id="claveRepetida" class="form-control" data-validation="required" data-validation-error-msg="Debe ingresar nuevamente la nueva clave" maxlength="50"/>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-success">Cambiar clave</button>
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

    $('#cambioClave').submit(function (evt) {
        evt.preventDefault();
        if ($('#claveNueva').val() != $('#claveRepetida').val()) {
            bootstrap_alert_usuario.warning("Las claves no coinciden");
            return false;
        }
        var formData = new FormData(this);
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/login/cambiarClave",
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
                    bootstrap_alert_usuario.success("Clave cambiada exitosamente");
                    $('#clave').val("");
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
               bootstrap_alert_usuario.warning("Error al cambiar la clave");
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
