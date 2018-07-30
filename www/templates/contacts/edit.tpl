
<div class="container">
	<div class="mt-80 title-1">Редактировать данные</div>

	<?php include ROOT . "templates/_parts/_errors.tpl"?>

	<form action="<?=HOST?>contacts-edit" method="POST">
		<div class="row mt-25">
			<div class="col-md-3">
				<div class="title-6">Имя</div>
				<input class="input" type="text" name="firstname" placeholder="Введите имя" value="<?php dataFromPost("firstname", $contacts); ?>" data-error = 'Введите ваше имя' data-valid='required' />


			</div>
			<div class="col-md-3">
				<div class="title-6">Фамилия</div>
				<input class="input" type="text" name="lastname" placeholder="Введите фамилию" 
				value="<?php dataFromPost("lastname", $contacts); ?>" data-error = 'Введите вашу фамилию' data-valid='required' />
			</div>
		</div>
		<div class="row mt-15">
			<div class="col-md-3">
				<div class="title-6">Email</div>
				<input class="input" type="email" name="email" placeholder="Введите email" value="<?php dataFromPost("email", $contacts); ?>" data-error = 'Введите ваш email' data-valid='required' />
			</div>
			<div class="col-md-3">
				<div class="title-6">Skype</div>
				<input class="input" type="skype" name="skype" placeholder="Введите skupe" value="<?php dataFromPost("skype", $contacts); ?>"/>
			</div>
		</div>
		<div class="row mt-15">
			<div class="col-md-3">
				<div class="title-6">Вконтакте</div>
				<input class="input" type="text" name="vk" placeholder="Введите ссылку на профиль" value="<?php dataFromPost("vk", $contacts); ?>"/>
			</div>
			<div class="col-md-3">
				<div class="title-6">Facebook</div>
				<input class="input" type="text" name="fb" placeholder="Введите ссылку на профиль" value="<?php dataFromPost("fb", $contacts); ?>"/>
			</div>
			<div class="col-md-3">
				<div class="title-6">GitHub</div>
				<input class="input" type="text" name="github" placeholder="Введите ссылку на профиль" value="<?php dataFromPost("github", $contacts); ?>"/>
			</div>
			<div class="col-md-3">
				<div class="title-6">CodePen</div>
				<input class="input" type="text" name="codepen" placeholder="Введите ссылку на профиль" value="<?php dataFromPost("codepen", $contacts); ?>"/>
			</div>
			<div class="col-md-3">
				<div class="title-6">Twitter</div>
				<input class="input" type="text" name="twitter" placeholder="Введите ссылку на профиль" value="<?php dataFromPost("twitter", $contacts); ?>"/>
			</div>
			<div class="col-md-3">
				<div class="title-6">instagram</div>
				<input class="input" type="text" name="instagram" placeholder="Введите ссылку на профиль" value="<?php dataFromPost("instagram", $contacts); ?>"/>
			</div>
		</div>
		<div class="row mt-15">
			<div class="col-md-3">
				<div class="title-6">Телефон</div>
				<input class="input" type="tel" name="phone" placeholder="Введите телефон" value="<?php dataFromPost("phone", $contacts); ?>"/>
			</div>
			<div class="col-md-3">
				<div class="title-6">Адрес</div>
				<input class="input" type="text" name="address" placeholder="Введите адрес" value="<?php dataFromPost("address", $contacts); ?>"/>
			</div>
		</div>
		<div class="row mt-30 mb-120">
			<div class="col-md-2">
				<input type="submit" name="contactsUpdate" class="button button--save" value="Сохранить"/>
			</div>
			<div class="col-md-2 rml-25">
				<a class="button" href="<?=HOST?>contacts">Отмена</a>
			</div>
		</div>
	</form>
</div>