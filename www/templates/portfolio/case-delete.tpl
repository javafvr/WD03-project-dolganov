<div class="container text-center">
	<form id="form" action="<?=HOST?>portfolio/case-delete?id=<?=$case['id']?>" method="POST" enctype="multipart/form-data">
		<div class="row mt-40">
			<div class="col-md-10 offset-1">
				<div class="title-1 mb-40">Удалить работу<?=$case['title']?></div>
				<p>Вы действительно хотите удалить работу <strong><?=$case['title']?></strong> c id = <strong><?=$case['id']?></strong>?</p>
			</div>
		</div>
		<div class="row mt-35 mb-120 justify-content-center">
			<div class="col-md-auto">
				<input type="submit" class="button button--delete" name="caseDelete" value="Удалить">
			</div>
			<div class="col-md-auto">
				<a class="button" href="<?=HOST?>portfolio/case?<?=$case['id']?>">Отмена</a>
			</div>
		</div>
	</form>
</div>