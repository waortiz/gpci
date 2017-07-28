<%-- 
    Document   : privilegios
    Created on : 23-jul-2017, 14:00:00
    Author     : William
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    

<div class="container">
    <div class="panel panel-success">
        <div class="panel-heading">Crear Usuario</div>
        <div class="panel-body">
            <form:form method="POST" action="${pageContext.request.contextPath}/usuarios/crear" modelAttribute="usuario">
                <div id="alert_placeholder_usuario"></div>
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
                        <td width="33%"><strong>Correo electrónico:</strong></td>
                        <td width="33%"><strong>Clave:</strong></td>
                        <td width="33%"><strong>Repita la clave:</strong></td>
                    </tr>
                    <tr>
                        <td><form:input path="correoElectronico" type="email" class="form-control" data-validation="required" data-validation-error-msg="Debe ingresar el correo electrónico" maxlength="100" /></td>
                        <td>
                            <form:input path="clave" type="password" class="form-control" data-validation="required" data-validation-error-msg="Debe ingresar la clave" maxlength="50"/>
                        </td>
                        <td>
                            <input type="password" name="claveRepetida" id="claveRepetida" class="form-control" data-validation="required" data-validation-error-msg="Debe ingresar nuevamente la clave" maxlength="50"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3"><strong>Privilegios</strong></td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <table align="center">
                                <tr>
                                    <td rowspan="2">
                                        <select name="privilegiosPorAsignar" id="privilegiosPorAsignar" class="form-control" multiple="true" style="width: 300px">
                                            <c:forEach var="privilegio" items="${privilegiosPorAsignar}">
                                                <option value="${privilegio.getIdPrivilegio()}">${privilegio.getNombre()}</option>
                                            </c:forEach>
                                        </select>                                          
                                    </td>
                                    <td>
                                        <a href="JavaScript:void(0);" id="asignar"><span class="glyphicon glyphicon-arrow-right"></span></a><br><br>
                                        <a href="JavaScript:void(0);" id="remover"><span class="glyphicon glyphicon-arrow-left"></span></a>
                                    </td>
                                    <td rowspan="2">
                                        <form:select path="privilegios" id="privilegios" cssClass="form-control" multiple="true" style="width: 300px">
                                            <form:options items="${privilegiosAsignados}" itemLabel="nombre" itemValue="idPrivilegio"/>
                                        </form:select>                                    
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-success">Crear</button>
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
        if ($('#clave').val() != $('#claveRepetida').val()) {
            bootstrap_alert_usuario.warning("Las claves no coinciden");
            return false;
        }
        if ($("#privilegios option").length == 0) {
            bootstrap_alert_usuario.warning('Debe asignar al menos un privilegio');
            return false;
        }
        $('#privilegios option').prop('selected', true);        
        var formData = new FormData(this);
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/usuarios/crear",
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
                    bootstrap_alert_usuario.success("Usuario creado exitosamente");
                    $('#nombreUsuario').val("");
                    $('#correoElectronico').val("");
                    $('#nombres').val("");
                    $('#apellidos').val("");
                    $('#clave').val("");
                    $('#claveRepetida').val("");
                    $('#privilegios option').each(function () {
                        $('#privilegiosPorAsignar').append("<option value='" + $(this).val() + "'>" + $(this).text() + "</option>");
                        $(this).remove();
                        ordenarPrivilegios($('#privilegiosPorAsignar option'));
                    });
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
               bootstrap_alert_usuario.warning("Error al crear el usuario");
            }});
    });

    $(document).ready(function () {

        $('#asignar').click(function () {
            $('#privilegiosPorAsignar option:selected').each(function () {
                $('#privilegios').append("<option value='" + $(this).val() + "'>" + $(this).text() + "</option>");
                $(this).remove();
                ordenarPrivilegios($('#privilegios option'));
            });
        });
        $('#remover').click(function () {
            $('#privilegios option:selected').each(function () {
                $('#privilegiosPorAsignar').append("<option value='" + $(this).val() + "'>" + $(this).text() + "</option>");
                $(this).remove();
                ordenarPrivilegios($('#privilegiosPorAsignar option'));
            });
        });

    });

    function ordenarPrivilegios(options) {
        var arr = options.map(function (_, o) {
            return {
                t: $(o).text(),
                v: o.value
            };
        }).get();
        arr.sort(function (o1, o2) {
            return o1.t > o2.t ? 1 : o1.t < o2.t ? -1 : 0;
        });
        options.each(function (i, o) {
            o.value = arr[i].v;
            $(o).text(arr[i].t);
        });
    }

    bootstrap_alert_usuario = function () { };
    bootstrap_alert_usuario.warning = function (message) {
        $('#alert_placeholder_usuario').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_usuario.success = function (message) {
        $('#alert_placeholder_usuario').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_usuario.removeWarning = function () {
        $('#alert_placeholder_usuario').html('');
    };
</script>
