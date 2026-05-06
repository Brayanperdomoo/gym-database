# Gym Database

Repositorio de documentación de la base de datos del sistema de gimnasio.

Este repositorio contiene la estructura SQL, el diccionario de datos y una explicación general de las tablas utilizadas por el backend.

## Proyecto

Sistema web para administrar un gimnasio, permitiendo registrar:

- Miembros
- Entrenadores
- Sesiones de entrenamiento

## Tecnologías relacionadas

- PostgreSQL
- Liquibase
- Spring Boot
- Render PostgreSQL
- GitHub Actions

## Tablas principales

- members
- trainers
- training_sessions

## Relaciones

- Un miembro puede tener muchas sesiones de entrenamiento.
- Un entrenador puede dirigir muchas sesiones de entrenamiento.
- Una sesión de entrenamiento pertenece a un miembro y a un entrenador.

## Archivos del repositorio

| Archivo | Descripción |
|---|---|
| README.md | Documentación general del repositorio |
| schema.sql | Script SQL con la estructura de la base de datos |
| diccionario-datos.md | Descripción de tablas, campos, tipos de datos y relaciones |

## Nota importante

La creación real de las tablas en el backend se realiza con Liquibase desde el proyecto `gym-back-end`.

Este repositorio funciona como evidencia, documentación y referencia de la estructura de base de datos usada por el sistema.
