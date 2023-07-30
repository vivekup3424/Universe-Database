CREATE TABLE Galaxy(
    galaxy_id SERIAL PRIMARY KEY UNIQUE,
    name VARCHAR(255) NOT NULL,
    galaxy_type TEXT NOT NULL,
    diameter NUMERIC(10,2),
    mass NUMERIC(10,2),
    distance_from_earth INT,
    number_of_stars INT,
    habitable BOOLEAN,
    has_life BOOLEAN,
    number_of_planets INT,
);
CREATE TABLE Star(
    star_id SERIAL PRIMARY KEY UNIQUE,
    name VARCHAR(255) NOT NULL,
    galaxy_id INT REFERENCES Galaxy(galaxy_id) NOT NULL,
    is_spherical BOOLEAN NOT NULL,
    is_super_giant BOOLEAN,
    age_in_millions INT.
    number_of_planets INT,
    mass_in_solar_masses NUMERIC(10,2),
    tempature_in_kelvin NUMERIC(10,2),
);
CREATE TABLE Planet(
    planet_id SERIAL PRIMARY KEY UNIQUE,
    name VARCHAR(255) NOT NULL,
    star_id INT REFERENCES Star(star_id) NOT NULL,
    mass_in_solar_masses NUMERIC(10,2) NOT NULL,
    tempature_in_kelvin NUMERIC(10,2),
    diameter INT,
    distance_from_star INT,
    has_water BOOLEAN,
    has_life BOOLEAN,
    number_of_moons INT,
);
CREATE TABLE Moon(
    moon_id SERIAL PRIMARY KEY UNIQUE,
    name VARCHAR(255) NOT NULL,
    planet_id INT REFERENCES Planet(planet_id) NOT NULL,
    is_spherical BOOLEAN NOT NULL,
    is_habitabe BOOLEAN NOT NULL,
    has_life BOOLEAN,
    mass_in_solar_masses NUMERIC(10,2),
    tempature_in_kelvin NUMERIC(10,2),
    diameter INT,
    distance_from_planet INT,
);
-- Insert data into the Galaxy table
INSERT INTO Galaxy (name, galaxy_type, diameter, mass, distance_from_earth, number_of_stars, habitable, has_life, number_of_planets)
VALUES
    ('Andromeda', 'Spiral', 260000.00, 1200000000.00, 1000, 200000000, true, true, 400000),
    ('Milky Way', 'Spiral', 200000.00, 1000000000.00, 500, 180000000, true, true, 350000),
    ('Triangulum', 'Spiral', 50000.00, 300000000.00, 1500, 80000000, false, false, 180000),
    ('Centaurus A', 'Elliptical', 100000.00, 800000000.00, 2000, 150000000, false, false, 250000),
    ('Messier 82', 'Irregular', 80000.00, 600000000.00, 1200, 100000000, false, false, 100000),
    ('Whirlpool Galaxy', 'Spiral', 150000.00, 900000000.00, 800, 120000000, false, false, 180000);

-- Insert data into the Star table
INSERT INTO Star (name, galaxy_id, is_spherical, is_super_giant, age_in_millions, number_of_planets, mass_in_solar_masses, temperature_in_kelvin)
VALUES
    ('Sun', 1, true, false, 4500, 8, 1.9885, 5778.00),
    ('Polaris', 1, true, true, 23000, 5, 7.672, 6600.00),
    ('Betelgeuse', 2, false, true, 100000, 2, 15.5, 3600.00),
    ('Sirius', 2, true, true, 20000, 7, 2.02, 9940.00),
    ('Proxima Centauri', 4, false, false, 10000, 1, 0.123, 3042.00),
    ('Alpha Centauri A', 4, true, true, 60000, 6, 1.1, 5790.00);

-- Insert data into the Planet table
INSERT INTO Planet (name, star_id, mass_in_solar_masses, temperature_in_kelvin, diameter, distance_from_star, has_water, has_life, number_of_moons)
VALUES
    ('Earth', 1, 1.00, 288.00, 12742, 149598023, true, true, 1),
    ('Mars', 1, 0.11, 210.00, 6779, 227943824, false, false, 2),
    ('Venus', 1, 0.82, 735.00, 12104, 108209475, false, false, 0),
    ('Jupiter', 2, 318.00, 131.00, 139820, 778340821, false, false, 79),
    ('Saturn', 2, 95.00, 87.00, 116460, 1426666422, false, false, 82),
    ('Neptune', 5, 17.00, 72.00, 49528, 4503443661, false, false, 14),
    ('Mercury', 3, 0.055, 440.00, 4879, 57909227, false, false, 0),
    ('Uranus', 6, 86.00, 59.00, 50724, 2870658186, false, false, 27),
    ('Pluto', 6, 0.0146, 44.00, 2370, 5913520000, false, false, 5),
    ('Vesta', 3, 0.000259, 132.00, 525, 353780000, false, false, 0),
    ('Ceres', 3, 0.0009, 168.00, 590, 413700000, false, false, 0),
    ('Makemake', 5, 0.00067, 30.00, 1434, 6949136578, false, false, 1);

-- Insert data into the Moon table
INSERT INTO Moon (name, planet_id, is_spherical, is_habitable, has_life, mass_in_solar_masses, temperature_in_kelvin, diameter, distance_from_planet)
VALUES
    ('Luna', 1, true, true, false, 0.0123, 197.00, 3475, 384400),
    ('Phobos', 2, true, false, false, 0.0000000013, 233.00, 22, 9380),
    ('Europa', 4, true, true, false, 0.008, 102.00, 3121, 670900),
    ('Titan', 5, true, true, false, 0.0225, 94.00, 5149, 1221870),
    ('Triton', 8, true, false, false, 0.00359, 38.00, 2706, 354759),
    ('Ganymede', 4, true, true, false, 0.025, 110.00, 5262, 1070400),
    ('Charon', 10, true, false, false, 0.000252, 53.00, 1212, 17536),
    ('Miranda', 8, true, false, false, 0.00066, 78.00, 2358, 129390),
    ('Dione', 7, true, false, false, 0.00248, 87.00, 1123, 377400),
    ('Io', 4, true, true, false, 0.015, 130.00, 3643, 421700),
    ('Oberon', 9, true, false, false, 0.0031, 80.00, 1523, 584000),
    ('Tethys', 7, true, false, false, 0.00062, 88.00, 1060, 294619),
    ('Nereid', 8, true, false, false, 0.00021, 47.00, 340, 5513813),
    ('Hyperion', 7, true, false, false, 0.000037, 52.00, 270, 1481107),
    ('Proteus', 8, true, false, false, 0.00051, 52.00, 420, 117647),
    ('Amalthea', 4, true, false, false, 0.0000017, 84.00, 262, 181400),
    ('Titania', 9, true, false, false, 0.00353, 77.00, 1578, 435910),
    ('Ariel', 9, true, false, false, 0.00075, 77.00, 1158, 191020),
    ('Umbriel', 9, true, false, false, 0.0035, 76.00, 1169, 266300),
    ('Callisto', 4, true, false, false, 0.018, 134.00, 4821, 1882700);
