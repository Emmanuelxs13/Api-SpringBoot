# 🧪 Guía Completa de Pruebas en Postman

Esta guía detalla paso a paso cómo probar todos los endpoints de la API Campeonatos FIFA usando Postman.

## 📋 Tabla de Contenidos

- [Instalación de Postman](#instalación-de-postman)
- [Configuración Inicial](#configuración-inicial)
- [Configuración de Variables de Entorno](#configuración-de-variables-de-entorno)
- [Creación de la Colección](#creación-de-la-colección)
- [Pruebas Detalladas por Endpoint](#pruebas-detalladas-por-endpoint)
- [Importar Colección JSON](#importar-colección-json)
- [Casos de Prueba y Validaciones](#casos-de-prueba-y-validaciones)
- [Solución de Problemas](#solución-de-problemas)

---

## 📥 Instalación de Postman

### Opción 1: Descargar e Instalar (Recomendado)

1. Ve a [https://www.postman.com/downloads/](https://www.postman.com/downloads/)
2. Descarga la versión para tu sistema operativo (Windows, Mac, Linux)
3. Instala siguiendo el asistente de instalación
4. Crea una cuenta gratuita o inicia sesión

### Opción 2: Usar Postman Web

1. Ve a [https://web.postman.co/](https://web.postman.co/)
2. Inicia sesión con tu cuenta
3. Usa la versión web (requiere conexión a internet)

---

## ⚙️ Configuración Inicial

### Paso 1: Verificar que la API está corriendo

Antes de empezar con Postman, asegúrate de que:

1. ✅ PostgreSQL está corriendo
2. ✅ La base de datos `campeonatosfifa` está creada y poblada
3. ✅ La aplicación Spring Boot está ejecutándose

```powershell
# Ejecuta esto en la terminal:
cd "d:\Tec. Desarrollo de Software\3° Semestre\Api-SpringBoot\apicampeonatosfifa"
.\mvnw.cmd spring-boot:run
```

Verás en la consola:

```
Started ApicampeonatosfifaApplication in X seconds
```

### Paso 2: Verificar conectividad

Abre tu navegador y visita:

```
http://localhost:8080/campeonatos/listar
```

Si ves datos JSON, ¡todo está funcionando! 🎉

---

## 🌍 Configuración de Variables de Entorno

Las variables de entorno te permiten cambiar la URL base fácilmente (útil para diferentes ambientes: desarrollo, producción, etc.).

### Crear un Entorno

1. **En Postman**, haz clic en el icono de ⚙️ (Settings) en la esquina superior derecha
2. Selecciona **"Environments"** en el menú lateral
3. Clic en **"Create Environment"** o el botón **"+"**
4. Nombra el entorno: `Campeonatos FIFA - Local`

### Agregar Variables

Agrega las siguientes variables:

| Variable        | Valor Inicial           | Valor Actual            |
| --------------- | ----------------------- | ----------------------- |
| `base_url`      | `http://localhost:8080` | `http://localhost:8080` |
| `campeonato_id` | `2`                     | `2`                     |
| `grupo_id`      | `1`                     | `1`                     |

5. Haz clic en **"Save"** o **"Create"**
6. En la esquina superior derecha, selecciona el entorno que acabas de crear

### ¿Cómo usar las variables?

En lugar de escribir `http://localhost:8080/campeonatos/listar`, usarás:

```
{{base_url}}/campeonatos/listar
```

Postman reemplazará automáticamente `{{base_url}}` con el valor de tu variable.

---

## 📦 Creación de la Colección

### Paso 1: Crear una Nueva Colección

1. En Postman, haz clic en **"Collections"** en el panel izquierdo
2. Clic en el botón **"+"** o **"Create Collection"**
3. Nombra la colección: `API Campeonatos FIFA`
4. (Opcional) Agrega una descripción:
   ```
   Colección de endpoints para la API de gestión de campeonatos FIFA.
   Desarrollado por: Juan Esteban Correa y Emmanuel Berrio
   ```

### Paso 2: Organizar por Carpetas

Dentro de la colección, crea 2 carpetas:

1. **Carpeta 1:** `Campeonatos`
2. **Carpeta 2:** `Grupos`

Para crear carpetas:

- Haz clic derecho en la colección → **"Add Folder"**
- Nombra la carpeta
- Clic en **"Create"**

---

## 🎯 Pruebas Detalladas por Endpoint

### 🏆 ENDPOINT 1: Listar Todos los Campeonatos

#### Información General

- **Método:** `GET`
- **URL:** `{{base_url}}/campeonatos/listar`
- **Descripción:** Obtiene la lista completa de todos los campeonatos registrados
- **Autenticación:** No requiere
- **Carpeta:** Campeonatos

#### Pasos para Crear el Request

1. **Haz clic derecho** en la carpeta "Campeonatos" → **"Add Request"**
2. **Nombre del request:** `Listar Todos los Campeonatos`
3. **Configuración:**
   - **Método:** Selecciona `GET` del dropdown
   - **URL:** `{{base_url}}/campeonatos/listar`
4. **Headers:** No necesitas agregar ninguno (dejar vacío)
5. **Body:** No aplica para GET
6. Haz clic en **"Save"**

#### Ejecutar la Prueba

1. Haz clic en el botón **"Send"**
2. Observa la respuesta en la sección inferior

#### Respuesta Esperada

**Status:** `200 OK`

**Body (JSON):**

```json
[
  {
    "id": 1,
    "nombre": "Copa Mundial FIFA 2018",
    "anio": 2018,
    "paisAnfitrion": {
      "id": 1,
      "nombre": "Brasil",
      "entidad": "CONMEBOL"
    }
  },
  {
    "id": 2,
    "nombre": "Copa Mundial FIFA 2022",
    "anio": 2022,
    "paisAnfitrion": {
      "id": 20,
      "nombre": "Qatar",
      "entidad": "AFC"
    }
  },
  {
    "id": 3,
    "nombre": "Copa Mundial FIFA 2026",
    "anio": 2026,
    "paisAnfitrion": {
      "id": 26,
      "nombre": "Estados Unidos",
      "entidad": "CONCACAF"
    }
  },
  {
    "id": 4,
    "nombre": "Copa América 2021",
    "anio": 2021,
    "paisAnfitrion": {
      "id": 1,
      "nombre": "Brasil",
      "entidad": "CONMEBOL"
    }
  },
  {
    "id": 5,
    "nombre": "Eurocopa 2024",
    "anio": 2024,
    "paisAnfitrion": {
      "id": 13,
      "nombre": "Alemania",
      "entidad": "UEFA"
    }
  }
]
```

#### Validaciones a Realizar

✅ **Status Code:** Debe ser `200`
✅ **Tipo de respuesta:** Debe ser un array `[]`
✅ **Cantidad de campeonatos:** Debe haber 5 campeonatos
✅ **Estructura:** Cada campeonato debe tener `id`, `nombre`, `anio`, `paisAnfitrion`
✅ **Tiempo de respuesta:** Debe ser menor a 1000ms

#### Tests Automatizados (Scripts de Postman)

En la pestaña **"Tests"** del request, agrega:

```javascript
// Validar que el status sea 200
pm.test("Status code is 200", function () {
  pm.response.to.have.status(200);
});

// Validar que la respuesta sea un array
pm.test("Response is an array", function () {
  var jsonData = pm.response.json();
  pm.expect(jsonData).to.be.an("array");
});

// Validar que haya al menos 1 campeonato
pm.test("At least one championship exists", function () {
  var jsonData = pm.response.json();
  pm.expect(jsonData.length).to.be.above(0);
});

// Validar estructura del primer campeonato
pm.test("Championship has required fields", function () {
  var jsonData = pm.response.json();
  pm.expect(jsonData[0]).to.have.property("id");
  pm.expect(jsonData[0]).to.have.property("nombre");
  pm.expect(jsonData[0]).to.have.property("anio");
  pm.expect(jsonData[0]).to.have.property("paisAnfitrion");
});

// Validar tiempo de respuesta
pm.test("Response time is less than 1000ms", function () {
  pm.expect(pm.response.responseTime).to.be.below(1000);
});
```

---

### 🏆 ENDPOINT 2: Listar Grupos de un Campeonato

#### Información General

- **Método:** `GET`
- **URL:** `{{base_url}}/campeonatos/{{campeonato_id}}/grupos`
- **Descripción:** Obtiene todos los grupos de un campeonato específico
- **Parámetros de ruta:** `campeonato_id` (ID del campeonato)
- **Autenticación:** No requiere
- **Carpeta:** Campeonatos

#### Pasos para Crear el Request

1. **Haz clic derecho** en la carpeta "Campeonatos" → **"Add Request"**
2. **Nombre del request:** `Listar Grupos de un Campeonato`
3. **Configuración:**
   - **Método:** `GET`
   - **URL:** `{{base_url}}/campeonatos/{{campeonato_id}}/grupos`
   - Alternativamente puedes usar: `{{base_url}}/campeonatos/2/grupos`
4. **Headers:** No necesitas agregar ninguno
5. Haz clic en **"Save"**

#### Ejecutar la Prueba

**Caso 1: Mundial 2022 (ID = 2)**

1. Asegúrate de que la URL sea: `{{base_url}}/campeonatos/2/grupos`
2. Haz clic en **"Send"**

**Caso 2: Usando variable de entorno**

1. Si usas `{{campeonato_id}}`, ve a tus variables de entorno
2. Cambia el valor de `campeonato_id` según el campeonato que quieras consultar
3. Haz clic en **"Send"**

#### Respuesta Esperada (Mundial 2022)

**Status:** `200 OK`

**Body (JSON):**

```json
[
  {
    "id": 1,
    "nombre": "Grupo A",
    "descripcion": "Primer grupo del Mundial 2022 - Qatar",
    "campeonato": {
      "id": 2,
      "nombre": "Copa Mundial FIFA 2022",
      "anio": 2022
    }
  },
  {
    "id": 2,
    "nombre": "Grupo B",
    "descripcion": "Segundo grupo del Mundial 2022",
    "campeonato": {
      "id": 2,
      "nombre": "Copa Mundial FIFA 2022",
      "anio": 2022
    }
  },
  {
    "id": 3,
    "nombre": "Grupo C",
    "descripcion": "Tercer grupo del Mundial 2022",
    "campeonato": {
      "id": 2,
      "nombre": "Copa Mundial FIFA 2022",
      "anio": 2022
    }
  },
  {
    "id": 4,
    "nombre": "Grupo D",
    "descripcion": "Cuarto grupo del Mundial 2022",
    "campeonato": {
      "id": 2,
      "nombre": "Copa Mundial FIFA 2022",
      "anio": 2022
    }
  },
  {
    "id": 5,
    "nombre": "Grupo E",
    "descripcion": "Quinto grupo del Mundial 2022",
    "campeonato": {
      "id": 2,
      "nombre": "Copa Mundial FIFA 2022",
      "anio": 2022
    }
  },
  {
    "id": 6,
    "nombre": "Grupo F",
    "descripcion": "Sexto grupo del Mundial 2022",
    "campeonato": {
      "id": 2,
      "nombre": "Copa Mundial FIFA 2022",
      "anio": 2022
    }
  },
  {
    "id": 7,
    "nombre": "Grupo G",
    "descripcion": "Séptimo grupo del Mundial 2022",
    "campeonato": {
      "id": 2,
      "nombre": "Copa Mundial FIFA 2022",
      "anio": 2022
    }
  },
  {
    "id": 8,
    "nombre": "Grupo H",
    "descripcion": "Octavo grupo del Mundial 2022",
    "campeonato": {
      "id": 2,
      "nombre": "Copa Mundial FIFA 2022",
      "anio": 2022
    }
  }
]
```

#### Validaciones a Realizar

✅ **Status Code:** Debe ser `200`
✅ **Tipo de respuesta:** Debe ser un array
✅ **Cantidad de grupos:** Para el Mundial 2022 deben ser 8 grupos
✅ **Estructura:** Cada grupo debe tener `id`, `nombre`, `descripcion`, `campeonato`
✅ **Relación correcta:** El `campeonato.id` debe coincidir con el ID solicitado

#### Tests Automatizados

```javascript
// Validar status code
pm.test("Status code is 200", function () {
  pm.response.to.have.status(200);
});

// Validar que sea un array
pm.test("Response is an array", function () {
  var jsonData = pm.response.json();
  pm.expect(jsonData).to.be.an("array");
});

// Validar que haya grupos
pm.test("Groups exist for this championship", function () {
  var jsonData = pm.response.json();
  pm.expect(jsonData.length).to.be.above(0);
});

// Validar estructura de los grupos
pm.test("Group has required fields", function () {
  var jsonData = pm.response.json();
  pm.expect(jsonData[0]).to.have.property("id");
  pm.expect(jsonData[0]).to.have.property("nombre");
  pm.expect(jsonData[0]).to.have.property("campeonato");
});

// Validar que el campeonato coincida con el solicitado
pm.test("Championship ID matches request", function () {
  var jsonData = pm.response.json();
  var requestedId = pm.variables.get("campeonato_id") || 2;
  pm.expect(jsonData[0].campeonato.id).to.eql(parseInt(requestedId));
});
```

#### Casos de Prueba Adicionales

| Caso                             | URL                       | Resultado Esperado                        |
| -------------------------------- | ------------------------- | ----------------------------------------- |
| Campeonato válido (Mundial 2022) | `/campeonatos/2/grupos`   | 200 OK - 8 grupos                         |
| Campeonato sin grupos            | `/campeonatos/1/grupos`   | 200 OK - Array vacío `[]`                 |
| Campeonato inexistente           | `/campeonatos/999/grupos` | 200 OK - Array vacío `[]` o 404 Not Found |

---

### 👥 ENDPOINT 3: Obtener Tabla de Posiciones de un Grupo

#### Información General

- **Método:** `GET`
- **URL:** `{{base_url}}/grupos/{{grupo_id}}/posiciones`
- **Descripción:** Obtiene la tabla de posiciones calculada de un grupo específico
- **Parámetros de ruta:** `grupo_id` (ID del grupo)
- **Autenticación:** No requiere
- **Carpeta:** Grupos

#### Pasos para Crear el Request

1. **Haz clic derecho** en la carpeta "Grupos" → **"Add Request"**
2. **Nombre del request:** `Tabla de Posiciones de un Grupo`
3. **Configuración:**
   - **Método:** `GET`
   - **URL:** `{{base_url}}/grupos/{{grupo_id}}/posiciones`
   - Alternativamente: `{{base_url}}/grupos/1/posiciones`
4. **Headers:** No necesitas agregar ninguno
5. Haz clic en **"Save"**

#### Ejecutar la Prueba

**Ejemplo: Grupo A del Mundial 2022 (ID = 1)**

1. URL: `{{base_url}}/grupos/1/posiciones`
2. Haz clic en **"Send"**

#### Respuesta Esperada (Grupo A)

**Status:** `200 OK`

**Body (JSON):**

```json
[
  {
    "id": 16,
    "pais": "Países Bajos",
    "pJ": 3,
    "pG": 2,
    "pE": 1,
    "pP": 0,
    "gF": 6,
    "gC": 1,
    "puntos": 7
  },
  {
    "id": 22,
    "pais": "Senegal",
    "pJ": 3,
    "pG": 2,
    "pE": 0,
    "pP": 1,
    "gF": 5,
    "gC": 2,
    "puntos": 6
  },
  {
    "id": 9,
    "pais": "Ecuador",
    "pJ": 3,
    "pG": 1,
    "pE": 1,
    "pP": 1,
    "gF": 3,
    "gC": 3,
    "puntos": 4
  },
  {
    "id": 20,
    "pais": "Qatar",
    "pJ": 3,
    "pG": 0,
    "pE": 0,
    "pP": 3,
    "gF": 1,
    "gC": 5,
    "puntos": 0
  }
]
```

#### Significado de los Campos

| Campo    | Descripción                                      |
| -------- | ------------------------------------------------ |
| `id`     | ID de la selección                               |
| `pais`   | Nombre del país/selección                        |
| `pJ`     | Partidos Jugados                                 |
| `pG`     | Partidos Ganados                                 |
| `pE`     | Partidos Empatados                               |
| `pP`     | Partidos Perdidos                                |
| `gF`     | Goles a Favor                                    |
| `gC`     | Goles en Contra                                  |
| `puntos` | Puntos totales (Victoria=3, Empate=1, Derrota=0) |

#### Validaciones a Realizar

✅ **Status Code:** Debe ser `200`
✅ **Tipo de respuesta:** Debe ser un array
✅ **Cantidad de equipos:** Debe haber 4 equipos por grupo
✅ **Orden:** Debe estar ordenado por puntos (mayor a menor)
✅ **Partidos jugados:** Todos deben tener `pJ = 3`
✅ **Suma lógica:** `pG + pE + pP` debe ser igual a `pJ` (3)
✅ **Puntos correctos:** `puntos = (pG * 3) + (pE * 1)`

#### Tests Automatizados

```javascript
// Validar status code
pm.test("Status code is 200", function () {
  pm.response.to.have.status(200);
});

// Validar que sea un array
pm.test("Response is an array", function () {
  var jsonData = pm.response.json();
  pm.expect(jsonData).to.be.an("array");
});

// Validar cantidad de equipos (4 por grupo)
pm.test("Group has 4 teams", function () {
  var jsonData = pm.response.json();
  pm.expect(jsonData.length).to.eql(4);
});

// Validar que todos jugaron 3 partidos
pm.test("All teams played 3 matches", function () {
  var jsonData = pm.response.json();
  jsonData.forEach(function (team) {
    pm.expect(team.pJ).to.eql(3);
  });
});

// Validar orden por puntos (descendente)
pm.test("Teams are ordered by points", function () {
  var jsonData = pm.response.json();
  for (let i = 0; i < jsonData.length - 1; i++) {
    pm.expect(jsonData[i].puntos).to.be.at.least(jsonData[i + 1].puntos);
  }
});

// Validar suma de resultados
pm.test("Match results sum correctly", function () {
  var jsonData = pm.response.json();
  jsonData.forEach(function (team) {
    pm.expect(team.pG + team.pE + team.pP).to.eql(team.pJ);
  });
});

// Validar cálculo de puntos
pm.test("Points calculated correctly", function () {
  var jsonData = pm.response.json();
  jsonData.forEach(function (team) {
    var expectedPoints = team.pG * 3 + team.pE * 1;
    pm.expect(team.puntos).to.eql(expectedPoints);
  });
});
```

#### Probar Todos los Grupos

Cambia el `grupo_id` en la URL para probar todos los grupos:

| Grupo   | URL                    | País Líder Esperado  |
| ------- | ---------------------- | -------------------- |
| Grupo A | `/grupos/1/posiciones` | Países Bajos (7 pts) |
| Grupo B | `/grupos/2/posiciones` | Inglaterra (7 pts)   |
| Grupo C | `/grupos/3/posiciones` | Argentina (6 pts)    |
| Grupo D | `/grupos/4/posiciones` | Francia (6 pts)      |
| Grupo E | `/grupos/5/posiciones` | Japón (6 pts)        |
| Grupo F | `/grupos/6/posiciones` | Marruecos (7 pts)    |
| Grupo G | `/grupos/7/posiciones` | Brasil (6 pts)       |
| Grupo H | `/grupos/8/posiciones` | Portugal (6 pts)     |

---

## 📥 Importar Colección JSON

Para ahorrar tiempo, puedes importar esta colección completa directamente:

### Paso 1: Copiar el JSON

Copia el siguiente JSON completo:

```json
{
  "info": {
    "name": "API Campeonatos FIFA",
    "description": "Colección completa de endpoints para la API de gestión de campeonatos FIFA.\nDesarrollado por: Juan Esteban Correa y Emmanuel Berrio",
    "schema": "https://schema.getpostman.com/json/collection/v2.1.0/collection.json"
  },
  "variable": [
    {
      "key": "base_url",
      "value": "http://localhost:8080",
      "type": "string"
    },
    {
      "key": "campeonato_id",
      "value": "2",
      "type": "string"
    },
    {
      "key": "grupo_id",
      "value": "1",
      "type": "string"
    }
  ],
  "item": [
    {
      "name": "Campeonatos",
      "item": [
        {
          "name": "Listar Todos los Campeonatos",
          "event": [
            {
              "listen": "test",
              "script": {
                "exec": [
                  "pm.test(\"Status code is 200\", function () {",
                  "    pm.response.to.have.status(200);",
                  "});",
                  "",
                  "pm.test(\"Response is an array\", function () {",
                  "    var jsonData = pm.response.json();",
                  "    pm.expect(jsonData).to.be.an('array');",
                  "});",
                  "",
                  "pm.test(\"At least one championship exists\", function () {",
                  "    var jsonData = pm.response.json();",
                  "    pm.expect(jsonData.length).to.be.above(0);",
                  "});",
                  "",
                  "pm.test(\"Response time is less than 1000ms\", function () {",
                  "    pm.expect(pm.response.responseTime).to.be.below(1000);",
                  "});"
                ],
                "type": "text/javascript"
              }
            }
          ],
          "request": {
            "method": "GET",
            "header": [],
            "url": {
              "raw": "{{base_url}}/campeonatos/listar",
              "host": ["{{base_url}}"],
              "path": ["campeonatos", "listar"]
            },
            "description": "Obtiene la lista completa de todos los campeonatos registrados en la base de datos."
          }
        },
        {
          "name": "Listar Grupos de un Campeonato",
          "event": [
            {
              "listen": "test",
              "script": {
                "exec": [
                  "pm.test(\"Status code is 200\", function () {",
                  "    pm.response.to.have.status(200);",
                  "});",
                  "",
                  "pm.test(\"Response is an array\", function () {",
                  "    var jsonData = pm.response.json();",
                  "    pm.expect(jsonData).to.be.an('array');",
                  "});"
                ],
                "type": "text/javascript"
              }
            }
          ],
          "request": {
            "method": "GET",
            "header": [],
            "url": {
              "raw": "{{base_url}}/campeonatos/{{campeonato_id}}/grupos",
              "host": ["{{base_url}}"],
              "path": ["campeonatos", "{{campeonato_id}}", "grupos"]
            },
            "description": "Obtiene todos los grupos de un campeonato específico.\n\nPor defecto usa el Mundial 2022 (ID=2) que tiene 8 grupos."
          }
        }
      ],
      "description": "Endpoints relacionados con la gestión de campeonatos"
    },
    {
      "name": "Grupos",
      "item": [
        {
          "name": "Tabla de Posiciones de un Grupo",
          "event": [
            {
              "listen": "test",
              "script": {
                "exec": [
                  "pm.test(\"Status code is 200\", function () {",
                  "    pm.response.to.have.status(200);",
                  "});",
                  "",
                  "pm.test(\"Response is an array\", function () {",
                  "    var jsonData = pm.response.json();",
                  "    pm.expect(jsonData).to.be.an('array');",
                  "});",
                  "",
                  "pm.test(\"Group has 4 teams\", function () {",
                  "    var jsonData = pm.response.json();",
                  "    pm.expect(jsonData.length).to.eql(4);",
                  "});",
                  "",
                  "pm.test(\"All teams played 3 matches\", function () {",
                  "    var jsonData = pm.response.json();",
                  "    jsonData.forEach(function(team) {",
                  "        pm.expect(team.pJ).to.eql(3);",
                  "    });",
                  "});",
                  "",
                  "pm.test(\"Teams are ordered by points\", function () {",
                  "    var jsonData = pm.response.json();",
                  "    for (let i = 0; i < jsonData.length - 1; i++) {",
                  "        pm.expect(jsonData[i].puntos).to.be.at.least(jsonData[i + 1].puntos);",
                  "    }",
                  "});"
                ],
                "type": "text/javascript"
              }
            }
          ],
          "request": {
            "method": "GET",
            "header": [],
            "url": {
              "raw": "{{base_url}}/grupos/{{grupo_id}}/posiciones",
              "host": ["{{base_url}}"],
              "path": ["grupos", "{{grupo_id}}", "posiciones"]
            },
            "description": "Obtiene la tabla de posiciones calculada de un grupo específico.\n\nMuestra: país, partidos jugados, ganados, empatados, perdidos, goles a favor, goles en contra y puntos.\n\nPor defecto usa el Grupo A (ID=1)."
          }
        }
      ],
      "description": "Endpoints relacionados con grupos y tablas de posiciones"
    }
  ]
}
```

### Paso 2: Importar en Postman

1. Abre Postman
2. Haz clic en **"Import"** (esquina superior izquierda)
3. Selecciona la pestaña **"Raw text"**
4. Pega el JSON completo
5. Haz clic en **"Continue"**
6. Revisa la información y haz clic en **"Import"**

¡Listo! Ahora tienes toda la colección con tests automatizados incluidos.

---

## ✅ Casos de Prueba y Validaciones

### Matriz de Casos de Prueba

| #   | Endpoint                        | Método | URL                      | Resultado Esperado         | Status  |
| --- | ------------------------------- | ------ | ------------------------ | -------------------------- | ------- |
| 1   | Listar Campeonatos              | GET    | `/campeonatos/listar`    | Array con 5 campeonatos    | 200     |
| 2   | Grupos del Mundial 2022         | GET    | `/campeonatos/2/grupos`  | Array con 8 grupos         | 200     |
| 3   | Grupos de campeonato sin grupos | GET    | `/campeonatos/1/grupos`  | Array vacío `[]`           | 200     |
| 4   | Tabla Grupo A                   | GET    | `/grupos/1/posiciones`   | 4 equipos, Países Bajos 1° | 200     |
| 5   | Tabla Grupo B                   | GET    | `/grupos/2/posiciones`   | 4 equipos, Inglaterra 1°   | 200     |
| 6   | Tabla Grupo C                   | GET    | `/grupos/3/posiciones`   | 4 equipos, Argentina 1°    | 200     |
| 7   | Tabla Grupo D                   | GET    | `/grupos/4/posiciones`   | 4 equipos, Francia 1°      | 200     |
| 8   | Tabla Grupo E                   | GET    | `/grupos/5/posiciones`   | 4 equipos, Japón 1°        | 200     |
| 9   | Tabla Grupo F                   | GET    | `/grupos/6/posiciones`   | 4 equipos, Marruecos 1°    | 200     |
| 10  | Tabla Grupo G                   | GET    | `/grupos/7/posiciones`   | 4 equipos, Brasil 1°       | 200     |
| 11  | Tabla Grupo H                   | GET    | `/grupos/8/posiciones`   | 4 equipos, Portugal 1°     | 200     |
| 12  | Grupo inexistente               | GET    | `/grupos/999/posiciones` | Array vacío o error        | 200/404 |

### Checklist de Validación

Para cada endpoint, verifica:

- [ ] **Status Code correcto** (200 OK)
- [ ] **Tipo de datos correcto** (Array, Object, etc.)
- [ ] **Estructura JSON válida**
- [ ] **Campos requeridos presentes**
- [ ] **Tipos de datos correctos** (number, string, etc.)
- [ ] **Valores lógicos** (no valores negativos donde no corresponde)
- [ ] **Ordenamiento correcto** (si aplica)
- [ ] **Tiempo de respuesta aceptable** (< 1000ms)
- [ ] **Headers de respuesta apropiados**

---

## 🐛 Solución de Problemas

### Error: "Could not get any response"

**Causa:** La API no está corriendo o hay un problema de conexión.

**Solución:**

1. Verifica que la aplicación Spring Boot esté corriendo
2. Revisa la consola de la aplicación para errores
3. Verifica que el puerto sea correcto (8080)
4. Intenta acceder desde el navegador: `http://localhost:8080/campeonatos/listar`

### Error: 404 Not Found

**Causa:** La URL del endpoint es incorrecta.

**Solución:**

1. Verifica que la URL sea exactamente: `/campeonatos/listar` (no `/campeonato/listar`)
2. Revisa que no haya espacios en la URL
3. Confirma que la variable `{{base_url}}` esté configurada correctamente

### Error: 500 Internal Server Error

**Causa:** Error en la aplicación o la base de datos.

**Solución:**

1. Revisa los logs de la aplicación Spring Boot
2. Verifica que PostgreSQL esté corriendo
3. Confirma que la base de datos esté poblada con `database.sql`
4. Verifica las credenciales en `application.properties`

### Respuesta vacía: `[]`

**Causa:** No hay datos en la base de datos o el ID no existe.

**Solución:**

1. Ejecuta el script `database.sql` para poblar la base de datos
2. Verifica que estés usando IDs válidos
3. Consulta la base de datos directamente:
   ```sql
   SELECT * FROM campeonato;
   SELECT * FROM grupo;
   ```

### Variables no se reemplazan: aparece `{{base_url}}`

**Causa:** El entorno no está seleccionado.

**Solución:**

1. En la esquina superior derecha de Postman, selecciona tu entorno
2. Verifica que las variables estén definidas correctamente
3. Usa el icono de "ojo" 👁️ para ver los valores actuales

---

## 📊 Ejecutar Colección Completa (Collection Runner)

Para ejecutar todos los tests automáticamente:

1. Haz clic derecho en la colección **"API Campeonatos FIFA"**
2. Selecciona **"Run collection"**
3. Selecciona todos los requests
4. Configura:
   - **Iterations:** 1
   - **Delay:** 0ms
   - **Data:** None
5. Haz clic en **"Run API Campeonatos FIFA"**

Verás un resumen con:

- ✅ Tests pasados
- ❌ Tests fallidos
- Tiempo total de ejecución
- Detalles de cada request

---

## 📸 Capturas de Pantalla Recomendadas

Para documentar tus pruebas, toma capturas de:

1. **Vista general de la colección** (panel izquierdo)
2. **Request de Listar Campeonatos** con respuesta exitosa
3. **Tests pasados** (panel de Tests con checks verdes)
4. **Tabla de posiciones del Grupo A** con los 4 equipos
5. **Collection Runner** mostrando todos los tests pasados

---

## 🎯 Próximos Pasos

Una vez domines estas pruebas básicas, puedes:

1. **Agregar más tests automatizados** con validaciones específicas
2. **Crear un entorno de producción** con URL diferente
3. **Documentar la API** usando Postman's documentation feature
4. **Compartir la colección** con tu equipo exportándola
5. **Configurar Newman** para ejecutar tests desde la línea de comandos

---

## 📚 Recursos Adicionales

- [Documentación oficial de Postman](https://learning.postman.com/docs/getting-started/introduction/)
- [Postman Test Scripts](https://learning.postman.com/docs/writing-scripts/test-scripts/)
- [Variables en Postman](https://learning.postman.com/docs/sending-requests/variables/)

---

**Desarrollado por Juan Esteban Correa y Emmanuel Berrio**  
**Versión:** 1.0  
**Última actualización:** Noviembre 2025

¡Felices pruebas! 🚀
