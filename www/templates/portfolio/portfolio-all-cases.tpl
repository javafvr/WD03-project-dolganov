<div class="container mb-120">
	<div class="row mb-20 mt-40 align-items-center">
		<?php if (isset($_GET['result'])){include ROOT . 'templates/_parts/_results.tpl';}?>
		<div class="col-md-8">
			<div class="title-1">Работы<span class="title-1-medium">&nbsp которые сделал я и моя команда</span>
			</div>
		</div>
		<div class="col-md-4 text-right">
			<a class="button button--edit" href="<?=HOST?>portfolio/case-new">Добавить работу</a>
		</div>
	</div>
	<div class="row mb-50">
		<?php foreach ($portfolio as $case){
			include ROOT . "templates/_parts/_portfolio-card.tpl";
		}?>
	</div>
</div>