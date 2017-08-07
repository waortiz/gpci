package co.edu.fnsp.gpci.entidades;

public enum EstadoProyectoEnum {
    EJECUCION(1), FINALIZADO(2), ATRASADO(3), TRASLADADO(3), CANCELADO(4);

    private final int idEstadoProyecto;

    private EstadoProyectoEnum(int idEstadoProyecto) {
        this.idEstadoProyecto = idEstadoProyecto;
    }

    public int getIdEstadoProyecto() {
        return idEstadoProyecto;
    }

}
