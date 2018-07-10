<?php 



include "libs/rb-mysql.php";

echo 'dbname='. DB_NAME;
R::setup('mysql:host=' . DB_HOST . ';dbname='. DB_NAME , DB_USER, DB_PASS);
// R::freeze(true);

 ?>