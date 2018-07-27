<?php


if (isset($_GET['id'])) {
	$post = R::load('posts',$_GET['id']);
	
	$title = $post['title'];

	// dd($post);

}

// $posts=R::find('posts', 'ORDER BY id DESC');

//dd($posts);

ob_start();
include ROOT . "/templates/_parts/_header.tpl";
include ROOT . "/templates/blog/blog-post.tpl";
$content = ob_get_contents();
ob_end_clean();

include ROOT . "/templates/_parts/_head.tpl";
include ROOT . "/templates/template.tpl";
include ROOT . "/templates/_parts/_footer.tpl";
include ROOT . "/templates/_parts/_foot.tpl";
 ?>