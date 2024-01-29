<?php

$database = new SQLite3("database.sqlite");
$code = $_POST["base_de_datos"];
$database->querySingle($code);
file_put_contents("installed.txt","Yes");