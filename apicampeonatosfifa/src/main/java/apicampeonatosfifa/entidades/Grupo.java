package apicampeonatosfifa.entidades;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import java.util.List;

/**
 * Entidad que representa un grupo dentro de un campeonato.
 */
@Entity
@Table(name = "grupo")
public class Grupo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 50)
    private String nombre;

    @Column(length = 200)
    private String descripcion;

    @ManyToOne
    @JoinColumn(name = "campeonato_id", nullable = false)
    @JsonIgnore
    private Campeonato campeonato;

    @OneToMany(mappedBy = "grupo")
    @JsonIgnore
    private List<GrupoSeleccion> grupoSelecciones;

    // Constructores
    public Grupo() {
    }

    public Grupo(String nombre, String descripcion, Campeonato campeonato) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.campeonato = campeonato;
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

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Campeonato getCampeonato() {
        return campeonato;
    }

    public void setCampeonato(Campeonato campeonato) {
        this.campeonato = campeonato;
    }

    public List<GrupoSeleccion> getGrupoSelecciones() {
        return grupoSelecciones;
    }

    public void setGrupoSelecciones(List<GrupoSeleccion> grupoSelecciones) {
        this.grupoSelecciones = grupoSelecciones;
    }
}
