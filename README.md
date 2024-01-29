# restomatic

Pequeño framework para automatizar despliegues HTTP REST API. Basado en hooks y SQL.

### ¿Qué es?

Es un pequeño framework que puedes copiar y pegar en tu servidor de PHP estático, y que (si tienes habilitado SQLite) puedes colocar y empezar a usar cuándo y cómo quieras.

Te permite, en otras palabras, gestionar automáticamente el acceso a una base de datos SQLite mediante una REST API en PHP estático. Puedes personalizarla en todos los aspectos, o incluso sobreescribir el código fuente para tus necesidades.

### Instalación

(1) Para empezar, tienes que descargarte el proyecto. No tiene dependencias, así que no hay que hacer nada más.

(2) Lo siguiente es colocar el proyecto descargado en la carpeta que te interesa de tu servidor PHP estático. Al usar «index.php» como entrada de las peticiones, puedes ponerlo en la ruta que desees de tu servidor.

(3) Después, debes saber que «Restomatic» viene con un instalador de serie. Simplemente, copia y pega el proyecto en la carpeta que te interese, y ten en cuenta lo siguiente:

- Si no está «installed.txt», el «index.php» redireccionará las peticiones a «installer.php».
- Si está «installed.txt», el «index.php» funcionará normalmente.

(4) A partir de ahí, puedes visitar la raíz del proyecto desde un navegador, e instalar la base de datos que tú prefieras. Y si quieres reiniciarla, solo tienes que eliminar estos 2 ficheros, y volver a proporcionar el código de una nueva base de datos.

### Uso

Como se ha dicho, se instala en cualquier carpeta, o incluso en varias de ellas. Una vez hecho esto, visitamos la URL del servidor que corresponde a dicha carpeta. El «index.php» nos llevará al instalador si no hemos ido todavía.

Cuando esté completamente instalado, y la base de datos creada también, volvemos a «index.php». Empezará dándonos un error. Bien.

Entonces podemos ir al «JSON Request Tester User Interface», que se hospeda en el «/jrtui» de la ruta del proyecto. Con esa interfaz podemos simular peticiones.

Pero me temo que si quieres hacer una interfaz, tendrás que hacerla por tu cuenta.