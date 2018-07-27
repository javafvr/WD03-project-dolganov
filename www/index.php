<?php 
// Путь до корневой директории
define('HOST', $_SERVER['REQUEST_SCHEME'] . '://' . $_SERVER['HTTP_HOST'] . '/');
// Путь до файла физически
define('ROOT', dirname(__FILE__).'/');

$errors = array();
$success = array();

require ROOT . "config.php";
require ROOT . "db.php";
require ROOT . "libs/functions.php";

session_start();

/*---------------------
РОУТЕР
-------------------*/

$uri = $_SERVER['REQUEST_URI'];
$uri = rtrim($uri,"/");
$uri = filter_var($uri, FILTER_SANITIZE_URL);
$uri = substr($uri, 1);
$uri = explode('?', $uri);

if (isset($_SESSION['logged_user'])) {
	$currentUser=$_SESSION['logged_user'];
};

// echo $uri[0];

switch ($uri[0]) {
	case '':
		include "modules/main/index.php";
		break;

/*USERS*/

	case 'registration':
		include ROOT . "modules/login/registration.php";
		break;
	
	case 'login':
		include ROOT . "modules/login/login.php";
		break;

	case 'logout':
		include ROOT . "modules/login/logout.php";
		break;

	case 'lost-password':
		include ROOT . "modules/login/lost-password.php";
		break;
	
	case 'set-new-password':
		include ROOT . "modules/login/set-new-password.php";
		break;

	case 'about':
		include "modules/about/index.php";
		break;

	case 'contacts':
		include "modules/contacts/index.php";
		break;

	case 'profile':
		include "modules/profile/index.php";
		break;

	case 'profile-edit':
		include "modules/profile/edit.php";
		break;

	case 'blog':
		include "modules/blog/index.php";
		break;
	
	default:
		include "modules/main/index.php";
		break;
}
 ?>