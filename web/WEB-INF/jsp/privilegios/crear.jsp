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
        <div class="panel-heading">Privilegio</div>
        <div class="panel-body">
            <form:form method="POST" action="${pageContext.request.contextPath}/privilegios/crear" modelAttribute="privilegio">
                <div id="alert_placeholder_privilegio"></div>
                <table class="table table-hover tablaForm" align="center">
                    <tr>
                        <td width="50%"><strong>Código</strong></td>
                        <td width="50%"><strong>Nombre:</strong></td>
                    </tr>
                    <tr>
                        <td><form:input path="codigo" class="form-control" data-validation="required" data-validation-error-msg="Debe ingresar el código" maxlength="45" /></td>
                        <td>
                            <form:input path="nombre" class="form-control" data-validation="required" data-validation-error-msg="Debe ingresar el nombre" maxlength="50" />
                            <input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <form:hidden path="idPrivilegio" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><strong>Opciones menú</strong></td>
                    </tr> 
                    <tr>
                        <td colspan="2">
                            <table align="center">
                                <tr>
                                    <td rowspan="2">
                                        <select name="opcionesMenuPorAsignar" id="opcionesMenuPorAsignar" class="form-control" multiple="true" style="width:450px; height: 200px">
                                            <c:forEach var="opcionMenu" items="${opcionesMenuPorAsignar}">
                                                <option value="${opcionMenu.getIdOpcionMenu()}">${opcionMenu.getNombre()}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                    <td>
                                        <a href="JavaScript:void(0);" id="asignar"><span class="glyphicon glyphicon-arrow-right"></span></a><br><br>
                                        <a href="JavaScript:void(0);" id="remover"><span class="glyphicon glyphicon-arrow-left"></span></a>
                                    </td>
                                    <td rowspan="2">
                                        <form:select path="opcionesMenu" id="opcionesMenu" cssClass="form-control" multiple="true" style="width:450px; height: 200px">
                                            <form:options items="${opcionesMenuAsignados}" itemLabel="nombre" itemValue="idOpcionMenu"/>
                                        </form:select>                                    
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>                    
                </table>
            </div>
            <div class="modal-footer">
                <c:if test = "${privilegio.getIdPrivilegio() == 0}">
                    <input type="submit" value="Crear privilegio" class="btn-sm btn-success" />
                </c:if>
                <c:if test = "${privilegio.getIdPrivilegio() > 0}">
                    <input type="submit" value="Actualizar privilegio" class="btn-sm btn-success" />
                </c:if>                
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
            $('#opcionesMenuPorAsignar option:selected').each(function () {
                $('#opcionesMenu').append("<option value='" + $(this).val() + "'>" + $(this).text() + "</option>");
                $(this).remove();
            });
            ordenarOpcionesMenu($('#opcionesMenu option'));
        });
        $('#remover').click(function () {
            $('#opcionesMenu option:selected').each(function () {
                $('#opcionesMenuPorAsignar').append("<option value='" + $(this).val() + "'>" + $(this).text() + "</option>");
                $(this).remove();
            });
            ordenarOpcionesMenu($('#opcionesMenuPorAsignar option'));
        });
    });

    function ordenarOpcionesMenu(options) {
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

    $('#privilegio').submit(function (evt) {
        if ($("#opcionesMenu option").length == 0) {
            bootstrap_alert_privilegio.warning('Debe asignar al menos una opción de menú');
            return false;
        }
        $('#opcionesMenu option').prop('selected', true);
        evt.preventDefault();
        var formData = new FormData(this);
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/privilegios/crear",
            data: formData,
            processData: false,
            contentType: false,
            beforeSend: function (xhr) {
                xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
            },            
            success: function (response) {
                if (response != "") {
                    bootstrap_alert_privilegio.warning(response);
                } else {
                    if ($('#idPrivilegio').val() == 0) {
                        $('#codigo').val("");
                        $('#nombre').val("");
                        $('#opcionesMenu option').each(function () {
                            $('#opcionesMenuPorAsignar').append("<option value='" + $(this).val() + "'>" + $(this).text() + "</option>");
                            $(this).remove();
                            ordenarOpcionesMenu($('#opcionesMenuPorAsignar option'));
                        });                        
                        bootstrap_alert_privilegio.success("Privilegio creado exitosamente");
                    } else {
                        bootstrap_alert_privilegio.success("Privilegio actualizado exitosamente");
                    }
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                bootstrap_alert_privilegio.warning("Error al crear el privilegio");
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
