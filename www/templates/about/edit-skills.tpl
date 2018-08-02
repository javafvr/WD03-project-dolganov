<div class="container technology__form pb-20">
	<form action="edit-skills" method="POST">
		<div class="row">
			<div class="col">
				<h3 class="title-3">Технологии</h3>
			</div>
			<? require ROOT . "/templates/_parts/_errors.tpl"; ?>
		</div>
		<div class="row mb-20">
			
			<?php function skillItem($name, $title){ global $skills;?>
				
				<div class="col-2">
					<div class="title-6"><?=$title?></div>
					<input class="input" type="counter" name="<?=$name?>" placeholder="50" value="<?=$skills[$name]?>" />
					<span>&nbsp;%</span>
				</div>
			<?}?>
	
			<?skillItem('html', 'HTML5');?>
			<?skillItem('css', 'CSS3');?>
			<?skillItem('js', 'JS');?>
			<?skillItem('jquery', 'jQuery');?>
		</div>
		
		<div class="row mb-20">
			<?skillItem('php', 'PHP');?>
			<?skillItem('mysql', 'MySql');?>
		</div>

		<div class="row">
			<?skillItem('git', 'Git');?>
			<?skillItem('gulp', 'Gulp');?>
			<?skillItem('bower', 'Bower');?>
			<?skillItem('npm', 'Npm');?>
		</div>
		
		<!-- Buttons -->
		<div class="row mt-35 mb-120">
			<div class="col-md-auto">
				<input type="submit" class="button button--save" name="skillsUpdate" value="Сохранить">
			</div>
			<div class="col-md-auto">
				<a class="button" href="<?=HOST?>about">Отмена</a>
			</div>
		</div>
	</form>
</div>