<?php if (count($jobs)>0){?>
	<h3 class="title-3 mb-20">Опыт работы</h3>
	<?php foreach ($jobs as $job){?>
		<div class="user-message mb-20">
			<div class="user-message__header">
				<div class="user-message__date"><?=$job['period']?></div>
				<a class="button button--delete" href="#">Удалить</a>
			</div>
			<div class="user-message__from">
				<div class="user-message__name"><?=$job['title']?></div>
			</div>
			<div class="user-message__text">
				<p class="user-content"><?=$job['description']?></p>
			</div>
		</div>
	<?}
}?>