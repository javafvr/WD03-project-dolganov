<?php

if (!isAdmin()) {
	header("Location: " . HOST);
	die();
}

$title = "Удалить сообщение";

$message = R::load('messages', $_GET['id']);

// $posts = R::find('posts', 'ORDER BY cat_title ASC');

if (isset($_POST['messageDelete'])) {
	$messageFileFolderLocation = ROOT . 'usercontent/upload_files/';

	// Если у поста есть изображение - удаляем
	if ($message['message_filename']!="") {
		$picurl = $messageFileFolderLocation . $message['message_filename'];
		if (file_exists($picurl)){unlink($picurl);}
	}

	R::trash($message);
	$success[]=['title' => 'Сообщение удалено успешно'];
	header('Location: ' . HOST . "messages?result=messageDeleted");
	// exit();
}


ob_start();
include ROOT . "/templates/_parts/_header.tpl";
include ROOT . "/templates/contacts/message-delete.tpl";
$content = ob_get_contents();
ob_end_clean();

include ROOT . "/templates/_parts/_head.tpl";
include ROOT . "/templates/template.tpl";
include ROOT . "/templates/_parts/_footer.tpl";
include ROOT . "/templates/_parts/_foot.tpl";

?>