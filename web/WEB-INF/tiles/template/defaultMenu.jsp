<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    

<table width="100%"  border="0" cellspacing="0" cellpadding="0" align="right">
  <tr>
    <td height="120">&nbsp;</td>
  </tr>
  <tr>
    <td height="750" valign="top"><div id="divMenu"></div></td>
  </tr>
</table>
<script type="text/javascript">
   ${javascriptMenu};
    $(document).ready(function () {
        inicializar();
    });
</script>