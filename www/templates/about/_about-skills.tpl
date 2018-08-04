<div class="skills">
	<div class="container pt-55 pb-80">
		<div class="row space-between">
			<div class="col-6 offset-3">
				<div class="title-1 mt-0 mb-5">Технологии</div>
				<p class="mt-0 mb-50">Которые использую в работе</p>
			</div>
			<div class="col-3">
				<?php if (isAdmin()) {?>
					<a class="button button--edit ml-100" href="<?=HOST?>edit-skills">Редактировать</a>
				<?}?>
			</div>
		</div>
		<div class="row mb-40">
			<div class="col-3">
				<div class="skill__title">Frontend</div>
			</div>
			<div class="col-9">
				<?php showIndicator('HTML5', $skills['html'], 'green');?>
				<?php showIndicator('CSS3', $skills['css'], 'green');?>
				<?php showIndicator('JS', $skills['js'], 'green');?>
				<?php showIndicator('JQuery', $skills['jquery'], 'green');?>
			</div>
		</div>
		<div class="row mb-40">
			<div class="col-3">
				<div class="skill__title">Backend</div>
			</div>
			<div class="col-9">
				<?php showIndicator('PHP', $skills['php'], 'blue');?>
				<?php showIndicator('MySQL', $skills['mysql'], 'blue');?>
			</div>
		</div>
		<div class="row">
			<div class="col-3">
				<div class="skill__title">Workflow</div>
			</div>
			<div class="col-9">
				<?php showIndicator('Git', $skills['git'], 'yellow');?>
				<?php showIndicator('Gulp', $skills['gulp'], 'yellow');?>
				<?php showIndicator('NPM', $skills['npm'], 'yellow');?>
				<?php showIndicator('Bower', $skills['bower'], 'yellow');?>
			</div>
		</div>
	</div>

</div>