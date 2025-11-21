package apicampeonatosfifa.interfaces;

import apicampeonatosfifa.entidades.Campeonato;
import apicampeonatosfifa.entidades.Grupo;
import java.util.List;

/**
 * Interfaz de servicio para operaciones relacionadas con Campeonatos.
 */
public interface ICampeonatoServicio {

    /**
     * Lista todos los campeonatos disponibles.
     * @return Lista de campeonatos
     */
    List<Campeonato> listar();

    /**
     * Lista todos los grupos de un campeonato específico.
     * @param id ID del campeonato
     * @return Lista de grupos del campeonato
     */
    List<Grupo> listarGrupos(long id);
}
