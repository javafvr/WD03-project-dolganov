<?php

if (!isAdmin()) {
	header("Location: " . HOST);
	die();
}

$title = "Удалить пост";

$post = R::load('posts', $_GET['id']);

	$sql = 'SELECT comments.id FROM `comments` WHERE post_id = ' . $post['id'];

$comments = R::getALL($sql);

// $posts = R::find('posts', 'ORDER BY cat_title ASC');

if (isset($_POST['postDelete'])) {
	$postImgFolderLocation = ROOT . 'usercontent/blog/';

	// Если у поста есть изображение - удаляем
	if ($post['post_img']!="" || $post['post_img_small']!="") {
		$picurl = $postImgFolderLocation . $post['post_img'];
		$picurlSmall = $postImgFolderLocation . $post['post_img_small'];

		if (file_exists($picurl)){unlink($picurl);}
		if (file_exists($picurlSmall)){unlink($picurlSmall);}
	}
	
	foreach ($comments as $id) {
		$comment = R::load('comments',$id['id']);
		R::trash($comment);
	}

	R::trash($post);
	header('Location: ' . HOST . "blog?result=postDeleted");
	exit();
}


ob_start();
include ROOT . "/templates/_parts/_header.tpl";
include ROOT . "/templates/blog/post-delete.tpl";
$content = ob_get_contents();
ob_end_clean();

include ROOT . "/templates/_parts/_head.tpl";
include ROOT . "/templates/template.tpl";
include ROOT . "/templates/_parts/_footer.tpl";
include ROOT . "/templates/_parts/_foot.tpl";

?>