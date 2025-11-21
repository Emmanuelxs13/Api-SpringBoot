package apicampeonatosfifa.repositorios;

import apicampeonatosfifa.entidades.Seleccion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Repositorio para la entidad Seleccion.
 * Proporciona operaciones CRUD básicas.
 */
@Repository
public interface SeleccionRepositorio extends JpaRepository<Seleccion, Long> {
}
