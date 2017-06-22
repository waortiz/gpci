package co.edu.fnsp.gpci.entidades;

import org.springframework.security.core.GrantedAuthority;

public class RolUsuario implements GrantedAuthority{

	private String name;
        
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
        
        @Override
	public String getAuthority() {
		return name;
	}
	 
	

}
