<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    

    <div class="imgFondo"></div>
    <div class="module form-module">
        <div id="divRegistro" class="toggle registro active"><i class="fa fa-pencil"></i>
            <div class="tooltip">
                Registrar
            </div>
        </div>
        <div id="divFormLogin" class="form form-login active">
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
            <div class="cta">
                <a href="#" class="clave">Perdió su contraseña / Forgot your password?</a>
            </div>
        </div>
        <div id="divFormRegistro" class="form form-registro">
            <div class="contenedorLogo">
                <img src='<c:url value="/resources/imagenes/logoUdeaBlanco.png"/>'>
            </div>
            <div class="header">
                <div>
                    Registro
                    <span>
                        Usuarios
                    </span>
                </div>
            </div>
            <div id="mensajeRegistro" class="label">
            </div>
            <form:form method="post" action="${pageContext.request.contextPath}/crear" modelAttribute="usuario">
                <input type="text" placeholder="Nombre Usuario / Username" required pattern="[0-9a-zA-Z]{1,15}" name="nombreUsuario" id="nombreUsuario"/>
                <input type="text" placeholder="Nombres / Firt Name" required name="nombres" id="nombres" />
                <input type="text" placeholder="Apellidos / Last Name" required name="apellidos" id="apellidos" />
                <input type="email" placeholder="Correo electrónico / Email Address" required name="correoElectronico" id="correoElectronico"/>
                <input type="password" placeholder="Contraseña / Password" required name="clave" id="clave"/>
                <input type="submit" value="Registrar"/>
            </form:form>
            <div class="cta">
                <a href="#" class="login">Iniciar Sesión / Login</a>
            </div>                    
        </div>
        <div id="divFormClave" class="form form-clave">
            <div class="contenedorLogo">
                <img src='<c:url value="/resources/imagenes/logoUdeaBlanco.png"/>'>
            </div>
            <div class="header">
                <div>
                    Recuperación
                    <span>
                        Clave
                    </span>
                </div>
            </div>
            <div id="mensajeClave" class="label">
            </div>
            <form:form method="post" action="${pageContext.request.contextPath}/recuperarClave" modelAttribute="recuperacionClave">
                <input type="text" placeholder="Nombre Usuario / Username" required pattern="[0-9a-zA-Z]{1,15}" name="nombreUsuario" id="nombreUsuario"/>
                <input type="submit" value="Recuperar clave"/>
            </form:form>
            <div class="cta">
                <a href="#" class="login">Iniciar Sesión / Login</a>
            </div>                
        </div>            
    </div>
    <script src='<c:url value="/resources/js/jquery-3.2.1.js" />'></script>
    <script>
        
    $('.registro').click(function(){
      if(!$('#divRegistro').hasClass('deactive')) {
         $('#divRegistro').toggleClass('deactive');
      }
      if($('#divRegistro').hasClass('active')) {
         $('#divRegistro').toggleClass('active');
      }      
      if($('#divFormRegistro').hasClass('deactive')) {
         $('#divFormRegistro').toggleClass('deactive');
      }
      if(!$('#divFormRegistro').hasClass('active')) {
         $('#divFormRegistro').toggleClass('active');
      } 
      if(!$('#divFormLogin').hasClass('deactive')) {
         $('#divFormLogin').toggleClass('deactive');
      }
      if($('#divFormLogin').hasClass('active')) {
         $('#divFormLogin').toggleClass('active');
      } 
      if(!$('#divFormClave').hasClass('deactive')) {
         $('#divFormClave').toggleClass('deactive');
      }
      if($('#divFormClave').hasClass('active')) {
         $('#divFormClave').toggleClass('active');
      } 
    });      

    $('.login').click(function(){
      if($('#divRegistro').hasClass('deactive')) {
         $('#divRegistro').toggleClass('deactive');
      }
      if(!$('#divRegistro').hasClass('active')) {
         $('#divRegistro').toggleClass('active');
      }      
      if(!$('#divFormRegistro').hasClass('deactive')) {
         $('#divFormRegistro').toggleClass('deactive');
      }
      if($('#divFormRegistro').hasClass('active')) {
         $('#divFormRegistro').toggleClass('active');
      } 
      if($('#divFormLogin').hasClass('deactive')) {
         $('#divFormLogin').toggleClass('deactive');
      }
      if(!$('#divFormLogin').hasClass('active')) {
         $('#divFormLogin').toggleClass('active');
      }   
      if(!$('#divFormClave').hasClass('deactive')) {
         $('#divFormClave').toggleClass('deactive');
      }
      if($('#divFormClave').hasClass('active')) {
         $('#divFormClave').toggleClass('active');
      } 
    });        

    $('.clave').click(function(){
      if($('#divRegistro').hasClass('deactive')) {
         $('#divRegistro').toggleClass('deactive');
      }
      if(!$('#divRegistro').hasClass('active')) {
         $('#divRegistro').toggleClass('active');
      }      
      if(!$('#divFormRegistro').hasClass('deactive')) {
         $('#divFormRegistro').toggleClass('deactive');
      }
      if($('#divFormRegistro').hasClass('active')) {
         $('#divFormRegistro').toggleClass('active');
      }
      if(!$('#divFormLogin').hasClass('deactive')) {
         $('#divFormLogin').toggleClass('deactive');
      }
      if($('#divFormLogin').hasClass('active')) {
         $('#divFormLogin').toggleClass('active');
      }
      if($('#divFormClave').hasClass('deactive')) {
         $('#divFormClave').toggleClass('deactive');
      }
      if(!$('#divFormClave').hasClass('active')) {
         $('#divFormClave').toggleClass('active');
      } 
    });   
    
    $('#usuario').submit(function (evt) {
                evt.preventDefault();
                var formData = new FormData(this);
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/login/crear",
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function (response) {
                        if (response != "") {
                           $('#mensajeRegistro').html(response);
                           $('#nombreUsuario').val("");
                           $('#correoElectronico').val("");
                           $('#nombres').val("");
                           $('#apellidos').val("");
                           $('#clave').val("");
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        $('#mensajeRegistro').html("Error al crear el usuario" + thrownError);
                    }});
            });   
            
    $('#recuperacionClave').submit(function (evt) {
                evt.preventDefault();
                var formData = new FormData(this);
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/login/recuperarClave",
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function (response) {
                        if (response != "") {
                           $('#mensajeClave').html(response);
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        $('#mensajeClave').html("Error al recuperar la clave: " + thrownError);
                    }});
            });    
    </script>
