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
                <h2>De SQL a API REST automáticamente</h2>
                <h4 style="padding: 12px;">Usando <a href="https://www.php.net/manual/es/book.sqlite3.php">SQLite</a> y <a href="https://www.php.net">PHP</a></h4>
                <h4>Para más información, <a href="https://www.github.com/allnulled/restomatic">ves aquí</a></h4>
            </div>
            <hr />
            <div style="padding:4px;">
                <div>Escribe el código fuente de la nueva base de datos SQL:</div>
                <textarea name="base_de_datos" class="textarea_de_codigo" placeholder="Aquí el código SQL para crear la base de datos"></textarea>
            </div>
            <div style="text-align:right; padding: 4px; padding-top: 0px;">
                <input type="submit" class="boton">Crear API REST</button>
            </div>
        </form>
    </div>
</body>
</html>