CREATE DATABASE Tienda;

USE Clientes;

CREATE TABLE Clientes (
IDCliente int NOT NULL AUTO_INCREMENT PRIMARY KEY,
Nombre nvarchar(50) NOT NULL,
ApellidoPaterno nvarchar(50) NOT NULL,
ApellidoMaterno nvarchar(50) NULL,
Telefono nvarchar(20) NULL,
Email nvarchar(25) NULL,
Direccion nvarchar(25) NOT NULL,
Ciudad nvarchar(25) NULL,
Pais nvarchar(4) NULL
);


INSERT INTO Clientes
  VALUES (1, 'Barbara', 
  'Becket', 
  NULL, 
  '81818181',
  'barbeck@email.com',
  '67 Willow Drive',
  'City',
  'USA'
  );

  INSERT INTO Clientes
  VALUES (2, 'Pepito', 
  'Sharkchenneger', 
  'Sinth', 
  '80000000',
  'pepshark@email.com',
  '67 Synth Ave.',
  'Synth City',
  'MX'
  );




  
CREATE TABLE Usuarios(
IDUsuario int NOT NULL AUTO_INCREMENT PRIMARY KEY,
Usuario nvarchar(50) NOT NULL,
Password nvarchar(50) NOT NULL
);

INSERT INTO Usuarios
VALUES (1, 'admin','admin');

INSERT INTO Usuarios
VALUES (2, 'Ventas','ventas123');



