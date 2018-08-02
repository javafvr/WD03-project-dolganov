<footer class="footer">
	<div class="container">
		<div class="row">
			<div class="col-4">
				<p>© 	<?=getContacts('firstname')?>
						<?=getContacts('lastname')?>
				</p>
				<p>Создано с &nbsp<i class="fas fa-heart"></i>&nbsp в <a class="footer-link__style" href="http://webcademy.ru/" target="_blank">WebCademy.ru</a> в 2018 году</p>
			</div>
			<div class="col-4">
				<nav>
					<ul class="footer-nav">
						<li class="footer-nav__item"><a href="<?=HOST?>">Главная</a></li>
						<li class="footer-nav__item"><a href="<?=HOST?>about">Обо мне</a></li>
						<li class="footer-nav__item"><a href="<?=HOST?>portfolio">Работы</a></li>
						<li class="footer-nav__item"><a href="<?=HOST?>blog">Блог</a></li>
						<li class="footer-nav__item"><a href="<?=HOST?>contacts">Контакты</a></li>
					</ul>
				</nav>
			</div>
			<div class="col-4">
				<div class="footer__icons">
					<?getSocialIcon($name='github');?>
					<?getSocialIcon($name='codepen');?>
					<?getSocialIcon($name='vk');?>
					<?getSocialIcon($name='instagram');?>
					<?getSocialIcon($name='fb');?>
					<?getSocialIcon($name='twitter');?>
				</div>
			</div>
		</div>
	</div>
</footer>