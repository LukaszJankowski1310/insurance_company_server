DROP SCHEMA IF EXISTS insurance_company;
CREATE SCHEMA insurance_company;
USE insurance_company;
DROP TABLE IF EXISTS `insurance_offers`;
DROP TABLE IF EXISTS `vehicles`;
DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nick` varchar(45) NOT NULL,
  `login` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `insert_time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_users_login` (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



CREATE TABLE `vehicles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login` varchar(45) NOT NULL,
  `brand` varchar(45) NOT NULL,
  `model` varchar(45) NOT NULL,
  `insert_time` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `login` (`login`),
  CONSTRAINT `login` FOREIGN KEY (`login`) REFERENCES `users` (`login`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `insurance_offers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vehicle_id` bigint(20) NOT NULL,
  `insurer` varchar(45) NOT NULL,
  `price` float DEFAULT NULL,
  `insert_time` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `vehicle_id` (`vehicle_id`),
  CONSTRAINT `vehicle_id` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




INSERT INTO users( nick, login, password, firstname, lastname)   VALUES( 'User1', 'User1', 'pass', 'jan', 'nowak');
INSERT INTO users( nick, login, password, firstname, lastname)   VALUES( 'User2', 'User2', 'pass', 'andrzej', 'kowalski');
INSERT INTO users(nick, login, password, firstname, lastname)   VALUES('User3', 'User3', 'pass', 'stefan', 'malinowski');

INSERT INTO vehicles ( login, brand, model) VALUES ('User1', 'Opel', 'Corsa');
INSERT INTO vehicles ( login, brand, model) VALUES ('User1', 'Opel', 'Astra');
INSERT INTO vehicles ( login, brand, model) VALUES ('User1', 'Volksvagen', 'Golf');


INSERT INTO vehicles (login, brand, model) VALUES ('User2', 'Renault', 'Clio');
INSERT INTO vehicles (login, brand, model) VALUES ('User2', 'Opel', 'Astra');
INSERT INTO vehicles (login, brand, model) VALUES ('User2', 'Renault', 'Captur');


INSERT INTO vehicles ( login, brand, model) VALUES ('User3', 'Honda', 'Civic');
INSERT INTO vehicles ( login, brand, model) VALUES ('User3', 'Opel', 'Astra');
INSERT INTO vehicles ( login, brand, model) VALUES ('User3', 'Volksvagen', 'Polo ');


INSERT INTO insurance_offers(vehicle_id, insurer, price) VALUES (1, 'insurer1', 900.00);
INSERT INTO insurance_offers(vehicle_id, insurer, price) VALUES (1, 'insurer2', 500.00);
INSERT INTO insurance_offers(vehicle_id, insurer, price) VALUES (2, 'insurer1', 300.00);
INSERT INTO insurance_offers(vehicle_id, insurer, price) VALUES (2, 'insurer2', 600.00);

INSERT INTO insurance_offers(vehicle_id, insurer, price) VALUES ( 3, 'insurer1', 900.00);
INSERT INTO insurance_offers(vehicle_id, insurer, price) VALUES ( 3, 'insurer2', 500.00);
INSERT INTO insurance_offers(vehicle_id, insurer, price) VALUES ( 3, 'insurer3', 300.00);


INSERT INTO insurance_offers(vehicle_id, insurer, price) VALUES ( 4, 'insurer1', 900.00);
INSERT INTO insurance_offers(vehicle_id, insurer, price) VALUES ( 4, 'insurer2', 500.00);
INSERT INTO insurance_offers(vehicle_id, insurer, price) VALUES (4, 'insurer3', 300.00);
INSERT INTO insurance_offers( vehicle_id, insurer, price) VALUES (5, 'insurer3', 600.00);
INSERT INTO insurance_offers( vehicle_id, insurer, price) VALUES (5, 'insurer2', 200.00);







