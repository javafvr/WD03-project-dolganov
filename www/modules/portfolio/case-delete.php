<?php

if (!isAdmin()) {
	header("Location: " . HOST);
	die();
}

$title = "Удалить пост";

$case = R::load('portfolio', $_GET['id']);

// $posts = R::find('posts', 'ORDER BY cat_title ASC');

if (isset($_POST['caseDelete'])) {
	$caseImgFolderLocation = ROOT . 'usercontent/portfolio/';

	// Если у поста есть изображение - удаляем
	if ($case['case_img']!="" || $case['case_img_small']!="" || $case['case_img_small']!="") {
		$picurl = $caseImgFolderLocation . $case['case_img'];
		$picurlSmall = $caseImgFolderLocation . $case['case_img_small'];
		$picurlFull = $caseImgFolderLocation . $case['case_img_small'];

		if (file_exists($picurl)){unlink($picurl);}
		if (file_exists($picurlSmall)){unlink($picurlSmall);}
		if (file_exists($picurlFull)){unlink($picurlFull);}
	}

	R::trash($case);
	header('Location: ' . HOST . "portfolio?result=caseDeleted");
	exit();
}


ob_start();
include ROOT . "/templates/_parts/_header.tpl";
include ROOT . "/templates/portfolio/case-delete.tpl";
$content = ob_get_contents();
ob_end_clean();

include ROOT . "/templates/_parts/_head.tpl";
include ROOT . "/templates/template.tpl";
include ROOT . "/templates/_parts/_footer.tpl";
include ROOT . "/templates/_parts/_foot.tpl";

?>