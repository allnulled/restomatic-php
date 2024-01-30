CREATE TABLE Usuario (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) UNIQUE,
    contrasenya VARCHAR(255),
    correo_electronico VARCHAR(255),
    imagen_de_perfil VARCHAR(516),
    descripcion VARCHAR(255)
);
CREATE TABLE Permiso (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) UNIQUE,
    descripcion VARCHAR(255)
);
CREATE TABLE Usuario_y_permiso (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    id_usuario INTEGER,
    id_permiso INTEGER,
    detalles VARCHAR(255),
    FOREIGN KEY (id_usuario) REFERENCES Usuario (id),
    FOREIGN KEY (id_permiso) REFERENCES Permiso (id)
);
CREATE TABLE Pais (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    pais VARCHAR(255),
    iso VARCHAR(10)
);