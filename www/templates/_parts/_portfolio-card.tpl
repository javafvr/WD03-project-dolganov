<div class="col-md-4 mb-20">
	<div class="card-portfolio">
		<div class="card-portfolio__img">
			<?=getCaseImg($case->caseImgSmall);?>
		</div>
		<div class="card-portfolio__title">
			<?=mbCutString($case->title,24,'...','UTF-8');?>
		</div>
		<a class="button" href="<?=HOST?>portfolio/case?id=<?=$case->id?>">Смотреть кейс</a>
	</div>
</div>