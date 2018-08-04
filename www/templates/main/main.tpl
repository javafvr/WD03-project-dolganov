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
				<a class="button" href="<?=HOST?>about">Подробнее</a>
			<?}?>
			</div>
	</div>
</div>
<div class="hr-line mb-80 mt-80"></div>
<div class="container mb-80">
	<h1 class="title-1">Новые <a href="<?=HOST?>portfolio">работы</a></h1>
	<div class="row">
		<?php foreach ($portfolio as $case){
			include ROOT . "templates/_parts/_portfolio-card.tpl";
		}?>
	</div>
</div>
<div class="container mb-80">
	<h1 class="title-1 mb-40">Новые записи в <a href="<?=HOST?>blog">блоге</a></h1>
	<div class="row">

	<?php foreach ($posts as $post){?>
		<?php include ROOT . "templates/_parts/_blog-card.tpl"?>
	<?php } ?>

	</div>
</div>