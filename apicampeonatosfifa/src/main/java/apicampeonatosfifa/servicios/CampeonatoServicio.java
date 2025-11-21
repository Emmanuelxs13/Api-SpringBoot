package apicampeonatosfifa.servicios;

import apicampeonatosfifa.entidades.Campeonato;
import apicampeonatosfifa.entidades.Grupo;
import apicampeonatosfifa.interfaces.ICampeonatoServicio;
import apicampeonatosfifa.repositorios.CampeonatoRepositorio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Servicio que implementa la lógica de negocio para Campeonatos.
 */
@Service
public class CampeonatoServicio implements ICampeonatoServicio {

    @Autowired
    private CampeonatoRepositorio campeonatoRepositorio;

    /**
     * Lista todos los campeonatos disponibles.
     * @return Lista de campeonatos
     */
    @Override
    public List<Campeonato> listar() {
        return campeonatoRepositorio.findAll();
    }

    /**
     * Lista todos los grupos de un campeonato específico.
     * @param id ID del campeonato
     * @return Lista de grupos del campeonato
     */
    @Override
    public List<Grupo> listarGrupos(long id) {
        Campeonato campeonato = campeonatoRepositorio.findById(id)
                .orElseThrow(() -> new RuntimeException("Campeonato no encontrado con ID: " + id));
        return campeonato.getGrupos();
    }
}
