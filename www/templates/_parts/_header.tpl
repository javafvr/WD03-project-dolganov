<body>
<? if (isAdmin()) {include ROOT . "templates/_parts/_admin-panel.tpl";}?>
<header class="header-bg">
	<div class="header">
		<div class="header__top">
		<?php 
			include ROOT . "templates/_parts/_header-logo.tpl";
			if (isLoggedIn()) {
				if(!isAdmin()){
					include ROOT . "templates/_parts/_header-user-login-profile.tpl";
				}
			} else{
				include ROOT . "templates/_parts/_header-user-login-links.tpl";
			}
		?>
		</div>
		
		<?php include ROOT . "templates/_parts/_header-nav.tpl";?>

	</div>
</header>
