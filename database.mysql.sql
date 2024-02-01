-- Crear tabla de clientes
CREATE TABLE IF NOT EXISTS clientes (
    cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    direccion VARCHAR(255),
    telefono VARCHAR(15)
);

-- Crear tabla de productos
CREATE TABLE IF NOT EXISTS productos (
    producto_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL
);

-- Crear tabla de órdenes de venta
CREATE TABLE IF NOT EXISTS ordenes_venta (
    orden_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    fecha_venta DATE,
    total DECIMAL(10, 2),
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

-- Crear tabla de detalles de órdenes de venta
CREATE TABLE IF NOT EXISTS detalles_orden_venta (
    detalle_id INT PRIMARY KEY AUTO_INCREMENT,
    orden_id INT,
    producto_id INT,
    cantidad INT,
    precio_unitario DECIMAL(10, 2),
    subtotal DECIMAL(10, 2),
    FOREIGN KEY (orden_id) REFERENCES ordenes_venta(orden_id),
    FOREIGN KEY (producto_id) REFERENCES productos(producto_id)
);

-- Crear tabla de empleados
CREATE TABLE IF NOT EXISTS empleados (
    empleado_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    cargo VARCHAR(255),
    fecha_contratacion DATE,
    salario DECIMAL(10, 2)
);

-- Crear tabla de proveedores
CREATE TABLE IF NOT EXISTS proveedores (
    proveedor_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    direccion VARCHAR(255),
    telefono VARCHAR(15)
);

-- Crear tabla de compras
CREATE TABLE IF NOT EXISTS compras (
    compra_id INT PRIMARY KEY AUTO_INCREMENT,
    proveedor_id INT,
    fecha_compra DATE,
    total DECIMAL(10, 2),
    FOREIGN KEY (proveedor_id) REFERENCES proveedores(proveedor_id)
);

-- Crear tabla de detalles de compras
CREATE TABLE IF NOT EXISTS detalles_compra (
    detalle_compra_id INT PRIMARY KEY AUTO_INCREMENT,
    compra_id INT,
    producto_id INT,
    cantidad INT,
    precio_unitario DECIMAL(10, 2),
    subtotal DECIMAL(10, 2),
    FOREIGN KEY (compra_id) REFERENCES compras(compra_id),
    FOREIGN KEY (producto_id) REFERENCES productos(producto_id)
);

-- Crear tabla de departamentos
CREATE TABLE IF NOT EXISTS departamentos (
    departamento_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_departamento VARCHAR(255) NOT NULL
);

-- Crear tabla de empleados_departamentos para gestionar la relación muchos a muchos entre empleados y departamentos
CREATE TABLE IF NOT EXISTS empleados_departamentos (
    empleado_id INT,
    departamento_id INT,
    PRIMARY KEY (empleado_id, departamento_id),
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id),
    FOREIGN KEY (departamento_id) REFERENCES departamentos(departamento_id)
);

-- Crear tabla de inventario para gestionar el control de inventario
CREATE TABLE IF NOT EXISTS inventario (
    inventario_id INT PRIMARY KEY AUTO_INCREMENT,
    producto_id INT,
    cantidad INT,
    fecha_actualizacion DATE,
    FOREIGN KEY (producto_id) REFERENCES productos(producto_id)
);

-- Crear tabla de facturas para gestionar las transacciones financieras
CREATE TABLE IF NOT EXISTS facturas (
    factura_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    fecha_factura DATE,
    total DECIMAL(10, 2),
    estado_pago VARCHAR(50),
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

-- Crear tabla de detalles de facturas
CREATE TABLE IF NOT EXISTS detalles_factura (
    detalle_factura_id INT PRIMARY KEY AUTO_INCREMENT,
    factura_id INT,
    producto_id INT,
    cantidad INT,
    precio_unitario DECIMAL(10, 2),
    subtotal DECIMAL(10, 2),
    FOREIGN KEY (factura_id) REFERENCES facturas(factura_id),
    FOREIGN KEY (producto_id) REFERENCES productos(producto_id)
);

-- Crear tabla de cuentas por pagar para gestionar las obligaciones financieras
CREATE TABLE IF NOT EXISTS cuentas_por_pagar (
    cuenta_id INT PRIMARY KEY AUTO_INCREMENT,
    proveedor_id INT,
    fecha_vencimiento DATE,
    monto DECIMAL(10, 2),
    estado_pago VARCHAR(50),
    FOREIGN KEY (proveedor_id) REFERENCES proveedores(proveedor_id)
);

-- Crear tabla de activos fijos para gestionar los bienes de la empresa
CREATE TABLE IF NOT EXISTS activos_fijos (
    activo_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_activo VARCHAR(255) NOT NULL,
    valor DECIMAL(10, 2),
    fecha_adquisicion DATE
);

-- Crear tabla de proyectos para gestionar proyectos internos de la empresa
CREATE TABLE IF NOT EXISTS proyectos (
    proyecto_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_proyecto VARCHAR(255) NOT NULL,
    fecha_inicio DATE,
    fecha_fin DATE
);

-- Crear tabla de tareas para gestionar las actividades asociadas a proyectos
CREATE TABLE IF NOT EXISTS tareas (
    tarea_id INT PRIMARY KEY AUTO_INCREMENT,
    proyecto_id INT,
    descripcion VARCHAR(255) NOT NULL,
    estado VARCHAR(50),
    fecha_inicio DATE,
    fecha_fin DATE,
    FOREIGN KEY (proyecto_id) REFERENCES proyectos(proyecto_id)
);

-- Crear tabla de roles para gestionar los permisos y responsabilidades de los empleados
CREATE TABLE IF NOT EXISTS roles (
    rol_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_rol VARCHAR(255) NOT NULL
);

-- Crear tabla de empleados_roles para gestionar la relación muchos a muchos entre empleados y roles
CREATE TABLE IF NOT EXISTS empleados_roles (
    empleado_id INT,
    rol_id INT,
    PRIMARY KEY (empleado_id, rol_id),
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id),
    FOREIGN KEY (rol_id) REFERENCES roles(rol_id)
);

-- Crear tabla de notificaciones para gestionar las comunicaciones internas
CREATE TABLE IF NOT EXISTS notificaciones (
    notificacion_id INT PRIMARY KEY AUTO_INCREMENT,
    empleado_id INT,
    mensaje TEXT,
    fecha_envio DATETIME,
    leida BOOLEAN,
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);

-- Crear tabla de gastos para gestionar los costos operativos
CREATE TABLE IF NOT EXISTS gastos (
    gasto_id INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(255) NOT NULL,
    monto DECIMAL(10, 2),
    fecha_gasto DATE
);

-- Crear tabla de cuentas bancarias para gestionar las transacciones financieras
CREATE TABLE IF NOT EXISTS cuentas_bancarias (
    cuenta_bancaria_id INT PRIMARY KEY AUTO_INCREMENT,
    banco VARCHAR(255) NOT NULL,
    numero_cuenta VARCHAR(20) NOT NULL,
    saldo_actual DECIMAL(10, 2)
);

-- Crear tabla de transacciones bancarias
CREATE TABLE IF NOT EXISTS transacciones_bancarias (
    transaccion_id INT PRIMARY KEY AUTO_INCREMENT,
    cuenta_bancaria_id INT,
    descripcion VARCHAR(255),
    monto DECIMAL(10, 2),
    fecha_transaccion DATETIME,
    FOREIGN KEY (cuenta_bancaria_id) REFERENCES cuentas_bancarias(cuenta_bancaria_id)
);

-- Crear tabla de eventos para gestionar calendarios y programaciones
CREATE TABLE IF NOT EXISTS eventos (
    evento_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_evento VARCHAR(255) NOT NULL,
    fecha_inicio DATETIME,
    fecha_fin DATETIME
);

-- Crear tabla de participantes en eventos
CREATE TABLE IF NOT EXISTS participantes_evento (
    participante_id INT PRIMARY KEY AUTO_INCREMENT,
    empleado_id INT,
    evento_id INT,
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id),
    FOREIGN KEY (evento_id) REFERENCES eventos(evento_id)
);

-- Crear tabla de usuarios para gestionar el acceso al sistema
CREATE TABLE IF NOT EXISTS usuarios (
    usuario_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_usuario VARCHAR(50) NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    empleado_id INT,
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);

-- Crear tabla de auditoría para registrar cambios en la base de datos
CREATE TABLE IF NOT EXISTS auditoria (
    auditoria_id INT PRIMARY KEY AUTO_INCREMENT,
    tabla_afectada VARCHAR(255) NOT NULL,
    accion_realizada VARCHAR(50) NOT NULL,
    fecha_registro DATETIME,
    usuario_id INT,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id)
);

-- Crear tabla de mensajes para la comunicación interna
CREATE TABLE IF NOT EXISTS mensajes (
    mensaje_id INT PRIMARY KEY AUTO_INCREMENT,
    remitente_id INT,
    destinatario_id INT,
    contenido TEXT,
    fecha_envio DATETIME,
    leido BOOLEAN,
    FOREIGN KEY (remitente_id) REFERENCES empleados(empleado_id),
    FOREIGN KEY (destinatario_id) REFERENCES empleados(empleado_id)
);

-- Crear tabla de permisos para asignar permisos específicos a roles
CREATE TABLE IF NOT EXISTS permisos (
    permiso_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_permiso VARCHAR(255) NOT NULL
);

-- Crear tabla de roles_permisos para gestionar la relación muchos a muchos entre roles y permisos
CREATE TABLE IF NOT EXISTS roles_permisos (
    rol_id INT,
    permiso_id INT,
    PRIMARY KEY (rol_id, permiso_id),
    FOREIGN KEY (rol_id) REFERENCES roles(rol_id),
    FOREIGN KEY (permiso_id) REFERENCES permisos(permiso_id)
);

-- Crear tabla de contratos para gestionar acuerdos y términos legales
CREATE TABLE IF NOT EXISTS contratos (
    contrato_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_contrato VARCHAR(255) NOT NULL,
    fecha_inicio DATE,
    fecha_fin DATE,
    detalles TEXT
);

-- Crear tabla de recursos_humanos para gestionar información adicional sobre empleados
CREATE TABLE IF NOT EXISTS recursos_humanos (
    empleado_id INT PRIMARY KEY,
    fecha_nacimiento DATE,
    genero VARCHAR(10),
    estado_civil VARCHAR(20),
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);

-- Crear tabla de proyectos_tareas para gestionar la relación muchos a muchos entre proyectos y tareas
CREATE TABLE IF NOT EXISTS proyectos_tareas (
    proyecto_id INT,
    tarea_id INT,
    PRIMARY KEY (proyecto_id, tarea_id),
    FOREIGN KEY (proyecto_id) REFERENCES proyectos(proyecto_id),
    FOREIGN KEY (tarea_id) REFERENCES tareas(tarea_id)
);

-- Crear tabla de ubicaciones para gestionar la información geográfica
CREATE TABLE IF NOT EXISTS ubicaciones (
    ubicacion_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_ubicacion VARCHAR(255) NOT NULL,
    direccion VARCHAR(255),
    ciudad VARCHAR(50),
    codigo_postal VARCHAR(15),
    pais VARCHAR(50)
);

-- Crear tabla de ventas para rastrear transacciones de venta
CREATE TABLE IF NOT EXISTS ventas (
    venta_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    fecha_venta DATE,
    total DECIMAL(10, 2),
    estado VARCHAR(50),
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

-- Crear tabla de devoluciones de ventas
CREATE TABLE IF NOT EXISTS devoluciones_ventas (
    devolucion_venta_id INT PRIMARY KEY AUTO_INCREMENT,
    venta_id INT,
    fecha_devolucion DATE,
    motivo VARCHAR(255),
    FOREIGN KEY (venta_id) REFERENCES ventas(venta_id)
);

-- Crear tabla de gastos_generales para rastrear otros gastos operativos
CREATE TABLE IF NOT EXISTS gastos_generales (
    gasto_general_id INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(255) NOT NULL,
    monto DECIMAL(10, 2),
    fecha_gasto DATE
);

-- Crear tabla de mantenimiento para rastrear las actividades de mantenimiento
CREATE TABLE IF NOT EXISTS mantenimiento (
    mantenimiento_id INT PRIMARY KEY AUTO_INCREMENT,
    equipo_id INT,
    fecha_mantenimiento DATE,
    descripcion VARCHAR(255),
    costo DECIMAL(10, 2),
    FOREIGN KEY (equipo_id) REFERENCES activos_fijos(activo_id)
);

-- Crear tabla de encuestas para recopilar feedback de los empleados o clientes
CREATE TABLE IF NOT EXISTS encuestas (
    encuesta_id INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(255) NOT NULL,
    fecha_inicio DATE,
    fecha_fin DATE
);

-- Crear tabla de respuestas de encuestas
CREATE TABLE IF NOT EXISTS respuestas_encuesta (
    respuesta_id INT PRIMARY KEY AUTO_INCREMENT,
    encuesta_id INT,
    empleado_id INT,
    respuesta TEXT,
    FOREIGN KEY (encuesta_id) REFERENCES encuestas(encuesta_id),
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);

-- Crear tabla de documentos_adjuntos para almacenar archivos asociados a registros
CREATE TABLE IF NOT EXISTS documentos_adjuntos (
    documento_id INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(255),
    ruta_archivo VARCHAR(255),
    fecha_creacion DATETIME
);

-- Crear tabla de competencias para gestionar las habilidades y conocimientos del personal
CREATE TABLE IF NOT EXISTS competencias (
    competencia_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_competencia VARCHAR(255) NOT NULL,
    descripcion TEXT
);

-- Crear tabla de evaluaciones_desempeno para registrar evaluaciones del desempeño del personal
CREATE TABLE IF NOT EXISTS evaluaciones_desempeno (
    evaluacion_id INT PRIMARY KEY AUTO_INCREMENT,
    empleado_id INT,
    fecha_evaluacion DATE,
    puntuacion DECIMAL(5, 2),
    comentarios TEXT,
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);

-- Crear tabla de turnos para gestionar los horarios de trabajo del personal
CREATE TABLE IF NOT EXISTS turnos (
    turno_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_turno VARCHAR(255) NOT NULL,
    hora_inicio TIME,
    hora_fin TIME
);

-- Crear tabla de asignaciones_turno para asignar turnos a empleados
CREATE TABLE IF NOT EXISTS asignaciones_turno (
    asignacion_id INT PRIMARY KEY AUTO_INCREMENT,
    empleado_id INT,
    turno_id INT,
    fecha_asignacion DATE,
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id),
    FOREIGN KEY (turno_id) REFERENCES turnos(turno_id)
);

-- Crear tabla de reclutamiento para gestionar el proceso de contratación de personal
CREATE TABLE IF NOT EXISTS reclutamiento (
    solicitud_id INT PRIMARY KEY AUTO_INCREMENT,
    puesto VARCHAR(255) NOT NULL,
    fecha_solicitud DATE,
    estado VARCHAR(50),
    descripcion TEXT
);

-- Crear tabla de candidatos para el proceso de reclutamiento
CREATE TABLE IF NOT EXISTS candidatos (
    candidato_id INT PRIMARY KEY AUTO_INCREMENT,
    solicitud_id INT,
    nombre_candidato VARCHAR(255) NOT NULL,
    cv_ruta_archivo VARCHAR(255),
    estado VARCHAR(50),
    FOREIGN KEY (solicitud_id) REFERENCES reclutamiento(solicitud_id)
);

-- Crear tabla de ofertas_laborales para publicar oportunidades de trabajo
CREATE TABLE IF NOT EXISTS ofertas_laborales (
    oferta_id INT PRIMARY KEY AUTO_INCREMENT,
    puesto VARCHAR(255) NOT NULL,
    descripcion TEXT,
    fecha_publicacion DATE,
    estado VARCHAR(50)
);

-- Crear tabla de postulaciones para el seguimiento de postulantes a ofertas laborales
CREATE TABLE IF NOT EXISTS postulaciones (
    postulacion_id INT PRIMARY KEY AUTO_INCREMENT,
    oferta_id INT,
    candidato_id INT,
    fecha_postulacion DATE,
    estado VARCHAR(50),
    FOREIGN KEY (oferta_id) REFERENCES ofertas_laborales(oferta_id),
    FOREIGN KEY (candidato_id) REFERENCES candidatos(candidato_id)
);

-- Crear tabla de incidentes para gestionar problemas o situaciones imprevistas
CREATE TABLE IF NOT EXISTS incidentes (
    incidente_id INT PRIMARY KEY AUTO_INCREMENT,
    descripcion TEXT,
    fecha_reporte DATETIME,
    estado VARCHAR(50)
);

-- Crear tabla de soluciones_incidentes para registrar acciones tomadas ante incidentes
CREATE TABLE IF NOT EXISTS soluciones_incidentes (
    solucion_id INT PRIMARY KEY AUTO_INCREMENT,
    incidente_id INT,
    descripcion TEXT,
    fecha_solucion DATETIME,
    FOREIGN KEY (incidente_id) REFERENCES incidentes(incidente_id)
);

-- Crear tabla de contratos_clientes para gestionar acuerdos con clientes
CREATE TABLE IF NOT EXISTS contratos_clientes (
    contrato_cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    detalles TEXT,
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

-- Crear tabla de suscripciones para gestionar servicios o productos suscritos
CREATE TABLE IF NOT EXISTS suscripciones (
    suscripcion_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    producto_id INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    estado VARCHAR(50),
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
    FOREIGN KEY (producto_id) REFERENCES productos(producto_id)
);

-- Crear tabla de clasificaciones para categorizar productos o servicios
CREATE TABLE IF NOT EXISTS clasificaciones (
    clasificacion_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_clasificacion VARCHAR(255) NOT NULL,
    descripcion TEXT
);

-- Crear tabla de eventos_calendario para gestionar eventos y recordatorios
CREATE TABLE IF NOT EXISTS eventos_calendario (
    evento_calendario_id INT PRIMARY KEY AUTO_INCREMENT,
    empleado_id INT,
    titulo VARCHAR(255) NOT NULL,
    descripcion TEXT,
    fecha_inicio DATETIME,
    fecha_fin DATETIME,
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);

-- Crear tabla de archivos_adjuntos para almacenar documentos o archivos relacionados
CREATE TABLE IF NOT EXISTS archivos_adjuntos (
    archivo_id INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(255),
    ruta_archivo VARCHAR(255),
    fecha_creacion DATETIME
);

-- Crear tabla de votaciones para recopilar opiniones o decisiones de los empleados
CREATE TABLE IF NOT EXISTS votaciones (
    votacion_id INT PRIMARY KEY AUTO_INCREMENT,
    descripcion TEXT,
    fecha_inicio DATETIME,
    fecha_fin DATETIME,
    resultado VARCHAR(50)
);

-- Crear tabla de notificaciones_sistema para gestionar mensajes y alertas del sistema
CREATE TABLE IF NOT EXISTS notificaciones_sistema (
    notificacion_sistema_id INT PRIMARY KEY AUTO_INCREMENT,
    tipo_notificacion VARCHAR(50) NOT NULL,
    contenido TEXT,
    fecha_creacion DATETIME
);

-- Crear tabla de devoluciones_compras para gestionar devoluciones de productos comprados
CREATE TABLE IF NOT EXISTS devoluciones_compras (
    devolucion_compra_id INT PRIMARY KEY AUTO_INCREMENT,
    compra_id INT,
    fecha_devolucion DATE,
    motivo VARCHAR(255),
    FOREIGN KEY (compra_id) REFERENCES compras(compra_id)
);

-- Crear tabla de presupuestos para gestionar proyecciones de gastos e ingresos
CREATE TABLE IF NOT EXISTS presupuestos (
    presupuesto_id INT PRIMARY KEY AUTO_INCREMENT,
    descripcion TEXT,
    fecha_inicio DATE,
    fecha_fin DATE,
    estado VARCHAR(50)
);

-- Crear tabla de detalles_presupuesto para especificar partidas dentro de un presupuesto
CREATE TABLE IF NOT EXISTS detalles_presupuesto (
    detalle_presupuesto_id INT PRIMARY KEY AUTO_INCREMENT,
    presupuesto_id INT,
    concepto VARCHAR(255) NOT NULL,
    monto DECIMAL(10, 2),
    FOREIGN KEY (presupuesto_id) REFERENCES presupuestos(presupuesto_id)
);

-- Crear tabla de mantenimiento_preventivo para programar y registrar mantenimientos preventivos
CREATE TABLE IF NOT EXISTS mantenimiento_preventivo (
    mantenimiento_preventivo_id INT PRIMARY KEY AUTO_INCREMENT,
    equipo_id INT,
    descripcion TEXT,
    fecha_programada DATE,
    fecha_realizacion DATE,
    costo DECIMAL(10, 2),
    FOREIGN KEY (equipo_id) REFERENCES activos_fijos(activo_id)
);

-- Crear tabla de informes para almacenar reportes y análisis de datos
CREATE TABLE IF NOT EXISTS informes (
    informe_id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    descripcion TEXT,
    fecha_creacion DATETIME,
    contenido TEXT
);

-- Crear tabla de comentarios para permitir a los usuarios dejar comentarios en diferentes secciones del sistema
CREATE TABLE IF NOT EXISTS comentarios (
    comentario_id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT,
    seccion_id INT,
    texto_comentario TEXT,
    fecha_creacion DATETIME,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id)
);

-- Crear tabla de descuentos para gestionar políticas de descuentos en productos o servicios
CREATE TABLE IF NOT EXISTS descuentos (
    descuento_id INT PRIMARY KEY AUTO_INCREMENT,
    porcentaje DECIMAL(5, 2) NOT NULL,
    descripcion TEXT
);

-- Crear tabla de eventos_logisticos para gestionar eventos relacionados con la cadena de suministro y logística
CREATE TABLE IF NOT EXISTS eventos_logisticos (
    evento_logistico_id INT PRIMARY KEY AUTO_INCREMENT,
    descripcion TEXT,
    fecha_evento DATETIME,
    tipo_evento VARCHAR(50),
    ubicacion_id INT,
    FOREIGN KEY (ubicacion_id) REFERENCES ubicaciones(ubicacion_id)
);

-- Crear tabla de rastreo_productos para seguir la ubicación y estado de los productos en tiempo real
CREATE TABLE IF NOT EXISTS rastreo_productos (
    rastreo_id INT PRIMARY KEY AUTO_INCREMENT,
    producto_id INT,
    ubicacion_id INT,
    fecha_rastreo DATETIME,
    estado_producto VARCHAR(50),
    FOREIGN KEY (producto_id) REFERENCES productos(producto_id),
    FOREIGN KEY (ubicacion_id) REFERENCES ubicaciones(ubicacion_id)
);

-- Crear tabla de condiciones_almacenamiento para especificar requisitos de almacenamiento para ciertos productos
CREATE TABLE IF NOT EXISTS condiciones_almacenamiento (
    condicion_id INT PRIMARY KEY AUTO_INCREMENT,
    producto_id INT,
    temperatura_min DECIMAL(5, 2),
    temperatura_max DECIMAL(5, 2),
    humedad_min DECIMAL(5, 2),
    humedad_max DECIMAL(5, 2),
    FOREIGN KEY (producto_id) REFERENCES productos(producto_id)
);

-- Crear tabla de reportes_financieros para almacenar informes financieros y contables
CREATE TABLE IF NOT EXISTS reportes_financieros (
    reporte_financiero_id INT PRIMARY KEY AUTO_INCREMENT,
    tipo_reporte VARCHAR(50) NOT NULL,
    fecha_creacion DATETIME,
    contenido TEXT
);

-- Crear tabla de documentos_legales para gestionar contratos, licencias y otros documentos legales
CREATE TABLE IF NOT EXISTS documentos_legales (
    documento_legal_id INT PRIMARY KEY AUTO_INCREMENT,
    tipo_documento VARCHAR(50) NOT NULL,
    descripcion TEXT,
    fecha_creacion DATE
);

-- Crear tabla de transacciones_inventario para rastrear cambios en los niveles de inventario
CREATE TABLE IF NOT EXISTS transacciones_inventario (
    transaccion_inventario_id INT PRIMARY KEY AUTO_INCREMENT,
    producto_id INT,
    cantidad INT,
    tipo_transaccion VARCHAR(50),
    fecha_transaccion DATETIME,
    FOREIGN KEY (producto_id) REFERENCES productos(producto_id)
);

-- Crear tabla de datos_geograficos para almacenar información geográfica detallada
CREATE TABLE IF NOT EXISTS datos_geograficos (
    dato_geografico_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_lugar VARCHAR(255) NOT NULL,
    tipo_lugar VARCHAR(50),
    latitud DECIMAL(9, 6),
    longitud DECIMAL(9, 6)
);

-- Crear tabla de auditoria_sistema para registrar eventos importantes en el sistema
CREATE TABLE IF NOT EXISTS auditoria_sistema (
    auditoria_sistema_id INT PRIMARY KEY AUTO_INCREMENT,
    evento VARCHAR(255) NOT NULL,
    descripcion TEXT,
    fecha_registro DATETIME,
    usuario_id INT,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id)
);

-- Crear tabla de horarios_trabajo para gestionar los horarios laborales de los empleados
CREATE TABLE IF NOT EXISTS horarios_trabajo (
    horario_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_horario VARCHAR(255) NOT NULL,
    hora_entrada TIME,
    hora_salida TIME
);

-- Crear tabla de asistencias para registrar la asistencia diaria de los empleados
CREATE TABLE IF NOT EXISTS asistencias (
    asistencia_id INT PRIMARY KEY AUTO_INCREMENT,
    empleado_id INT,
    fecha_asistencia DATE,
    hora_entrada TIME,
    hora_salida TIME,
    estado VARCHAR(50),
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);

-- Crear tabla de permisos_empleados para gestionar los permisos solicitados por los empleados
CREATE TABLE IF NOT EXISTS permisos_empleados (
    permiso_empleado_id INT PRIMARY KEY AUTO_INCREMENT,
    empleado_id INT,
    fecha_solicitud DATE,
    motivo VARCHAR(255),
    estado VARCHAR(50),
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);

-- Crear tabla de objetivos para establecer y medir los objetivos de los empleados o equipos
CREATE TABLE IF NOT EXISTS objetivos (
    objetivo_id INT PRIMARY KEY AUTO_INCREMENT,
    descripcion TEXT,
    fecha_inicio DATE,
    fecha_fin DATE,
    estado VARCHAR(50)
);

-- Crear tabla de avances_objetivos para registrar el progreso hacia los objetivos
CREATE TABLE IF NOT EXISTS avances_objetivos (
    avance_id INT PRIMARY KEY AUTO_INCREMENT,
    objetivo_id INT,
    empleado_id INT,
    porcentaje_avance DECIMAL(5, 2),
    fecha_registro DATETIME,
    FOREIGN KEY (objetivo_id) REFERENCES objetivos(objetivo_id),
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);

-- Crear tabla de turnos_rotativos para gestionar horarios de trabajo rotativos
CREATE TABLE IF NOT EXISTS turnos_rotativos (
    turno_rotativo_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_turno_rotativo VARCHAR(255) NOT NULL
);

-- Crear tabla de asignaciones_turno_rotativo para asignar turnos rotativos a empleados
CREATE TABLE IF NOT EXISTS asignaciones_turno_rotativo (
    asignacion_turno_rotativo_id INT PRIMARY KEY AUTO_INCREMENT,
    empleado_id INT,
    turno_rotativo_id INT,
    fecha_asignacion DATE,
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id),
    FOREIGN KEY (turno_rotativo_id) REFERENCES turnos_rotativos(turno_rotativo_id)
);

-- Crear tabla de pedidos para gestionar las solicitudes de productos o servicios
CREATE TABLE IF NOT EXISTS pedidos (
    pedido_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    fecha_pedido DATE,
    estado VARCHAR(50),
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

-- Crear tabla de detalles_pedido para especificar los productos en cada pedido
CREATE TABLE IF NOT EXISTS detalles_pedido (
    detalle_pedido_id INT PRIMARY KEY AUTO_INCREMENT,
    pedido_id INT,
    producto_id INT,
    cantidad INT,
    precio_unitario DECIMAL(10, 2),
    subtotal DECIMAL(10, 2),
    FOREIGN KEY (pedido_id) REFERENCES pedidos(pedido_id),
    FOREIGN KEY (producto_id) REFERENCES productos(producto_id)
);

-- Crear tabla de registros_vacaciones para gestionar las solicitudes y saldos de vacaciones de los empleados
CREATE TABLE IF NOT EXISTS registros_vacaciones (
    registro_vacaciones_id INT PRIMARY KEY AUTO_INCREMENT,
    empleado_id INT,
    fecha_solicitud DATE,
    fecha_inicio DATE,
    fecha_fin DATE,
    estado VARCHAR(50),
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);

-- Crear tabla de beneficios_empleados para gestionar los beneficios otorgados a los empleados
CREATE TABLE IF NOT EXISTS beneficios_empleados (
    beneficio_empleado_id INT PRIMARY KEY AUTO_INCREMENT,
    empleado_id INT,
    tipo_beneficio VARCHAR(255) NOT NULL,
    descripcion TEXT,
    fecha_otorgamiento DATE,
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);

-- Crear tabla de viajes_negocios para registrar viajes de negocios de los empleados
CREATE TABLE IF NOT EXISTS viajes_negocios (
    viaje_negocio_id INT PRIMARY KEY AUTO_INCREMENT,
    empleado_id INT,
    destino VARCHAR(255) NOT NULL,
    fecha_salida DATE,
    fecha_regreso DATE,
    motivo_viaje TEXT,
    estado VARCHAR(50),
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);

-- Crear tabla de pagos_nomina para gestionar el proceso de nómina
CREATE TABLE IF NOT EXISTS pagos_nomina (
    pago_nomina_id INT PRIMARY KEY AUTO_INCREMENT,
    empleado_id INT,
    fecha_pago DATE,
    monto DECIMAL(10, 2),
    concepto VARCHAR(255),
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);

-- Crear tabla de capacitaciones
CREATE TABLE IF NOT EXISTS capacitaciones (
    capacitacion_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255),
    descripcion TEXT
);

-- Crear tabla de capacitaciones_empleados para registrar la participación de empleados en capacitaciones
CREATE TABLE IF NOT EXISTS capacitaciones_empleados (
    capacitacion_empleado_id INT PRIMARY KEY AUTO_INCREMENT,
    empleado_id INT,
    capacitacion_id INT,
    fecha_asistencia DATE,
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id),
    FOREIGN KEY (capacitacion_id) REFERENCES capacitaciones(capacitacion_id)
);

-- Crear tabla de proyectos_clientes para gestionar la relación entre proyectos y clientes
CREATE TABLE IF NOT EXISTS proyectos_clientes (
    proyecto_cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    proyecto_id INT,
    cliente_id INT,
    FOREIGN KEY (proyecto_id) REFERENCES proyectos(proyecto_id),
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

-- Crear tabla de contactos_proveedor para almacenar información de contacto de proveedores
CREATE TABLE IF NOT EXISTS contactos_proveedor (
    contacto_proveedor_id INT PRIMARY KEY AUTO_INCREMENT,
    proveedor_id INT,
    nombre_contacto VARCHAR(255) NOT NULL,
    puesto_contacto VARCHAR(255),
    telefono_contacto VARCHAR(20),
    correo_contacto VARCHAR(255),
    FOREIGN KEY (proveedor_id) REFERENCES proveedores(proveedor_id)
);

-- Crear tabla de reclamaciones_clientes para gestionar reclamaciones de clientes
CREATE TABLE IF NOT EXISTS reclamaciones_clientes (
    reclamacion_cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    fecha_reclamacion DATE,
    motivo_reclamacion TEXT,
    estado VARCHAR(50),
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);
-- Crear tabla de evaluaciones_proveedores para evaluar el rendimiento de los proveedores
CREATE TABLE IF NOT EXISTS evaluaciones_proveedores (
    evaluacion_proveedor_id INT PRIMARY KEY AUTO_INCREMENT,
    proveedor_id INT,
    fecha_evaluacion DATE,
    calificacion DECIMAL(5, 2),
    comentarios TEXT,
    FOREIGN KEY (proveedor_id) REFERENCES proveedores(proveedor_id)
);

-- Crear tabla de inventario_fisico para realizar el seguimiento de inventario en tiempo real
CREATE TABLE IF NOT EXISTS inventario_fisico (
    inventario_fisico_id INT PRIMARY KEY AUTO_INCREMENT,
    producto_id INT,
    cantidad REAL,
    fecha_registro DATETIME,
    ubicacion_id INT,
    FOREIGN KEY (producto_id) REFERENCES productos(producto_id),
    FOREIGN KEY (ubicacion_id) REFERENCES ubicaciones(ubicacion_id)
);

-- Crear tabla de mantenimiento_correctivo para registrar acciones correctivas en equipos o activos
CREATE TABLE IF NOT EXISTS mantenimiento_correctivo (
    mantenimiento_correctivo_id INT PRIMARY KEY AUTO_INCREMENT,
    equipo_id INT,
    descripcion TEXT,
    fecha_reporte DATETIME,
    fecha_solucion DATETIME,
    costo DECIMAL(10, 2),
    FOREIGN KEY (equipo_id) REFERENCES activos_fijos(activo_id)
);

-- Crear tabla de procesos_produccion para gestionar las etapas y procesos de producción
CREATE TABLE IF NOT EXISTS procesos_produccion (
    proceso_produccion_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_proceso VARCHAR(255) NOT NULL,
    descripcion TEXT
);

-- Crear tabla de seguimiento_produccion para rastrear la producción de productos
CREATE TABLE IF NOT EXISTS seguimiento_produccion (
    seguimiento_produccion_id INT PRIMARY KEY AUTO_INCREMENT,
    producto_id INT,
    proceso_produccion_id INT,
    fecha_inicio DATETIME,
    fecha_fin DATETIME,
    cantidad_producida INT,
    estado VARCHAR(50),
    FOREIGN KEY (producto_id) REFERENCES productos(producto_id),
    FOREIGN KEY (proceso_produccion_id) REFERENCES procesos_produccion(proceso_produccion_id)
);

-- Crear tabla de encuestas_satisfaccion para recopilar feedback de clientes o empleados
CREATE TABLE IF NOT EXISTS encuestas_satisfaccion (
    encuesta_satisfaccion_id INT PRIMARY KEY AUTO_INCREMENT,
    descripcion TEXT,
    fecha_inicio DATE,
    fecha_fin DATE
);

-- Crear tabla de respuestas_encuesta_satisfaccion para almacenar respuestas a encuestas de satisfacción
CREATE TABLE IF NOT EXISTS respuestas_encuesta_satisfaccion (
    respuesta_encuesta_id INT PRIMARY KEY AUTO_INCREMENT,
    encuesta_satisfaccion_id INT,
    cliente_id INT,
    empleado_id INT,
    respuesta TEXT,
    FOREIGN KEY (encuesta_satisfaccion_id) REFERENCES encuestas_satisfaccion(encuesta_satisfaccion_id),
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);

-- Crear tabla de almacenes para gestionar diferentes ubicaciones de almacenamiento
CREATE TABLE IF NOT EXISTS almacenes (
    almacen_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_almacen VARCHAR(255) NOT NULL,
    direccion VARCHAR(255),
    ciudad VARCHAR(50),
    codigo_postal VARCHAR(15),
    pais VARCHAR(50)
);

-- Crear tabla de contratos_empleados para gestionar los contratos laborales de los empleados
CREATE TABLE IF NOT EXISTS contratos_empleados (
    contrato_empleado_id INT PRIMARY KEY AUTO_INCREMENT,
    empleado_id INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    tipo_contrato VARCHAR(50),
    salario DECIMAL(10, 2),
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);

-- Crear tabla de reconocimientos_empleados para registrar reconocimientos y premios a los empleados
CREATE TABLE IF NOT EXISTS reconocimientos_empleados (
    reconocimiento_empleado_id INT PRIMARY KEY AUTO_INCREMENT,
    empleado_id INT,
    tipo_reconocimiento VARCHAR(255) NOT NULL,
    descripcion TEXT,
    fecha_reconocimiento DATE,
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);

-- Crear tabla de proyectos_equipo para asignar empleados a proyectos específicos
CREATE TABLE IF NOT EXISTS proyectos_equipo (
    proyecto_equipo_id INT PRIMARY KEY AUTO_INCREMENT,
    proyecto_id INT,
    empleado_id INT,
    fecha_asignacion DATE,
    FOREIGN KEY (proyecto_id) REFERENCES proyectos(proyecto_id),
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);

-- Crear tabla de documentos
CREATE TABLE IF NOT EXISTS documentos (
    documento_id INT PRIMARY KEY AUTO_INCREMENT,
    tipo_documento VARCHAR(255) NOT NULL,
    nombre_documento VARCHAR(255) NOT NULL,
    descripcion TEXT,
    fecha_creacion DATE,
    empleado_id INT,
    proyecto_id INT,
    cliente_id INT,
    proveedor_id INT,
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id),
    FOREIGN KEY (proyecto_id) REFERENCES proyectos(proyecto_id),
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
    FOREIGN KEY (proveedor_id) REFERENCES proveedores(proveedor_id)
);

-- Crear tabla de gestiones_documentos para gestionar documentos internos y externos
CREATE TABLE IF NOT EXISTS gestiones_documentos (
    gestion_documento_id INT PRIMARY KEY AUTO_INCREMENT,
    documento_id INT,
    empleado_id INT,
    accion VARCHAR(50) NOT NULL,
    fecha_gestion DATE,
    FOREIGN KEY (documento_id) REFERENCES documentos(documento_id),
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);

-- Crear tabla de software
CREATE TABLE IF NOT EXISTS software (
    software_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_software VARCHAR(255) NOT NULL,
    version_software VARCHAR(50),
    licencia_software VARCHAR(50),
    proveedor_id INT,
    fecha_adquisicion DATE,
    fecha_actualizacion DATE,
    costo DECIMAL(10, 2),
    descripcion TEXT,
    FOREIGN KEY (proveedor_id) REFERENCES proveedores(proveedor_id)
);

-- Crear tabla de licencias_software para gestionar el uso de software en la empresa
CREATE TABLE IF NOT EXISTS licencias_software (
    licencia_software_id INT PRIMARY KEY AUTO_INCREMENT,
    software_id INT,
    cantidad_disponible INT,
    fecha_expiracion DATE,
    FOREIGN KEY (software_id) REFERENCES software(software_id)
);

-- Crear tabla de auditorias_calidad para realizar auditorías internas de calidad
CREATE TABLE IF NOT EXISTS auditorias_calidad (
    auditoria_calidad_id INT PRIMARY KEY AUTO_INCREMENT,
    fecha_auditoria DATE,
    responsable_auditoria INT,
    resultado VARCHAR(50),
    observaciones TEXT,
    FOREIGN KEY (responsable_auditoria) REFERENCES empleados(empleado_id)
);

-- Crear tabla de tareas_proyecto para gestionar las tareas asociadas a proyectos
CREATE TABLE IF NOT EXISTS tareas_proyecto (
    tarea_proyecto_id INT PRIMARY KEY AUTO_INCREMENT,
    proyecto_id INT,
    descripcion TEXT,
    fecha_inicio DATE,
    fecha_fin DATE,
    estado VARCHAR(50),
    FOREIGN KEY (proyecto_id) REFERENCES proyectos(proyecto_id)
);

-- Crear tabla de costos_proyecto para realizar seguimiento de los costos asociados a proyectos
CREATE TABLE IF NOT EXISTS costos_proyecto (
    costo_proyecto_id INT PRIMARY KEY AUTO_INCREMENT,
    proyecto_id INT,
    concepto VARCHAR(255) NOT NULL,
    monto DECIMAL(10, 2),
    fecha_registro DATE,
    FOREIGN KEY (proyecto_id) REFERENCES proyectos(proyecto_id)
);

-- Crear tabla de metas_ventas para establecer y rastrear las metas de ventas
CREATE TABLE IF NOT EXISTS metas_ventas (
    meta_venta_id INT PRIMARY KEY AUTO_INCREMENT,
    empleado_id INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    monto_meta DECIMAL(10, 2),
    estado VARCHAR(50),
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);

-- Crear tabla de incidentes_seguridad para registrar incidentes relacionados con la seguridad
CREATE TABLE IF NOT EXISTS incidentes_seguridad (
    incidente_seguridad_id INT PRIMARY KEY AUTO_INCREMENT,
    empleado_id INT,
    fecha_incidente DATE,
    descripcion TEXT,
    estado VARCHAR(50),
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);

-- Crear tabla de capacitaciones_clientes para ofrecer programas de capacitación a los clientes
CREATE TABLE IF NOT EXISTS capacitaciones_clientes (
    capacitacion_cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    descripcion TEXT,
    fecha_inicio DATE,
    fecha_fin DATE,
    estado VARCHAR(50),
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

-- Crear tabla de servicios
CREATE TABLE IF NOT EXISTS servicios (
    servicio_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_servicio VARCHAR(255) NOT NULL,
    descripcion TEXT,
    costo_servicio DECIMAL(10, 2),
    proveedor_id INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    estado VARCHAR(50),
    FOREIGN KEY (proveedor_id) REFERENCES proveedores(proveedor_id)
);

-- Crear tabla de suscripciones_clientes para gestionar las suscripciones de servicios por parte de los clientes
CREATE TABLE IF NOT EXISTS suscripciones_clientes (
    suscripcion_cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    servicio_id INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    estado VARCHAR(50),
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
    FOREIGN KEY (servicio_id) REFERENCES servicios(servicio_id)
);

-- Crear tabla de reclamaciones_proveedores para gestionar reclamaciones hacia los proveedores
CREATE TABLE IF NOT EXISTS reclamaciones_proveedores (
    reclamacion_proveedor_id INT PRIMARY KEY AUTO_INCREMENT,
    proveedor_id INT,
    fecha_reclamacion DATE,
    motivo_reclamacion TEXT,
    estado VARCHAR(50),
    FOREIGN KEY (proveedor_id) REFERENCES proveedores(proveedor_id)
);

-- Crear tabla de evaluaciones_clientes para evaluar la satisfacción y rendimiento de los clientes
CREATE TABLE IF NOT EXISTS evaluaciones_clientes (
    evaluacion_cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    fecha_evaluacion DATE,
    calificacion DECIMAL(5, 2),
    comentarios TEXT,
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

-- Crear tabla de auditorias_ambientales para realizar auditorías relacionadas con el impacto ambiental
CREATE TABLE IF NOT EXISTS auditorias_ambientales (
    auditoria_ambiental_id INT PRIMARY KEY AUTO_INCREMENT,
    fecha_auditoria DATE,
    responsable_auditoria INT,
    resultado VARCHAR(50),
    observaciones TEXT,
    FOREIGN KEY (responsable_auditoria) REFERENCES empleados(empleado_id)
);

-- Crear tabla de cursos_formacion para gestionar programas de formación y cursos
CREATE TABLE IF NOT EXISTS cursos_formacion (
    curso_formacion_id INT PRIMARY KEY AUTO_INCREMENT,
    descripcion TEXT,
    fecha_inicio DATE,
    fecha_fin DATE,
    estado VARCHAR(50)
);

-- Crear tabla de asistencias_cursos para registrar la asistencia a cursos de formación
CREATE TABLE IF NOT EXISTS asistencias_cursos (
    asistencia_curso_id INT PRIMARY KEY AUTO_INCREMENT,
    empleado_id INT,
    curso_formacion_id INT,
    fecha_asistencia DATE,
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id),
    FOREIGN KEY (curso_formacion_id) REFERENCES cursos_formacion(curso_formacion_id)
);

-- Crear tabla de pedidos_proveedores para gestionar las solicitudes de productos a proveedores
CREATE TABLE IF NOT EXISTS pedidos_proveedores (
    pedido_proveedor_id INT PRIMARY KEY AUTO_INCREMENT,
    proveedor_id INT,
    fecha_pedido DATE,
    estado VARCHAR(50),
    FOREIGN KEY (proveedor_id) REFERENCES proveedores(proveedor_id)
);

-- Crear tabla de detalles_pedido_proveedor para especificar los productos en cada pedido a proveedores
CREATE TABLE IF NOT EXISTS detalles_pedido_proveedor (
    detalle_pedido_proveedor_id INT PRIMARY KEY AUTO_INCREMENT,
    pedido_proveedor_id INT,
    producto_id INT,
    cantidad INT,
    precio_unitario DECIMAL(10, 2),
    subtotal DECIMAL(10, 2),
    FOREIGN KEY (pedido_proveedor_id) REFERENCES pedidos_proveedores(pedido_proveedor_id),
    FOREIGN KEY (producto_id) REFERENCES productos(producto_id)
);

-- Crear tabla de devoluciones_ventas para gestionar devoluciones de productos vendidos
CREATE TABLE IF NOT EXISTS devoluciones_ventas (
    devolucion_venta_id INT PRIMARY KEY AUTO_INCREMENT,
    venta_id INT,
    fecha_devolucion DATE,
    motivo VARCHAR(255),
    FOREIGN KEY (venta_id) REFERENCES ventas(venta_id)
);

-- Crear tabla de informes_proveedores para almacenar informes y evaluaciones de proveedores
CREATE TABLE IF NOT EXISTS informes_proveedores (
    informe_proveedor_id INT PRIMARY KEY AUTO_INCREMENT,
    proveedor_id INT,
    fecha_informe DATE,
    contenido TEXT,
    FOREIGN KEY (proveedor_id) REFERENCES proveedores(proveedor_id)
);

-- Crear tabla de procesos_compras para gestionar los procesos de compras
CREATE TABLE IF NOT EXISTS procesos_compras (
    proceso_compra_id INT PRIMARY KEY AUTO_INCREMENT,
    proveedor_id INT,
    empleado_id INT,
    fecha_solicitud DATE,
    estado VARCHAR(50),
    FOREIGN KEY (proveedor_id) REFERENCES proveedores(proveedor_id),
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);

-- Crear tabla de cotizaciones para solicitar y comparar cotizaciones de diferentes proveedores
CREATE TABLE IF NOT EXISTS cotizaciones (
    cotizacion_id INT PRIMARY KEY AUTO_INCREMENT,
    proceso_compra_id INT,
    fecha_solicitud DATE,
    fecha_respuesta DATE,
    estado VARCHAR(50),
    FOREIGN KEY (proceso_compra_id) REFERENCES procesos_compras(proceso_compra_id)
);

-- Crear tabla de detalles_cotizacion para especificar productos y precios en una cotización
CREATE TABLE IF NOT EXISTS detalles_cotizacion (
    detalle_cotizacion_id INT PRIMARY KEY AUTO_INCREMENT,
    cotizacion_id INT,
    producto_id INT,
    cantidad INT,
    precio_unitario DECIMAL(10, 2),
    subtotal DECIMAL(10, 2),
    FOREIGN KEY (cotizacion_id) REFERENCES cotizaciones(cotizacion_id),
    FOREIGN KEY (producto_id) REFERENCES productos(producto_id)
);

-- Crear tabla de gastos_viaje para registrar los gastos asociados a viajes de negocios
CREATE TABLE IF NOT EXISTS gastos_viaje (
    gasto_viaje_id INT PRIMARY KEY AUTO_INCREMENT,
    viaje_negocio_id INT,
    descripcion TEXT,
    fecha_gasto DATE,
    monto DECIMAL(10, 2),
    FOREIGN KEY (viaje_negocio_id) REFERENCES viajes_negocios(viaje_negocio_id)
);

-- Crear tabla de documentos_almacen para gestionar documentos relacionados con el almacenamiento
CREATE TABLE IF NOT EXISTS documentos_almacen (
    documento_almacen_id INT PRIMARY KEY AUTO_INCREMENT,
    tipo_documento VARCHAR(255) NOT NULL,
    descripcion TEXT,
    fecha_creacion DATE
);
-- Crear tabla de planificacion_proyectos para gestionar la planificación de proyectos
CREATE TABLE IF NOT EXISTS planificacion_proyectos (
    planificacion_proyecto_id INT PRIMARY KEY AUTO_INCREMENT,
    proyecto_id INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    descripcion TEXT,
    FOREIGN KEY (proyecto_id) REFERENCES proyectos(proyecto_id)
);

-- Crear tabla de hitos_proyecto para marcar eventos importantes en el desarrollo de un proyecto
CREATE TABLE IF NOT EXISTS hitos_proyecto (
    hito_proyecto_id INT PRIMARY KEY AUTO_INCREMENT,
    planificacion_proyecto_id INT,
    descripcion TEXT,
    fecha_hito DATE,
    FOREIGN KEY (planificacion_proyecto_id) REFERENCES planificacion_proyectos(planificacion_proyecto_id)
);

-- Crear tabla de materiales
CREATE TABLE IF NOT EXISTS materiales (
    material_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_material VARCHAR(255) NOT NULL,
    descripcion TEXT,
    unidad_medida VARCHAR(50),
    costo_unitario DECIMAL(10, 2),
    cantidad_en_stock INT,
    proveedor_id INT,
    fecha_ultima_compra DATE,
    FOREIGN KEY (proveedor_id) REFERENCES proveedores(proveedor_id)
);

-- Crear tabla de seguimiento_materiales para rastrear el uso de materiales en proyectos
CREATE TABLE IF NOT EXISTS seguimiento_materiales (
    seguimiento_materiales_id INT PRIMARY KEY AUTO_INCREMENT,
    proyecto_id INT,
    material_id INT,
    cantidad_utilizada INT,
    fecha_utilizacion DATE,
    FOREIGN KEY (proyecto_id) REFERENCES proyectos(proyecto_id),
    FOREIGN KEY (material_id) REFERENCES materiales(material_id)
);

-- Crear tabla de registros_satisfaccion para almacenar registros de satisfacción de clientes
CREATE TABLE IF NOT EXISTS registros_satisfaccion (
    registro_satisfaccion_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    empleado_id INT,
    proyecto_id INT,
    fecha_registro DATE,
    puntuacion DECIMAL(5, 2),
    comentarios TEXT,
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id),
    FOREIGN KEY (proyecto_id) REFERENCES proyectos(proyecto_id)
);

-- Crear tabla de evaluaciones_desempeno para evaluar el desempeño de los empleados
CREATE TABLE IF NOT EXISTS evaluaciones_desempeno (
    evaluacion_desempeno_id INT PRIMARY KEY AUTO_INCREMENT,
    empleado_id INT,
    fecha_evaluacion DATE,
    calificacion DECIMAL(5, 2),
    comentarios TEXT,
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);

-- Crear tabla de subcontrataciones para gestionar subcontrataciones de servicios
CREATE TABLE IF NOT EXISTS subcontrataciones (
    subcontratacion_id INT PRIMARY KEY AUTO_INCREMENT,
    proveedor_id INT,
    servicio_id INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    estado VARCHAR(50),
    FOREIGN KEY (proveedor_id) REFERENCES proveedores(proveedor_id),
    FOREIGN KEY (servicio_id) REFERENCES servicios(servicio_id)
);

-- Crear tabla de auditorias_proyectos para realizar auditorías internas en proyectos
CREATE TABLE IF NOT EXISTS auditorias_proyectos (
    auditoria_proyecto_id INT PRIMARY KEY AUTO_INCREMENT,
    proyecto_id INT,
    responsable_auditoria INT,
    fecha_auditoria DATE,
    resultado VARCHAR(50),
    observaciones TEXT,
    FOREIGN KEY (proyecto_id) REFERENCES proyectos(proyecto_id),
    FOREIGN KEY (responsable_auditoria) REFERENCES empleados(empleado_id)
);

-- Crear tabla de polizas_seguro para gestionar pólizas de seguro
CREATE TABLE IF NOT EXISTS polizas_seguro (
    poliza_seguro_id INT PRIMARY KEY AUTO_INCREMENT,
    tipo_seguro VARCHAR(255) NOT NULL,
    descripcion TEXT,
    fecha_inicio DATE,
    fecha_fin DATE
);

-- Crear tabla de reclamaciones_seguros para gestionar reclamaciones a compañías de seguros
CREATE TABLE IF NOT EXISTS reclamaciones_seguros (
    reclamacion_seguro_id INT PRIMARY KEY AUTO_INCREMENT,
    poliza_seguro_id INT,
    cliente_id INT,
    fecha_reclamacion DATE,
    motivo_reclamacion TEXT,
    estado VARCHAR(50),
    FOREIGN KEY (poliza_seguro_id) REFERENCES polizas_seguro(poliza_seguro_id),
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

-- Crear tabla de gestiones_cambios para gestionar solicitudes y aprobaciones de cambios
CREATE TABLE IF NOT EXISTS gestiones_cambios (
    gestion_cambio_id INT PRIMARY KEY AUTO_INCREMENT,
    empleado_id INT,
    fecha_solicitud DATE,
    motivo_cambio TEXT,
    estado VARCHAR(50),
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);

-- Crear tabla de cambios_proceso para registrar cambios en los procesos internos
CREATE TABLE IF NOT EXISTS cambios_proceso (
    cambio_proceso_id INT PRIMARY KEY AUTO_INCREMENT,
    gestion_cambio_id INT,
    proceso_afectado_id INT,
    descripcion_cambio TEXT,
    fecha_cambio DATE,
    FOREIGN KEY (gestion_cambio_id) REFERENCES gestiones_cambios(gestion_cambio_id),
    FOREIGN KEY (proceso_afectado_id) REFERENCES procesos_produccion(proceso_produccion_id)
);

-- Crear tabla de depreciacion_activos para gestionar la depreciación de activos fijos
CREATE TABLE IF NOT EXISTS depreciacion_activos (
    depreciacion_activo_id INT PRIMARY KEY AUTO_INCREMENT,
    activo_fijo_id INT,
    fecha_depreciacion DATE,
    monto_depreciacion DECIMAL(10, 2),
    FOREIGN KEY (activo_fijo_id) REFERENCES activos_fijos(activo_id)
);

-- Crear tabla de categorias_gastos para clasificar los gastos de la empresa
CREATE TABLE IF NOT EXISTS categorias_gastos (
    categoria_gasto_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_categoria VARCHAR(255) NOT NULL,
    descripcion TEXT
);

-- Crear tabla de gastos_generales para registrar gastos no relacionados con proyectos específicos
CREATE TABLE IF NOT EXISTS gastos_generales (
    gasto_general_id INT PRIMARY KEY AUTO_INCREMENT,
    categoria_gasto_id INT,
    empleado_id INT,
    descripcion TEXT,
    fecha_gasto DATE,
    monto DECIMAL(10, 2),
    FOREIGN KEY (categoria_gasto_id) REFERENCES categorias_gastos(categoria_gasto_id),
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);

-- Crear tabla de registros_tiempo para rastrear el tiempo dedicado a proyectos
CREATE TABLE IF NOT EXISTS registros_tiempo (
    registro_tiempo_id INT PRIMARY KEY AUTO_INCREMENT,
    empleado_id INT,
    proyecto_id INT,
    fecha_registro DATE,
    horas_trabajadas DECIMAL(5, 2),
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id),
    FOREIGN KEY (proyecto_id) REFERENCES proyectos(proyecto_id)
);

-- Crear tabla de reportes_financieros para almacenar informes financieros
CREATE TABLE IF NOT EXISTS reportes_financieros (
    reporte_financiero_id INT PRIMARY KEY AUTO_INCREMENT,
    tipo_reporte VARCHAR(255) NOT NULL,
    fecha_generacion DATE,
    contenido TEXT
);

-- Crear tabla de evaluaciones_riesgos para evaluar y gestionar riesgos empresariales
CREATE TABLE IF NOT EXISTS evaluaciones_riesgos (
    evaluacion_riesgo_id INT PRIMARY KEY AUTO_INCREMENT,
    descripcion TEXT,
    probabilidad DECIMAL(5, 2),
    impacto DECIMAL(5, 2),
    estrategia_mitigacion TEXT
);

-- Crear tabla de revisiones_contratos para gestionar revisiones y renovaciones de contratos
CREATE TABLE IF NOT EXISTS revisiones_contratos (
    revision_contrato_id INT PRIMARY KEY AUTO_INCREMENT,
    contrato_id INT,
    fecha_revision DATE,
    estado_contrato VARCHAR(50),
    FOREIGN KEY (contrato_id) REFERENCES contratos_empleados(contrato_empleado_id)
);

-- Crear tabla de reuniones_proyecto para gestionar reuniones relacionadas con proyectos
CREATE TABLE IF NOT EXISTS reuniones_proyecto (
    reunion_proyecto_id INT PRIMARY KEY AUTO_INCREMENT,
    proyecto_id INT,
    fecha_reunion DATE,
    asunto VARCHAR(255) NOT NULL,
    ubicacion VARCHAR(255),
    FOREIGN KEY (proyecto_id) REFERENCES proyectos(proyecto_id)
);

-- Crear tabla de asistentes_reunion para registrar participantes en reuniones
CREATE TABLE IF NOT EXISTS asistentes_reunion (
    asistente_reunion_id INT PRIMARY KEY AUTO_INCREMENT,
    reunion_proyecto_id INT,
    empleado_id INT,
    FOREIGN KEY (reunion_proyecto_id) REFERENCES reuniones_proyecto(reunion_proyecto_id),
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);

-- Crear tabla de registros_ambientales para mantener seguimiento de impactos ambientales
CREATE TABLE IF NOT EXISTS registros_ambientales (
    registro_ambiental_id INT PRIMARY KEY AUTO_INCREMENT,
    empleado_id INT,
    fecha_registro DATE,
    tipo_impacto VARCHAR(255) NOT NULL,
    descripcion TEXT,
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);

-- Crear tabla de evaluaciones_ambientales para evaluar el impacto ambiental de actividades
CREATE TABLE IF NOT EXISTS evaluaciones_ambientales (
    evaluacion_ambiental_id INT PRIMARY KEY AUTO_INCREMENT,
    proyecto_id INT,
    fecha_evaluacion DATE,
    resultado VARCHAR(50),
    observaciones TEXT,
    FOREIGN KEY (proyecto_id) REFERENCES proyectos(proyecto_id)
);

-- Crear tabla de contratos_clientes para gestionar contratos con clientes
CREATE TABLE IF NOT EXISTS contratos_clientes (
    contrato_cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    tipo_contrato VARCHAR(50),
    monto_contrato DECIMAL(10, 2),
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

-- Crear tabla de pagos_contratos para gestionar los pagos asociados a contratos
CREATE TABLE IF NOT EXISTS pagos_contratos (
    pago_contrato_id INT PRIMARY KEY AUTO_INCREMENT,
    contrato_cliente_id INT,
    fecha_pago DATE,
    monto_pagado DECIMAL(10, 2),
    concepto VARCHAR(255),
    FOREIGN KEY (contrato_cliente_id) REFERENCES contratos_clientes(contrato_cliente_id)
);

-- Crear tabla de registros_calidad para almacenar registros de control de calidad
CREATE TABLE IF NOT EXISTS registros_calidad (
    registro_calidad_id INT PRIMARY KEY AUTO_INCREMENT,
    empleado_id INT,
    fecha_registro DATE,
    descripcion TEXT,
    resultado VARCHAR(50),
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);

-- Crear tabla de auditorias_seguridad para realizar auditorías internas de seguridad
CREATE TABLE IF NOT EXISTS auditorias_seguridad (
    auditoria_seguridad_id INT PRIMARY KEY AUTO_INCREMENT,
    fecha_auditoria DATE,
    responsable_auditoria INT,
    resultado VARCHAR(50),
    observaciones TEXT,
    FOREIGN KEY (responsable_auditoria) REFERENCES empleados(empleado_id)
);

-- Crear tabla de historial_acciones para registrar acciones realizadas por los usuarios
CREATE TABLE IF NOT EXISTS historial_acciones (
    historial_accion_id INT PRIMARY KEY AUTO_INCREMENT,
    empleado_id INT,
    fecha_accion DATETIME,
    accion_realizada TEXT,
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);

-- Crear tabla de rankings_empleados para clasificar a los empleados según su desempeño
CREATE TABLE IF NOT EXISTS rankings_empleados (
    ranking_empleado_id INT PRIMARY KEY AUTO_INCREMENT,
    empleado_id INT,
    fecha_evaluacion DATE,
    posicion_ranking INT,
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);

-- Crear tabla de vehículos
CREATE TABLE IF NOT EXISTS vehiculos (
    vehiculo_id INT PRIMARY KEY AUTO_INCREMENT,
    marca VARCHAR(255) NOT NULL,
    modelo VARCHAR(255) NOT NULL,
    anyo_fabricacion INT,
    placa VARCHAR(15),
    tipo_combustible VARCHAR(50),
    capacidad_tanque DECIMAL(10, 2),
    kilometraje_actual INT,
    estado_mantenimiento VARCHAR(50),
    fecha_ultimo_mantenimiento DATE,
    descripcion TEXT
);

-- Crear tabla de registros_vehiculos para rastrear el uso y mantenimiento de vehículos
CREATE TABLE IF NOT EXISTS registros_vehiculos (
    registro_vehiculo_id INT PRIMARY KEY AUTO_INCREMENT,
    vehiculo_id INT,
    empleado_id INT,
    fecha_registro DATE,
    kilometraje INT,
    tipo_registro VARCHAR(50),
    FOREIGN KEY (vehiculo_id) REFERENCES vehiculos(vehiculo_id),
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);

-- Crear tabla de incidentes_calidad para registrar incidentes relacionados con la calidad
CREATE TABLE IF NOT EXISTS incidentes_calidad (
    incidente_calidad_id INT PRIMARY KEY AUTO_INCREMENT,
    empleado_id INT,
    fecha_incidente DATE,
    descripcion TEXT,
    estado VARCHAR(50),
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);

-- Crear tabla de documentos_proveedores para almacenar documentos proporcionados por proveedores
CREATE TABLE IF NOT EXISTS documentos_proveedores (
    documento_proveedor_id INT PRIMARY KEY AUTO_INCREMENT,
    proveedor_id INT,
    tipo_documento VARCHAR(255) NOT NULL,
    descripcion TEXT,
    fecha_creacion DATE,
    FOREIGN KEY (proveedor_id) REFERENCES proveedores(proveedor_id)
);

-- Crear tabla de proyectos_investigacion para gestionar proyectos de investigación internos
CREATE TABLE IF NOT EXISTS proyectos_investigacion (
    proyecto_investigacion_id INT PRIMARY KEY AUTO_INCREMENT,
    empleado_id INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    descripcion TEXT,
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);

-- Crear tabla de resultados_investigacion para almacenar resultados de proyectos de investigación
CREATE TABLE IF NOT EXISTS resultados_investigacion (
    resultado_investigacion_id INT PRIMARY KEY AUTO_INCREMENT,
    proyecto_investigacion_id INT,
    descripcion TEXT,
    fecha_registro DATE,
    FOREIGN KEY (proyecto_investigacion_id) REFERENCES proyectos_investigacion(proyecto_investigacion_id)
);

-- Crear tabla de registros_asistencias para gestionar asistencias a eventos y conferencias
CREATE TABLE IF NOT EXISTS registros_asistencias (
    registro_asistencia_id INT PRIMARY KEY AUTO_INCREMENT,
    empleado_id INT,
    evento_id INT,
    fecha_asistencia DATE,
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id),
    FOREIGN KEY (evento_id) REFERENCES eventos(evento_id)
);

-- Crear tabla de informes_inventario para generar informes detallados del inventario
CREATE TABLE IF NOT EXISTS informes_inventario (
    informe_inventario_id INT PRIMARY KEY AUTO_INCREMENT,
    fecha_generacion DATE,
    contenido TEXT
);

-- Crear tabla de sugerencias_mejora para recopilar y evaluar sugerencias de mejora
CREATE TABLE IF NOT EXISTS sugerencias_mejora (
    sugerencia_mejora_id INT PRIMARY KEY AUTO_INCREMENT,
    empleado_id INT,
    fecha_sugerencia DATE,
    descripcion TEXT,
    estado VARCHAR(50),
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);

-- Crear tabla de pedidos_clientes para gestionar solicitudes de productos por parte de clientes
CREATE TABLE IF NOT EXISTS pedidos_clientes (
    pedido_cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    fecha_pedido DATE,
    estado VARCHAR(50),
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

-- Crear tabla de detalles_pedido_cliente para especificar productos en cada pedido de clientes
CREATE TABLE IF NOT EXISTS detalles_pedido_cliente (
    detalle_pedido_cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    pedido_cliente_id INT,
    producto_id INT,
    cantidad INT,
    precio_unitario DECIMAL(10, 2),
    subtotal DECIMAL(10, 2),
    FOREIGN KEY (pedido_cliente_id) REFERENCES pedidos_clientes(pedido_cliente_id),
    FOREIGN KEY (producto_id) REFERENCES productos(producto_id)
);

-- Crear tabla de devoluciones_proveedores para gestionar devoluciones de productos a proveedores
CREATE TABLE IF NOT EXISTS devoluciones_proveedores (
    devolucion_proveedor_id INT PRIMARY KEY AUTO_INCREMENT,
    proveedor_id INT,
    fecha_devolucion DATE,
    motivo VARCHAR(255),
    FOREIGN KEY (proveedor_id) REFERENCES proveedores(proveedor_id)
);

-- Crear tabla de informes_ventas para almacenar informes y análisis de ventas
CREATE TABLE IF NOT EXISTS informes_ventas (
    informe_venta_id INT PRIMARY KEY AUTO_INCREMENT,
    fecha_generacion DATE,
    contenido TEXT
);

-- Crear tabla de permisos_empleados para gestionar los permisos y accesos de los empleados
CREATE TABLE IF NOT EXISTS permisos_empleados (
    permiso_empleado_id INT PRIMARY KEY AUTO_INCREMENT,
    empleado_id INT,
    modulo VARCHAR(255) NOT NULL,
    nivel_acceso INT,
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);

-- Crear tabla de registros_salud para rastrear información de salud de los empleados
CREATE TABLE IF NOT EXISTS registros_salud (
    registro_salud_id INT PRIMARY KEY AUTO_INCREMENT,
    empleado_id INT,
    fecha_registro DATE,
    tipo_examen VARCHAR(255) NOT NULL,
    resultado TEXT,
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);

-- Crear tabla de eventos_sociales para gestionar eventos y actividades sociales
CREATE TABLE IF NOT EXISTS eventos_sociales (
    evento_social_id INT PRIMARY KEY AUTO_INCREMENT,
    descripcion TEXT,
    fecha_evento DATE,
    ubicacion VARCHAR(255),
    estado VARCHAR(50)
);

-- Crear tabla de asistentes_evento para registrar asistentes a eventos sociales
CREATE TABLE IF NOT EXISTS asistentes_evento (
    asistente_evento_id INT PRIMARY KEY AUTO_INCREMENT,
    evento_social_id INT,
    empleado_id INT,
    FOREIGN KEY (evento_social_id) REFERENCES eventos_sociales(evento_social_id),
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);

-- Crear tabla de recursos
CREATE TABLE IF NOT EXISTS recursos (
    recurso_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_recurso VARCHAR(255) NOT NULL,
    tipo_recurso VARCHAR(50),
    cantidad_disponible INT,
    ubicacion VARCHAR(255),
    estado VARCHAR(50),
    descripcion TEXT
);

-- Crear tabla de registros_consumo para gestionar el consumo de recursos en proyectos
CREATE TABLE IF NOT EXISTS registros_consumo (
    registro_consumo_id INT PRIMARY KEY AUTO_INCREMENT,
    proyecto_id INT,
    recurso_id INT,
    cantidad_utilizada DECIMAL(10, 2),
    fecha_utilizacion DATE,
    FOREIGN KEY (proyecto_id) REFERENCES proyectos(proyecto_id),
    FOREIGN KEY (recurso_id) REFERENCES recursos(recurso_id)
);

-- Crear tabla de evaluaciones_eventos para evaluar la efectividad y satisfacción en eventos
CREATE TABLE IF NOT EXISTS evaluaciones_eventos (
    evaluacion_evento_id INT PRIMARY KEY AUTO_INCREMENT,
    evento_social_id INT,
    calificacion DECIMAL(5, 2),
    comentarios TEXT,
    FOREIGN KEY (evento_social_id) REFERENCES eventos_sociales(evento_social_id)
);