package apicampeonatosfifa.controladores;

import apicampeonatosfifa.entidades.TablaPosicion;
import apicampeonatosfifa.interfaces.IGrupoServicio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Controlador REST para operaciones relacionadas con Grupos.
 */
@RestController
@RequestMapping("/grupos")
@CrossOrigin(origins = "*")
public class GrupoControlador {

    @Autowired
    private IGrupoServicio grupoServicio;

    /**
     * Endpoint para obtener la tabla de posiciones de un grupo.
     * GET /grupos/{id}/posiciones
     * @param id ID del grupo
     * @return Tabla de posiciones del grupo
     */
    @GetMapping("/{id}/posiciones")
    public ResponseEntity<List<TablaPosicion>> obtenerPosiciones(@PathVariable int id) {
        List<TablaPosicion> posiciones = grupoServicio.obtenerPosiciones(id);
        return ResponseEntity.ok(posiciones);
    }
}
