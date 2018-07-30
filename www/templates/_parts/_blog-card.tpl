<div class="col-md-4 mb-50">
	<div class="card-post">
		<div class="card-post__img">
			<?=getPostImg($post->postImgSmall);?>
		</div>
		<div class="card-post__title"><?=mbCutString($post->title,48,'...','UTF-8');?></div><a class="button" href="<?=HOST?>blog/post?id=<?=$post->id?>">Читать</a></div>
</div>