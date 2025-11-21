package apicampeonatosfifa.interfaces;

import apicampeonatosfifa.entidades.TablaPosicion;
import java.util.List;

/**
 * Interfaz de servicio para operaciones relacionadas con Grupos.
 */
public interface IGrupoServicio {

    /**
     * Obtiene la tabla de posiciones de un grupo específico.
     * @param idGrupo ID del grupo
     * @return Lista con las posiciones del grupo
     */
    List<TablaPosicion> obtenerPosiciones(int idGrupo);
}
