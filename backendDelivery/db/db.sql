DROP TABLE IF EXISTS roles CASCADE;
CREATE TABLE roles(
	id BIGSERIAL PRIMARY KEY,
	name VARCHAR(180) NOT NULL UNIQUE,
	image VARCHAR(255) NULL,
	route VARCHAR(255) NULL,
	created_at TIMESTAMP(0) NOT NULL,
	update_at TIMESTAMP(0) NOT NULL

);


DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users(
    id BIGSERIAL PRIMARY KEY,
    email VARCHAR (255) NOT NULL UNIQUE,
	name VARCHAR (255) NOT NULL,
	lastname VARCHAR (255) NOT NULL,
	phone VARCHAR (80) NOT NULL UNIQUE,
	image VARCHAR (255)NULL,
	password VARCHAR(255) NOT NULL,
	is_available BOOLEAN NULL,
	session_token VARCHAR (255) NULL,
	created_at TIMESTAMP (0) NOT NULL,
	update_at TIMESTAMP (0) NOT NULL
);

DROP TABLE IF EXISTS users_has_roles CASCADE;
CREATE TABLE users_has_roles(
	id_user BIGSERIAL NOT NULL,
	id_rol BIGSERIAL NOT NULL,
	created_at TIMESTAMP(0) NOT NULL,
	update_at TIMESTAMP(0) NOT NULL,
	FOREIGN KEY(id_user) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(id_rol) REFERENCES roles(id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(id_user, id_rol)

);


INSERT INTO  roles(
    name,
    route,
	image,
	created_at,
	update_at
	
)
VALUES(
'CLIENTE',
	'client/home',
	'https://www.pngfind.com/pngs/m/470-4703547_icon-user-icon-hd-png-download.png',
	'2023-09-17',
	'2023-09-17'

);

INSERT INTO  roles(
    name,
    route,
	image,
	created_at,
	update_at
	
)
VALUES(
'RESTAURANTE',
	'restaurant/home',
	'https://banner2.cleanpng.com/20180407/utq/kisspng-computer-icons-hotel-room-resturant-5ac87e63596821.7773698515230889953662.jpg',
	'2023-09-17',
	'2023-09-17'

);

INSERT INTO  roles(
    name,
    route,
	image,
	created_at,
	update_at
	
)
VALUES(
'REPARTIDOR',
	'delivery/home',
	'https://www.citypng.com/public/uploads/preview/fast-scooter-delivery-shipping-blue-icon-free-png-21635366061nmkluyyxoh.png',
	'2023-09-17',
	'2023-09-17'

);