<?php

foreach($success as $item) {
	if(count($item)==1){
		echo "<div class='error error__title error__title--success mb-5' data-notify-hide>" . $item['title'] . "</div>";
	} elseif (count($item)==2) {
		echo "<div class='error'><div class='error__title error__title--with-desc error__title--success'>" . $item['title'] ."</div><div class='error__desc'>" . $item['desc'] . "</div></div>";
	}
}

?>