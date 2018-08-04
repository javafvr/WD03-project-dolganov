
<?php foreach ($jobs as $job){?>
	<div class="experience__block mb-35">
		<div class="experience__period"><?=$job['period']?></div>
		<div class="experience__position"><?=$job['title']?></div>
		<p class="experience__description"><?=$job['description']?></p>
	</div>
<?}?>