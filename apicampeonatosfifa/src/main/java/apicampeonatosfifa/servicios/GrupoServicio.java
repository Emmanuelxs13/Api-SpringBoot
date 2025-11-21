package apicampeonatosfifa.servicios;

import apicampeonatosfifa.entidades.TablaPosicion;
import apicampeonatosfifa.interfaces.IGrupoServicio;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import org.springframework.stereotype.Service;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

/**
 * Servicio que implementa la lógica de negocio para Grupos.
 */
@Service
public class GrupoServicio implements IGrupoServicio {

    @PersistenceContext
    private EntityManager entityManager;

    /**
     * Obtiene la tabla de posiciones de un grupo específico.
     * Ejecuta la función SQL nativa fTablaPosicionesGrupo.
     * @param idGrupo ID del grupo
     * @return Lista con las posiciones del grupo
     */
    @Override
    public List<TablaPosicion> obtenerPosiciones(int idGrupo) {
        // Ejecutar la consulta nativa que llama a la función SQL
        String sql = "SELECT * FROM fTablaPosicionesGrupo(:idgrupotabla)";
        Query query = entityManager.createNativeQuery(sql);
        query.setParameter("idgrupotabla", idGrupo);

        List<Object[]> resultados = query.getResultList();
        List<TablaPosicion> posiciones = new ArrayList<>();

        // Mapear los resultados a objetos TablaPosicion
        for (Object[] fila : resultados) {
            TablaPosicion posicion = new TablaPosicion();
            
            // Convertir BigInteger a Long si es necesario
            if (fila[0] instanceof BigInteger) {
                posicion.setId(((BigInteger) fila[0]).longValue());
            } else {
                posicion.setId(((Number) fila[0]).longValue());
            }
            
            posicion.setPais((String) fila[1]);
            posicion.setpJ((Integer) fila[2]);
            posicion.setpG((Integer) fila[3]);
            posicion.setpE((Integer) fila[4]);
            posicion.setpP((Integer) fila[5]);
            posicion.setgF((Integer) fila[6]);
            posicion.setgC((Integer) fila[7]);
            posicion.setPuntos((Integer) fila[8]);
            
            posiciones.add(posicion);
        }

        return posiciones;
    }
}
