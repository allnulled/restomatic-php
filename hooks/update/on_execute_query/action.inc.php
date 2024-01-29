<?php

$framework = get_rest_framework();
$request = get_rest_request();
$utils = $framework->utils;

$query = $request->get_setting("query", false);
$result = $framework->database->query($query);

$request->expand_setting("output", array(
    "mensaje" => "El registro se actualizó correctamente"
));
