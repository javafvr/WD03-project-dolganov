<?php

$error_email='';
$error_pass = '';
$error_descr = '';

foreach($errors as $error) {
	if(count($error)==1){
		echo "<div class='error error__title'>" . $error['title'] . "</div>";

		if($error['title'] == 'Введите Email'){
			$error_email = "<div class='error error__title'>" . $error['title'] . "</div>";
		}

		if($error['title'] == 'Введите Пароль'){
			$error_pass = "<div class='error error__title'>" . $error['title'] . "</div>";
		}
	
	} elseif (count($error)==2) {
		$error_descr = "<div class='error'><div class='error__title error__title--with-desc'>" . $error['title'] ."</div><div class='error__desc'>" . $error['desc'] . "</div></div>";
	}
}

?>