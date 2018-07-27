<form class="login-page__form text-center" id="login-form" method="POST" action="<?=HOST?>login" data-form-type = "login" novalidate >
	<div class="title-1">Вход на сайт</div>
	<? require ROOT . "/templates/_parts/_errors.tpl"; ?>

	<?=$error_descr?>

	<?=$error_email?>
	<input class="input" type="email" name="email" placeholder="Email" value="123@mail.com" data-error = 'Email не может быть пустым' data-valid='required'/>
	<?=$error_pass?>
	<input class="input" type="password" name="password" placeholder="Пароль" value="123" data-error = 'Пароль не может быть пустым' data-valid='required'/>
	<div class="login-page__form-helpers">
		<label class="checkbox__label">
			<input class="checkbox__input" type="checkbox" name="checkbox"/>
			<span class="checkbox__type"></span>&nbsp;Запомнить меня</label>
			<a class="login-page__link" href="<?=HOST?>lost-password">Забыл пароль</a>
	</div>
	<input type="submit" name="login" class="button button--enter" value="Войти" />
</form>