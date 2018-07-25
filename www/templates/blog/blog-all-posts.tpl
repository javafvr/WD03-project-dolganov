<div class="container">
	<div class="row mb-20 mt-40 align-items-center">
		<?php if (isset($_GET['result'])){include ROOT . 'templates/_parts/_results.tpl';}?>
		<div class="col-md-8">
			<div class="title-1">Блог веб-разработчика</div>
		</div>
		<div class="col-md-4 text-right">
		<?php if (isAdmin()){ ?>
			<a class="button button--edit" href="<?=HOST?>blog/post-new">Добавить пост</a>
		<?php } ?>
		</div>
	</div>
	<div class="row pb-100">
		<?php foreach ($posts as $post){?>
			<?php include ROOT . "templates/_parts/_blog-card.tpl"?>
		<?php } ?>
	</div>
</div>