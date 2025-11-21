package apicampeonatosfifa.entidades;

import jakarta.persistence.*;
import java.util.List;

/**
 * Entidad que representa una selección nacional de fútbol.
 * Mapeada a la tabla 'pais' en la base de datos.
 */
@Entity
@Table(name = "pais")
public class Seleccion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true, length = 100)
    private String nombre;

    @Column(nullable = false, length = 50)
    private String entidad;

    @OneToMany(mappedBy = "seleccion")
    private List<GrupoSeleccion> grupoSelecciones;

    // Constructores
    public Seleccion() {
    }

    public Seleccion(String nombre, String entidad) {
        this.nombre = nombre;
        this.entidad = entidad;
    }

    // Getters y Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEntidad() {
        return entidad;
    }

    public void setEntidad(String entidad) {
        this.entidad = entidad;
    }

    public List<GrupoSeleccion> getGrupoSelecciones() {
        return grupoSelecciones;
    }

    public void setGrupoSelecciones(List<GrupoSeleccion> grupoSelecciones) {
        this.grupoSelecciones = grupoSelecciones;
    }
}
