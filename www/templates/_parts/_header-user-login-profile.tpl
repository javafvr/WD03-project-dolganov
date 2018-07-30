<div class="header-user">
	<div class="avatar avatar--small">
		<?php getAvatar($currentUser->avatar_small, $currentUser->firstname . ' ' . $currentUser->lastname);?>
	</div>
	<a class="header-user__name" href="<?=HOST?>profile">
	<?php 
		echo $currentUser->firstname . ' ' . $currentUser->lastname
	?>
	</a>
	<div class="header-user__badge">Пользователь</div>
	<a class="button button--profile" href="<?=HOST?>profile">Профиль</a>
	<a class="button button--profile" href="<?=HOST?>logout">Выход</a>
</div>