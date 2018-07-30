<form class="login-page__form text-center" id="set-new-password-form" method="POST" action="<?=HOST?>set-new-password" data-form-type = "set-new-password" novalidate>
	<?php if (!$newPasswordReady) {?>
		<div class="title-1">Введите новый пароль</div>
	<?}?>
	<? require ROOT . "/templates/_parts/_errors.tpl"; ?>
	<? require ROOT . "/templates/_parts/_success.tpl"; ?>

	<?=$error_descr?>
	<?=$error_pass?>

	<?php if (!$newPasswordReady) {?>
		<input class="input" type="password" name="reset-password" placeholder="Новый пароль" data-valid ='required' data-error = 'Введите пароль'/>
		<input class="input" type="password" name="reset-password-confirm" placeholder="Введите пароль еще раз" data-valid ='required' data-error = 'Введите пароль еще раз'/>
	<?}?>
	<div class="login-page__form-helpers ">
		<div class="col-12">
			<a class="login-page__link" href="<?=HOST?>login">Перейти на страницу входа</a>
			
		</div>
	</div>
	<?php if (!$newPasswordReady) {?>
	<input type="submit" name="set-new-password" class="button button--enter" value="Сохранить" />
	
	<input type="hidden" name="resetemail" value="<?=$_GET['email']?>" />
	<input type="hidden" name="onetimecode" value="<?=$_GET['code']?>" />
	<?}?>

</form>