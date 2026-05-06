-- =====================================================
-- Gym Database Schema
-- PostgreSQL
-- =====================================================
-- Este archivo documenta la estructura de la base de datos.
-- En el backend, las tablas se crean automáticamente con Liquibase.
-- =====================================================

-- =====================================================
-- Tabla: members
-- Descripción: almacena los miembros o clientes del gimnasio.
-- =====================================================
CREATE TABLE members (
    id BIGSERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    document_number VARCHAR(12) NOT NULL UNIQUE,
    phone VARCHAR(12) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    membership_type VARCHAR(60) NOT NULL,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- =====================================================
-- Tabla: trainers
-- Descripción: almacena los entrenadores del gimnasio.
-- =====================================================
CREATE TABLE trainers (
    id BIGSERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    specialty VARCHAR(100) NOT NULL,
    phone VARCHAR(12) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- =====================================================
-- Tabla: training_sessions
-- Descripción: almacena las sesiones de entrenamiento.
-- Cada sesión está asociada a un miembro y a un entrenador.
-- =====================================================
CREATE TABLE training_sessions (
    id BIGSERIAL PRIMARY KEY,
    session_date TIMESTAMP NOT NULL,
    training_type VARCHAR(100) NOT NULL,
    duration_minutes INT NOT NULL,
    notes VARCHAR(255),
    member_id BIGINT NOT NULL,
    trainer_id BIGINT NOT NULL,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,

    CONSTRAINT fk_training_sessions_member
        FOREIGN KEY (member_id)
        REFERENCES members(id),

    CONSTRAINT fk_training_sessions_trainer
        FOREIGN KEY (trainer_id)
        REFERENCES trainers(id)
);

-- =====================================================
-- Consultas útiles
-- =====================================================

-- Consultar todos los miembros
SELECT * FROM members;

-- Consultar todos los entrenadores
SELECT * FROM trainers;

-- Consultar todas las sesiones
SELECT * FROM training_sessions;

-- Consultar sesiones con nombre del miembro y entrenador
SELECT
    ts.id,
    ts.session_date,
    ts.training_type,
    ts.duration_minutes,
    ts.notes,
    CONCAT(m.first_name, ' ', m.last_name) AS member_name,
    CONCAT(t.first_name, ' ', t.last_name) AS trainer_name,
    t.specialty
FROM training_sessions ts
INNER JOIN members m ON ts.member_id = m.id
INNER JOIN trainers t ON ts.trainer_id = t.id;

-- Consultar sesiones por miembro
SELECT
    ts.id,
    ts.session_date,
    ts.training_type,
    ts.duration_minutes,
    ts.notes,
    CONCAT(m.first_name, ' ', m.last_name) AS member_name
FROM training_sessions ts
INNER JOIN members m ON ts.member_id = m.id
WHERE m.id = 1;

-- Consultar sesiones por entrenador
SELECT
    ts.id,
    ts.session_date,
    ts.training_type,
    ts.duration_minutes,
    ts.notes,
    CONCAT(t.first_name, ' ', t.last_name) AS trainer_name
FROM training_sessions ts
INNER JOIN trainers t ON ts.trainer_id = t.id
WHERE t.id = 1;
