<%-- 
    Document   : proyectos
    Created on : 14-may-2017, 19:26:44
    Author     : William
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<html><!-- InstanceBegin template="/Templates/tema1.dwt.php" codeOutsideHTMLIsLocked="false" -->
    <head>
        <title>GPCI: Gestión de Proyectos</title>
        <link rel="icon" href='<c:url value="/resources/imagenes/favicon.ico" />' type="image/x-icon" />
        <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/bootstrap.min.css" />'>
        <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/estilos.css" />'>
    </head>
    <body>
        <nav class="navbar barraPrincipal">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#inverseNavbar1" aria-expanded="false">
                        <span class="sr-only"></span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                    </button>
                    <a class="barraPrincipal-text" href="#">GPCI <small> FNSP</small></a>
                </div>
                <div class="collapse navbar-collapse" id="inverseNavbar1">

                    <ul class="nav navbar-nav navbar-right">

                    </ul>

                </div>
            </div>
        </nav>        
        <div class="container">
            <c:if test = "${not empty mensaje}">
                <div class="alert alert-success">
                    ${mensaje}
                </div>
            </c:if>            
            <div class = "panel panel-success">
                <div class = "panel-heading ">PROYECTOS</div>   
                <div class = "panel-body">
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="tab1success">
                            <table class='table table-hover' style='font-size:12px;'> 
                                <tr  class='text-success'>
                                    <th width='20%'>Nombre corto</th>
                                    <th width='20%'>Fecha de inicio</th> 
                                    <th width='20%'>Fecha finalizaci&oacute;n</th> 
                                    <th width='15%'>Tipo de proyecto</th> 
                                    <th width='15%'>Estado</th> 
                                    <th width='10%'>Modificar</th> 
                                </tr> 
                                <c:forEach var="proyecto" items="${proyectos}">   
                                    <tr>
                                        <td>
                                            ${proyecto.getNombreCortoProyecto()}
                                        </td>
                                        <td>
                                            ${proyecto.getFechaInicioFormato()}
                                        </td>
                                        <td>
                                            ${proyecto.getFechaFinalizacionFormato()}
                                        </td>
                                        <td>
                                            ${proyecto.getTipoProyecto()}
                                        </td>   
                                        <td>
                                            ${proyecto.getEstadoProyecto()}
                                        </td>  
                                        <td>
                                            <a href="${pageContext.request.contextPath}/proyectos/editar/${proyecto.getIdProyecto()}" class="btn-sm btn-warning">Editar</a>
                                        </td>  
                                    </tr>
                                </c:forEach>  
                            </table> 
                        </div>
                    </div>
                </div>
                <table class='table table-hover' style='font-size:12px;'> 
                    <tr>
                        <td align="right">
                            <a href='crear'  title='Registrar Proyecto' >
                                <input type='button' class='btn-sm btn-success' value='Registrar Proyecto' />
                            </a> 
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <script src='<c:url value="/resources/js/jquery-3.2.1.js" />'></script>
        <script src='<c:url value="/resources/js/jquery-ui.js" />'></script>
        <script src='<c:url value="/resources/js/bootstrap.js" />'></script>              
    </body>
</html>
