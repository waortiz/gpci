/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.gpci.editores;

import co.edu.fnsp.gpci.entidades.TipoProyecto;
import java.beans.PropertyEditorSupport;
import org.springframework.stereotype.Component;

/**
 *
 * @author William
 */
@Component
public class TipoProyectoEditor extends PropertyEditorSupport {

    @Override
    public void setAsText(String id) {
        TipoProyecto tipoProyecto = new TipoProyecto();
        if (id.length() > 0) {
            tipoProyecto.setIdTipoProyecto(Integer.parseInt(id));
        }

        this.setValue(tipoProyecto);
    }
}
