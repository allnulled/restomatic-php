<?php

$framework = get_rest_framework();
$request = get_rest_request();
$utils = $framework->utils;

$query = $request->get_setting("query");

$query .= "DELETE FROM ";
$query .= $utils->escape_sql_string($request->table);

$request->set_setting("query", $query);