<div class="container pt-55 pb-80">

	<?php if (isAdmin()){?>
		<div class="row justify-content-end">
			<div class="col-md-auto"><a class="button button--edit" href="<?=HOST?>contacts-edit">Редактировать</a></div>
			<div class="col-md-auto"><a class="button" href="<?=HOST?>messages">Сообщения</a></div>
		</div>
	<?}?>

	<div class="row">
		<div class="col-5">
			<h1 class="title-1">Контакты</h1>
			<table class="contacts-table text-left">
				<tr>
					<?=getContactsItem('email', 'Email');?>
				</tr>
				<tr>
					<?=getContactsItem('skype', 'Skype');?>
				</tr>
				<tr>
					<?=getContactsItem('github', 'GitHub');?>
				</tr>
				<tr>
					<?=getContactsItem('codepen', 'CodePen');?>
				</tr>
				
				<?php if (!($contacts['instagram']="" && $contacts['twitter']="" && $contacts['vk']="" && $contacts['fb']="")){?>

					<tr>
						<th class="contacts-table__index" rowspan="4">Социальные сети</th>
						<?=getContactsItem('vk', 'Профиль Вконтакте');?>
					</tr>
					<tr>
						<?=getContactsItem('fb', 'Профиль Facebook');?>
					</tr>
					<tr>
						<?=getContactsItem('instagram', 'Профиль Instagram');?>
					</tr>
					<tr>
						<?=getContactsItem('twitter', 'Профиль Twitter');?>
					</tr>

				<?}?>
				<tr>
					<?=getContactsItem('phone', 'Телефон');?>
				</tr>
				<tr>
					<?=getContactsItem('address', 'Адрес');?>
				</tr>
			</table>
		</div>
		<div class="col-4 offset-1">
			<div class="title-1">Связаться со мной</div>
			
			<?php include ROOT . "/templates/_parts/_errors.tpl"; ?>
			
			<?php include ROOT . "/templates/_parts/_success.tpl"; ?>
			

			<form action="<?=HOST?>contacts" method="POST" class="contact-form" enctype="multipart/form-data">
				<input class="input" type="text" name="firstname" placeholder="Введите имя" data-error = 'Введите имя' data-valid='required'/>
				<input class="input" type="email" name="email" placeholder="Email" data-error = 'Введите email' data-valid='required' />
				<textarea class="textarea" name="message" placeholder="Сообщение" data-error = 'Сообщение не может быть пустым!' data-valid='required'></textarea>
				<div class="file-upload">
					<fieldset>
						<legend>
							<div class="title-8 mb-2">Прикрепить файл</div>
							<div class="legend__descr">
								<p>jpg, png, pdf, doc, весом до 2Мб.</p>
							</div>
						</legend>
						<input class="inputfile" id="#file-1" type="file" name="file" data-multiple-caption="{count} файлов выбрано" multiple="multiple" />
						<label for="#file-1">Выбрать файл</label>
						<span>Файл не выбран</span>
					</fieldset>
				</div>
				<input name="sendMessage" class="button button--save" type="submit" value="Отправить" />
			</form>
		</div>
	</div>
</div>
<div class="container-fluid px-0">
	<div class="contacts-map" id="map"></div>
</div>
<script async="async" defer="defer" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBLEqvIXKAkDlvLPw1vUCSoz2KAPQCIAyU&amp;callback=initMap"></script>
<script src="<?=HOST?>templates/assets/js/google-map.js"></script>