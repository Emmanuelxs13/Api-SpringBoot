# API Campeonatos FIFA ⚽

API REST desarrollada con Spring Boot para la gestión de campeonatos de fútbol, grupos y tablas de posiciones.

## 👥 Autores

- **Juan Esteban Correa**
- **Emmanuel Berrio**

## 📋 Tabla de Contenidos

- [Requisitos Previos](#requisitos-previos)
- [Tecnologías Utilizadas](#tecnologías-utilizadas)
- [Configuración de la Base de Datos](#configuración-de-la-base-de-datos)
- [Instalación y Ejecución](#instalación-y-ejecución)
- [Endpoints de la API](#endpoints-de-la-api)
- [Pruebas en Postman](#pruebas-en-postman)
- [Estructura del Proyecto](#estructura-del-proyecto)

## 🔧 Requisitos Previos

Antes de comenzar, asegúrate de tener instalado:

- **Java JDK 17** o superior
- **Maven 3.6+** (o usa el wrapper incluido `mvnw`)
- **PostgreSQL 12+**
- **Postman** (para pruebas de API)
- **Git** (opcional)

## 🚀 Tecnologías Utilizadas

- **Spring Boot 4.0.0**
- **Spring Data JPA** - Para persistencia de datos
- **PostgreSQL** - Base de datos relacional
- **Maven** - Gestor de dependencias
- **Jackson** - Serialización/deserialización JSON

## 🗄️ Configuración de la Base de Datos

### 1. Crear la Base de Datos

Abre PostgreSQL y crea la base de datos:

**Opción A: Usando pgAdmin**

1. Abre pgAdmin
2. Clic derecho en "Databases" → "Create" → "Database"
3. Nombre: `campeonatosfifa`
4. Clic en "Save"

**Opción B: Usando terminal/consola SQL**

```sql
CREATE DATABASE campeonatosfifa;
```

### 2. Ejecutar el Script SQL

El proyecto incluye un archivo `database.sql` con todas las tablas y datos de prueba. **Este es el paso más importante:**

**Opción A: Usando pgAdmin (Recomendado)**

1. En pgAdmin, selecciona la base de datos `campeonatosfifa`
2. Clic en "Tools" → "Query Tool"
3. Abre el archivo `database.sql` (está en la raíz del proyecto)
4. Clic en el botón "Execute/Run" (▶️) o presiona F5
5. Espera a que termine la ejecución (verás mensajes de confirmación)

**Opción B: Usando terminal psql**

```bash
# En Windows PowerShell:
psql -U postgres -d campeonatosfifa -f database.sql

# En Linux/Mac:
psql -U postgres -d campeonatosfifa -f database.sql
```

**¿Qué hace el script?**

- ✅ Crea todas las tablas necesarias (`pais`, `campeonato`, `grupo`, `grupopais`)
- ✅ Inserta 30+ países/selecciones
- ✅ Inserta 5 campeonatos (Mundial 2018, 2022, 2026, Copa América, Eurocopa)
- ✅ Crea los 8 grupos del Mundial 2022 con datos reales
- ✅ Crea la función `fTablaPosicionesGrupo` para calcular tablas de posiciones
- ✅ Verifica que todo esté correcto

### 3. Configurar Credenciales

El archivo `src/main/resources/application.properties` contiene la configuración por defecto:

```properties
spring.datasource.url=jdbc:postgresql://localhost:5432/campeonatosfifa
spring.datasource.username=postgres
spring.datasource.password=123456789
server.port=8080
```

**⚠️ IMPORTANTE:** Si tus credenciales de PostgreSQL son diferentes, modifica este archivo antes de ejecutar la aplicación.

### 4. Verificar la Instalación

Para verificar que la base de datos se creó correctamente, ejecuta en pgAdmin:

```sql
-- Ver todas las tablas
SELECT table_name FROM information_schema.tables
WHERE table_schema = 'public';

-- Ver países insertados
SELECT * FROM pais LIMIT 5;

-- Ver campeonatos
SELECT * FROM campeonato;

-- Probar la función de tabla de posiciones
SELECT * FROM fTablaPosicionesGrupo(1);
```

Si ves datos, ¡todo está listo! 🎉

## 💻 Instalación y Ejecución

### Opción 1: Usando Maven Wrapper (Recomendado)

#### En Windows (PowerShell o CMD):

```powershell
# 1. Navegar al directorio del proyecto
cd "d:\Tec. Desarrollo de Software\3° Semestre\Api-SpringBoot\apicampeonatosfifa"

# 2. Compilar el proyecto
.\mvnw.cmd clean install

# 3. Ejecutar la aplicación
.\mvnw.cmd spring-boot:run
```

#### En Linux/Mac:

```bash
# 1. Dar permisos de ejecución
chmod +x mvnw

# 2. Compilar el proyecto
./mvnw clean install

# 3. Ejecutar la aplicación
./mvnw spring-boot:run
```

### Opción 2: Usando Maven instalado globalmente

```powershell
mvn clean install
mvn spring-boot:run
```

### Opción 3: Ejecutar el JAR generado

```powershell
# Después de compilar, ejecuta:
java -jar target/apicampeonatosfifa-0.0.1-SNAPSHOT.jar
```

### ✅ Verificar que la aplicación está corriendo

Si todo salió bien, verás en la consola:

```
Started ApicampeonatosfifaApplication in X seconds
```

La API estará disponible en: `http://localhost:8080`

## 📡 Endpoints de la API

### Base URL

```
http://localhost:8080
```

### 🏆 Campeonatos

#### 1. Listar todos los campeonatos

```http
GET /campeonatos/listar
```

**Respuesta exitosa (200 OK):**

```json
[
  {
    "id": 1,
    "nombre": "Copa Mundial FIFA 2022",
    "anio": 2022,
    "pais": "Qatar"
  },
  {
    "id": 2,
    "nombre": "Copa Mundial FIFA 2026",
    "anio": 2026,
    "pais": "USA/México/Canadá"
  }
]
```

#### 2. Listar grupos de un campeonato

```http
GET /campeonatos/{id}/grupos
```

**Ejemplo:**

```http
GET /campeonatos/1/grupos
```

**Respuesta exitosa (200 OK):**

```json
[
  {
    "id": 1,
    "nombre": "Grupo A",
    "campeonatoId": 1
  },
  {
    "id": 2,
    "nombre": "Grupo B",
    "campeonatoId": 1
  }
]
```

### 👥 Grupos

#### 3. Obtener tabla de posiciones de un grupo

```http
GET /grupos/{id}/posiciones
```

**Ejemplo:**

```http
GET /grupos/1/posiciones
```

**Respuesta exitosa (200 OK):**

```json
[
  {
    "posicion": 1,
    "seleccion": "Argentina",
    "partidosJugados": 3,
    "ganados": 2,
    "empatados": 1,
    "perdidos": 0,
    "golesFavor": 5,
    "golesContra": 2,
    "diferenciaGoles": 3,
    "puntos": 7
  },
  {
    "posicion": 2,
    "seleccion": "Polonia",
    "partidosJugados": 3,
    "ganados": 1,
    "empatados": 1,
    "perdidos": 1,
    "golesFavor": 3,
    "golesContra": 3,
    "diferenciaGoles": 0,
    "puntos": 4
  }
]
```

## 🧪 Pruebas en Postman

> 📘 **¿Necesitas una guía completa?** Consulta [POSTMAN_GUIDE.md](POSTMAN_GUIDE.md) para instrucciones detalladas paso a paso, casos de prueba, tests automatizados y solución de problemas.

### Guía Rápida

#### Paso 1: Configurar Variables de Entorno (Opcional)

Crea una variable de entorno en Postman:

- Variable: `base_url`
- Value: `http://localhost:8080`

#### Paso 2: Crear Requests

**Request 1: Listar Campeonatos**

- Método: `GET`
- URL: `http://localhost:8080/campeonatos/listar`
- Resultado: Lista de 5 campeonatos

**Request 2: Grupos de un Campeonato**

- Método: `GET`
- URL: `http://localhost:8080/campeonatos/2/grupos`
- Resultado: 8 grupos del Mundial 2022

**Request 3: Tabla de Posiciones**

- Método: `GET`
- URL: `http://localhost:8080/grupos/1/posiciones`
- Resultado: 4 equipos del Grupo A con sus estadísticas

#### Paso 3: Importar Colección Completa

Puedes importar esta colección directamente en Postman (o usa la versión completa en [POSTMAN_GUIDE.md](POSTMAN_GUIDE.md)):

```json
{
  "info": {
    "name": "API Campeonatos FIFA",
    "schema": "https://schema.getpostman.com/json/collection/v2.1.0/collection.json"
  },
  "item": [
    {
      "name": "Listar Campeonatos",
      "request": {
        "method": "GET",
        "header": [],
        "url": {
          "raw": "http://localhost:8080/campeonatos/listar",
          "protocol": "http",
          "host": ["localhost"],
          "port": "8080",
          "path": ["campeonatos", "listar"]
        }
      }
    },
    {
      "name": "Grupos de Campeonato",
      "request": {
        "method": "GET",
        "header": [],
        "url": {
          "raw": "http://localhost:8080/campeonatos/1/grupos",
          "protocol": "http",
          "host": ["localhost"],
          "port": "8080",
          "path": ["campeonatos", "1", "grupos"]
        }
      }
    },
    {
      "name": "Tabla de Posiciones",
      "request": {
        "method": "GET",
        "header": [],
        "url": {
          "raw": "http://localhost:8080/grupos/1/posiciones",
          "protocol": "http",
          "host": ["localhost"],
          "port": "8080",
          "path": ["grupos", "1", "posiciones"]
        }
      }
    }
  ]
}
```

### Pruebas Alternativas con cURL

Si prefieres usar cURL desde la terminal:

```bash
# Listar campeonatos
curl http://localhost:8080/campeonatos/listar

# Grupos de un campeonato
curl http://localhost:8080/campeonatos/1/grupos

# Tabla de posiciones
curl http://localhost:8080/grupos/1/posiciones
```

## 📁 Estructura del Proyecto

```
apicampeonatosfifa/
├── src/
│   ├── main/
│   │   ├── java/apicampeonatosfifa/
│   │   │   ├── ApicampeonatosfifaApplication.java  # Clase principal
│   │   │   ├── controladores/                      # REST Controllers
│   │   │   │   ├── CampeonatoControlador.java
│   │   │   │   └── GrupoControlador.java
│   │   │   ├── entidades/                          # Entidades JPA
│   │   │   │   ├── Campeonato.java
│   │   │   │   ├── Grupo.java
│   │   │   │   ├── Seleccion.java
│   │   │   │   ├── GrupoSeleccion.java
│   │   │   │   ├── GrupoSeleccionId.java
│   │   │   │   └── TablaPosicion.java
│   │   │   ├── interfaces/                         # Interfaces de servicios
│   │   │   │   ├── ICampeonatoServicio.java
│   │   │   │   └── IGrupoServicio.java
│   │   │   ├── repositorios/                       # Repositorios JPA
│   │   │   │   ├── CampeonatoRepositorio.java
│   │   │   │   ├── GrupoRepositorio.java
│   │   │   │   └── SeleccionRepositorio.java
│   │   │   └── servicios/                          # Implementación de servicios
│   │   │       ├── CampeonatoServicio.java
│   │   │       └── GrupoServicio.java
│   │   └── resources/
│   │       └── application.properties              # Configuración
│   └── test/                                        # Tests
├── database.sql                                     # ⭐ Script SQL para crear y poblar la BD
├── POSTMAN_GUIDE.md                                 # 📘 Guía detallada de pruebas en Postman
├── pom.xml                                          # Dependencias Maven
└── README.md                                        # Este archivo
```

## 🔍 Solución de Problemas

### Error: "Could not connect to database"

- ✅ Verifica que PostgreSQL esté corriendo
- ✅ Revisa las credenciales en `application.properties`
- ✅ Confirma que la base de datos `campeonatosfifa` existe
- ✅ Asegúrate de haber ejecutado el script `database.sql`

### Error: "Port 8080 already in use"

- Cambia el puerto en `application.properties`:
  ```properties
  server.port=8081
  ```

### Error: "Java version mismatch"

- Verifica tu versión de Java: `java -version`
- Debe ser Java 17 o superior

### La API no responde

- Verifica que la aplicación esté corriendo (revisa la consola)
- Prueba con: `curl http://localhost:8080/campeonatos/listar`

## 👨‍💻 Desarrollo

### Estructura de la Base de Datos

Las tablas principales son:

- **`pais`** - Países/selecciones con su confederación (CONMEBOL, UEFA, AFC, CAF, CONCACAF)
- **`campeonato`** - Campeonatos con año y país anfitrión
- **`grupo`** - Grupos de cada campeonato
- **`grupopais`** - Relación many-to-many entre grupos y selecciones (incluye posición y puntos)
- **`fTablaPosicionesGrupo(id)`** - Función que calcula automáticamente la tabla de posiciones

### Agregar Más Datos de Prueba

Si quieres agregar más datos, puedes usar estos ejemplos:

```sql
-- Insertar un nuevo país
INSERT INTO pais (nombre, entidad)
VALUES ('Rusia', 'UEFA');

-- Insertar un nuevo campeonato
INSERT INTO campeonato (nombre, anio, pais_anfitrion_id)
VALUES ('Copa Mundial FIFA 2030', 2030, (SELECT id FROM pais WHERE nombre = 'España'));

-- Agregar una selección a un grupo existente
INSERT INTO grupopais (grupo_id, seleccion_id, posicion, puntos)
VALUES (1, (SELECT id FROM pais WHERE nombre = 'Rusia'), 5, 0);
```

## 📝 Notas Adicionales

- La API usa CORS configurado para aceptar peticiones desde cualquier origen (`*`)
- Los logs de Hibernate están activados para ver las consultas SQL
- El modo DDL de Hibernate está en `update` (crea/actualiza tablas automáticamente)

## � Resumen de Pasos Rápidos

Para los impacientes, aquí está todo en 5 pasos:

```powershell
# 1. Crear la base de datos en PostgreSQL
CREATE DATABASE campeonatosfifa;

# 2. Ejecutar el script SQL (en pgAdmin o psql)
psql -U postgres -d campeonatosfifa -f database.sql

# 3. Verificar credenciales en application.properties

# 4. Compilar y ejecutar
cd "d:\Tec. Desarrollo de Software\3° Semestre\Api-SpringBoot\apicampeonatosfifa"
.\mvnw.cmd spring-boot:run

# 5. Probar en Postman
GET http://localhost:8080/campeonatos/listar
```

## �📄 Licencia

Este proyecto es de uso educativo.

---

**Desarrollado por Juan Esteban Correa y Emmanuel Berrio**
