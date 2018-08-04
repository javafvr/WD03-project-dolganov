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
	// dd($post);
	$authorName = $post['firstname'] . " " . $post['lastname'];

	$sql = 'SELECT 
				comments.text, comments.date_time, comments.user_id, users.firstname, users.lastname, users.avatar_small 
			FROM `comments` 
			INNER JOIN users ON comments.user_id = users.id
			WHERE comments.post_id = ' . $_GET['id'];
	$comments = R::getALL($sql);
// dd($comments);

	$listId = R::getCol('SELECT id FROM posts');
	// dd($listId);
	foreach ($listId as $index => $id) {
		if ($id == $post['id']) {
			if($index!=0){
				$linkPrev = $listId[$index-1];
			} else{
				$linkPrev = '';
			}
			$linkNext = @$listId[$index+1];
			break;
		}
	}

	$title = $post['title'];
}


if (isset($_POST['addComment'])) {
	if (trim($_POST['commentText'] =='')) {
		$errors[]=['title'=>'Введите содержание комментария'];
	}

	if (empty($errors)) {
		$comment = R::dispense('comments');
		$comment->postId = htmlentities($_GET['id']);
		$comment->userId = htmlentities($_SESSION['logged_user']['id']);
		$comment->text = htmlentities($_POST['commentText']);
		$comment->dateTime = R::isoDateTime();
		R::store($comment);
		header('Location: ' . HOST . 'blog/post?id=' . $_GET['id']);
		exit();
	}
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