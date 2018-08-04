<?if(isLoggedIn()){?>
	<!-- Добавить комментарий -->
	<div class="title-2">Оставить комментарий</div>
	<div class="comment-add">
		<div class="comment-add__avatar">
			<div class="avatar avatar--small">
				<?php getAvatar($currentUser->avatar_small, $_SESSION['logged_user']['firstname'] . $_SESSION['logged_user']['lastname']);?>
			</div>
		</div>
		<form action="<?=HOST?>blog/post?id=<?=$post['id']?>" method="POST" class="comment-add__form" id="form">
			<div class="title-6 mt-0 mb-2">
				<?=$_SESSION['logged_user']['firstname']?>
				<?=$_SESSION['logged_user']['lastname']?>
			</div>
			<textarea class="textarea" name="commentText" placeholder="Присоединиться к обсуждению..." data-error = 'Комментарий не может быть пустым' data-valid='required'></textarea>
			<input class="button" type="submit" value="Опубликовать" name="addComment" />
		</form>
	</div>
<?} else { ?>
	<div class="comment">
		<div class="comment--register">
			<p><a class="comment-register_link" href="<?=HOST?>login">Войдите</a> или <a class="comment-register_link" href="<?=HOST?>registration">зарегистрируйтесь</a><br/> чтобы оставить комментарий</p>
		</div>
	</div>
<?}?>