<?php

$framework = get_rest_framework();

get_rest_request()->expand_setting("output", array(
    "select.on_build_query.action" => "OK"
));

get_rest_request()->set_setting("query", "");