<?php

if (!isAdmin()) {
	header("Location: " . HOST);
	die();
}

$title = "Портфолио - Добавить новую работу";

$categories = R::find('categories', 'ORDER BY cat_title ASC');

if (isset($_POST['caseNew'])) {
	if (trim($_POST['title'] =='')) {
		$errors[]=['title'=>'Введите название работы'];
	}
	if (trim($_POST['description'] =='')) {
		$errors[]=['title'=>'Введите содержание работы'];
	}
	if (trim($_POST['descriptionResult'] =='')) {
		$errors[]=['title'=>'Введите содержание результата работы'];
	}
	if (trim($_POST['descriptionTech'] =='')) {
		$errors[]=['title'=>'Введите используемые технологии'];
	}

	if (empty($errors)) {
		$portfolio = R::dispense('portfolio');
		$portfolio->title = htmlentities($_POST['title']);
		$portfolio->description = htmlentities($_POST['description']);
		$portfolio->descriptionResult = htmlentities($_POST['descriptionResult']);
		$portfolio->descriptionTech = htmlentities($_POST['descriptionTech']);
		$portfolio->category = htmlentities($_POST['caseCat']);
		$portfolio->gitLink = htmlentities($_POST['gitLink']);
		$portfolio->hostingLink = htmlentities($_POST['hostingLink']);
		$portfolio->authorId = $_SESSION['logged_user']['id'];
		$portfolio->dateTime = R::isoDateTime();


		if (isset($_FILES['caseImg']['name']) && $_FILES['caseImg']['tmp_name'] != '') {
			
			$fileName = $_FILES['caseImg']['name'];
			$fileTmpLoc = $_FILES['caseImg']['tmp_name'];
			$fileType = $_FILES['caseImg']['type'];
			$fileSize = $_FILES['caseImg']['size'];
			$fileErrorMsg = $_FILES['caseImg']['error'];
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

			$caseImgFolderLocation = ROOT . 'usercontent/portfolio/';

			$db_file_name = rand(100000000000, 999999999999) . "." . $fileExt;
			$uploadfile = $caseImgFolderLocation . $db_file_name;
			$moveResult = move_uploaded_file($fileTmpLoc, $uploadfile);

			if (!$moveResult) {
				$errors[] = ['title' => 'Ошибка загрузки файла'];
			}

			include_once ROOT . "/libs/image_resize_imagick.php";

			// Файл полностью без обрезки, для портфолио
			$target_file = $caseImgFolderLocation . $db_file_name;
			$full_file = "full-" . $db_file_name;
			$new_file =$caseImgFolderLocation . $full_file;
			$copyResult = copy($target_file, $new_file);
			if ($copyResult) {
				$portfolio->caseImgFull =$full_file;
			} else{
				$errors[] = ['title' => 'Ошибка загрузки файла'];
			}

			$target_file = $caseImgFolderLocation . $db_file_name;
			$resized_file = $caseImgFolderLocation . $db_file_name;
			$wmax =920;
			$hmax =620;
			$img = createThumbnail($target_file, $wmax, $hmax);
			$img->writeImage($resized_file);
			$portfolio->caseImg = $db_file_name;

			$target_file = $caseImgFolderLocation . $db_file_name;
			$resized_file = $caseImgFolderLocation . "small-" . $db_file_name;
			$wmax =320;
			$hmax =140;
			$img = createThumbnailCrop($target_file, $wmax, $hmax);
			$img->writeImage($resized_file);
			$portfolio->caseImgSmall = "small-" . $db_file_name;
		}

		R::store($portfolio);
		header('Location: ' . HOST . "portfolio?result=caseCreated");
	}
}


ob_start();
include ROOT . "/templates/_parts/_header.tpl";
include ROOT . "/templates/portfolio/case-new.tpl";
$content = ob_get_contents();
ob_end_clean();

include ROOT . "/templates/_parts/_head.tpl";
include ROOT . "/templates/template.tpl";
include ROOT . "/templates/_parts/_footer.tpl";
include ROOT . "/templates/_parts/_foot.tpl";
 ?>