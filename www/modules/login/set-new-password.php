<?php 

$recoveryCode = false;
$newPasswordReady = false;

if (!empty($_GET['email'])) {

	$user = R::findOne('users', 'email = ?', array($_GET['email']));

	if ($user) {

		$user->recovery_code_times--;
		R::store($user);

			if ($user->recovery_code_times<1) {
				echo "User recovery code tries - limited";
				echo "<br><br>";
				echo "<a href='" . HOST . "'>Вернуться на главную</a>";
				die();
			}
		if ($user->recovery_code == $_GET['code']) {
			$recoveryCode = true;
		} else {
			$recoveryCode = false;
			echo "Код восстановления не верный";
			die();
			
		}
	} else{
		echo "Пользователь с таким email не найден";
		die();
	}

} elseif (isset($_POST['set-new-password'])) { //Когда уже меняем пароль
	
	$user = R::findOne('users', 'email = ?', array($_POST['resetemail']));
	$user->recovery_code_times--;
	R::store($user);

	$user = R::findOne('users', 'email = ?', array($_POST['resetemail']));
	if ($user) {
		if ($user->recovery_code_times<1) {
			die();
		}

		if ($user->recovery_code == $_POST['onetimecode']) {
			$user->password = password_hash($_POST['reset-password'], PASSWORD_DEFAULT);
			
			$user->recovery_code_times = 0;
			R::store($user);
			$recoveryCode = true;
			$success[] =[
				'title' => "Пароль изменен"];
			$newPasswordReady = true;
		
		} else {
			$recoveryCode = false;
			echo "Код восстановления не верный";
			die();
			
		}
	}

} else {
	header("Location: " . HOST . "lost-password");
	die();
}

ob_start();
include ROOT . "/templates/login/form-set-new-password.tpl";
$content = ob_get_contents();
ob_end_clean();
include ROOT . "/templates/_parts/_head.tpl";
include ROOT . "/templates/login/login-page.tpl";
include ROOT . "/templates/_parts/_foot.tpl";
 ?>