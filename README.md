
# Automatización de Pruebas para ServeRest con Karate DSL

Este proyecto implementa una suite profesional de pruebas automatizadas para la API de Usuarios de ServeRest ([https://serverest.dev/](https://serverest.dev/)), utilizando Karate DSL y Maven. El objetivo es validar integralmente los endpoints de usuarios bajo criterios de calidad, robustez y mantenibilidad.

## Tabla de Contenidos

- [Descripción General](#descripción-general)
- [Requisitos](#requisitos)
- [Instalación](#instalación)
- [Ejecución de Pruebas](#ejecución-de-pruebas)
- [Estructura del Proyecto](#estructura-del-proyecto)
- [Estrategia de Automatización](#estrategia-de-automatización)
- [Buenas Prácticas y Patrones](#buenas-prácticas-y-patrones)
- [Notas Importantes](#notas-importantes)
- [Contacto](#contacto)

## Descripción General

La suite automatiza pruebas funcionales para los endpoints CRUD de usuarios de ServeRest. Incluye validaciones de status, mensajes, esquemas JSON y manejo de datos dinámicos, cubriendo escenarios positivos y negativos.

## Requisitos

- Java 8 o superior
- Maven 3.6+

## Instalación

1. Clona este repositorio:
   ```sh
   git clone <URL_DEL_REPOSITORIO>
   cd <NOMBRE_DEL_PROYECTO>
   ```
2. Verifica que tienes Java y Maven instalados:
   ```sh
   java -version
   mvn -version
   ```

## Ejecución de Pruebas

Para ejecutar toda la suite:

```sh
mvn test
```

Los reportes HTML se generan en `target/karate-reports/`.

## Estructura del Proyecto

- `src/test/java/features/`: Features de Karate para cada endpoint (GET, POST, PUT, DELETE, etc.).
- `src/test/java/utils/`: Utilidades Java para generación dinámica de datos.
- `pom.xml`: Configuración de dependencias y plugins Maven.
- `estrategia.md`: Detalle de la estrategia de automatización.

## Estrategia de Automatización

- **Cobertura Completa**: Pruebas para todos los endpoints CRUD de usuarios.
- **Escenarios Positivos y Negativos**: Validación de respuestas exitosas y manejo de errores.
- **Validación de Esquemas**: Uso de JSON Schema para asegurar la estructura de las respuestas.
- **Datos Dinámicos**: Generación de emails y datos únicos para evitar colisiones.
- **Reutilización y Mantenibilidad**: Uso de `Background` y llamadas entre features para preparar datos y reducir duplicidad.

## Buenas Prácticas y Patrones

- Separación clara de features por endpoint.
- Utilización de utilidades Java para lógica auxiliar y generación de datos.
- Validaciones explícitas de status code, mensajes y estructura.
- Organización modular y documentación interna en los features.

## Notas Importantes

- **Idioma de las Respuestas**: Aunque la documentación de ServeRest está en español, las respuestas de la API son en portugués. Las aserciones y reportes reflejan fielmente las respuestas reales del backend.
- **Extensión**: El proyecto puede ampliarse fácilmente para cubrir otros endpoints o integrarse con pipelines CI/CD.

