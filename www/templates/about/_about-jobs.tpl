<div class="container pt-75 pb-80">
	<div class="row">
		<div class="col-9 offset-3">
			<div class="row">
				<div class="col-9">	
					<div class="title-1 mt-0 mb-35">Опыт работы</div>
				</div>
				<div class="col-3">
					<?php if (isAdmin()) {?>
						<a class="button button--edit ml-10" href="<?=HOST?>edit-jobs">Редактировать</a>
					<?}?>
				</div>
			</div>
			
			<?php include ROOT . "/templates/_parts/_job-card.tpl";?>

		</div>
	</div>

</div>