<div class="container section-content">
	<h1 class="title-1">Редактировать профиль</h1>
		<form enctype="multipart/form-data" action="<?=HOST?>profile-edit" method="POST">
			<? require ROOT . "/templates/_parts/_errors.tpl"; ?>

			<?=$error_descr?>

			<div class="row mb-10">
				<div class="col-4">
					<div class="title-6">Имя</div>
					<input class="input" type="text" name="firstname" placeholder="Введите имя" value="<?=@$currentUser->firstname?>"/>
					<div class="mb-30"></div>
					<div class="title-6">Фамилия</div>
					<input class="input" type="text" name="lastname" placeholder="Введите фамилию" value="<?=@$currentUser->lastname?>"/>
					<div class="mb-30"></div>
					<?=$error_email?>
					<div class="title-6">Email</div>
					<input class="input" type="email" name="email" placeholder="Введите email" value="<?=@$currentUser['email']?>"/>
				</div>
			</div>
			<div class="row mb-20">
				<div class="col-md-auto">
					<div class="file-upload">
						<fieldset>
							<legend>
								<div class="title-8 mb-2">Фотография</div>
								<div class="legend__descr">
									<p>Изображение jpg или png, размером больше чем 100х100 пикселей, и весом до 2Мб.</p>
								</div>
							</legend>
							<input class="inputfile" id="#file-1" type="file" name="avatar" data-multiple-caption="{count} файлов выбрано" multiple="multiple" />
							<label for="#file-1">Выбрать файл</label>
							<span>Файл не выбран</span>
						</fieldset>
					</div>
				</div>
			</div>
			<div class="row mb-30">
				<div class="col-4">
					<div class="title-6">Страна</div>
					<input class="input" type="text" name="country" placeholder="Введите страну" value="<?=@$currentUser->country?>"/>
					<div class="mb-5"></div>
					<div class="title-6">Город</div><input class="input" type="text" name="city" placeholder="Введите город" value="<?=@$currentUser->city?>"/></div>
			</div>
			<div class="row">
				<div class="col-3 space-between">
					<input type="submit" name="profile-update" class="button button--save" value="Сохранить"/>
					<a class="button" href="<?=HOST?>profile">Отмена</a>
				</div>
			</div>
	</form>
</div>