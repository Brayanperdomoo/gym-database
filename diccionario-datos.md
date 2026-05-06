# Diccionario de Datos

Este documento describe las tablas utilizadas por la base de datos del sistema de gimnasio.

---

## Tabla: members

Tabla encargada de almacenar la información de los miembros o clientes registrados en el gimnasio.

| Campo | Tipo | Restricciones | Descripción |
|---|---|---|---|
| id | BIGSERIAL | PRIMARY KEY | Identificador único del miembro |
| first_name | VARCHAR(100) | NOT NULL | Nombres del miembro |
| last_name | VARCHAR(100) | NOT NULL | Apellidos del miembro |
| document_number | VARCHAR(12) | NOT NULL, UNIQUE | Número de documento del miembro |
| phone | VARCHAR(12) | NOT NULL | Número de celular del miembro |
| email | VARCHAR(150) | NOT NULL, UNIQUE | Correo electrónico del miembro |
| membership_type | VARCHAR(60) | NOT NULL | Tipo de membresía del miembro |
| created_at | TIMESTAMP | NULL | Fecha de creación del registro |
| updated_at | TIMESTAMP | NULL | Fecha de última actualización del registro |

### Validaciones relacionadas

| Campo | Validación |
|---|---|
| first_name | Solo letras y espacios |
| last_name | Solo letras y espacios |
| document_number | Solo números, mínimo 10 y máximo 12 dígitos |
| phone | Solo números, mínimo 10 y máximo 12 dígitos |
| email | Formato de correo válido |
| membership_type | Solo letras y espacios |

---

## Tabla: trainers

Tabla encargada de almacenar la información de los entrenadores registrados en el gimnasio.

| Campo | Tipo | Restricciones | Descripción |
|---|---|---|---|
| id | BIGSERIAL | PRIMARY KEY | Identificador único del entrenador |
| first_name | VARCHAR(100) | NOT NULL | Nombres del entrenador |
| last_name | VARCHAR(100) | NOT NULL | Apellidos del entrenador |
| specialty | VARCHAR(100) | NOT NULL | Especialidad del entrenador |
| phone | VARCHAR(12) | NOT NULL | Número de celular del entrenador |
| email | VARCHAR(150) | NOT NULL, UNIQUE | Correo electrónico del entrenador |
| created_at | TIMESTAMP | NULL | Fecha de creación del registro |
| updated_at | TIMESTAMP | NULL | Fecha de última actualización del registro |

### Validaciones relacionadas

| Campo | Validación |
|---|---|
| first_name | Solo letras y espacios |
| last_name | Solo letras y espacios |
| specialty | Solo letras y espacios |
| phone | Solo números, mínimo 10 y máximo 12 dígitos |
| email | Formato de correo válido |

---

## Tabla: training_sessions

Tabla encargada de almacenar las sesiones de entrenamiento programadas en el gimnasio.

| Campo | Tipo | Restricciones | Descripción |
|---|---|---|---|
| id | BIGSERIAL | PRIMARY KEY | Identificador único de la sesión |
| session_date | TIMESTAMP | NOT NULL | Fecha y hora de la sesión de entrenamiento |
| training_type | VARCHAR(100) | NOT NULL | Tipo de entrenamiento |
| duration_minutes | INT | NOT NULL | Duración de la sesión en minutos |
| notes | VARCHAR(255) | NULL | Observaciones o notas adicionales |
| member_id | BIGINT | NOT NULL, FOREIGN KEY | Miembro asociado a la sesión |
| trainer_id | BIGINT | NOT NULL, FOREIGN KEY | Entrenador asociado a la sesión |
| created_at | TIMESTAMP | NULL | Fecha de creación del registro |
| updated_at | TIMESTAMP | NULL | Fecha de última actualización del registro |

### Validaciones relacionadas

| Campo | Validación |
|---|---|
| session_date | No puede estar en el pasado |
| training_type | Solo letras y espacios |
| duration_minutes | Mínimo 15 y máximo 240 minutos |
| notes | Máximo 255 caracteres |
| member_id | Debe existir en la tabla members |
| trainer_id | Debe existir en la tabla trainers |

---

# Relaciones

## members -> training_sessions

Un miembro puede tener muchas sesiones de entrenamiento.

Relación:

```txt
members 1 -> N training_sessions
```

## trainers -> training_sessions

Un entrenador puede dirigir muchas sesiones de entrenamiento.

Relación:

```txt
trainers 1 -> N training_sessions
```

---

# Resumen del modelo

| Entidad | Descripción |
|---|---|
| members | Clientes o miembros registrados en el gimnasio |
| trainers | Entrenadores encargados de dirigir sesiones |
| training_sessions | Sesiones de entrenamiento asociadas a miembros y entrenadores |

---

# Modelo lógico

```txt
members
  - id
  - first_name
  - last_name
  - document_number
  - phone
  - email
  - membership_type

trainers
  - id
  - first_name
  - last_name
  - specialty
  - phone
  - email

training_sessions
  - id
  - session_date
  - training_type
  - duration_minutes
  - notes
  - member_id
  - trainer_id
```
