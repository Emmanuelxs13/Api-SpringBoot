package apicampeonatosfifa.entidades;

import java.io.Serializable;
import java.util.Objects;

/**
 * Clase que representa la clave primaria compuesta para GrupoSeleccion.
 */
public class GrupoSeleccionId implements Serializable {

    private Long grupo;
    private Long seleccion;

    // Constructores
    public GrupoSeleccionId() {
    }

    public GrupoSeleccionId(Long grupo, Long seleccion) {
        this.grupo = grupo;
        this.seleccion = seleccion;
    }

    // Getters y Setters
    public Long getGrupo() {
        return grupo;
    }

    public void setGrupo(Long grupo) {
        this.grupo = grupo;
    }

    public Long getSeleccion() {
        return seleccion;
    }

    public void setSeleccion(Long seleccion) {
        this.seleccion = seleccion;
    }

    // equals y hashCode
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        GrupoSeleccionId that = (GrupoSeleccionId) o;
        return Objects.equals(grupo, that.grupo) && Objects.equals(seleccion, that.seleccion);
    }

    @Override
    public int hashCode() {
        return Objects.hash(grupo, seleccion);
    }
}
