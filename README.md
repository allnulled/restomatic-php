# restomatic

Pequeño framework para automatizar despliegues HTTP REST API. Basado en hooks y SQL.

### ¿Para qué?

Para montar APIs REST automáticas en servidor PHP estáticos con lo mínimo posible.

### Instalación

1. Descargar el proyecto.
2. Mover el proyecto al servidor PHP estático, en la ruta que se prefiera.
3. Visitar con un navegador la ruta del proyecto en el servidor.
4. Si aparece el instalador, rellenar el código de la base de datos deseado y presionar «Crear REST API».
    
![Instalador](./docs/img/instalador.png)

Tienes un script en la raíz del proyecto, «database.sql». Puedes utilizarlo como base para la creación de tu base de datos.

![Instalacion_completada](./docs/img/instalacion_completada.png)

5. Ir al endpoint del servidor correspondiente al «index.php» del proyecto descargado.
6. Comprobar que devuelve un error en formato JSON.
7. Ir a «/jrtui» para probar el tester.
8. Pasarle siempre los 2 parámetros clave en formato JSON:
   1. El parámetro «operation» con: select | insert | update | delete.
   2. El parámetro «table» con el nombre del modelo que quieres atacar.

### Instrucciones

Abre el «/jtrui». Aprenderás a hacer algunas llamadas útiles.

- Para obtener el esquema de datos, en «Contenido» pon «{"operation":"schema"}».
- Para hacer un SELECT, en «Contenido» pon «{"operation":"select","table":"Usuario"}».
- Para hacer un INSERT, UPDATE o DELETE, tienes que poner la contraseña en «Cabeceras» tal que así: «{"Authorization":"Contraseña"}».
- Para hacer un INSERT, en «Contenido» pon «{"operation":"insert","table":"Usuario","value":{ "nombre":"Carl" }}».
- Para hacer un UPDATE, en «Contenido» pon «{"operation":"insert","table":"Usuario","value":{ "nombre":"Carl" },"id":1}».
- Para hacer un DELETE, en «Contenido» pon «{"operation":"delete","table":"Usuario","id":1}».

Con esta sencilla guía, puedes interactuar con la base de datos.