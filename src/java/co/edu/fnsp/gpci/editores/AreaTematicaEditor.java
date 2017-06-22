package co.edu.fnsp.gpci.editores;

import co.edu.fnsp.gpci.entidades.AreaTematica;
import java.beans.PropertyEditorSupport;

public class AreaTematicaEditor extends PropertyEditorSupport {

    @Override
    public void setAsText(String id) {
        AreaTematica areaTematica = new AreaTematica();
        if (id.length() > 0) {
            areaTematica.setIdAreaTematica(Integer.parseInt(id));
        }

        this.setValue(areaTematica);
    }
}
