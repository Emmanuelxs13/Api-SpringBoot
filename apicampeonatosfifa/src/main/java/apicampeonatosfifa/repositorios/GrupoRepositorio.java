package apicampeonatosfifa.repositorios;

import apicampeonatosfifa.entidades.Grupo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Repositorio para la entidad Grupo.
 * Proporciona operaciones CRUD básicas.
 */
@Repository
public interface GrupoRepositorio extends JpaRepository<Grupo, Long> {
}
