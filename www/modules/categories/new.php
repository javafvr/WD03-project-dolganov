<?php

$title = "Создать новую категорию";
if (isset($_POST['catNew'])) {
	if (trim($_POST['catTitle'] =='')) {
		$errors[]=['title'=>'Введите название категории'];
	}
	if (empty($errors)) {
		$cat = R::dispense('categories');
		$cat->cat_title = htmlentities($_POST['catTitle']);
		R::store($cat);
		header('Location: ' . HOST . "blog/categories?result=catCreated");
		exit();
	}
}

ob_start();
include ROOT . "/templates/_parts/_header.tpl";
include ROOT . "/templates/categories/new.tpl";
$content = ob_get_contents();
ob_end_clean();

include ROOT . "/templates/_parts/_head.tpl";
include ROOT . "/templates/template.tpl";
include ROOT . "/templates/_parts/_footer.tpl";
include ROOT . "/templates/_parts/_foot.tpl";
 ?>