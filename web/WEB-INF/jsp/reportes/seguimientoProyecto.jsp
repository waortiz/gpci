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
        <div class = "panel-heading ">SEGUIMIENTO DE PROYECTO</div>   
        <div class = "panel-body">
            <div class="tab-content">
                <div class="tab-pane fade in active" id="tab1success">
                    <form id="seguimiento" name="seguimiento">
                        <div id="alert_placeholder"></div>
                        <table class="tablaForm"> 
                            <tr>
                                <td align="center">Formato:</td>
                                <td align="center">
                                    <select name="tipoFormato" id="tipoFormato" class="form-control">
                                        <option value=""></option>
                                        <option value="1">HTML</option>
                                        <option value="2">PDF</option>
                                        <option value="3">Excel</option>
                                    </select>    
                                </td>
                                <td align="center">Código:</td>
                                <td align="center">
                                    <input id="codigo" name="codigo" class="form-control" maxlength="20"/>
                                </td>
                                <td align="right">
                                    <input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <button type="button" class="btn-sm btn-success" onclick="generarInforme()">Generar</button>
                                </td>
                            </tr>
                        </table>                    
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">

    function generarInforme() {
        bootstrap_alert.removeWarning();
        if ($('#tipoFormato').val() == "") {
            bootstrap_alert.warning('Debe seleccionar el tipo de formato');
            return false;
        }
        if ($('#codigo').val() == "") {
            bootstrap_alert.warning('Debe ingresar el número código del proyecto');
            return false;
        }
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/proyectos/proyectoPorCodigo/" + $('#codigo').val(),
            beforeSend: function (xhr) {
                xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
            },
            success: function (response) {
                var respuesta = JSON.parse(response);
                if (respuesta.existe) {
                    if($('#tipoFormato').val() == 3) {
                      window.location.href = "${pageContext.request.contextPath}/reportes/generarInformeSeguimientoProyecto" + $('#tipoFormato option:selected').text() + "/" + $('#codigo').val();
                    } else {
                      window.open("${pageContext.request.contextPath}/reportes/generarInformeSeguimientoProyecto" + $('#tipoFormato option:selected').text() + "/" + $('#codigo').val(), "_blank", "location=no,height=600,width=900");
                    }
                } else {
                    bootstrap_alert.warning('El proyecto no existe');
                }
            },
            error: function (e) {
                bootstrap_alert.warning(e);
            }
        });
    }

    bootstrap_alert = function () { };
    bootstrap_alert.warning = function (message) {
        $('#alert_placeholder').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert.removeWarning = function () {
        $('#alert_placeholder').html('');
    };

</script>
