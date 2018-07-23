<?php 

$errors = array();
$title = "Вход на сайт";

// Регистрация если форма отправлена
if(isset($_POST['login'])){
	// dd($_POST);

	if (trim($_POST['email']) == '') {
		$errors[] = ['title' => 'Введите Email'];
	}

	if (trim($_POST['password']) == '') {
		$errors[] = ['title' => 'Введите Пароль'];
	}

	if (empty($errors)) {
		$user = R::findOne('users','email = ?', array($_POST['email']));

		if ($user) {
			if (password_verify($_POST['password'], $user->password)) {
				$_SESSION['logged_user'] = $user;
				$_SESSION['login'] = "1";
				$_SESSION['role'] = $user->role;
				header('Location: ' . HOST . "");
				exit();
			} else{
				$errors[] = ['title' => 'Пароль введен неверно', 'desc' => '<p>Попробуйте еще раз.</p><p>Или воспользуйтесь <a href="#">восстановлением пароля</a>, чтобы войти на сайт.</p>'];
			}
		} else {
			$errors[] = ['title' => 'Пользователя с таким email не существует', 'desc' => '<p>Попробуйте еще раз.</p><p>Или воспользуйтесь <a href="#">восстановлением пароля</a>, чтобы войти на сайт.</p>'];
		}
	}
}

ob_start();
include ROOT . "/templates/login/form-login.tpl";
$content = ob_get_contents();
ob_end_clean();
include ROOT . "/templates/_parts/_head.tpl";
include ROOT . "/templates/login/login-page.tpl";
include ROOT . "/templates/_parts/_foot.tpl";

 ?>