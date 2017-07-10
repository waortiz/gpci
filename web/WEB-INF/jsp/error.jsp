<%-- 
    Document   : error
    Created on : 08-jul-2017, 22:38:40
    Author     : William
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
        <div class="container">
            <div class="container-fluid"> 
                <p align="center" style="margin-top:20px;"><img src='<c:url value="/resources/imagenes/logo-udea.png"/>' width="371" height="103" alt="U de A"></p>
            </div>
            <br />
            <table class='table table-hover' style='font-size:12px;'> 
                <tr>
                    <td><strong>${errorMsg}</strong></td>
                </tr>
            </table>
            <script src='<c:url value="/resources/js/jquery-3.2.1.js" />'></script>
            <script src='<c:url value="/resources/js/jquery-ui.js" />'></script>
            <script src='<c:url value="/resources/js/bootstrap.js" />'></script>  
        </div>
