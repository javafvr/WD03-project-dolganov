<?php

if (!isAdmin()) {
	header("Location: " . HOST);
	die();
}

$title = "Редактировать - Обо мне";

$about = R::load('about', 1);

if (isset($_POST['textUpdate'])) {
	if (trim($_POST['firstname'] =='')) {
		$errors[]=['title'=>'Введите свое имя'];
	}
	if (trim($_POST['description'] =='')) {
		$errors[]=['title'=>'Заполните краткое описание о себе'];
	}

	if (empty($errors)) {
		// $about = R::dispense('about');
		$about->firstname = htmlentities($_POST['firstname']);
		$about->description = $_POST['description'];


		if (isset($_FILES['photo']['name']) && $_FILES['photo']['tmp_name']!='') {
			
			$fileName = $_FILES['photo']['name'];
			$fileTmpLoc = $_FILES['photo']['tmp_name'];
			$fileType = $_FILES['photo']['type'];
			$fileSize = $_FILES['photo']['size'];
			$fileErrorMsg = $_FILES['photo']['error'];
			$kaboom = explode('.', $fileName);
			$fileExt = end($kaboom);

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

			// $postImg = $post;
			// $postImgSmall = $user['avatar_small'];
			$aboutImgFolderLocation = ROOT . 'usercontent/about/';

			// Если изображение поста уже есть - удаляем
			if ($about['photo']!="") {
				$picurl = $aboutImgFolderLocation . $about['photo'];

				if (file_exists($picurl)){unlink($picurl);}
			}

			$db_file_name = rand(100000000000, 999999999999) . "." . $fileExt;
			$uploadfile = $aboutImgFolderLocation . $db_file_name;
			$moveResult = move_uploaded_file($fileTmpLoc, $uploadfile);

			if (!$moveResult) {
				$errors[] = ['title' => 'Ошибка загрузки файла'];
			}

			include_once ROOT . "/libs/image_resize_imagick.php";

			$target_file = $aboutImgFolderLocation . $db_file_name;
			$resized_file = $aboutImgFolderLocation . $db_file_name;
			$wmax =222;
			$hmax =222;
			$img = createThumbnail($target_file, $wmax, $hmax);
			$img->writeImage($resized_file);
			$about->photo = $db_file_name;

		}

		R::store($about);
		header('Location: ' . HOST . "about?result=aboutSaved");
	}
}

ob_start();
include ROOT . "/templates/_parts/_header.tpl";
include ROOT . "/templates/about/edit-text.tpl";
$content = ob_get_contents();
ob_end_clean();

include ROOT . "/templates/_parts/_head.tpl";
include ROOT . "/templates/template.tpl";
include ROOT . "/templates/_parts/_footer.tpl";
include ROOT . "/templates/_parts/_foot.tpl";
 ?>