<div class="container text-center">
	<form id="form" action="<?=HOST?>blog/category-delete?id=<?=$cat['id']?>" method="POST" enctype="multipart/form-data">
		<div class="row mt-40">
			<div class="col-md-10 offset-1">
				
				<div class="title-1 mb-40">Удалить категорию <?=$cat['catTitle']?></div>
				<p>Вы действительно хотите удалить категорию <strong><?=$cat['catTitle']?></strong> c id = <strong><?=$cat['id']?></strong>?</p>
				<!-- <? require ROOT . "/templates/_parts/_errors.tpl"; ?> -->

			</div>
		</div>
		<div class="row mt-35 mb-120 justify-content-center">
			<div class="col-md-auto">
				<input type="submit" class="button button--delete" name="catDelete" value="Удалить">
			</div>
			<div class="col-md-auto">
				<a class="button" href="<?=HOST?>categories">Отмена</a>
			</div>
		</div>
	</form>
</div>