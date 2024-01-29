<?php

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
        }
        .textarea_de_codigo,
        .input_de_texto {
            width: 100%;
            border: 2px solid black;
            background-color: #112;
            color: white;
            font-family: monospace;
            font-size:9px;
            box-shadow: 2px 2px 4px black;
        }
        .textarea_de_codigo[readonly=true] {
            background-color: #111;
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
        .explicacion_de_campo {
            color: #333;
            font-size: 11px;
            vertical-align: middle;
        }
    </style>
    <script src="lib/js/hql/hql.js"></script>
</head>
<body>
    <div class="page">
        <form action="install.php" method="POST">
            <div style="padding: 4px;text-align: center;">
                <h2>De SQL a API REST automáticamente</h2>
                <h4 style="padding: 12px;">Usando <a href="https://www.php.net/manual/es/book.sqlite3.php">SQLite</a> y <a href="https://www.php.net">PHP</a></h4>
                <h4>Para más información, <a href="https://www.github.com/allnulled/restomatic-php">ves aquí</a></h4>
            </div>
            <hr />
            <div style="padding:4px;">
                <div>AUTENTIFICADOR:</div>
                <div class="explicacion_de_campo">Este campo se requerirá en la cabecera HTTP de «Authentication» de todas las peticiones para las operaciones INSERT, UPDATE y DELETE.</div>
                <input class="input_de_texto" type="text" name="autentificador" />
            </div>
            <div style="padding:4px;">
                <div>BASE DE DATOS:</div>
                <div class="explicacion_de_campo">Este campo debe contener la creación de tablas de la base de datos. Se parseará con <a href="https://github.com/allnulled/hyper-query-language">HQL</a> para deducir la estructura de datos.</div>
                <textarea id="base_de_datos" oninput="actualiza_estructura()" name="base_de_datos" class="textarea_de_codigo" placeholder="SQL para crear tablas" spellcheck="false"></textarea>
                <div id="error_en_base_de_datos" class="error_en_base_de_datos" onclick="this.innerHTML = ''"></div>
            </div>
            <div style="padding:4px;">
                <div>ESTRUCTURA DEL MODELO DE DATOS:</div>
                <div class="explicacion_de_campo">Este campo es autogenerado, y representa la estructura del modelo de datos de la base de datos.</div>
                <textarea id="estructura" name="estructura" readonly="true" class="textarea_de_codigo" placeholder="JSON con la estructura de tablas" spellcheck="false"></textarea>
            </div>
            <div style="padding:4px;">
                <div>PRIMERA MIGRACIÓN:</div>
                <div class="explicacion_de_campo">Fuera de las sentencias de crear tablas, puede que quieras realizar una primera migración de datos. Aquí puedes hacer los INSERTs que necesites.</div>
                <textarea name="migracion" class="textarea_de_codigo" placeholder="SQL para insertar datos" spellcheck="false"></textarea>
            </div>
            <div style="text-align:right; padding: 4px; padding-top: 0px;">
                <input type="submit" class="boton" value="Crear API REST" />
            </div>
        </form>
    </div>
    <script>
        function actualiza_estructura() {
            const textarea_estructura = document.getElementById("estructura");
            const textarea_base_de_datos = document.getElementById("base_de_datos");
            try {
                textarea_estructura.value = JSON.stringify(HyperQueryLanguage.parse(textarea_base_de_datos.value), null, 2);
            } catch (error) {
                document.getElementById("error_en_base_de_datos").textContent = error.message;
            }
        }
    </script>
</body>
</html>