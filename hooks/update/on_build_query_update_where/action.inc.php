<?php

$framework = get_rest_framework();
$request = get_rest_request();
$utils = $framework->utils;

$query = $request->get_setting("query");

$query .= "\nWHERE ";

$id = $request->get_parameter("id");
if(!is_integer($id)) {
    $utils->print_json(array(
        "error" => true,
        "message" => "Se requiere parametro «id» como un entero"
    ));
    die();
}
$query .= " id = ";
$query .= $utils->escape_sql_string($id);
$query .= ";";

$request->set_setting("query", $query);