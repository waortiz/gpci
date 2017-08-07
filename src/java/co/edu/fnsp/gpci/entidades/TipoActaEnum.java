package co.edu.fnsp.gpci.entidades;

public enum TipoActaEnum {
    REGISTRO_PROPIEDAD_INTELECTUAL(1), FINALIZACION(2), CIERRE(3), CONSEJO_FACULTAD(4);

    private final int idTipoActa;

    private TipoActaEnum(int idTipoActa) {
        this.idTipoActa = idTipoActa;
    }

    public int getIdTipoActa() {
        return idTipoActa;
    }

}
