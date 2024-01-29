<?php

$framework = get_rest_framework();
$request = get_rest_request();
$utils = $framework->utils;

$query = $request->get_setting("query");

$query .= " SET ";

$item = $request->get_parameter("value");
if(!is_array($item)) {
    throw new Exception("Se requiere parametro «value» como un objeto");
}
$index_property = 0;
foreach ($item as $key => $value) {
    $index_property++;
    if ($index_property !== 1) {
        $query .= ", ";
    }
    $query .= $utils->escape_sql_string($key);
    $query .= " = ";
    $query .= "'" . $utils->escape_sql_string($value) . "'";
}

$query .= "";

$request->set_setting("query", $query);