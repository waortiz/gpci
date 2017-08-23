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
        <div class = "panel-heading ">CERTIFICADOS</div>   
        <div class = "panel-body">
            <div class="tab-content">
                <div class="tab-pane fade in active" id="tab1success">
                    <form id="certificado" name="certificado">
                        <div id="alert_placeholder"></div>
                        <table class='table' style='font-size:12px;'> 
                            <tr  class='text-success'>
                                <td>Tipo persona</td>
                                <td>
                                    <select name="tipoPersona" id="tipoPersona" class="form-control">
                                        <option value=""></option>
                                        <option value="2">Estudiante</option>
                                        <option value="3">Personal Externo</option>
                                    </select>    
                                </td>
                                <td align="center"><b>Cédula</b></td>
                                <td>
                                    <input id="numeroDocumento" name="numeroDocumento" class="form-control" maxlength="20"/>
                                </td>
                                <td align="right">
                                    <button type="button" class="btn btn-primary" onclick=generarCertificado()">Generar</button>
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

    function generarCertificado() {

        var tipoPersona = "";
        if ($('#tipoPersona').val() == "") {
            bootstrap_alert_adenda_cambio.warning('Debe seleccionar el tipo de persona');
            return false;
        }
        if ($('#numeroDocumento').val() == "") {
            bootstrap_alert_adenda_cambio.warning('Debe ingresar la cédula');
            return false;
        }

        if ($('#tipoPersona').val() == 2) {
            tipoPersona = "Estudiante";
        }
        if ($('#tipoPersona').val() == 3) {
            tipoPersona = "PersonalExterno";
        }

        window.location.href = "${pageContext.request.contextPath}/reportes/generarCertificado" + tipoPersona + "/" + $('numeroDocumento').val();
    }

    bootstrap_alert = function () { };
    bootstrap_alert.warning = function (message) {
        $('#alert_placeholder').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert.removeWarning = function () {
        $('#alert_placeholder').html('');
    };

</script>
