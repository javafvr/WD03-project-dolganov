<div class="comment-wrap">
		<div class="avatar avatar--small">
			<?php getAvatar($comment['avatar_small'], $comment['firstname']. ' ' . $comment['lastname']);?>
		</div>
		<div class="comment__content">
			<div class="comment__header">
				<div class="comment__user-name">
					<?=$comment['firstname']?>
					<?=$comment['lastname']?>
				</div>
				<div class="comment__date">
					<i class="far fa-clock"></i>
					<?	

						echo rus_date("j F Y H:i", strtotime($comment['date_time'])); 

					?>
				</div>
			</div>
			<div class="comment__text">
				<?=$comment['text']?>
			</div>
		</div>
	</div>