<div class="container edit-about-me pt-40 pb-15">
	<div class="row">
		<div class="col">
			<h1 class="title-1 mb-30">Редактировать - Обо Мне</h1>
			<? require ROOT . "/templates/_parts/_errors.tpl"; ?>
			<form action="edit-text" method="POST" enctype="multipart/form-data">
				<div class="title-6">Имя, фамилия</div>
				<input class="input" type="text" name="firstname" placeholder="Введите имя и фамилию" value="<?dataFromPost('firstname', $about);?>" data-error = 'Введите имя и фамилию' data-valid='required'/>
				<div class="file-upload">
					<fieldset>
						<legend>
							<div class="title-8 mb-2">Фотография</div>
							<div class="legend__descr">
								<p>Изображение jpg или png, рекомендуемый размер 205px на 205px, вес до 2Мб.</p>
							</div>
						</legend>
						<input class="inputfile" id="#file-1" type="file" name="photo" data-multiple-caption="{count} файлов выбрано" multiple="multiple" />
						<label for="#file-1">Выбрать файл</label>
						<span>Файл не выбран</span>
					</fieldset>
				</div>
				<?php if ($about['photo']!='' && file_exists(ROOT . 'usercontent/about/' . $about['photo'])){?>
					
					<div class="avatar ">
						<img src="<?=HOST?>/usercontent/about/<?=$about['photo']?>" title="<?=$about['firstname']?>" />
					</div>

				<?}?>
				<div class="title-6">Информация на главной</div>
				<textarea id='ckeditor'class="textarea" name="description" placeholder="Оставьте Ваше сообщение">
					<?dataFromPost('description', $about);?>
						
				</textarea>
				<? include_once ROOT . "templates/_parts/_ckEditorConnect.tpl" ?>
				<div class="row mt-35 mb-120">
					<div class="col-md-auto">
						<input type="submit" class="button button--save" name="textUpdate" value="Сохранить">
					</div>
					<div class="col-md-auto">
						<a class="button" href="<?=HOST?>about">Отмена</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>