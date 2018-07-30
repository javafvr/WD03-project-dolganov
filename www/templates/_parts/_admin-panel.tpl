<div class="header-admin">
	<div class="header-admin__user">
		<div class="avatar avatar--small">
			<?php getAvatar($currentUser->avatar_small, $currentUser->firstname . ' ' . $currentUser->lastname);?>
		</div>
		<div class="header-admin__user-data">
			<a class="header-admin__name" href="<?=HOST?>profile">
			<?php 
				echo $currentUser->firstname . ' ' . $currentUser->lastname
			?>
			</a>
			<div class="badge">Администратор</div>
		</div>
	</div>
	<div class="admin-nav">
		<a class="admin-nav__link" href="<?=HOST?>blog/post-new"> 
			<i class="fas fa-plus-circle link__icon"></i>
			<span>Пост</span>
		</a>
		<a class="admin-nav__link" href="<?=HOST?>blog/categories"> 
			<i class="fas fa-folder link__icon"></i>
			<span>Категории</span>
		</a>
		<a class="admin-nav__link" href="<?=HOST?>portfolio">
			<i class="fas fa-plus-circle link__icon"></i>
			<span>Работа</span>
		</a>
		<a class="admin-nav__link" href="<?=HOST?>about">
			<i class="fas fa-edit link__icon"></i>
			<span>Обо мне</span>
		</a>
		<a class="admin-nav__link" href="<?=HOST?>contacts">
			<i class="fas fa-edit link__icon"></i>
			<span>Контакты</span>
		</a>
		<a class="admin-nav__link" href="<?=HOST?>messages">
			<i class="fas fa-envelope link__icon"></i>
			<span>Сообщения</span>
		</a>
	</div>
	<div class="admin-nav__exit">
		<a class="admin-nav__link" href="<?=HOST?>logout">
			<i class="fas fa-sign-out-alt link__icon"></i>
			<span>Выход</span>
		</a>
	</div>
</div>