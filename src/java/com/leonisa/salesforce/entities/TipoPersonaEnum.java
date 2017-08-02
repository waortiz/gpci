package com.leonisa.salesforce.entities;

public enum TipoPersonaEnum {
    PROFESOR(1), ESTUDIANTE(2), PERSONAL_EXTERNO(2);

    private final int idTipoPersona;

    private TipoPersonaEnum(int idTipoPersona) {
        this.idTipoPersona = idTipoPersona;
    }

    public int getIdTipoPersona() {
        return idTipoPersona;
    }

}
