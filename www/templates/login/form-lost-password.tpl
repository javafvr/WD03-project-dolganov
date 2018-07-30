<form class="login-page__form text-center" id="lost-password-form" method="POST" action="<?=HOST?>lost-password" data-form-type = "lost-password" novalidate>
	<div class="title-1">Восстановление пароля</div>
	<? require ROOT . "/templates/_parts/_errors.tpl"; ?>
	<? require ROOT . "/templates/_parts/_success.tpl"; ?>

	<?=$error_descr?>
	<?=$error_email?>
	<input class="input" type="email" name="email" placeholder="Email" data-valid ='required' data-error = 'Введите email'/>
	<?=$error_pass?>
	<div class="login-page__form-helpers ">
		<div class="col-12">
			<a class="login-page__link" href="<?=HOST?>login">Перейти на страницу входа</a>
			
		</div>
	</div>
	<input type="submit" name="lost-password" class="button button--enter" value="Восстановить" />
</form>