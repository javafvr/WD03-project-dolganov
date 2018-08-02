<div class="container">
	<form id="form" action="<?=HOST?>portfolio/case-new" method="POST" enctype="multipart/form-data">
		<div class="row">
			<div class="col-md-10 offset-1">
				<div class="title-1 mt-55 mb-35">Добавить работу</div>
				<? require ROOT . "/templates/_parts/_errors.tpl"; ?>
				<div class="title-8 mt-0 mb-10">Название</div>
				<input class="input" type="text" name="title" placeholder="Введите название работы" data-error = 'Введите название работы' data-valid='required'/>
			</div>
		</div>
		<div class="row">
			<div class="col-md-10 offset-1">
				<div class="title-8 mt-25 mb-5">Изображение </div>
				<div class="title-7">Изображение jpg или png, рекомендуемая ширина 945px и больше, высота от 400px и более, вес до 2Мб.</div>
				<div class="file-upload">
					<fieldset>
						<legend>
							<div class="title-8 mb-2"></div>
							<div class="legend__descr"> </div>
						</legend><input class="inputfile" id="#file-undefined" type="file" name="caseImg" data-multiple-caption="{count} файлов выбрано" multiple="multiple" /><label for="#file-undefined">Выбрать файл</label><span>Файл не выбран</span></fieldset>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-10 offset-1">
				<div class="title-8 mt-25 mb-10">Содержание</div>
				<textarea class="textarea" name="description" placeholder="Введите описание" data-error = 'Введите содержание работы' data-valid='required'></textarea>
			</div>
		</div>
		<div class="row">
			<div class="col-md-10 offset-1">
				<div class="title-8 mt-25 mb-10">Результат</div>
				<textarea class="textarea" name="descriptionResult" placeholder="Введите описание" data-error = 'Введите описание результата' data-valid='required'></textarea>
			</div>
		</div>
		<div class="row">
			<div class="col-md-10 offset-1">
				<div class="title-8 mt-25 mb-10">Технологии</div>
				<textarea class="textarea" name="descriptionTech" placeholder="Введите описание" data-error = 'Введите используемые технологии' data-valid='required'></textarea>
			</div>
		</div>
		<div class="row">
			<div class="col-md-auto width offset-1">
				<div class="title-8 mt-25 mb-10">Ссылка на проект</div><input class="input" type="text" name="hostingLink" placeholder="Введите ссылку" /></div>
			<div class="col-md-auto width">
				<div class="title-8 mt-25 mb-10">Ссылка на GitHub</div><input class="input" type="text" name="gitLink" placeholder="Введите ссылку" />
			</div>
			
			<!-- Категории -->
			<div class="col-md-auto width">
				<div class="col-md-10 offset-1">
					<div class="title-8 mt-25 mb-10">Категория</div>
					<select class="input" name="caseCat" id="">
						<?php foreach ($categories as $category){?>
							<option value="<?=$category['id']?>"><?=$category['cat_title']?></option>
						<?}?>
					</select>
				</div>
			</div>
		</div>
		<div class="row mt-30 mb-100">
			<div class="col-md-auto offset-1">
				<input type="submit" name="caseNew" class="button button--save" value="Сохранить">
			</div>
			<div class="col-md-auto">
				<a class="button" href="<?=HOST?>portfolio">Отмена</a>
			</div>
		</div>
	</form>
</div>