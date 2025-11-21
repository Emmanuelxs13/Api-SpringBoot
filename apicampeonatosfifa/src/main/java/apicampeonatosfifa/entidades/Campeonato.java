package apicampeonatosfifa.entidades;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import java.util.List;

/**
 * Entidad que representa un campeonato de fútbol.
 */
@Entity
@Table(name = "campeonato")
public class Campeonato {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 150)
    private String nombre;

    @Column(nullable = false)
    private Integer anio;

    @ManyToOne
    @JoinColumn(name = "pais_anfitrion_id")
    private Seleccion paisAnfitrion;

    @OneToMany(mappedBy = "campeonato")
    @JsonIgnore
    private List<Grupo> grupos;

    // Constructores
    public Campeonato() {
    }

    public Campeonato(String nombre, Integer anio, Seleccion paisAnfitrion) {
        this.nombre = nombre;
        this.anio = anio;
        this.paisAnfitrion = paisAnfitrion;
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

    public Integer getAnio() {
        return anio;
    }

    public void setAnio(Integer anio) {
        this.anio = anio;
    }

    public Seleccion getPaisAnfitrion() {
        return paisAnfitrion;
    }

    public void setPaisAnfitrion(Seleccion paisAnfitrion) {
        this.paisAnfitrion = paisAnfitrion;
    }

    public List<Grupo> getGrupos() {
        return grupos;
    }

    public void setGrupos(List<Grupo> grupos) {
        this.grupos = grupos;
    }
}
