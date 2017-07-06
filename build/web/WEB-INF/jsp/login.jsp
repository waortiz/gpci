<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<html>
    <head>
        <title>GPCI: Gestión de Proyectos</title>
        <link rel="icon" href='<c:url value="/resources/imagenes/favicon.ico" />' type="image/x-icon" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
        <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>  
        <link rel="stylesheet" href='<c:url value="/resources/css/login.css" />'>

    </style>
</head>
<body>
    <div class="imgFondo"></div>
    <div class="module form-module">
        <div class="toggle"><i class="fa fa-times fa-pencil"></i>
            <div class="tooltip">
                Registrar
            </div>
        </div>
        <div class="form">
            <div class="contenedorLogo">
                <img src='<c:url value="/resources/imagenes/logoUdeaBlanco.png"/>'>
            </div>
            <div class="header">
                <div>
                    Ingreso<br>
                    <span>
                        GPCI
                    </span>
                </div>
            </div>
            <c:if test="${param.auth eq 'failure'}">
                <div class="label">
                    <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />
                </div>
            </c:if>
            <form action="<c:url value='/j_spring_security_check' />" method='POST'>
                <input type="text" placeholder="Nickname / Nickname" pattern="[0-9a-zA-Z]{1,15}" name="username" required maxlength="15"/>
                <input type="password" placeholder="Contraseña / Password" name="password" required maxlength="40"/>
                <input type="submit" value="Ingresar"/>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
        </div>
        <div class="form">
            <div class="header">
                <div>
                    Registro
                    <span>
                        Usuarios
                    </span>
                </div>
            </div>
            <form:form method="post" action="${pageContext.request.contextPath}/usuario/crear" modelAttribute="usuario">
                <input type="text" placeholder="Nombre Usuario / Username" required pattern="[0-9a-zA-Z]{1,15}" name="nombreUsuario" id="nombreUsuario"/>
                <input type="text" placeholder="Nombres / Firt Name" required name="nombres" />
                <input type="text" placeholder="Apellidos / Last Name" required name="apellidos" />
                <input type="email" placeholder="Correo electrónico / Email Address" required name="correoElectronico"/>
                <input type="password" placeholder="Contraseña / Password" required name="clave" id="clave"/>
                <input type="submit" value="Registrar"/>
            </form:form>
        </div>
        <div class="cta">
            <a href="#">Perdió su contraseña / Forgot your password?</a>
        </div>
    </div>
    <script src='<c:url value="/resources/js/jquery-3.2.1.js" />'></script>
    <script src='<c:url value="/resources/js/index.js" />'></script>
</body>
</html>