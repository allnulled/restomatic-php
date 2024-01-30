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
CREATE TABLE Entrada_de_blog (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(512),
    subtitulo VARCHAR(1024),
    contenido TEXT,
    fecha_de_creacion DATETIME,
    imagen TEXT
);
CREATE TABLE Libro_de_biblioteca (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(512),
    subtitulo VARCHAR(512),
    resumen TEXT
);
CREATE TABLE Capitulo_de_libro (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(512),
    subtitulo VARCHAR(512),
    contenido TEXT,
    orden INTEGER,
    id_libro INTEGER,
    FOREIGN KEY (id_libro) REFERENCES Libro_de_biblioteca (id)
);
