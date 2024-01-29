<?php

$database = new SQLite3("database.sqlite");
$code = $_POST["base_de_datos"];
$database->querySingle($code);
file_put_contents("installed.txt","Yes");

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Instalador de API REST automática</title>
    <style>
        * {
            box-sizing: border-box;
        }
        html {
            text-align: center;
            background-color: #8CF;
            font-family: Arial Narrow;
        }
        .page {
            display: inline-block;
            width:100%;
            max-width: 500px;
            border: 1px solid #333;
            box-shadow: 2px 2px 12px black;
            font-size: 14px;
            background-color: white;
            text-align: left;
        }
        .page h1, .page h2, .page h3, .page h4 {
            margin: 0px;
            padding: 0px;
        }
        .textarea_de_codigo {
            width: 100%;
            resize: vertical;
            min-height: 120px;
            border: 2px solid black;
            background-color: #112;
            color: white;
            font-family: monospace;
            font-size:10px;
            box-shadow: 2px 2px 4px black;
        }
        .boton {
            border-radius: 0pt;
            border: 1px solid #333;
            background-color: #AAA;
            box-shadow: 2px 2px 4px black;
            color: black;
            font-family: "Arial Narrow";
            font-size: 14px;
            cursor: pointer;
            padding: 8px;
            transition: background-color .2s linear, color .2s linear;
        }
        .boton:hover {
            background-color: #AAF;
            color: black;
        }
    </style>
</head>
<body>
    <div class="page">
        <form action="install.php" method="POST">
            <div style="padding: 4px;text-align: center;">
                <h2>Instalación completada</h2>
                <h4 style="padding: 12px;">Ya puedes empezar a usar la API REST</h4>
                <h4>En punto de entrada es <a href="./index.php">aquí</a></h4>
            </div>
            <hr />
            <div style="padding:12px; text-align: center;">¡Tu <b>API REST</b> ya está funcionando!</div>
            <hr />
            <div style="padding:4px; font-size: 11px;">
                <div style="text-align: justify;">Solo tienes que empezar a hacer peticiones REST. Pero antes de que te vayas, puedes recordar algunos puntos sobre cómo funciona deben ser todas las peticiones:</div>
                <ul style="padding-left: 20px;">
                    <li>Deben ser con el método POST.</li>
                    <li>Deben que contener la cabecera "Content-Type: application/json".</li>
                    <li>Deben que contener el parámetro «operation» con select, insert, update o delete.</li>
                    <li>Deben que contener el parámetro «table» con el nombre de la tabla.</li>
                    <li>Deben contener en su cuerpo directamente el JSON que se pasa.</li>
                </ul>
                <div>
                    <div>En cuanto a las operaciones, cabe recordar que:</div>
                    <ul style="padding-left: 20px;">
                        <li>En el caso del SELECT, no hay nada que hacer: devolverá todos los registros, simplemente.</li>
                        <li>En el caso del INSERT, hay 1 parámetro: |value» que debe ser un objeto con los valores a insertar.</li>
                        <li>En el caso del UPDATE, hay 2 parámetros: «value» que debe ser un objeto con los valores a actualizar, e «id» que debe ser un número entero con el ID del registro a actualizar.</li>
                        <li>En el caso del DELETE, hay 1 parámetro: «id» que debe ser un número entero con el ID del registro a eliminar.</li>
                        <li>Y ya está. Con esto, ya deberías tener claro todo lo que hay que saber.</li>
                    </ul>
                </div>
            </div>
            <hr/>
            <div style="font-size: 11px;padding:4px;">
                <div>Para hacer pruebas, tienes el <a href="./jrtui">JSON Request Tester User Interface</a>. Con él puedes hacer las peticiones de prueba contra el servidor.</div>
            </div>
        </form>
    </div>
</body>
</html>