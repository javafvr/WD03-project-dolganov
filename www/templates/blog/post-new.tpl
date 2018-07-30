<div class="container">
	<form id="form" action="<?=HOST?>blog/post-new" method="POST" enctype="multipart/form-data">
		<div class="row mt-40">
			<div class="col-md-10 offset-1">
				
				<div class="title-1 mb-40">Добавить пост</div>
				
				<? require ROOT . "/templates/_parts/_errors.tpl"; ?>
				
				<div class="title-8 mb-10">Название</div>
				<input class="input" type="text" name="postTitle" placeholder="Введите имя" data-error = 'Введите имя' data-valid='required'/>
			</div>
		</div>
		<!-- Категории -->
		<div class="row mt-40">
			<div class="col-md-10 offset-1">
				<div class="title-8 mb-10">Категория</div>
				<select name="postCat" id="">
					<?php foreach ($categories as $category){?>
						<option value="<?=$category['id']?>"><?=$category['cat_title']?></option>
					<?}?>
				</select>
			</div>
		</div>
		
		<div class="row mt-30">
			<div class="col-md-10 offset-1">
				<div class="file-upload">
					<fieldset>
						<legend>
							<div class="title-8 mb-2">Изображение</div>
							<div class="legend__descr">
								<p>Изображение jpg или png, рекомендуемая ширина 945px и больше, высота от 400px и более, вес до 2Мб.</p>
							</div>
						</legend>

						<input class="inputfile" id="#file-3" type="file" name="postImg" data-multiple-caption="{count} файлов выбрано" multiple="multiple" />
						<label for="#file-3">Выбрать файл</label>
						<span>Файл не выбран</span>
					</fieldset>
				</div>
			</div>
		</div>
		<div class="row mt-10">
			<div class="col-md-10 offset-1">
				<div class="title-8 mb-10">Содержание</div>
				<textarea id='ckeditor' class="textarea" name="postText" placeholder="Введите сообщение" data-error = 'Введите сообщение' data-valid='required'>
				</textarea>
				<? include_once ROOT . "templates/_parts/_ckEditorConnect.tpl" ?>
			</div>
		</div>
		<div class="row mt-35 mb-120">
			<div class="col-md-auto offset-1">
				<input type="submit" class="button button--save" name="postNew" value="Сохранить">
			</div>
			<div class="col-md-auto"><a class="button" href="<?=HOST?>blog">Отмена</a></div>
		</div>
	</form>
</div>