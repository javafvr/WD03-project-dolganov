<div class="container text-center">
	<form id="form" action="<?=HOST?>message-delete?id=<?=$message['id']?>" method="POST" enctype="multipart/form-data">
		<div class="row mt-40">
			<div class="col-md-10 offset-1">
				
				<div class="title-1 mb-40">Удалить пост<?=$post['title']?></div>
				<p>Вы действительно хотите удалить это сообщение от <strong><?=$message['firstname']?></strong> c id = <strong><?=$message['date_time']?></strong>?</p>
			</div>
		</div>
		<div class="row mt-35 mb-120 justify-content-center">
			<div class="col-md-auto">
				<input type="submit" class="button button--delete" name="messageDelete" value="Удалить">
			</div>
			<div class="col-md-auto">
				<a class="button" href="<?=HOST?>blog/posts">Отмена</a>
			</div>
		</div>
	</form>
</div>