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
        <div class="panel-heading">Privilegios Usuario</div>
        <div class="panel-body">
            <form:form method="POST" action="${pageContext.request.contextPath}/usuarios/privilegios" modelAttribute="privilegiosUsuario">
                <div id="alert_placeholder_privilegio"></div>
                <table class="table table-hover tablaForm" align="center">
                    <tr>
                        <td width="33%"><strong>Usuario:</strong></td>
                        <td width="33%"><strong>Nombres:</strong></td>
                        <td width="33%"><strong>Apellidos:</strong></td>
                    </tr>
                    <tr>
                        <td>${privilegiosUsuario.getNombreUsuario()}</td>
                        <td>${privilegiosUsuario.getNombres()}</td>
                        <td>${privilegiosUsuario.getApellidos()}</td>
                    </tr>                
                    <tr>
                        <td colspan="3"><strong>Privilegios</strong></td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <form:hidden path="idUsuario" />
                            <table align="center">
                                <tr>
                                    <td rowspan="2">
                                        <select name="privilegiosPorAsignar" id="privilegiosPorAsignar" class="form-control" multiple="true" style="width:450px; height: 200px">
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
                                        <form:select path="privilegios" id="privilegios" cssClass="form-control" multiple="true" style="width:450px; height: 200px">
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
                <button type="submit" class="btn btn-success">Aceptar</button>
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

    $('#privilegiosUsuario').submit(function (evt) {
        evt.preventDefault();
        if ($("#privilegios option").length == 0) {
            bootstrap_alert_privilegio.warning('Debe asignar al menos un privilegio');
            return false;
        }
        $('#privilegios option').prop('selected', true);
        var formData = new FormData(this);
        bootstrap_alert_privilegio.removeWarning();
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/usuarios/privilegios",
            data: formData,
            processData: false,
            contentType: false,
            beforeSend: function (xhr) {
                xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
            },
            success: function (response) {
                bootstrap_alert_privilegio.success("Privilegios asignados exitosamente");
            },
            error: function (xhr, ajaxOptions, thrownError) {
                bootstrap_alert_privilegio.warning("Error al almacenar los privilegios");
            }});
    });

    bootstrap_alert_privilegio = function () { };
    bootstrap_alert_privilegio.warning = function (message) {
        $('#alert_placeholder_privilegio').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_privilegio.success = function (message) {
        $('#alert_placeholder_privilegio').html('<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_privilegio.removeWarning = function () {
        $('#alert_placeholder_privilegio').html('');
    };
</script>
