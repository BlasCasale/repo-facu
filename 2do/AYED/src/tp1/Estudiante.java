package tp1;

public class Estudiante {
	private String nombre;
	private String apellido;
	private String email;
	private String direccion;
	private int comision;

	public Estudiante(String nombre, String apellido, String email, String direccion, int comision) {
		this.nombre = nombre;
		this.apellido = apellido;
		this.email = email;
		this.direccion = direccion;
		this.comision = comision;
	}

	public Estudiante() {

	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public int getComision() {
		return comision;
	}

	public void setComision(int comision) {
		this.comision = comision;
	}

	public String tusDatos() {
		return getApellido() + " " + getNombre() + " " + getComision() + " " + getDireccion() + " " + getEmail();
	}

	public boolean equals(Estudiante estudiante) {
		boolean resultado = false;

		if (estudiante != null) {
			boolean nombre = estudiante.getNombre().equals(this.nombre);
			boolean apellido = estudiante.getApellido().equals(this.apellido);
			boolean direccion = estudiante.getDireccion().equals(this.direccion);
			boolean email = estudiante.getEmail().equals(this.email);
			boolean comision = estudiante.getComision() == this.comision;
			
			return nombre && apellido && direccion && email && comision;
		}
		return resultado;
	}

}
