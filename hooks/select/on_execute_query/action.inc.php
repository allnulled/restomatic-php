<?php

$framework = get_rest_framework();
$request = get_rest_request();
$utils = $framework->utils;

$request->expand_setting("output", array(
    "select.on_execute_query.action" => "OK"
));

$query = $request->get_setting("query", false);
$result = $framework->database->query($query);

$request->expand_setting("output", array(
    "query" => $query,
    "result" => $result
));
