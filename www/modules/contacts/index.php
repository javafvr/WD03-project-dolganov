<?php

$title = "Контакты";

$contacts = R::load('contacts', 1);


if (isset($_POST['sendMessage'])) {
		if (trim($_POST['firstname'] =='')) {
			$errors[]=['title'=>'Введите имя'];
		}
		if (trim($_POST['email'] =='')) {
			$errors[]=['title'=>'Введите email'];
		}

		if (trim($_POST['message'] =='')) {
			$errors[]=['title'=>'Введите содержание сообщения'];
		}

		if (empty($errors)) {
			$message = R::dispense('messages');
			$message->firstname = htmlentities($_POST['firstname']);
			// $message->user_id = if isLogged();
			$message->email = htmlentities($_POST['email']);
			$message->message = htmlentities($_POST['message']);
			$message->dateTime = R::isoDateTime();

			if (isset($_FILES['file']['name']) && $_FILES['file']['tmp_name'] != '') {
			
			$fileName = $_FILES['file']['name'];
			$fileTmpLoc = $_FILES['file']['tmp_name'];
			$fileType = $_FILES['file']['type'];
			$fileSize = $_FILES['file']['size'];
			$fileErrorMsg = $_FILES['file']['error'];
			$kaboom = explode('.', $fileName);
			$fileExt = end($kaboom);

			if ($fileSize > 4194304) {
				$errors[] = ['title' => 'Файл не должен быть более 4 Mb'];	
			}

			if(!preg_match("/.(gif|jpg|png)$/i", $fileName)){
				$errors[] = [
								'title' => 'Неверный формат изображения', 
								'desc' => '<p>Файл изображения должен быть в формате gif, jpg, jpeg или png</p>'
							];
			}

			if ($fileErrorMsg) {
				$errors[] = ['title' => 'При загрузке изображения произошла ошибка'];
			}

			$postImgFolderLocation = ROOT . 'usercontent/upload_files/';
			$db_file_name = rand(100000000000, 999999999999) . "." . $fileExt;
			$uploadfile = $postImgFolderLocation . $db_file_name;
			$moveResult = move_uploaded_file($fileTmpLoc, $uploadfile);

			if (!$moveResult) {
				$errors[] = ['title' => 'Ошибка загрузки файла'];
			}

			$message->message_filename_original = $fileName;
			$message->message_filename = $db_file_name;

			}

			R::store($message);
			$success[]=['title' => 'Сообщение отправлено успешно'];
		}
}



ob_start();
include ROOT . "/templates/_parts/_header.tpl";
include ROOT . "/templates/contacts/contacts.tpl";
$content = ob_get_contents();
ob_end_clean();

include ROOT . "/templates/_parts/_head.tpl";
include ROOT . "/templates/template.tpl";
include ROOT . "/templates/_parts/_footer.tpl";
include ROOT . "/templates/_parts/_foot.tpl";
 ?>
