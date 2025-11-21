package apicampeonatosfifa.entidades;

import jakarta.persistence.*;

/**
 * Entidad que representa la relación entre Grupo y Selección.
 * Mapeada a la tabla 'grupopais' en la base de datos.
 */
@Entity
@Table(name = "grupopais")
@IdClass(GrupoSeleccionId.class)
public class GrupoSeleccion {

    @Id
    @ManyToOne
    @JoinColumn(name = "grupo_id", nullable = false)
    private Grupo grupo;

    @Id
    @ManyToOne
    @JoinColumn(name = "seleccion_id", nullable = false)
    private Seleccion seleccion;

    @Column(name = "posicion")
    private Integer posicion;

    @Column(name = "puntos")
    private Integer puntos;

    // Constructores
    public GrupoSeleccion() {
    }

    public GrupoSeleccion(Grupo grupo, Seleccion seleccion, Integer posicion, Integer puntos) {
        this.grupo = grupo;
        this.seleccion = seleccion;
        this.posicion = posicion;
        this.puntos = puntos;
    }

    // Getters y Setters
    public Grupo getGrupo() {
        return grupo;
    }

    public void setGrupo(Grupo grupo) {
        this.grupo = grupo;
    }

    public Seleccion getSeleccion() {
        return seleccion;
    }

    public void setSeleccion(Seleccion seleccion) {
        this.seleccion = seleccion;
    }

    public Integer getPosicion() {
        return posicion;
    }

    public void setPosicion(Integer posicion) {
        this.posicion = posicion;
    }

    public Integer getPuntos() {
        return puntos;
    }

    public void setPuntos(Integer puntos) {
        this.puntos = puntos;
    }
}
