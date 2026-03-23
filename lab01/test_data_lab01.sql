INSERT INTO worker (name, birthdate, role, education, homeland) VALUES
    ('Ivan Petrov', '1980-05-12', 'researcher', 'bachelor', 'Russia'),
    ('Anna Smirnova', '1990-11-23', 'assistant', 'master', 'Norway'),
    ('Anna Ivanovna', '1985-07-09', 'cleaner', 'school', 'Estonia'),
    ('Maria Kuznetsova', '1992-03-18', 'researcher', 'candidate', 'Cuba'),
    ('Kim Jong Un', '1984-01-08', 'researcher', 'doctor', 'DPRK');

INSERT INTO manufacture (name, founded, country) VALUES
    ('Crudoshlyopiki', '2000-06-15', 'Cuba'),
    ('PSZ labs', '2010-03-20', 'Estonia'),
    ('ITMO BIO', '2005-09-12', 'Russia');

INSERT INTO substance (name, temp, manufacture_id) VALUES
    ('Ziza A', -20, 1),
    ('Ziza B', 5, 1),
    ('Ziza C', -10, 2),
    ('Ziza D', 0, 3);

INSERT INTO pack (material, manufacture_id) VALUES
    ('plastic', 1),
    ('metal', 1),
    ('carbord', 2),
    ('paper', 3),
    ('rubber', 2);

INSERT INTO tank (label, volume, substance_id, manufacture_id) VALUES
    ('Tank A', 100.5, 1, 1),
    ('Tank B', 50.0, 2, 1),
    ('Tank C', 75.0, 3, 2),
    ('Tank D', 120.0, 4, 3);

INSERT INTO freezer (model, height, temp, tank_id, manufacture_id) VALUES
    ('Холодос 1', 200, -25, 1, 1),
    ('Холодос 2', 180, -15, 2, 1),
    ('Холодос 3', 210, -20, 3, 2),
    ('Холодос 4', 190, 0, 4, 3);

INSERT INTO worker_freezer (worker_id, freezer_id) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 1);

INSERT INTO shelf (num, capacity, freezer_id) VALUES
    (1, 10, 1),
    (2, 15, 1),
    (1, 20, 2),
    (1, 12, 3),
    (2, 18, 4);

INSERT INTO embryo (type, date, pack_id, shelf_id, country) VALUES
    ('Type A', '2023-01-10', 1, 1, 'Russia'),
    ('Type B', '2023-02-15', 2, 2, 'Norway'),
    ('Type C', '2023-03-20', 3, 3, 'Estonia'),
    ('Type D', '2023-04-25', 4, 4, 'Cuba'),
    ('Type E', '2023-05-30', 5, 5, 'DPRK');