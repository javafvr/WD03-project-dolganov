<?php


if (isset($_GET['id'])) {
	$sql = 'SELECT 
		posts.id, posts.title, posts.text, posts.post_img, posts.date_time, posts.update_time, posts.author_id, posts.category, 
		users.firstname, users.lastname,
		categories.cat_title
		FROM `posts`
		INNER JOIN categories ON posts.category = categories.id
		INNER JOIN users ON posts.author_id = users.id
		WHERE posts.id = ' . $_GET['id'] . ' LIMIT 1';

	$post = R::getALL($sql)[0];
	
	$authorName = $post['firstname'] . " " . $post['lastname'];

	$title = $post['title'];
}

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