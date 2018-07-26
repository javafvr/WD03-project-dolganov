<div class="container mt-50 mb-120">
	<div class="row justify-content-center">
		<div class="col-md-10">
			<div class="blog-post">
				<div class="row">
					<div class="col-md-12 space-between mb-20">
						<h1 class="title-1 mt-0"><?=$post['title']?></h1>
						<? if(isAdmin()){?>
							<div class="buttons-wrapper space-between">
								<a class="button button--edit mr-5" href="<?=HOST?>blog/post-edit?id=<?=$post['id']?>">Редактировать</a>
								<a class="button button--delete" href="<?=HOST?>blog/post-delete?id=<?=$post['id']?>">Удалить</a>
							</div>
						<?}?>
					</div>
				</div>
				<div class="blog-post__info">
					<a class="blog-post__info-item blog-post__info-item--name" href="#"><?=$authorName?></a>
					<a class="blog-post__info-item blog-post__info-item--tag" href="#"><?=$post['cat_title']?></a>
					<a class="blog-post__info-item blog-post__info-item--date" href="#">
						<?
						
						echo rus_date("j F Y H:i", strtotime($post['date_time']));

						if (isset($post['date_time'])) {
							echo " Обновлен: " . rus_date("j F Y H:i", strtotime($post['update_time']));
						}

						?>
							
					</a>
						<? if(count($comments)>0){?>
						<a class="blog-post__info-item blog-post__info-item--comments" href="#comments">
							<?=commentNumber (count($comments))?>
						</a>
					<?}?>
				</div>
				<div class="blog-post__img">
					<?=getPostImg($post['post_img']);?>
				</div>
				<div class="blog-post__content user-content">
					<p><?=$post['text']?></p>
					
				</div>
			</div>
		</div>
		<div class="col-md-10 buttons-flex"><a class="button" href="#"><i class="fas fa-arrow-left"></i>&nbsp;Назад</a><a class="button" href="#">Вперед&nbsp;<i class="fas fa-arrow-right"></i></a></div>
	</div>
	<div id= "comments" class="row justify-content-center">
		<div class="col-md-10">
			<? if(count($comments)>0){?>
				<div class="title-2">
					<?=commentNumber (count($comments))?>
				</div>
			<?}?>
			<!-- Добавленные комментарии -->
			<?php 
				foreach ($comments as $comment){
					include ROOT . "templates/_parts/_comment-card.tpl";
				}
			?>

			<!-- Форма добавления комментария -->
			<?php 

			include ROOT . "templates/_parts/_add-comment-form.tpl"

			 ?>
		</div>
	</div>
</div>