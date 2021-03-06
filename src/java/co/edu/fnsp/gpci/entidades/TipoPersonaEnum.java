package co.edu.fnsp.gpci.entidades;

public enum TipoPersonaEnum {
    PROFESOR(1), ESTUDIANTE(2), PERSONAL_EXTERNO(3);

    private final int idTipoPersona;

    private TipoPersonaEnum(int idTipoPersona) {
        this.idTipoPersona = idTipoPersona;
    }

    public int getIdTipoPersona() {
        return idTipoPersona;
    }

}
