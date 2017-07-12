package co.edu.fnsp.gpci.entidades;

import org.springframework.security.core.GrantedAuthority;

public class Privilegio implements GrantedAuthority {

    private int idPrivilegio;
    private String codigo;
    private String nombre;

    /**
     * @return the idPrivilegio
     */
    public int getIdPrivilegio() {
        return idPrivilegio;
    }

    /**
     * @param idPrivilegio the idPrivilegio to set
     */
    public void setIdPrivilegio(int idPrivilegio) {
        this.idPrivilegio = idPrivilegio;
    }

    /**
     * @return the codigo
     */
    public String getCodigo() {
        return codigo;
    }

    /**
     * @param codigo the codigo to set
     */
    public void setCodigo(String codigo) {
        this.codigo = codigo;
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

    @Override
    public String getAuthority() {
        return this.codigo;
    }

}
