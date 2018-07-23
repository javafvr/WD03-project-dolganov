<body>
<?php 
	if (isset($_SESSION['logged_user']) && $_SESSION['login'] == 1 && $_SESSION['role'] == 'admin') {
		include ROOT . "templates/_parts/_admin-panel.tpl";
		
	}

 ?>

<header class="header-bg">
	<div class="header">
		<div class="header__top">
		<?php 
			include ROOT . "templates/_parts/_header-logo.tpl";
			if (isset($_SESSION['logged_user']) && $_SESSION['login'] == 1 ) {
				if($_SESSION['role'] != 'admin'){
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
