<div class="container pb-100">

	<?php include ROOT . "/templates/_parts/_job-card-edit.tpl";?>

	<h3 class="title-3 mb-30">Добавить новое место</h3>
	<? require ROOT . "/templates/_parts/_errors.tpl"; ?>
	<?php if (isset($_GET['result'])){include ROOT . 'templates/_parts/_results.tpl';}?>

	<form action="edit-jobs" method="POST">
		<div class="user-message add-job-item">
			<div class="title-6">Период</div>
			<input 
				class="input" 
				type="text" 
				name="period" 
				placeholder="Введите даты начала и окончания работы" 
				value="<?=@$_POST['period']?>" />
			<div class="title-6">Название должности</div>
			<input 
				class="input" 
				type="text" 
				name="title" 
				placeholder="Введите название должности" 
				value="<?=@$_POST['title']?>" />
			<div class="title-6">Описание работы, должностные обязанности, достигнутые результаты</div>
			<textarea class="textarea" name="description" placeholder="Напишите интересное краткое содержательное описание">
				<?=@$_POST['description']?>
			</textarea>
			<input type="submit" name="newJob" class="button button--save" value="Добавить">
		</div>
		<div class="row mt-35 mb-120">
			<div class="col-md-auto">
				<input type="submit" class="button button--save" name="aboutJobsUpdate" value="Сохранить">
			</div>
			<div class="col-md-auto">
				<a class="button" href="<?=HOST?>about">Отмена</a>
			</div>
		</div>
	</form>
</div>