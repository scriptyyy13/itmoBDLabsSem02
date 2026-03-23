CREATE TYPE country_names AS ENUM ('Russia', 'Norway', 'Estonia', 'Cuba', 'DPRK')

CREATE TYPE material AS ENUM ('plastic', 'metal', 'carbord', 'paper', 'rubber')

CREATE TYPE grade AS ENUM ('bachelor', 'master', 'boctorate', 'candidate', 'doctor', 'shcool')

CREATE TYPE roles AS ENUM ('researcher', 'cleaner', 'assistant')


CREATE TABLE worker (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    birthdate DATE (CHECK birthdate <= CURRENT_DATE - INTERVAL '18 years'),
    role roles,
    education grade,
    homeland country_names
);

CREATE TABLE manufacture (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    founded DATE,
    country country_names
);

CREATE TABLE substance (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    temp NUMERIC,
    manufacture_id INTEGER,
    FOREIGN KEY (manufacture_id) REFERENCES manufacture(id)
);

CREATE TABLE pack (
    id SERIAL PRIMARY KEY,
    material material,
    manufacture_id INTEGER,
    FOREIGN KEY (manufacture_id) REFERENCES manufacture(id)
);

CREATE TABLE tank (
    id SERIAL PRIMARY KEY,
    label TEXT,
    volume NUMERIC,
    substance_id INTEGER,
    manufacture_id INTEGER,
    FOREIGN KEY (substance_id) REFERENCES substance(id)
    FOREIGN KEY (manufacture_id) REFERENCES manufacture(id)
);

CREATE TABLE freezer (
    id SERIAL PRIMARY KEY,
    model TEXT,
    height INTEGER,
    temp NUMERIC,
    tank_id INTEGER,
    manufacture_id INTEGER,
    FOREIGN KEY (tank_id) REFERENCES tank(id)
    FOREIGN KEY (manufacture_id) REFERENCES manufacture(id)
);

CREATE TABLE worker_freezer (
    PRIMARY KEY (worker_id, freezer_id),
    worker_id INTEGER,
    freezer_id INTEGER,
    FOREIGN KEY (worker_id) REFERENCES worker(id),
    FOREIGN KEY (freezer_id) REFERENCES freezer(id)
);

CREATE TABLE shelf (
    id SERIAL PRIMARY KEY,
    num INTEGER,
    capacity INTEGER,
    freezer_id INTEGER,
    FOREIGN KEY (freezer_id) REFERENCES freezer(id)
);

CREATE TABLE embryo (
    id SERIAL PRIMARY KEY,
    type TEXT,
    date DATE,
    pack_id INTEGER,
    shelf_id INTEGER,
    country country_names,
    FOREIGN KEY (pack_id) REFERENCES pack(id),
    FOREIGN KEY (shelf_id) REFERENCES shelf(id)
);