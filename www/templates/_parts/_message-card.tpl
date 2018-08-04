<div class="user-message mb-20">
	<div class="user-message__header">
		<div class="user-message__date">
			<? echo rus_date("j F Y H:i", strtotime($message['date_time']));?>
		</div>
		<a class="button button--delete" href="<?=HOST?>message-delete?id=<?=$message['id']?>">Удалить</a>
	</div>
	<div class="user-message__from">
		<div class="user-message__name">
			<?=$message['firstname']?>
		</div>
		<a class="user-message__email" href="mailto:<?=$message['email']?>">
			<?=$message['email']?>
		</a>
	</div>
	<div class="user-message__text">
		<p class="user-content"><?=$message['message']?></p>
	</div>
	<?getFileLink($message['message_filename_original'], $message['message_filename']);?>

</div>