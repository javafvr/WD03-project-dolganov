<?php if ($_GET['result'] == 'catCreated'){?>
	<div class='error error__title error__title--success' data-notify-hide>
		Категория успешно добавлена!
	</div>
<?}?>
<?php if ($_GET['result'] == 'catSaved'){?>
	<div class='error error__title error__title--success' data-notify-hide>
		Категория успешно обновлена!
	</div>
<?}?>
<?php if ($_GET['result'] == 'catDeleted'){?>
	<div class='error error__title' data-notify-hide>
		Категория успешно удалена!
	</div>
<?}?>
<?php if ($_GET['result'] == 'postCreated'){?>
	<div class='error error__title error__title--success' data-notify-hide>
		Пост успешно добавлен!
	</div>
<?}?>
<?php if ($_GET['result'] == 'postSaved'){?>
	<div class='error error__title error__title--success' data-notify-hide>
		Пост успешно обновлен!
	</div>
<?}?>
<?php if ($_GET['result'] == 'postDeleted'){?>
	<div class='error error__title' data-notify-hide>
		Пост успешно удален!
	</div>
<?}?>