package apicampeonatosfifa.repositorios;

import apicampeonatosfifa.entidades.Campeonato;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Repositorio para la entidad Campeonato.
 * Proporciona operaciones CRUD básicas.
 */
@Repository
public interface CampeonatoRepositorio extends JpaRepository<Campeonato, Long> {
}
