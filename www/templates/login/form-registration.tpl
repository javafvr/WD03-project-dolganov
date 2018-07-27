<form class="login-page__form text-center" id="form" method="POST" action="<?=HOST?>registration" data-form-type = "registration" novalidate>
	<div class="title-1">Регистрация</div>
	
	<? require ROOT . "/templates/_parts/_errors.tpl"; ?>

	<?=$error_descr?>

	<?=$error_email?>

	<input class="input" type="email" name="email" data-valid="required" placeholder="Email" data-error="Введите email" />

	<?=$error_pass?>

	<input class="input" type="password" name="password" data-valid="required" placeholder="Пароль" data-error="Введите пароль"/>
	<input name="registr" class="button button--enter" type="submit" value="Регистрация" />
</form>