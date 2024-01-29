<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
header("Allow: GET, POST, OPTIONS, PUT, DELETE");
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
$method = $_SERVER["REQUEST_METHOD"];
if ($method == "OPTIONS") {
	die();
}
if(!file_exists("installed.txt")) {
	include("installer.php");
	die();
}
header("Content-Type: application/json");
$admin_token = file_get_contents("./installed.txt");
$request_headers = apache_request_headers();
$request_token = array_key_exists("Authorization", $request_headers) ? $request_headers["Authorization"] : "";
$is_admin = (!empty($request_token)) && ($admin_token === $request_token);
define("IS_ADMIN", $is_admin);

function get_rest_request()
{
	return $GLOBALS["request_state"];
}

class RequestState
{
	public $model = null;
	public $operation = null;
	public $framework = null;
	public $table = null;
	public $parameters = null;
	public $settings = null;
	public $is_admin = IS_ADMIN;
	public function __construct ($operation, $table, $model)
	{
		$GLOBALS["request_state"] = $this;
		$this->model = $model;
		$this->framework = get_rest_framework();
		$this->parameters = $this->framework->utils->get_request_parameters();
		$this->settings = array();
		$this->operation = $operation;
		$this->table = $table;
	}
	public function set_parameter($key, $value)
	{
		$this->parameters[$key] = $value;
	}
	public function get_parameter($key, $default_value = null)
	{
		return array_key_exists($key, $this->parameters) ? $this->parameters[$key] : $default_value;
	}
	public function set_setting($key, $value)
	{
		$this->settings[$key] = $value;
	}
	public function get_setting($key, $default_value = null)
	{
		return array_key_exists($key, $this->settings) ? $this->settings[$key] : $default_value;
	}

	public function expand_setting($key, $newdata) {
		$exists = array_key_exists($key, $this->settings);
		if(!$exists) {
			$this->settings[$key] = array();
		}
		$this->settings[$key] = array_merge($this->settings[$key], $newdata);
	}
}

class FrameworkUtilities
{
	public $framework = null;
	public function __construct($framework)
	{
		$this->framework = $framework;
	}
	public function escape_sql_string($text)
	{
		return SQLite3::escapeString($text);
	}
	public function get_request_parameters()
	{
		$post_data = json_decode(file_get_contents("php://input"), true);
		$post_data = is_null($post_data) ? array() : $post_data;
		if (empty($post_data)) {
			$post_data = $_GET;
		}
		return array_merge(array(), $post_data);
	}
	public function get_array_property($data, $property, $default_value)
	{
		if (array_key_exists($property, $data)) {
			return $data[$property];
		} else {
			return $default_value;
		}
	}
	public function print_json($data)
	{
		echo json_encode($data, JSON_UNESCAPED_UNICODE);
	}
	public function include_hook($path)
	{
		$fullpath = realpath("./hooks/" . $path);
		$exists = file_exists($fullpath);
		if (!$exists) {
			return false;
		}
		include($fullpath);
	}
	public function generate_random_string($longitud) {
		$alphabet = explode("", "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ");
		$random_string = "";
		for ($i = 0; $i < $longitud; $i++) {
			$random_string = array_rand($alphabet, 1);
		}
		return $random_string;
	}
}

class Framework
{
	public $utils = null;
	public $database = null;
	public function __construct()
	{
		$this->database = new SqliteDatabase("database.sqlite");
		$this->utils = new FrameworkUtilities($this);
	}
}

$GLOBALS["framework"] = new Framework();

function get_rest_framework()
{
	return $GLOBALS["framework"];
}

class SqliteDatabase
{
	public $database_file = null;
	public $native_db = null;
	public function __construct($database_file)
	{
		$this->database_file = $database_file;
		$this->native_db = new SQLite3($database_file);
	}
	public function query($query)
	{
		return $this->native_db->query($query);
	}
}

class DatabaseModel
{
	public $name = null;
	public $database = null;
	public $framework = null;
	public function __construct($name, $database)
	{
		$this->name = $name;
		$this->database = $database;
		$this->framework = get_rest_framework();
	}
	public function select()
	{
		$request = new RequestState("select", $this->name, $this);
		$this->framework->utils->include_hook("common/before.inc.php");
		$this->framework->utils->include_hook("select/action/before.inc.php");
		$this->framework->utils->include_hook("select/on_build_query_select_from/before.inc.php");
		$this->framework->utils->include_hook("select/on_build_query_select_from/action.inc.php");
		$this->framework->utils->include_hook("select/on_build_query_select_from/after.inc.php");
		$this->framework->utils->include_hook("select/on_build_query_select_join/before.inc.php");
		$this->framework->utils->include_hook("select/on_build_query_select_join/action.inc.php");
		$this->framework->utils->include_hook("select/on_build_query_select_join/after.inc.php");
		$this->framework->utils->include_hook("select/on_build_query_select_where/before.inc.php");
		$this->framework->utils->include_hook("select/on_build_query_select_where/action.inc.php");
		$this->framework->utils->include_hook("select/on_build_query_select_where/after.inc.php");
		$this->framework->utils->include_hook("select/on_build_query_select_order_by/before.inc.php");
		$this->framework->utils->include_hook("select/on_build_query_select_order_by/action.inc.php");
		$this->framework->utils->include_hook("select/on_build_query_select_order_by/after.inc.php");
		$this->framework->utils->include_hook("select/on_build_query_select_limit_offset/before.inc.php");
		$this->framework->utils->include_hook("select/on_build_query_select_limit_offset/action.inc.php");
		$this->framework->utils->include_hook("select/on_build_query_select_limit_offset/after.inc.php");
		$this->framework->utils->include_hook("select/on_execute_query/before.inc.php");
		$this->framework->utils->include_hook("select/on_execute_query/action.inc.php");
		$this->framework->utils->include_hook("select/on_execute_query/after.inc.php");
		$this->framework->utils->include_hook("select/action/after.inc.php");
		$this->framework->utils->include_hook("common/after.inc.php");
		return $this->framework->utils->print_json($request->get_setting("output"));
	}
	public function insert()
	{
		$request = new RequestState("insert", $this->name, $this);
		$this->framework->utils->include_hook("common/before.inc.php");
		$this->framework->utils->include_hook("insert/action/before.inc.php");
		$this->framework->utils->include_hook("insert/on_build_query_insert_into/before.inc.php");
		$this->framework->utils->include_hook("insert/on_build_query_insert_into/action.inc.php");
		$this->framework->utils->include_hook("insert/on_build_query_insert_into/after.inc.php");
		$this->framework->utils->include_hook("insert/on_build_query_insert_values/before.inc.php");
		$this->framework->utils->include_hook("insert/on_build_query_insert_values/action.inc.php");
		$this->framework->utils->include_hook("insert/on_build_query_insert_values/after.inc.php");
		$this->framework->utils->include_hook("insert/on_execute_query/before.inc.php");
		$this->framework->utils->include_hook("insert/on_execute_query/action.inc.php");
		$this->framework->utils->include_hook("insert/on_execute_query/after.inc.php");
		$this->framework->utils->include_hook("insert/action/after.inc.php");
		$this->framework->utils->include_hook("common/after.inc.php");
		return $this->framework->utils->print_json($request->get_setting("output"));
	}
	public function update()
	{
		$request = new RequestState("update", $this->name, $this);
		$this->framework->utils->include_hook("common/before.inc.php");
		$this->framework->utils->include_hook("update/action/before.inc.php");
		$this->framework->utils->include_hook("update/on_build_query_update_from/before.inc.php");
		$this->framework->utils->include_hook("update/on_build_query_update_from/action.inc.php");
		$this->framework->utils->include_hook("update/on_build_query_update_from/after.inc.php");
		$this->framework->utils->include_hook("update/on_build_query_update_set/before.inc.php");
		$this->framework->utils->include_hook("update/on_build_query_update_set/action.inc.php");
		$this->framework->utils->include_hook("update/on_build_query_update_set/after.inc.php");
		$this->framework->utils->include_hook("update/on_build_query_update_where/before.inc.php");
		$this->framework->utils->include_hook("update/on_build_query_update_where/action.inc.php");
		$this->framework->utils->include_hook("update/on_build_query_update_where/after.inc.php");
		$this->framework->utils->include_hook("update/on_execute_query/before.inc.php");
		$this->framework->utils->include_hook("update/on_execute_query/action.inc.php");
		$this->framework->utils->include_hook("update/on_execute_query/after.inc.php");
		$this->framework->utils->include_hook("update/action/after.inc.php");
		$this->framework->utils->include_hook("common/after.inc.php");
		return $this->framework->utils->print_json($request->get_setting("output"));
	}
	public function delete()
	{
		$request = new RequestState("delete", $this->name, $this);
		$this->framework->utils->include_hook("common/before.inc.php");
		$this->framework->utils->include_hook("delete/action/before.inc.php");
		$this->framework->utils->include_hook("delete/on_build_query_delete_from/before.inc.php");
		$this->framework->utils->include_hook("delete/on_build_query_delete_from/action.inc.php");
		$this->framework->utils->include_hook("delete/on_build_query_delete_from/after.inc.php");
		$this->framework->utils->include_hook("delete/on_build_query_delete_where/before.inc.php");
		$this->framework->utils->include_hook("delete/on_build_query_delete_where/action.inc.php");
		$this->framework->utils->include_hook("delete/on_build_query_delete_where/after.inc.php");
		$this->framework->utils->include_hook("delete/on_execute_query/before.inc.php");
		$this->framework->utils->include_hook("delete/on_execute_query/action.inc.php");
		$this->framework->utils->include_hook("delete/on_execute_query/after.inc.php");
		$this->framework->utils->include_hook("delete/action/after.inc.php");
		$this->framework->utils->include_hook("common/after.inc.php");
		return $this->framework->utils->print_json($request->get_setting("output"));
	}
}

$framework = get_rest_framework();
$utils = $framework->utils;
$parameters = $utils->get_request_parameters();
$operation = $utils->get_array_property($parameters, "operation", null);
if($operation === "schema") {
	$schema_contents = file_get_contents("./schema.json");
	echo $schema_contents;
	return;
}
$table = $utils->get_array_property($parameters, "table", null);
if (is_null($operation)) {
	$utils->print_json(array("message" => "Se requiere parámetro 'operation' en controlador REST principal"));
	return;
}
if (!in_array($operation, array("select", "insert", "update", "delete"))) {
	$utils->print_json(array("message" => "Se requiere parámetro 'operation' que sea válido en controlador REST principal"));
	return;
}
if (is_null($table)) {
	$utils->print_json(array("message" => "Se requiere parámetro 'table' en controlador REST principal"));
	return;
}
$model = new DatabaseModel($table, $framework->database);
$model->$operation();

