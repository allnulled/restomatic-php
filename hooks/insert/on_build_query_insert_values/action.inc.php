<?php

$framework = get_rest_framework();
$request = get_rest_request();
$utils = $framework->utils;

$query = $request->get_setting("query");

$query .= "\nVALUES (";

$item = $request->get_parameter("value");
$index_property = 0;
foreach ($item as $key => $value) {
    $index_property++;
    if ($index_property !== 1) {
        $query .= ", ";
    }
    $query .= "'" . $utils->escape_sql_string($value) . "'";
}

$query .= ");";

$request->set_setting("query", $query);