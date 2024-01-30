<?php

include("./settings.php");

$database = null;
if(DATABASE_ADAPTER == "sqlite") {
    $database = new SQLite3(SQLITE_FILE);
} else {
    $database = mysqli_connect(MYSQL_HOST, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DATABASE);
}
$code = $_POST["base_de_datos"];
$password = $_POST["autentificador"];
$structure = $_POST["estructura"];
$migration = $_POST["migracion"];
if(empty($code)) {
    include("./installer.php");
    die();
}
if(empty($password)) {
    include("./installer.php");
    die();
}
if(DATABASE_ADAPTER == "sqlite") {
    $database->query($code . "\n" . $migration);
} else if(DATABASE_ADAPTER == "mysql") {
    mysqli_multi_query($database, $code . "\n" . $migration);
}
file_put_contents("installed.txt",$password);
file_put_contents("schema.json", $structure);

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Restomatic - Installation</title>
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
                <h2>Installation completed</h2>
                <h4 style="padding: 12px;">You can start using your REST API</h4>
                <h4>The entry point is <a href="./index.php">here</a></h4>
            </div>
            <hr />
            <div style="padding:12px; text-align: center;">¡Your <b>REST API</b> is already working!</div>
            <hr />
            <div style="padding:4px; font-size: 11px;">
                <div style="text-align: justify;">
                You just have to start making REST requests.
                But before you go, you can remember some points about how requests must be:
                </div>
                <ul style="padding-left: 20px;">
                    <li>They must be made with the POST method.</li>
                    <li>They must contain the header "Content-Type: application/json".</li>
                    <li>They must contain the parameter «operation» with select, insert, update or delete.</li>
                    <li>They must contain the parameter «table» with the name of the table.</li>
                    <li>They must contain, in its body, directly the JSON that is passed by.</li>
                </ul>
                <div>
                    <div>About the operations, you must remember that:</div>
                    <ul style="padding-left: 20px;">
                        <li>In the case of the SELECT, there is nothing you can do: it will simply return all the records of the table we specify.</li>
                        <li>In the case of the INSERT, there is 1 added parameter: «value» that must be an object with the values to insert.</li>
                        <li>In the case of the UPDATE, there are 2 added parameters: «value» that must be an object with the values to update, and «id» that must be an integer with the ID of the record to update.</li>
                        <li>In the case of the DELETE, there is 1 added parameter: «id» that must be an integer with the ID of the record to delete.</li>
                    </ul>
                </div>
                <div>And that is all. With this, you should know how to exploit this tool.</div>
            </div>
            <hr/>
            <div style="font-size: 11px;padding:4px;">
                <div>Para hacer pruebas, tienes el <a href="./jrtui">JSON Request Tester User Interface</a>. Con él puedes hacer las peticiones de prueba con todo lo que sabes ahora contra el servidor.</div>
            </div>
        </form>
    </div>
</body>
</html>