<div class="container">
	<form id="form" action="<?=HOST?>portfolio/case-edit?id=<?=$case['id']?>" method="POST" enctype="multipart/form-data">
		<div class="row">
			<div class="col-md-10 offset-1">
				<div class="title-1 mt-55 mb-35">Редактировать работу</div>
				<? require ROOT . "/templates/_parts/_errors.tpl"; ?>
				<div class="title-8 mt-0 mb-10">Название</div>
				<input class="input" type="text" name="title" placeholder="Введите название работы" data-error = 'Введите название работы' data-valid='required' value="<?=$case['title']?>"/>
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
						</legend>
						<input class="inputfile" id="#file-undefined" type="file" name="caseImg" data-multiple-caption="{count} файлов выбрано" multiple="multiple" />
						<label for="#file-undefined">Выбрать файл</label>
						<span>Файл не выбран</span>
						<div class="file-upload__thumb mt-30">

						<? if($case['case_img_small']!='' && file_exists(ROOT . 'usercontent/portfolio/' . $case['case_img_small'])){

							echo "<img src=" . HOST . "usercontent/portfolio/" . $case['case_img_small'] . " title=" . $case['case_img_small'] . "/>";
							echo "<a class='button button--delete button--small' href='#''>Удалить</a>";
						} else{
							echo "<img src=" . HOST . "/templates/assets/img/paceholders/no-photo.png title=no-photo.png/>";
						} 

						?>

						</div>
					</fieldset>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-10 offset-1">
				<div class="title-8 mt-25 mb-10">Содержание</div>
				<textarea class="textarea" name="description" placeholder="Введите описание" data-error = 'Введите содержание работы' data-valid='required'><?=$case['description']?></textarea>
			</div>
		</div>
		<div class="row">
			<div class="col-md-10 offset-1">
				<div class="title-8 mt-25 mb-10">Результат</div>
				<textarea  class="textarea" name="descriptionResult" placeholder="Введите описание" data-error = 'Введите описание результата' data-valid='required'><?=$case['description_result']?></textarea>
			</div>
		</div>
		<div class="row">
			<div class="col-md-10 offset-1">
				<div class="title-8 mt-25 mb-10">Технологии</div>
				<textarea id="ckeditor" class="textarea" name="descriptionTech" placeholder="Введите описание">
					<?=$case['description_tech']?>
				</textarea>
				<? include_once ROOT . "templates/_parts/_ckEditorConnect.tpl" ?>
			</div>
		</div>
		<div class="row">
			<div class="col-md-auto width offset-1">
				<div class="title-8 mt-25 mb-10">Ссылка на проект</div><input class="input" type="text" name="hostingLink" placeholder="Введите ссылку" value="<?=$case['hosting_link']?>"/></div>
			<div class="col-md-auto width">
				<div class="title-8 mt-25 mb-10">Ссылка на GitHub</div><input class="input" type="text" name="gitLink" placeholder="Введите ссылку" value="<?=$case['git_link']?>"/>
			</div>
			
			<!-- Категории -->
			<div class="col-md-auto width">
				<div class="col-md-10 offset-1">
					<div class="title-8 mt-25 mb-10">Категория</div>
					<select class="input" name="caseCat" id="">
						<?php foreach ($categories as $category){?>
						<option value="<?=$category['id']?>" <? if ($category['id'] == $case['category']){echo 'selected';}?>><?=$category['cat_title']?></option>
						<?}?>
					</select>
				</div>
			</div>
		</div>
		<div class="row mt-30 mb-100">
			<div class="col-md-auto offset-1">
				<input type="submit" name="caseUpdate" class="button button--save" value="Сохранить">
			</div>
			<div class="col-md-auto">
				<a class="button" href="<?=HOST?>portfolio">Отмена</a>
			</div>
		</div>
	</form>
</div>