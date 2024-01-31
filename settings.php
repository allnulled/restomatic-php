<?php

$env = parse_ini_file("./settings.env");
$env = array(
    "DATABASE_ADAPTER" => "mysql",
    "SQLITE_FILE" => "./database.sqlite",
    "MYSQL_HOST" => "127.0.0.1",
    "MYSQL_PORT" => "3306",
    "MYSQL_USER" => "root",
    "MYSQL_PASSWORD" => "",
    "MYSQL_DATABASE" => "example",
);

foreach ($env as $key => $value) {
    define($key, $value);
}

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
header("Allow: GET, POST, OPTIONS, PUT, DELETE");
if($_SERVER['REQUEST_METHOD'] == "OPTIONS") {
    die();
}
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

if (!function_exists('apache_request_headers')) {
    function apache_request_headers()
    {
        $arh = array();
        $rx_http = '/\AHTTP_/';
        foreach ($_SERVER as $key => $val) {
            if (preg_match($rx_http, $key)) {
                $arh_key = preg_replace($rx_http, '', $key);
                $rx_matches = array();
                // do some nasty string manipulations to restore the original letter case
                // this should work in most cases
                $rx_matches = explode('_', $arh_key);
                if (count($rx_matches) > 0 and strlen($arh_key) > 2) {
                    foreach ($rx_matches as $ak_key => $ak_val)
                        $rx_matches[$ak_key] = ucfirst($ak_val);
                    $arh_key = implode('-', $rx_matches);
                }
                $arh[$arh_key] = $val;
            }
        }
        return ($arh);
    }
}