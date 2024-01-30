<?php

$framework = get_rest_framework();
$request = get_rest_request();
$utils = $framework->utils;

$query = $request->get_setting("query", false);
$result = $framework->database->query($query);
$data = array();

if(DATABASE_ADAPTER == "sqlite") {
    while ($row = $result->fetchArray(SQLITE3_ASSOC)) {
        array_push($data, $row);
    }
} else if(DATABASE_ADAPTER == "mysql") {
    $data = mysqli_fetch_all($result, MYSQLI_ASSOC);
}

$request->set_setting("output", $data);
