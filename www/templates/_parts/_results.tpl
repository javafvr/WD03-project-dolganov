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