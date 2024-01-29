<?php

$framework = get_rest_framework();
$request = get_rest_request();
$utils = $framework->utils;

$query = $request->get_setting("query");

$query .= "INSERT INTO ";
$query .= $utils->escape_sql_string($request->table);
$query .= " (";

$item = $request->get_parameter("value");
if(!is_array($item)) {
    $utils->print_json(array(
        "error" => true,
        "message" => "Se requiere parametro «value» como un objeto"
    ));
    die();
}
$index_property = 0;
foreach ($item as $key => $value) {
    $index_property++;
    if ($index_property !== 1) {
        $query .= ", ";
    }
    $query .= $utils->escape_sql_string($key);
}

$query .= ")";

$request->set_setting("query", $query);