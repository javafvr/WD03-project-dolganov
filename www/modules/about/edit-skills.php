<?php

if (!isAdmin()) {
	header("Location: " . HOST);
	die();
}

$title = "Редактировать - навыки";

$skills = R::load('skills', 1);

if (isset($_POST['skillsUpdate'])) {
	$errorFieldsOver = '';
	$errorFieldsWrong = '';
	foreach ($_POST as $field => $value) {
		if ($field!='skillsUpdate') {
			if (intval($_POST[$field]) > 100) {
				$errorFieldsOver = $errorFieldsOver . $field . ", "; 
			}

			if (intval($_POST[$field]) == 0 && $_POST[$field] != '0') {
				$errorFieldsWrong = $errorFieldsWrong . $field . ", "; 
			}
		}
		
	}
		
	if ($errorFieldsOver!='') {
		$errors[]=['title'=>"Число в поле $errorFieldsOver должно быть меньше 100"];
	}

	if ($errorFieldsWrong!='') {
		$errors[]=['title'=>"Число в поле $errorFieldsWrong должно быть целым числом "];
	}

	if (empty($errors)) {
		// $skills = R::dispense('skills');
		foreach ($_POST as $key => $value) {
			if ($key!='skillsUpdate') {
				$skills->$key = htmlentities($_POST[$key]);
			}
		}

		R::store($skills);
		header('Location: ' . HOST . "about?result=skillsSaved");
		exit();
	}
}

ob_start();
include ROOT . "/templates/_parts/_header.tpl";
include ROOT . "/templates/about/edit-skills.tpl";
$content = ob_get_contents();
ob_end_clean();

include ROOT . "/templates/_parts/_head.tpl";
include ROOT . "/templates/template.tpl";
include ROOT . "/templates/_parts/_footer.tpl";
include ROOT . "/templates/_parts/_foot.tpl";
 ?>