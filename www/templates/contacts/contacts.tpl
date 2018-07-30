<div class="container pt-55 pb-80">
	<div class="row justify-content-end">
		<div class="col-md-auto"><a class="button button--edit" href="<?=HOST?>contacts-edit">Редактировать</a></div>
		<div class="col-md-auto"><a class="button" href="<?=HOST?>messages">Сообщения</a></div>
	</div>
	<div class="row">
		<div class="col-5">
			<h1 class="title-1">Контакты</h1>
			<table class="contacts-table text-left">
				<tr>
					<?php if ($contacts['vk']!=''){?>
						<th class="contacts-table__index">Email</th>
						<td class="contacts-table__value pb-10"><a href="mailto:<?=$contacts['email']?>"><?=$contacts['email']?></a>
						</td>
					<?}?>
				</tr>
				<tr>
					<?php if ($contacts['vk']!=''){?>
						<th class="contacts-table__index">Skype</th>
						<td class="contacts-table__value pb-10">
							<a href="skype:<?=$contacts['skype']?>?chat"><?=$contacts['skype']?></a>
						</td>
					<?}?>
				</tr>
				<tr>
					<th class="contacts-table__index" rowspan="3">Социальные сети</th>
					<?php if ($contacts['vk']!=''){?>
						<td class="contacts-table__value contacts-table__value--bold pb-10">
							<a href="<?=$contacts['vk']?>" target="_blank">Профиль Вконтакте</a>
						</td>
					<?}?>
				</tr>
				<tr>
					<?php if ($contacts['fb']!=''){?>
						<td class="contacts-table__value contacts-table__value--bold pb-10"><a href="<?=$contacts['fb']?>" target="_blank">Профиль Facebook</a>
						</td>
					<?}?>
				</tr>
				<tr>
					<?php if ($contacts['github']!=''){?>
						<td class="contacts-table__value contacts-table__value--bold pb-20">
							<a href="<?=$contacts['github']?>" target="_blank">Профиль GitHub</a>
						</td>
					<?}?>
				</tr>
				<tr>
					<?php if ($contacts['phone']!=''){?>
						<th class="contacts-table__index">Телефон</th>
						<td class="contacts-table__value pb-10"><?=$contacts['phone']?>
							
						</td>
					<?}?>
				</tr>
				<tr>
					<?php if ($contacts['phone']!=''){?>
						<th class="contacts-table__index">Адрес</th>
						<td class="contacts-table__value"><?=$contacts['address']?>
						</td>
					<?}?>
				</tr>
			</table>
		</div>
		<div class="col-4 offset-1">
			<div class="title-1">Связаться со мной</div>
			<form class="contact-form"><input class="input" type="text" name="firstname" placeholder="Введите имя" /><input class="input" type="text" name="email" placeholder="Email" /><textarea class="textarea" name="message" placeholder="Сообщение"></textarea>
				<div class="file-upload">
					<fieldset>
						<legend>
							<div class="title-8 mb-2">Прикрепить файл</div>
							<div class="legend__descr">
								<p>jpg, png, pdf, doc, весом до 2Мб.</p>
							</div>
						</legend><input class="inputfile" id="#file-1" type="file" name="file-1" data-multiple-caption="{count} файлов выбрано" multiple="multiple" /><label for="#file-1">Выбрать файл</label><span>Файл не выбран</span></fieldset>
				</div><input class="button button--save" type="submit" value="Отправить" /></form>
		</div>
	</div>
</div>
<div class="container-fluid px-0">
	<div class="contacts-map" id="map"></div>
</div>
<script async="async" defer="defer" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBLEqvIXKAkDlvLPw1vUCSoz2KAPQCIAyU&amp;callback=initMap"></script>
<script src="<?=HOST?>templates/assets/js/google-map.js"></script>