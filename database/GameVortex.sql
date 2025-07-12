-- -------------------------------------
-- Proyecto : GameVortex - Carrito de compras de videojuegos
-- Autor : Hector Palacios Romero
-- -------------------------------------

-- DROP DATABASE GameVortex;

 CREATE SCHEMA GameVortex;

use GameVortex;

-- Tabla : Categorias
DROP TABLE IF EXISTS Categorias;
CREATE TABLE Categorias(
    IdCategoria CHAR(6) NOT NULL,
    Descripcion VARCHAR(50) NOT NULL,
    Imagen VARCHAR(50) NOT NULL,
    Estado CHAR(1) NOT NULL,
    PRIMARY KEY (IdCategoria),
    CHECK(Estado IN ('0','1'))
);

-- Insertar filas en la tabla Categorias
INSERT INTO Categorias VALUES('GAM001','Juegos de Acción','categoriaAccion.jpg','1');
INSERT INTO Categorias VALUES('GAM002','Juegos de Terror','categoriaTerror.jpg','1');
INSERT INTO Categorias VALUES('GAM003','Juegos de Carreras','categoriaCarreras.jpg','1');
INSERT INTO Categorias VALUES('GAM004','Juegos MOBA','categoriaMoba.jpg','1');
INSERT INTO Categorias VALUES('GAM005','Juegos Shooter','categoriaShooter.jpg','1');
INSERT INTO Categorias VALUES('GAM006','Juegos de Mundo abierto','categoriaMundoAbierto.jpg','1');


-- Tabla : Productos
DROP TABLE IF EXISTS Productos;
CREATE TABLE Productos(
    IdProducto CHAR(8) NOT NULL,
    IdCategoria CHAR(6) NOT NULL,
    Descripcion VARCHAR(50) NOT NULL,
    PrecioUnidad DECIMAL NOT NULL,
    Stock INT NOT NULL,
    Imagen VARCHAR(50) NOT NULL,
    Estado CHAR(1) NOT NULL,
    PRIMARY KEY(IdProducto),
    FOREIGN KEY(IdCategoria) REFERENCES Categorias(IdCategoria),
    CHECK(PrecioUnidad > 0),
    CHECK(Stock > 0),
    CHECK(Estado IN ('0','1'))
);

-- Insertar filas en la tabla Productos
INSERT INTO Productos VALUES('PRO00001','GAM001','Assassin s Creed Valhalla',
150,14,'accion1.jpg','1');
INSERT INTO Productos VALUES('PRO00002','GAM001','Battlefield V',
89,10,'accion2.jpg','1');
INSERT INTO Productos VALUES('PRO00003','GAM001','Death Stranding',
85,9,'accion3.jpg','1');
INSERT INTO Productos VALUES('PRO00004','GAM001','Grand Theft Auto V',
110,10,'accion4.jpg','1');
INSERT INTO Productos VALUES('PRO00005','GAM001','Mortal Kombat',
110,10,'accion5.jpg','1');
INSERT INTO Productos VALUES('PRO00006','GAM001','Red Dead Redemption 2',
110,10,'accion6.jpg','1');

INSERT INTO Productos VALUES('PRO00007','GAM002','The Last of Us',
94,10,'terror1.jpg','1');
INSERT INTO Productos VALUES('PRO00008','GAM002','Killing Floor 2',
45,10,'terror2.jpg','1');
INSERT INTO Productos VALUES('PRO00009','GAM002','Resident Evil 4',
90,10,'terror3.jpg','1');
INSERT INTO Productos VALUES('PRO00010','GAM002','The Evil Within',
150,10,'terror4.jpg','1');
INSERT INTO Productos VALUES('PRO00011','GAM002','7 Days to Die',
150,10,'terror5.jpg','1');
INSERT INTO Productos VALUES('PRO00012','GAM002','Hunt: Showdown',
150,10,'terror6.jpg','1');

INSERT INTO Productos VALUES('PRO00013','GAM003','Mario Kart 8 Deluxe',
90,10,'carrera1.jpg','1');
INSERT INTO Productos VALUES('PRO00014','GAM003','Gran Turismo',
85,10,'carrera2.jpg','1');
INSERT INTO Productos VALUES('PRO00015','GAM003','ModNation Racers',
80,10,'carrera3.jpg','1');
INSERT INTO Productos VALUES('PRO00016','GAM003','Downhill Domination',
75,10,'carrera4.jpg','1');
INSERT INTO Productos VALUES('PRO00017','GAM003','Gran Turismo 7',
75,10,'carrera5.jpg','1');
INSERT INTO Productos VALUES('PRO00018','GAM003','Forza Horizon 5',
75,10,'carrera6.jpg','1');

INSERT INTO Productos VALUES('PRO00019','GAM004','Dota 2',
90,10,'moba1.jpg','1');
INSERT INTO Productos VALUES('PRO00020','GAM004','Pokemon unite',
85,10,'moba2.jpg','1');
INSERT INTO Productos VALUES('PRO00021','GAM004','Brawl Starts',
80,10,'moba3.jpg','1');
INSERT INTO Productos VALUES('PRO00022','GAM004','Smite',
75,10,'moba4.jpg','1');
INSERT INTO Productos VALUES('PRO00023','GAM004','Vain Glory',
75,10,'moba5.jpg','1');
INSERT INTO Productos VALUES('PRO00024','GAM004','Diablo',
75,10,'moba6.jpg','1');

INSERT INTO Productos VALUES('PRO00025','GAM005','Fornite',
90,10,'shooter1.jpg','1');
INSERT INTO Productos VALUES('PRO00026','GAM005','Paladins',
85,10,'shooter2.jpg','1');
INSERT INTO Productos VALUES('PRO00027','GAM005','Overwatch',
80,10,'shooter3.jpg','1');
INSERT INTO Productos VALUES('PRO00028','GAM005','Call of Duty',
75,10,'shooter4.jpg','1');
INSERT INTO Productos VALUES('PRO00029','GAM005','Valorant',
75,10,'shooter5.jpg','1');
INSERT INTO Productos VALUES('PRO00030','GAM005','Warzone',
75,10,'shooter6.jpg','1');

INSERT INTO Productos VALUES('PRO00031','GAM006','The Legend of Zelda',
90,10,'mundo1.jpg','1');
INSERT INTO Productos VALUES('PRO00032','GAM006','Ratchet & Clank',
85,10,'mundo2.jpg','1');
INSERT INTO Productos VALUES('PRO00033','GAM006','Grand Theft Auto: San Andreas',
80,10,'mundo3.jpg','1');
INSERT INTO Productos VALUES('PRO00034','GAM006','Minecraft',
75,10,'mundo4.jpg','1');
INSERT INTO Productos VALUES('PRO00035','GAM006','Horizon Zero Dawn',
75,10,'mundo5.jpg','1');
INSERT INTO Productos VALUES('PRO00036','GAM006','Terraria',
75,10,'mundo6.jpg','1');

-- Crear la tabla de usuarios (si deseas seguir usándola)
DROP TABLE IF EXISTS Usuarios;
CREATE TABLE Usuarios(
    IdUsuario CHAR(8) NOT NULL,
    Apellidos VARCHAR(50) NOT NULL,
    Nombres VARCHAR(50) NOT NULL,
    Direccion VARCHAR(50) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    Sexo CHAR(1) NOT NULL,
    Correo VARCHAR(50) NOT NULL,
    Tipo CHAR(1) NOT NULL,
    Password VARCHAR(50) NOT NULL,
    Estado CHAR(1) NOT NULL,
    PRIMARY KEY(IdUsuario),
    CHECK(Sexo IN ('M','F')),
    CHECK(Estado IN ('0','1')),
    CHECK(Tipo IN ('A','U'))
);

-- Datos de ejemplo
INSERT INTO Usuarios VALUES
('ADM00001', 'Palacios Romero', 'Hector Fernando', 'Av. Pezet 120, San Isidro', '2003-07-19', 'M', 'hectorpalaciosromero@gmail.com', 'A', '123', '1'),
('ADM00002', 'Romero Palacios', 'Fernando Hector', 'Av. Pezet 150, San Isidro', '2007-07-19', 'M', 'fernandopalacios@gmail.com', 'A', '123', '1'),
('ADM00003', 'Rockefeller Vanderbilt', 'Natalia Elizabeth', 'Av. Pezet 194, San Isidro', '1999-09-19', 'F', 'nataliarockefeller@gmail.com', 'A', '123', '1'),
('ADM00004', 'Moreyra Benavides', 'Emma Sofía', 'Calle Los Eucaliptos 210, San Isidro', '1997-12-01', 'F', 'Emma.benavides@gmail.com', 'A', '123', '1'),
('USR00001', 'Walton Ford', 'John James', 'Av. Camino Real 112, San Isidro', '1998-08-07', 'M', 'jwalton@gmail.com', 'U', '123', '1'),
('USR00002', 'Hochschild Durán', 'Camila Sofía', 'Av. Primavera 1234, Surco', '1991-07-11', 'F', 'chochschild@gmail.com', 'U', '123', '1'),
('USR00003', 'Villar Ramos', 'William Ismael', 'Av. Camino Real 112, San Isidro', '1989-12-01', 'M', 'wvillar@gmail.com', 'U', '123', '1'),
('USR00004', 'Benavides Palacios', 'Fernando', 'Calle Los Eucaliptos 555, San Isidro', '2005-07-07', 'M', 'fernandobenavides@gmail.com', 'U', '123', '1'),
('USR00005', 'Campos Pérez', 'Adriana Gabriela', 'Av. Camino Real 112, San Isidro', '1997-03-17', 'F', 'adriana.Campos@gmail.com', 'U', '123', '1'),
('USR00006', 'Campos García', 'Jorge Enrique', 'Av. Víctor Maurtua 200, San Isidro', '1992-08-25', 'M', 'jorge.Campos@gmail.com', 'U', '123', '1'),
('USR00007', 'Silva Toro', 'Melissa Rocío', 'Calle Los Pinos 102, San Isidro', '1995-11-10', 'F', 'melissa.silva@gmail.com', 'U', '123', '1'),
('USR00008', 'Díaz Pinto', 'Carlos Iván', 'Av. Dos de Mayo 890, San Isidro', '1993-01-30', 'M', 'carlos.diaz@gmail.com', 'U', '123', '1'),
('USR00009', 'Navarro Vásquez', 'Fiorella María', 'Av. Santo Toribio 321, San Isidro', '1999-06-18', 'F', 'fiorella.navarro@gmail.com', 'U', '123', '1'),
('USR00010', 'Vallejo Pastor', 'Renzo Manuel', 'Calle Los Robles 300, San Isidro', '1991-10-05', 'M', 'renzo.vallejo@gmail.com', 'U', '123', '1'),
('USR00011', 'Coronado Sánchez', 'Valeria Isabel', 'Av. Arequipa 2450, San Isidro', '1994-04-27', 'F', 'valeria.coronado@gmail.com', 'U', '123', '1'),
('USR00012', 'Campos León', 'Javier Arturo', 'Av. Javier Prado Oeste 1500, San Isidro', '1987-09-09', 'M', 'javier.campos@gmail.com', 'U', '123', '1'),
('USR00013', 'Rodríguez America', 'Patricia Daniela', 'Calle Los Cedros 400, San Isidro', '1996-12-14', 'F', 'patricia.rodríguez@gmail.com', 'U', '123', '1'),
('USR00014', 'López Soto', 'Edgar Manuel', 'Av. El Rosario 155, San Isidro', '1993-03-20', 'M', 'edgar.lopez@gmail.com', 'U', '123', '1'),
('USR00015', 'Tapia Ruiz', 'Sofía Lucia', 'Av. Arenales 1220, San Isidro', '1998-05-15', 'F', 'sofia.tapia@gmail.com', 'U', '123', '1'),
('USR00016', 'Castro Delgado', 'Arthur Alejandro', 'Calle Los Álamos 98, San Isidro', '1990-10-10', 'M', 'arthur.delgado@gmail.com', 'U', '123', '1'),
('USR00017', 'Windsor Vanderbilt', 'James Fernando', 'Av. Camino Real 112, San Isidro', '1998-05-15', 'M', 'james.windsor@gmail.com', 'U', '123', '1');

-- Crear la tabla de clientes con los ajustes propuestos
DROP TABLE IF EXISTS Clientes;

CREATE TABLE clientes (
    IdUsuario CHAR(8) PRIMARY KEY,
    Apellidos VARCHAR(50),
    Nombres VARCHAR(50),
    Direccion VARCHAR(50),
    FechaNacimiento DATE,
    Sexo CHAR(1),
    Correo VARCHAR(50) UNIQUE,
    Password VARCHAR(50),
    Estado CHAR(1) DEFAULT '1'
);

-- Datos para la tabla clientes
INSERT INTO clientes (IdUsuario, Apellidos, Nombres, Direccion, FechaNacimiento, Sexo, Correo, Password, Estado)
VALUES 
('USR00001', 'Walton Ford', 'John James', 'Av. Camino Real 112, San Isidro', '1998-08-07', 'M', 'jwalton@gmail.com', '123', '1'),
('USR00002', 'Hochschild Durán', 'Camila Sofía', 'Av. Primavera 1234, Surco', '1991-07-11', 'F', 'chochschild@gmail.com', '123', '1'),
('USR00003', 'Villar Ramos', 'William Ismael', 'Av. Camino Real 112, San Isidro', '1989-12-01', 'M', 'wvillar@gmail.com', '123', '1'),
('USR00004', 'Benavides Palacios', 'Fernando', 'Calle Los Eucaliptos 555, San Isidro', '2005-07-07', 'M', 'fernandobenavides@gmail.com', '123', '1'),
('USR00005', 'Campos Pérez', 'Adriana Gabriela', 'Av. Camino Real 112, San Isidro', '1997-03-17', 'F', 'adriana.Campos@gmail.com', '123', '1'),
('USR00006', 'Campos García', 'Jorge Enrique', 'Av. Víctor Maurtua 200, San Isidro', '1992-08-25', 'M', 'jorge.Campos@gmail.com', '123', '1'),
('USR00007', 'Silva Toro', 'Melissa Rocío', 'Calle Los Pinos 102, San Isidro', '1995-11-10', 'F', 'melissa.silva@gmail.com', '123', '1'),
('USR00008', 'Díaz Pinto', 'Carlos Iván', 'Av. Dos de Mayo 890, San Isidro', '1993-01-30', 'M', 'carlos.diaz@gmail.com', '1234', '1'),
('USR00009', 'Navarro Vásquez', 'Fiorella María', 'Av. Santo Toribio 321, San Isidro', '1999-06-18', 'F', 'fiorella.navarro@gmail.com', '123', '1'),
('USR00010', 'Vallejo Pastor', 'Renzo Manuel', 'Calle Los Robles 300, San Isidro', '1991-10-05', 'M', 'renzo.vallejo@gmail.com', '123', '1'),
('USR00011', 'Coronado Sánchez', 'Valeria Isabel', 'Av. Arequipa 2450, San Isidro', '1994-04-27', 'F', 'valeria.coronado@gmail.com', '123', '1'),
('USR00012', 'Campos León', 'Javier Arturo', 'Av. Javier Prado Oeste 1500, San Isidro', '1987-09-09', 'M', 'javier.campos@gmail.com', '123', '1'),
('USR00013', 'Rodríguez America', 'Patricia Daniela', 'Calle Los Cedros 400, San Isidro', '1996-12-14', 'F', 'patricia.rodríguez@gmail.com', '123', '1'),
('USR00014', 'López Soto', 'Edgar Manuel', 'Av. El Rosario 155, San Isidro', '1993-03-20', 'M', 'edgar.lopez@gmail.com', '123', '1'),
('USR00015', 'Tapia Ruiz', 'Sofía Lucia', 'Av. Arenales 1220, San Isidro', '1998-05-15', 'F', 'sofia.tapia@gmail.com', '123', '1'),
('USR00016', 'Castro Delgado', 'Arthur Alejandro', 'Calle Los Álamos 98, San Isidro', '1990-10-10', 'M', 'arthur.delgado@gmail.com', '123', '1'),
('USR00017', 'Windsor Vanderbilt', 'James Fernando', 'Av. Camino Real 112, San Isidro', '1998-05-15', 'M', 'james.windsor@gmail.com', '123', '1');

-- Consulta para verificar los datos insertados
SELECT * FROM clientes;
SELECT * FROM Usuarios;
SELECT * FROM Usuarios WHERE Tipo = 'U';

-- Tabla : Ventas
DROP TABLE IF EXISTS Ventas;
CREATE TABLE Ventas(
    IdVenta CHAR(10) NOT NULL,
    IdUsuario CHAR(8) NOT NULL,
    FechaVenta DATE NOT NULL,
    MontoTotal DECIMAL NOT NULL,
    Estado CHAR(1) NOT NULL,
    PRIMARY KEY(IdUsuario,IdVenta),
    CHECK(MontoTotal > 0),
    CHECK(Estado IN ('0','1'))
);

-- Tabla : Detalle
DROP TABLE IF EXISTS Detalle;
CREATE TABLE Detalle(
    IdVenta CHAR(10) NOT NULL,
    IdProducto CHAR(8) NOT NULL,
    Cantidad INT NOT NULL,
    PrecioUnidad DECIMAL NOT NULL,
    Estado CHAR(1) NOT NULL,
    PRIMARY KEY(IdVenta, IdProducto),
    CHECK(Cantidad > 0),
    CHECK(PrecioUnidad >0),
    CHECK(Estado IN ('0','1'))
);

-- PROCEDIMIENTOS ALMACENADOS

-- Store Procedure : ListarUsuarios
DROP PROCEDURE IF EXISTS ListarUsuarios;
DELIMITER @@
CREATE PROCEDURE ListarUsuarios()
BEGIN
	SELECT * FROM Usuarios;
END @@
DELIMITER ;

-- Store Procedure : ListarVentas
DROP PROCEDURE IF EXISTS ListarVentas;
DELIMITER @@
CREATE PROCEDURE ListarVentas()
BEGIN
	SELECT * FROM Ventas;
END @@
DELIMITER ;

-- Store Procedure : ListarDetalle
DROP PROCEDURE IF EXISTS ListarDetalle;
DELIMITER @@
CREATE PROCEDURE ListarDetalle(Id CHAR(10))
BEGIN
	SELECT * FROM Detalle WHERE IdVenta = Id;
END @@
DELIMITER ;

-- Store Procedure : ListarCategorias
DROP PROCEDURE IF EXISTS ListarCategorias;
DELIMITER @@
CREATE PROCEDURE ListarCategorias()
BEGIN
	SELECT * FROM Categorias;
END @@
DELIMITER ;

CALL ListarCategorias();

-- Store Procedure : InfoProducto
DROP PROCEDURE IF EXISTS InfoProducto;
DELIMITER @@
CREATE PROCEDURE InfoProducto(IdProd CHAR(8))
BEGIN
	SELECT * FROM Productos WHERE IdProducto=IdProd;
END @@
DELIMITER ;

CALL InfoProducto('PRO00003');

-- Store Procedure : ListarProductos
DROP PROCEDURE IF EXISTS ListarProductos;
DELIMITER @@
CREATE PROCEDURE ListarProductos()
BEGIN
    SELECT * FROM Productos;
END @@
DELIMITER ;

-- Llamada al procedimiento almacenado
CALL ListarProductos();

-- Store Procedure : ListarProductosXCategoria
DROP PROCEDURE IF EXISTS ListarProductosXCategoria;
DELIMITER @@
CREATE PROCEDURE ListarProductosXCategoria(IdCat CHAR(6))
BEGIN
    SELECT * FROM Productos
    WHERE IdCategoria = IdCat;
END @@
DELIMITER ;

CALL ListarProductosXCategoria('CAT001');

-- Store Procedure : InfoUsuario
DROP PROCEDURE IF EXISTS InfoUsuario;
DELIMITER @@
CREATE PROCEDURE InfoUsuario(Id CHAR(8))
BEGIN
    SELECT * FROM Usuarios
    WHERE IdUsuario = Id;
END @@
DELIMITER ;

CALL InfoUsuario('CLI00001');

-- Store Procedure : InsertaVenta
DROP PROCEDURE IF EXISTS InsertaVenta;
DELIMITER @@
CREATE PROCEDURE InsertaVenta(
    IdVenta CHAR(10),
    IdCliente CHAR(8),
    FechaVenta DATE,
    MontoTotal DECIMAL,
    Estado CHAR(1)
)
BEGIN
    INSERT INTO Ventas VALUES(IdVenta,IdCliente,FechaVenta,MontoTotal,Estado);
END @@
DELIMITER ;

DROP PROCEDURE IF EXISTS RegistrarUsuario;
DELIMITER @@
CREATE PROCEDURE RegistrarUsuario(
    IN p_IdUsuario VARCHAR(50),
    IN p_Apellidos VARCHAR(100),
    IN p_Nombres VARCHAR(100),
    IN p_Direccion VARCHAR(200),
    IN p_FechaNacimiento DATE,
    IN p_Sexo CHAR(1),
    IN p_Correo VARCHAR(100),
    IN p_Password VARCHAR(255)
)
BEGIN
    INSERT INTO Clientes (IdUsuario, Apellidos, Nombres, Direccion, FechaNacimiento, Sexo, Correo, Password, Estado)
    VALUES (p_IdUsuario, p_Apellidos, p_Nombres, p_Direccion, p_FechaNacimiento, p_Sexo, p_Correo, p_Password, '1');
END @@
DELIMITER ;

-- Store Procedure : InsertaDetalle
DROP PROCEDURE IF EXISTS InsertaDetalle;
DELIMITER @@
CREATE PROCEDURE InsertaDetalle(
    IdVenta CHAR(10),
    IdProducto CHAR(8),
    Cantidad INT,
    PrecioUnidad DECIMAL,
    Estado CHAR(1)
)
BEGIN
    INSERT INTO Detalle VALUES(IdVenta,IdProducto,Cantidad,PrecioUnidad,Estado);
END @@

-- Trigger para insertar en la tabla Usuarios cuando se inserta en Clientes
DELIMITER @@

CREATE TRIGGER after_insert_clientes
AFTER INSERT ON clientes
FOR EACH ROW
BEGIN
    INSERT INTO Usuarios (IdUsuario, Apellidos, Nombres, Direccion, FechaNacimiento, Sexo, Correo, Tipo, Password, Estado)
    VALUES (NEW.IdUsuario, NEW.Apellidos, NEW.Nombres, NEW.Direccion, NEW.FechaNacimiento, NEW.Sexo, NEW.Correo, 'U', NEW.Password, NEW.Estado);
END @@

DELIMITER ;
