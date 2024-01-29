CREATE TABLE Usuario (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(255) UNIQUE,
    contrasenya VARCHAR(255),
    correo_electronico VARCHAR(255),
    imagen_de_perfil VARCHAR(516),
    descripcion VARCHAR(255)
);
CREATE TABLE Permiso (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(255) UNIQUE,
    descripcion VARCHAR(255)
);
CREATE TABLE Usuario_y_permiso (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_usuario INTEGER,
    id_permiso INTEGER,
    detalles VARCHAR(255),
    FOREIGN KEY (id_usuario) REFERENCES Usuario (id),
    FOREIGN KEY (id_permiso) REFERENCES Permiso (id)
);

