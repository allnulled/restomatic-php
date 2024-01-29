<?php

$framework = get_rest_framework();
$request = get_rest_request();
$utils = $framework->utils;

$query = $request->get_setting("query", false);
$result = $framework->database->query($query);
$data = array();

while ($row = $result->fetchArray(SQLITE3_ASSOC)) {
    array_push($data, $row);
}

$request->set_setting("output", $data);
