package co.edu.fnsp.gpci.entidades;

public enum TipoIdentificacionEnum {
    CEDULA_CIUDADANIA(1), PASAPORTE(2), CEDULA_EXTRANJERIA(3);

    private final int idTipoIdentificacion;

    private TipoIdentificacionEnum(int idTipoIdentificacion) {
        this.idTipoIdentificacion = idTipoIdentificacion;
    }

    public int getIdTipoIdentificacion() {
        return idTipoIdentificacion;
    }

}
