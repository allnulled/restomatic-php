<?php

$framework = get_rest_framework();
$request = get_rest_request();
$utils = $framework->utils;

$request->expand_setting("output", array(
    "select.on_build_query_select_from.action" => "OK"
));

$query = $request->get_setting("query");

$query .= "SELECT ";
$query .= "*";
$query .= "\nFROM ";
$query .= $utils->escape_sql_string($request->table);

$request->set_setting("query", $query);