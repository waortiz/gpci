/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.utilidades;

import co.edu.fnsp.gpci.entidades.OpcionMenu;
import co.edu.fnsp.gpci.entidades.Usuario;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class GPCIInterceptor extends HandlerInterceptorAdapter {

    /**
     *
     * @param request
     * @param response
     * @param handler
     * @return
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest request,
            HttpServletResponse response, Object handler) throws Exception {

        if (request.getRequestURI().toLowerCase().contains(request.getContextPath() + "/proyectos/estudiantes")
                || request.getRequestURI().toLowerCase().contains(request.getContextPath() + "/proyectos/profesores")
                || request.getRequestURI().toLowerCase().contains(request.getContextPath() + "/proyectos/personalExterno")) {
            return true;
        }
        if (SecurityContextHolder.getContext().getAuthentication() != null && SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof Usuario) {
            boolean existe = false;
            Usuario usuario = (Usuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            for (OpcionMenu opcionMenu : usuario.getOpcionesMenu()) {
                existe = false;
                if (request.getRequestURI().toLowerCase().contains(request.getContextPath() + opcionMenu.getUrl())) {
                    existe = true;
                    break;
                }
            }
            if (!existe) {
                response.sendRedirect(request.getContextPath() + "/index");
            }
        }

        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request,
            HttpServletResponse response,
            Object handler,
            ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request,
            HttpServletResponse response, Object handler,
            Exception ex) throws Exception {
    }
}
