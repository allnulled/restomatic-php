<?php

$framework = get_rest_framework();
$utils = $framework->utils;
$request = get_rest_request();
$is_dangerous_operation = in_array($request->operation, array("insert", "update", "delete"));
$is_admin = $request->is_admin;

if($is_dangerous_operation && !$is_admin) {
    $utils->print_json(array(
        "error" => true,
        "message" => "Se requiere autentificación especial para esta operación"
    ));
    die();
}