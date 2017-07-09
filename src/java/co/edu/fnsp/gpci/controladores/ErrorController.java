/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.controladores;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author William
 */
@Controller
public class ErrorController {
 
    @RequestMapping(value = "errors", method = RequestMethod.GET)
    public String renderErrorPage(HttpServletRequest httpRequest, Model model) {
        String errorMsg = "";
        int httpErrorCode = getErrorCode(httpRequest);
 
        switch (httpErrorCode) {
            case 400: {
                errorMsg = "La solicitud realizada no es válida.";
                break;
            }
            case 401: {
                errorMsg = "No está autorizado para visualizar la página.";
                break;
            }
            case 404: {
                errorMsg = "La página solicitada no existe.";
                break;
            }
            case 500: {
                errorMsg = "Ha ocurrido un error interno en el servidor.";
                break;
            }
        }
        model.addAttribute("errorMsg", errorMsg);
        
        return "error";
    }
     
    private int getErrorCode(HttpServletRequest httpRequest) {
        return (Integer) httpRequest
          .getAttribute("javax.servlet.error.status_code");
    }
}