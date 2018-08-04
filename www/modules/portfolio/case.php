<?php


if (isset($_GET['id'])) {
	$sql = 'SELECT 
		portfolio.id, portfolio.title, portfolio.description, 
		portfolio.description_result, portfolio.description_tech,
		portfolio.git_link, portfolio.hosting_link, portfolio.case_img,portfolio.case_img_full,
		portfolio.date_time, portfolio.author_id, portfolio.category,
		users.firstname, users.lastname,
		categories.cat_title
	 	FROM `portfolio`
	 	INNER JOIN categories ON portfolio.category = categories.id
	 	INNER JOIN users ON portfolio.author_id = users.id
	 	WHERE portfolio.id = ' . $_GET['id'] . ' LIMIT 1';

	$case = R::getALL($sql)[0];
	
	$authorName = $case['firstname'] . " " . $case['lastname'];


	$listId = R::getCol('SELECT id FROM portfolio');
	foreach ($listId as $index => $id) {
		if ($id == $case['id']) {
			if($index!=0){
				$linkPrev = $listId[$index-1];
			} else{
				$linkPrev = '';
			}
			$linkNext = @$listId[$index+1];
			break;
		}
	}
	
	$title = $case['title'];
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
		header('Location: ' . HOST . 'portfolio/case?id=' . $_GET['id']);
		exit();
	}
}

ob_start();
include ROOT . "/templates/portfolio/portfolio-case.tpl";
$content = ob_get_contents();
ob_end_clean();

include ROOT . "/templates/_parts/_head.tpl";
include ROOT . "/templates/template.tpl";
include ROOT . "/templates/_parts/_footer.tpl";
include ROOT . "/templates/_parts/_foot.tpl";
 ?>