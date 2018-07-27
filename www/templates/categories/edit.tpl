<div class="container">
	<form id="form" action="<?=HOST?>blog/category-edit?id=<?=$cat['id']?>" method="POST" enctype="multipart/form-data">
		<div class="row mt-40">
			<div class="col-md-10 offset-1">
				
				<div class="title-1 mb-40">Редактировать категорию</div>
				
				<? require ROOT . "/templates/_parts/_errors.tpl"; ?>
				
				<div class="title-8 mb-10">Название категории</div>
				<input class="input" type="text" name="catTitle" placeholder="Введите название" data-error = 'Введите название категории' data-valid='required' value="<?=$cat['catTitle']?>"/>
			</div>
		</div>
		<div class="row mt-35 mb-120">
			<div class="col-md-auto offset-1">
				<input type="submit" class="button button--save" name="catSave" value="Сохранить">
			</div>
			<div class="col-md-auto">
				<a class="button" href="<?=HOST?>categories">Отмена</a>
			</div>
		</div>
	</form>
</div>