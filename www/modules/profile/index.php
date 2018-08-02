<?php

$title = "Профиль пользователя";
$currentUser = $_SESSION['logged_user'];

$sql = 'SELECT comments.text, comments.date_time, comments.user_id, users.firstname, users.lastname, posts.title, comments.post_id
	FROM `comments` 
	INNER JOIN users ON comments.user_id = users.id
	INNER JOIN posts ON comments.post_id = posts.id 
	WHERE comments.user_id = ' . $_SESSION['logged_user']['id'];

$comments = R::getALL($sql);

ob_start();
include ROOT . "/templates/_parts/_header.tpl";
include ROOT . "/templates/profile/profile.tpl";
$content = ob_get_contents();
ob_end_clean();

include ROOT . "/templates/_parts/_head.tpl";
include ROOT . "/templates/template.tpl";
include ROOT . "/templates/_parts/_footer.tpl";
include ROOT . "/templates/_parts/_foot.tpl";
 ?>