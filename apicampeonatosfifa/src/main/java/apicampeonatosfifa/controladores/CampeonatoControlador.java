package apicampeonatosfifa.controladores;

import apicampeonatosfifa.entidades.Campeonato;
import apicampeonatosfifa.entidades.Grupo;
import apicampeonatosfifa.interfaces.ICampeonatoServicio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Controlador REST para operaciones relacionadas con Campeonatos.
 */
@RestController
@RequestMapping("/campeonatos")
@CrossOrigin(origins = "*")
public class CampeonatoControlador {

    @Autowired
    private ICampeonatoServicio campeonatoServicio;

    /**
     * Endpoint para listar todos los campeonatos.
     * GET /campeonatos/listar
     * @return Lista de campeonatos
     */
    @GetMapping("/listar")
    public ResponseEntity<List<Campeonato>> listar() {
        List<Campeonato> campeonatos = campeonatoServicio.listar();
        return ResponseEntity.ok(campeonatos);
    }

    /**
     * Endpoint para listar los grupos de un campeonato específico.
     * GET /campeonatos/{id}/grupos
     * @param id ID del campeonato
     * @return Lista de grupos del campeonato
     */
    @GetMapping("/{id}/grupos")
    public ResponseEntity<List<Grupo>> listarGrupos(@PathVariable long id) {
        List<Grupo> grupos = campeonatoServicio.listarGrupos(id);
        return ResponseEntity.ok(grupos);
    }
}
