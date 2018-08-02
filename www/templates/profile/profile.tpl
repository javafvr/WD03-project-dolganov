	<div class="container section-content">
		<div class="row align-items-center">
			<div class="col">
				<div class="title-1">Профиль</div>
			</div>
			<div class="col text-right"><a class="button" href="<?=HOST?>profile-edit">Редактировать</a></div>
		</div>
		<div class="row">
			<div class="col-md-auto">
				<div class="avatar ">
					<?=getAvatar($currentUser->avatar, $currentUser->firstname . ' ' . $currentUser->lastname);?>
				</div>
			</div>
			<div class="col">
				<div class="user-info">
					<div class="user-info__title">Имя и фамилия</div>
					<div class="user-info__desc">
					<?php 
						echo $currentUser->firstname . ' ' . $currentUser->lastname
					?>						
					</div>
				</div>
				<div class="user-info">
					<div class="user-info__title">Email </div>
					<div class="user-info__desc">
					<?php 
						echo $currentUser->email
					?>
					</div>
				</div>
				<div class="user-info">
					<div class="user-info__title">Страна, Город </div>
					<div class="user-info__desc">
					<?php 
						echo $currentUser->country . ', ' . $currentUser->city
					?>
					</div>
				</div>
			</div>
		</div>
		<?php if ($comments!=NULL){?>
				<div class="title-2">Комментарии пользователя </div>
		<?}?>
		<?php foreach ($comments as $comment){?>
			<div class="comment-wrap comment-wrap--no-avatar">
				<div class="comment__content">
					<div class="comment__header"><a class="comment__related-to" href="<?=HOST?>blog/post?id=<?=$comment['post_id']?>"><?=$comment['title']?></a>
						<div class="comment__date"><i class="far fa-clock"></i> 05 Мая 2017 года в 15:45</div>
					</div>
					<div class="comment__text"><?=$comment['text']?></div>
				</div>
			</div>
		<?}?>
</div>