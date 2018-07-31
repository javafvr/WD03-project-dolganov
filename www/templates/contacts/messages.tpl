<div class="container">
	<div class="row">
		<div class="col align-self-center mb-30 mt-60">
			<div class="title-1 mt-0 mb-0">Сообщения от посетителей</div>
		</div>
	</div>
		<?php if (isset($_GET['result'])){include ROOT . 'templates/_parts/_results.tpl';}?>
	<div class="row mb-100">
		<div class="col align-self-center">
			<? foreach ($messages as $message){

				include ROOT . "/templates/_parts/_message-card.tpl";

			}?>
		</div>
	</div>
</div>