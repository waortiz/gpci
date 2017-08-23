package co.edu.fnsp.gpci.entidades;

public enum TipoIdentificacionEnum {
    CEDULA_CIUDADANIA(1, "Cédula de Ciudadanía"), PASAPORTE(2, "Pasaporte"), CEDULA_EXTRANJERIA(3, "Cédula de Extranjería");

    private final int idTipoIdentificacion;
    private String nombre;

    private TipoIdentificacionEnum(int idTipoIdentificacion, String nombre) {
        this.idTipoIdentificacion = idTipoIdentificacion;
        this.nombre = nombre;
    }

    public int getIdTipoIdentificacion() {
        return idTipoIdentificacion;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

}
