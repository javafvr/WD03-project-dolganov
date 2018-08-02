<div class="container pt-80 pb-55">
	<div class="row resume">
		<div class="col-3">
		<?php if ($about['photo']!='' && file_exists(ROOT . 'usercontent/about/' . $about['photo'])){?>
			<div class="avatar "><img src="<?=HOST?>/usercontent/about/<?=$about['photo']?>" title="<?=$about['firstname']?>" /></div>
		<?}?>
		</div>
		<div class="col-9 about-text">
			<div class="title-1 mb-5 mt-0 "><?=$about['firstname']?></div>
			<?=$about['description']?>
			<?php if (isAdmin()) {?>
				<a class="button button--edit" href="<?=HOST?>edit-text">Редактировать</a>
			<?}?>
			</div>
	</div>
</div>