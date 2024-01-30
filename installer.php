<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Automatic HTTP REST API installer</title>
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
                <h2>From SQL to API REST automatically</h2>
                <h4 style="padding: 12px;">Using 
                <?php
                    if(DATABASE_ADAPTER == "sqlite") {
                        ?><a href="https://www.php.net/manual/es/book.sqlite3.php">SQLite</a><?php
                    } else if (DATABASE_ADAPTER == "mysql") {
                        ?><a href="https://www.php.net/manual/es/book.mysqli.php">MySQL</a><?php
                    }
                ?>
                and <a href="https://www.php.net">static PHP</a></h4>
                <h4>For more info, go <a href="https://www.github.com/allnulled/restomatic-php">here</a></h4>
            </div>
            <hr />
            <div style="padding:4px;">
                <div>AUTHENTICATION TOKEN:</div>
                <div class="explicacion_de_campo">This field is required as «Authentication» (not «Authorization») HTTP header on every INSERT, UPDATE and DELETE operations.</div>
                <input class="input_de_texto" type="text" name="autentificador" placeholder="Secret administration token" />
            </div>
            <div style="padding:4px;">
                <div>DATABASE SOURCE CODE:</div>
                <div class="explicacion_de_campo">This field is the source code that creates the tables in the database. It will be parsed with <a href="https://github.com/allnulled/hyper-query-language">HQL</a> to deduce the data model structure.</div>
                <textarea id="base_de_datos" oninput="actualiza_estructura()" name="base_de_datos" class="textarea_de_codigo" placeholder="SQL to create tables" spellcheck="false"></textarea>
                <div id="error_en_base_de_datos" class="error_en_base_de_datos" onclick="this.innerHTML = ''"></div>
            </div>
            <div style="padding:4px;">
                <div>DATA MODEL STRUCTURE:</div>
                <div class="explicacion_de_campo">This field is automatically generated, and represents the structure of the data model.</div>
                <textarea id="estructura" name="estructura" readonly="true" class="textarea_de_codigo" placeholder="JSON with the tables structure" spellcheck="false"></textarea>
            </div>
            <div style="padding:4px;">
                <div>FIRST MIGRATION:</div>
                <div class="explicacion_de_campo">Out of «CREATE TABLE» sentences, you may want to commit the first migration of data. Here you can code all the INSERTs you need.</div>
                <textarea name="migracion" class="textarea_de_codigo" placeholder="SQL to insert data" spellcheck="false"></textarea>
            </div>
            <div style="text-align:right; padding: 4px; padding-top: 0px;">
                <input type="submit" class="boton" value="Create REST API" />
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