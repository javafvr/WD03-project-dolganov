<?php

$title = "Редактировать профиль пользователя";
$errors = array();
$currentUser = $_SESSION['logged_user'];

// dd($currentUser);

$user = R::load('users', $currentUser->id);

if (isset($_POST['profile-update'])) {
	if (trim($_POST['email']) == '') {
		$errors[] = ['title' => 'Введите Email'];
	}

	if (trim($_POST['firstname']) == '') {
		$errors[] = ['title' => 'Введите Имя'];
	}

	if (trim($_POST['lastname']) == '') {
		$errors[] = ['title' => 'Введите Фамилию'];
	}

	if (empty($errors)) {
		$user->firstname = htmlentities($_POST['firstname']);
		$user->lastname = htmlentities($_POST['lastname']);
		$user->email = htmlentities($_POST['email']);
		$user->city = htmlentities($_POST['city']);
		$user->country = htmlentities($_POST['country']);


		if (isset($_FILES['avatar']['name']) && $_FILES['avatar']['tmp_name'] !="") {
			// dd($_FILES);
			$fileName = $_FILES['avatar']['name'];
			$fileTmpLoc = $_FILES['avatar']['tmp_name'];
			$fileType = $_FILES['avatar']['type'];
			$fileSize = $_FILES['avatar']['size'];
			$fileErrorMsg = $_FILES['avatar']['error'];

			$kaboom = explode(".", $fileName);
			$fileExt=end($kaboom);

			list($width, $height) = getimagesize($fileTmpLoc);

			if ($width < 10 || $height < 10) {
				$errors[] = ['title' => 'Картинка имеет нулевой размер'];	
			}

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

			$avatar = $user['avatar'];
			$avatarSmall = $user['avatar_small'];
			$avatarFolderLocation = ROOT . 'usercontent/avatar/';

			// Если аватарка уже есть - удаляем
			if ($avatar!="") {
				$picurl = $avatarFolderLocation . $avatar;
				$picurlSmall = $avatarFolderLocation . $avatarSmall;

				if (file_exists($picurl)){unlink($picurl);}
				if (file_exists($picurlSmall)){unlink($picurlSmall);}
			}

			$db_file_name = rand(100000000000, 999999999999) . "." . $fileExt;
			$uploadfile = $avatarFolderLocation . $db_file_name;
			$moveResult = move_uploaded_file($fileTmpLoc, $uploadfile);

			if (!$moveResult) {
				$errors[] = ['title' => 'Ошибка загрузки файла'];
			}

			include_once ROOT . "/libs/image_resize_imagick.php";
			
			$target_file = $avatarFolderLocation . $db_file_name;
			$resized_file = $avatarFolderLocation . $db_file_name;
			$wmax =222;
			$hmax =222;
			$img = createThumbnail($target_file, $wmax, $hmax);
			$img->writeImage($resized_file);
			$user->avatar = $db_file_name;

			//Маленькая аватарка
			$wmax =48;
			$hmax =48;
			$target_file = $avatarFolderLocation . $db_file_name;
			$resized_file = $avatarFolderLocation . "small-" . $db_file_name;
			$img = createThumbnail($target_file, $wmax, $hmax);
			$img->writeImage($resized_file);
			$user->avatarSmall = "small-" . $db_file_name;



		}


		R::store($user);
		$_SESSION['logged_user'] = $user;
		// $currentUser = $_SESSION['logged_user'];
		header('Location: ' . HOST . "profile");
		exit();

	}
}

ob_start();
include ROOT . "/templates/_parts/_header.tpl";
include ROOT . "/templates/profile/profile-edit.tpl";
$content = ob_get_contents();
ob_end_clean();

include ROOT . "/templates/_parts/_head.tpl";
include ROOT . "/templates/template.tpl";
include ROOT . "/templates/_parts/_footer.tpl";
include ROOT . "/templates/_parts/_foot.tpl";
 ?>