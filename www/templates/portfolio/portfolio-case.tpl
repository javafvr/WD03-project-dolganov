<?php 	if(isAdmin()){
		include ROOT . "/templates/_parts/_admin-panel.tpl";

} ?>
<div class="single-work__bg">
	<div class="single-work__bg-opacity">
		<div class="single-work__bg-gradient pt-40 pb-30">
			<div class="logo">
				<div class="logo__icon logo__icon--dark"><i class="far fa-paper-plane"></i></div>
				<div class="logo__text"><a class="header-logo__title header-logo__title--dark" href="<?=HOST?>main">Digital Lifestyle</a>
					<div class="header-logo__sub header-logo__sub--dark">Сайт IT специалиста</div>
				</div>
			</div>
			<div class="container single-work-title">
			<?php if (isset($_GET['result'])){include ROOT . 'templates/_parts/_results.tpl';}?>
				<div class="row justify-content-center">
					<div class="col">
						<div class="single-work-title__title mb-15">
							<?=$case['title']?>
						</div>
						<a class="single-work-title__link" href="#">
							<?=$authorName?>
						</a>
						<a class="single-work-title__link single-work-title__link--tag" href="#">
							<?=$case['cat_title']?>
						</a>
						<a class="single-work-title__link" href="#">
						<?
						
						echo rus_date("j F Y H:i", strtotime($case['date_time']));
						?>

						</a>

					</div>
						<? if(isAdmin()){?>

						<div class="col-4 buttons-flex">
							<a class="button button--edit ml-40" href="<?=HOST?>portfolio/case-edit?id=<?=$case['id']?>">Редактировать</a>
							<a class="button button--delete" href="<?=HOST?>portfolio/case-delete?id=<?=$case['id']?>">Удалить</a>
						</div>
						<?}?>
				</div>
				<div class="row justify-content-center">
					<div class="col">
						<a class="single-work-title__img" href="<?=HOST?>usercontent/portfolio/<?=$case['case_img']?>" target="_blank">
							<?=getCaseImg($case['case_img']);?>
						</a>
					
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="container single-work-desc user-content">
	<div class="row justify-content-center mb-30">
		<div class="col-5">
			<h3>Кратко о проекте</h3>
			<?=$case['description']?>
			<h3>Результат</h3>
			<?=$case['description_result']?>
		</div>
		<div class="col-5">
			<h3>Технологии</h3>
			<?=$case['description_tech']?>
			<?php if ($case['hosting_link']!=''){?>
				<h3>Ссылка на проект</h3>
				<a class="mt-5 mb-40" href="<?=$case['hosting_link']?>"><?=$case['hosting_link']?></a>
			<?}?>
			<?php if ($case['git_link']!=''){?>
				<h3>Код на github</h3>
				<a class="mt-5" href="<?=$case['git_link']?>"><?=$case['git_link']?></a>
			<?}?>
		</div>
	</div>
	<div class="row justify-content-center">
		<div class="col-10 single-work-buttons">
			
				<?php if ($linkPrev==''){?>
					<a class="button" href="<?=HOST?>portfolio">
					<i class="fas fa-arrow-left" ></i>&nbsp;Все работы</a>
				<?} else{?>
					<a class="button" href="<?=HOST?>portfolio/case?id=<?=$linkPrev?>">
					<i class="fas fa-arrow-left"></i>&nbsp;Предыдущая</a>
				<?}?>
				<?php if ($linkNext==''){?>
				<a class="button" href="<?=HOST?>portfolio">Все работы&nbsp;
					<i class="fas fa-arrow-right"></i>
				</a>
				<?} else{?>
					<a class="button" href="<?=HOST?>portfolio/case?id=<?=$linkNext?>">Следующая&nbsp;
					<i class="fas fa-arrow-right"></i>
				</a>
				<?}?>
			</div>
	</div>
</div>