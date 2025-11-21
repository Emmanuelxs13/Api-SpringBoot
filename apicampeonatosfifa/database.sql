-- =======================================================================
-- BASE DE DATOS: CAMPEONATOS FIFA
-- Autores: Juan Esteban Correa & Emmanuel Berrio
-- =======================================================================

-- =======================================================================
-- PASO 1: CREAR TABLAS
-- =======================================================================

-- CREAR TABLA pais
CREATE TABLE pais (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    entidad VARCHAR(50) NOT NULL
);

-- CREAR TABLA campeonato
CREATE TABLE campeonato (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    anio INTEGER NOT NULL,
    pais_anfitrion_id INTEGER REFERENCES pais(id)
);

-- CREAR TABLA grupo
CREATE TABLE grupo (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200),
    campeonato_id INTEGER NOT NULL REFERENCES campeonato(id)
);

-- CREAR TABLA grupopais (relación many-to-many grupo-selección)
CREATE TABLE grupopais (
    grupo_id INTEGER NOT NULL REFERENCES grupo(id),
    seleccion_id INTEGER NOT NULL REFERENCES pais(id),
    posicion INTEGER,
    puntos INTEGER,
    PRIMARY KEY (grupo_id, seleccion_id)
);

-- =======================================================================
-- PASO 2: INSERTAR PAÍSES/SELECCIONES
-- =======================================================================

INSERT INTO pais (nombre, entidad) VALUES 
-- CONMEBOL (Sudamérica)
('Brasil', 'CONMEBOL'),
('Argentina', 'CONMEBOL'),
('Uruguay', 'CONMEBOL'),
('Colombia', 'CONMEBOL'),
('Chile', 'CONMEBOL'),
('Paraguay', 'CONMEBOL'),
('Bolivia', 'CONMEBOL'),
('Perú', 'CONMEBOL'),
('Ecuador', 'CONMEBOL'),
('Venezuela', 'CONMEBOL'),

-- UEFA (Europa)
('Francia', 'UEFA'),
('España', 'UEFA'),
('Alemania', 'UEFA'),
('Inglaterra', 'UEFA'),
('Portugal', 'UEFA'),
('Países Bajos', 'UEFA'),
('Bélgica', 'UEFA'),
('Croacia', 'UEFA'),
('Italia', 'UEFA'),
('Polonia', 'UEFA'),
('Dinamarca', 'UEFA'),
('Suiza', 'UEFA'),
('Austria', 'UEFA'),
('Serbia', 'UEFA'),

-- AFC (Asia)
('Japón', 'AFC'),
('Australia', 'AFC'),
('Corea del Sur', 'AFC'),
('Irán', 'AFC'),
('Arabia Saudí', 'AFC'),
('Qatar', 'AFC'),

-- CAF (África)
('Marruecos', 'CAF'),
('Senegal', 'CAF'),
('Túnez', 'CAF'),
('Ghana', 'CAF'),
('Camerún', 'CAF'),

-- CONCACAF (Norte y Centro América)
('Estados Unidos', 'CONCACAF'),
('México', 'CONCACAF'),
('Canadá', 'CONCACAF'),
('Costa Rica', 'CONCACAF');

-- =======================================================================
-- PASO 3: INSERTAR CAMPEONATOS
-- =======================================================================

INSERT INTO campeonato (nombre, anio, pais_anfitrion_id) VALUES 
('Copa Mundial FIFA 2018', 2018, (SELECT id FROM pais WHERE nombre = 'Brasil')),
('Copa Mundial FIFA 2022', 2022, (SELECT id FROM pais WHERE nombre = 'Qatar')),
('Copa Mundial FIFA 2026', 2026, (SELECT id FROM pais WHERE nombre = 'Estados Unidos')),
('Copa América 2021', 2021, (SELECT id FROM pais WHERE nombre = 'Brasil')),
('Eurocopa 2024', 2024, (SELECT id FROM pais WHERE nombre = 'Alemania'));

-- =======================================================================
-- PASO 4: INSERTAR GRUPOS PARA EL MUNDIAL 2022
-- =======================================================================

-- Obtener el ID del Mundial 2022
DO $$
DECLARE
    mundial_2022_id INTEGER;
BEGIN
    SELECT id INTO mundial_2022_id FROM campeonato WHERE nombre = 'Copa Mundial FIFA 2022';
    
    -- Insertar grupos
    INSERT INTO grupo (nombre, descripcion, campeonato_id) VALUES 
    ('Grupo A', 'Primer grupo del Mundial 2022 - Qatar', mundial_2022_id),
    ('Grupo B', 'Segundo grupo del Mundial 2022', mundial_2022_id),
    ('Grupo C', 'Tercer grupo del Mundial 2022', mundial_2022_id),
    ('Grupo D', 'Cuarto grupo del Mundial 2022', mundial_2022_id),
    ('Grupo E', 'Quinto grupo del Mundial 2022', mundial_2022_id),
    ('Grupo F', 'Sexto grupo del Mundial 2022', mundial_2022_id),
    ('Grupo G', 'Séptimo grupo del Mundial 2022', mundial_2022_id),
    ('Grupo H', 'Octavo grupo del Mundial 2022', mundial_2022_id);
END $$;

-- =======================================================================
-- PASO 5: ASIGNAR SELECCIONES A GRUPOS (GRUPOS DEL MUNDIAL 2022 REAL)
-- =======================================================================

-- GRUPO A: Qatar, Ecuador, Senegal, Países Bajos
INSERT INTO grupopais (grupo_id, seleccion_id, posicion, puntos) VALUES 
((SELECT id FROM grupo WHERE nombre = 'Grupo A'), (SELECT id FROM pais WHERE nombre = 'Países Bajos'), 1, 7),
((SELECT id FROM grupo WHERE nombre = 'Grupo A'), (SELECT id FROM pais WHERE nombre = 'Senegal'), 2, 6),
((SELECT id FROM grupo WHERE nombre = 'Grupo A'), (SELECT id FROM pais WHERE nombre = 'Ecuador'), 3, 4),
((SELECT id FROM grupo WHERE nombre = 'Grupo A'), (SELECT id FROM pais WHERE nombre = 'Qatar'), 4, 0);

-- GRUPO B: Inglaterra, Irán, Estados Unidos, Gales
INSERT INTO grupopais (grupo_id, seleccion_id, posicion, puntos) VALUES 
((SELECT id FROM grupo WHERE nombre = 'Grupo B'), (SELECT id FROM pais WHERE nombre = 'Inglaterra'), 1, 7),
((SELECT id FROM grupo WHERE nombre = 'Grupo B'), (SELECT id FROM pais WHERE nombre = 'Estados Unidos'), 2, 5),
((SELECT id FROM grupo WHERE nombre = 'Grupo B'), (SELECT id FROM pais WHERE nombre = 'Irán'), 3, 3),
((SELECT id FROM grupo WHERE nombre = 'Grupo B'), (SELECT id FROM pais WHERE nombre = 'Japón'), 4, 1); -- Usando Japón como sustituto

-- GRUPO C: Argentina, Arabia Saudí, México, Polonia  
INSERT INTO grupopais (grupo_id, seleccion_id, posicion, puntos) VALUES 
((SELECT id FROM grupo WHERE nombre = 'Grupo C'), (SELECT id FROM pais WHERE nombre = 'Argentina'), 1, 6),
((SELECT id FROM grupo WHERE nombre = 'Grupo C'), (SELECT id FROM pais WHERE nombre = 'Polonia'), 2, 4),
((SELECT id FROM grupo WHERE nombre = 'Grupo C'), (SELECT id FROM pais WHERE nombre = 'México'), 3, 4),
((SELECT id FROM grupo WHERE nombre = 'Grupo C'), (SELECT id FROM pais WHERE nombre = 'Arabia Saudí'), 4, 3);

-- GRUPO D: Francia, Australia, Dinamarca, Túnez
INSERT INTO grupopais (grupo_id, seleccion_id, posicion, puntos) VALUES 
((SELECT id FROM grupo WHERE nombre = 'Grupo D'), (SELECT id FROM pais WHERE nombre = 'Francia'), 1, 6),
((SELECT id FROM grupo WHERE nombre = 'Grupo D'), (SELECT id FROM pais WHERE nombre = 'Australia'), 2, 6),
((SELECT id FROM grupo WHERE nombre = 'Grupo D'), (SELECT id FROM pais WHERE nombre = 'Túnez'), 3, 4),
((SELECT id FROM grupo WHERE nombre = 'Grupo D'), (SELECT id FROM pais WHERE nombre = 'Dinamarca'), 4, 1);

-- GRUPO E: España, Costa Rica, Alemania, Japón
INSERT INTO grupopais (grupo_id, seleccion_id, posicion, puntos) VALUES 
((SELECT id FROM grupo WHERE nombre = 'Grupo E'), (SELECT id FROM pais WHERE nombre = 'Japón'), 1, 6),
((SELECT id FROM grupo WHERE nombre = 'Grupo E'), (SELECT id FROM pais WHERE nombre = 'España'), 2, 4),
((SELECT id FROM grupo WHERE nombre = 'Grupo E'), (SELECT id FROM pais WHERE nombre = 'Alemania'), 3, 4),
((SELECT id FROM grupo WHERE nombre = 'Grupo E'), (SELECT id FROM pais WHERE nombre = 'Costa Rica'), 4, 3);

-- GRUPO F: Bélgica, Canadá, Marruecos, Croacia
INSERT INTO grupopais (grupo_id, seleccion_id, posicion, puntos) VALUES 
((SELECT id FROM grupo WHERE nombre = 'Grupo F'), (SELECT id FROM pais WHERE nombre = 'Marruecos'), 1, 7),
((SELECT id FROM grupo WHERE nombre = 'Grupo F'), (SELECT id FROM pais WHERE nombre = 'Croacia'), 2, 5),
((SELECT id FROM grupo WHERE nombre = 'Grupo F'), (SELECT id FROM pais WHERE nombre = 'Bélgica'), 3, 4),
((SELECT id FROM grupo WHERE nombre = 'Grupo F'), (SELECT id FROM pais WHERE nombre = 'Canadá'), 4, 1);

-- GRUPO G: Brasil, Serbia, Suiza, Camerún  
INSERT INTO grupopais (grupo_id, seleccion_id, posicion, puntos) VALUES 
((SELECT id FROM grupo WHERE nombre = 'Grupo G'), (SELECT id FROM pais WHERE nombre = 'Brasil'), 1, 6),
((SELECT id FROM grupo WHERE nombre = 'Grupo G'), (SELECT id FROM pais WHERE nombre = 'Suiza'), 2, 6),
((SELECT id FROM grupo WHERE nombre = 'Grupo G'), (SELECT id FROM pais WHERE nombre = 'Camerún'), 3, 4),
((SELECT id FROM grupo WHERE nombre = 'Grupo G'), (SELECT id FROM pais WHERE nombre = 'Serbia'), 4, 1);

-- GRUPO H: Portugal, Ghana, Uruguay, Corea del Sur
INSERT INTO grupopais (grupo_id, seleccion_id, posicion, puntos) VALUES 
((SELECT id FROM grupo WHERE nombre = 'Grupo H'), (SELECT id FROM pais WHERE nombre = 'Portugal'), 1, 6),
((SELECT id FROM grupo WHERE nombre = 'Grupo H'), (SELECT id FROM pais WHERE nombre = 'Corea del Sur'), 2, 4),
((SELECT id FROM grupo WHERE nombre = 'Grupo H'), (SELECT id FROM pais WHERE nombre = 'Uruguay'), 3, 4),
((SELECT id FROM grupo WHERE nombre = 'Grupo H'), (SELECT id FROM pais WHERE nombre = 'Ghana'), 4, 3);

-- =======================================================================
-- PASO 6: CREAR FUNCIÓN fTablaPosicionesGrupo
-- =======================================================================

CREATE OR REPLACE FUNCTION fTablaPosicionesGrupo(idgrupotabla INTEGER)
RETURNS TABLE (
    id BIGINT,
    pais VARCHAR(100),
    pJ INTEGER,
    pG INTEGER,
    pE INTEGER,
    pP INTEGER,
    gF INTEGER,
    gC INTEGER,
    puntos INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT 
        gp.seleccion_id::BIGINT as id,
        p.nombre::VARCHAR(100) as pais,
        3 as pJ,  -- Partidos jugados (3 en fase de grupos)
        -- Calcular partidos ganados basado en puntos (3 puntos = 1 victoria)
        CASE 
            WHEN gp.puntos >= 7 THEN 2  -- 2 victorias + 1 empate = 7 puntos
            WHEN gp.puntos >= 6 THEN 2  -- 2 victorias = 6 puntos
            WHEN gp.puntos >= 4 THEN 1  -- 1 victoria + 1 empate = 4 puntos
            WHEN gp.puntos >= 3 THEN 1  -- 1 victoria = 3 puntos
            ELSE 0
        END as pG,
        -- Calcular empates
        CASE 
            WHEN gp.puntos = 7 THEN 1   -- 2 victorias + 1 empate
            WHEN gp.puntos = 5 THEN 2   -- 1 victoria + 2 empates
            WHEN gp.puntos = 4 THEN 1   -- 1 victoria + 1 empate + 1 derrota
            WHEN gp.puntos = 2 THEN 2   -- 2 empates + 1 derrota
            WHEN gp.puntos = 1 THEN 1   -- 1 empate + 2 derrotas
            ELSE 0
        END as pE,
        -- Calcular derrotas
        CASE 
            WHEN gp.puntos = 0 THEN 3   -- 3 derrotas
            WHEN gp.puntos = 1 THEN 2   -- 1 empate + 2 derrotas
            WHEN gp.puntos = 2 THEN 1   -- 2 empates + 1 derrota
            WHEN gp.puntos = 3 THEN 2   -- 1 victoria + 2 derrotas
            WHEN gp.puntos = 4 THEN 1   -- 1 victoria + 1 empate + 1 derrota
            WHEN gp.puntos = 5 THEN 0   -- 1 victoria + 2 empates
            WHEN gp.puntos = 6 THEN 1   -- 2 victorias + 1 derrota
            WHEN gp.puntos = 7 THEN 0   -- 2 victorias + 1 empate
            ELSE 1
        END as pP,
        -- Goles a favor (estimación basada en rendimiento)
        CASE 
            WHEN gp.puntos >= 7 THEN 6  -- Muy buen rendimiento
            WHEN gp.puntos >= 6 THEN 5  -- Buen rendimiento
            WHEN gp.puntos >= 4 THEN 3  -- Rendimiento regular
            WHEN gp.puntos >= 3 THEN 2  -- Rendimiento bajo
            ELSE 1                      -- Mal rendimiento
        END as gF,
        -- Goles en contra (inversamente relacionado al rendimiento)
        CASE 
            WHEN gp.puntos >= 7 THEN 1  -- Muy buena defensa
            WHEN gp.puntos >= 6 THEN 2  -- Buena defensa
            WHEN gp.puntos >= 4 THEN 3  -- Defensa regular
            WHEN gp.puntos >= 3 THEN 4  -- Defensa débil
            ELSE 5                      -- Defensa muy débil
        END as gC,
        COALESCE(gp.puntos, 0) as puntos
    FROM grupopais gp
    JOIN pais p ON gp.seleccion_id = p.id
    WHERE gp.grupo_id = idgrupotabla
    ORDER BY puntos DESC, (
        CASE 
            WHEN gp.puntos >= 7 THEN 6
            WHEN gp.puntos >= 6 THEN 5
            WHEN gp.puntos >= 4 THEN 3
            WHEN gp.puntos >= 3 THEN 2
            ELSE 1
        END - 
        CASE 
            WHEN gp.puntos >= 7 THEN 1
            WHEN gp.puntos >= 6 THEN 2
            WHEN gp.puntos >= 4 THEN 3
            WHEN gp.puntos >= 3 THEN 4
            ELSE 5
        END
    ) DESC;
END;
$$;

-- =======================================================================
-- PASO 7: VERIFICAR LA INSTALACIÓN
-- =======================================================================

-- Verificar datos insertados
SELECT 'PAÍSES INSERTADOS:' as info, COUNT(*) as total FROM pais;
SELECT 'CAMPEONATOS INSERTADOS:' as info, COUNT(*) as total FROM campeonato;
SELECT 'GRUPOS INSERTADOS:' as info, COUNT(*) as total FROM grupo;
SELECT 'RELACIONES GRUPO-PAÍS:' as info, COUNT(*) as total FROM grupopais;

-- Probar la función con el Grupo A (ID = 1)
SELECT 'TABLA DE POSICIONES GRUPO A:' as info;
SELECT * FROM fTablaPosicionesGrupo(1);

-- =======================================================================
-- MENSAJE FINAL
-- =======================================================================

DO $$
BEGIN
    RAISE NOTICE '';
    RAISE NOTICE '🎉 ===============================================';
    RAISE NOTICE '✅ BASE DE DATOS POBLADA CORRECTAMENTE';
    RAISE NOTICE '🎉 ===============================================';
    RAISE NOTICE '';
    RAISE NOTICE '📊 DATOS INSERTADOS:';
    RAISE NOTICE '   - Países/Selecciones: % registros', (SELECT COUNT(*) FROM pais);
    RAISE NOTICE '   - Campeonatos: % registros', (SELECT COUNT(*) FROM campeonato);
    RAISE NOTICE '   - Grupos: % registros', (SELECT COUNT(*) FROM grupo);
    RAISE NOTICE '   - Relaciones Grupo-País: % registros', (SELECT COUNT(*) FROM grupopais);
    RAISE NOTICE '';
    RAISE NOTICE '🚀 ENDPOINTS PARA PROBAR:';
    RAISE NOTICE '   GET http://localhost:8080/campeonatos/listar';
    RAISE NOTICE '   GET http://localhost:8080/campeonatos/2/grupos';
    RAISE NOTICE '   GET http://localhost:8080/grupos/1/posiciones';
    RAISE NOTICE '';
    RAISE NOTICE '⚡ INICIA LA API CON: .\mvnw.cmd spring-boot:run';
    RAISE NOTICE '';
END $$;
