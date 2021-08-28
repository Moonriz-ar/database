-- inset data into password table
INSERT INTO password
	(password, last_modified_date)
VALUES
	('123spotify', '2021-05-01'),
    ('12345678', '2021-05-29'),
    ('2020spotify', '2021-06-01');

SELECT * FROM password;

-- insert data into user table 
INSERT INTO user
	(email, id_password, date_of_birth, sex, postal_code, country)
VALUES
	('andre93_lin@hotmail.com', 1, '1993-05-27', 1, 1218, 'Argentina'),
    ('kerrjoel@hotmail.com', 2, '1995-08-27', 0, 1215, 'Finland'),
    ('micheal@hotmail.com', 3, '1990-08-27', 0, 1215, 'United States');

SELECT * FROM user;

-- insert data into artists
INSERT INTO artist
	(name, surname, profile_image)
VALUE
	('Ed', 'Sheeran', '/img/edsheeran-profile-pic'),
    ('Dua', 'Lipa', '/img/dualipa-profile-pic'),
    ('Imagine', 'Dragons', '/img/imaginedragons-profile-pic');

SELECT * FROM artist;
    
-- insert data into discografica
INSERT INTO discografica
	(name, country)
VALUES
	('Sony Music Entertainment', 'United States'),
    ('Warner Music Group', 'United States'),
    ('Universal Music Group', 'United States');

SELECT * FROM discografica;

-- insert data into album
INSERT INTO album
	(title, id_artist, id_discografica, cover_image)
VALUES
	('Visiting Hours', 1, 2, '/img/visiting-hours-cover.png'),
    ('Future Nostalgia', 2, 2, '/img/future-nostalgia-cover.png'),
    ('Evolve', 3, 3, '/img/evolve-cover.png');
    
SELECT * FROM album;