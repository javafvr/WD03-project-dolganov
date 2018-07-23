<div class="container mt-50 mb-120">
	<div class="row justify-content-center">
		<div class="col-md-12">
			<div class="blog-post">
				<div class="row">
					<div class="col-md-12 space-between">
						<h1 class="title-1 mt-0"><?=$post['title']?></h1>
						<a class="button button--edit" href="#">Редактировать</a>
					</div>
				</div>
				<div class="blog-post__info">
					<a class="blog-post__info-item blog-post__info-item--name" href="#">Емельян Казаков</a><a class="blog-post__info-item blog-post__info-item--tag" href="#">Путешествия</a>
					<a class="blog-post__info-item blog-post__info-item--date" href="#">
						<?
						
						echo rus_date("j F Y H:i", strtotime($post['dateTime']));

						?>
							
					</a>
					<a class="blog-post__info-item blog-post__info-item--comments" href="#">2 комментария</a>
				</div>
				<div class="blog-post__img">
					<?=getPostImg($post['postImg']);?>
				</div>
				<div class="blog-post__content user-content">
					<p><?=$post['text']?></p>
					
				</div>
			</div>
		</div>
		<div class="col-md-12 buttons-flex"><a class="button" href="#"><i class="fas fa-arrow-left"></i>&nbsp;Назад</a><a class="button" href="#">Вперед&nbsp;<i class="fas fa-arrow-right"></i></a></div>
	</div>
	<div class="row justify-content-center">
		<div class="col-md-12">
			<div class="title-2">2 комментария</div>
			<div class="comment-wrap">
				<div class="avatar avatar--small"><img src="../../../img/avatars/avatar-2.jpg" title="Джон До" /></div>
				<div class="comment__content">
					<div class="comment__header">
						<div class="comment__user-name">Джон До</div>
						<div class="comment__date"><i class="far fa-clock"></i> 05 Мая 2017 года в 15:45</div>
					</div>
					<div class="comment__text">Замечательный парк, обязательно отправлюсь туда этим летом.</div>
				</div>
			</div>
			<div class="comment-wrap">
				<div class="avatar avatar--small"><img src="../../../img/avatars/avatar-2.jpg" title="Джон До" /></div>
				<div class="comment__content">
					<div class="comment__header">
						<div class="comment__user-name">Джон До</div>
						<div class="comment__date"><i class="far fa-clock"></i> 05 Мая 2017 года в 15:45</div>
					</div>
					<div class="comment__text">Замечательный парк, обязательно отправлюсь туда этим летом.</div>
				</div>
			</div>
			<div class="title-2">Оставить комментарий</div>
			<div class="comment-add">
				<div class="comment-add__avatar">
					<div class="avatar avatar--small"><img src="../../../img/avatars/avatar-1.jpg" title="Юрий Ключевский" /></div>
				</div>
				<form class="comment-add__form" id="form">
					<div class="title-6 mt-0 mb-2">Юрий Ключевский</div>
					<div class="error">
						<div class="error__title">Комментарий не может быть пустым.</div>
					</div><textarea class="textarea" name="comment" placeholder="Присоединиться к обсуждению..."></textarea><input class="button" type="submit" value="Опубликовать" name="post-comment" /></form>
			</div>
		</div>
	</div>
</div>