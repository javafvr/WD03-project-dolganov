<?php

function getSocialIcon($name=''){?>
	<? if($name!='' && getContacts($name)!=''){?>
		<? if($name=='vk'){?>
			<a href="<?=getContacts('vk')?>" target="_blank">
				<i class="fab fa-vk"></i>
			</a>
		<?} else if($name=='fb'){?>
			<a href="<?=getContacts('fb')?>" target="_blank">
				<i class="fab fa-facebook-f"></i>
			</a>
		<?} else if($name=='twitter'){?>
			<a href="<?=getContacts('twitter')?>" target="_blank">
				<i class="fab fa-twitter"></i>
			</a>
		<?} else if($name=='youtube'){?>
			<a href="<?=getContacts('youtube')?>" target="_blank">
				<i class="fab fa-youtube"></i>
			</a>
		<?} else if($name=='instagram'){?>
			<a href="<?=getContacts('instagram')?>" target="_blank">
				<i class="fab fa-instagram"></i>
			</a>
		<?} else if($name=='github'){?>
			<a href="<?=getContacts('github')?>" target="_blank">
				<i class="fab fa-github-square"></i>
			</a>
		<?} else if($name=='codepen'){?>
			<a href="<?=getContacts('codepen')?>" target="_blank">
				<i class="fab fa-codepen"></i>
			</a>
		<?}?>
	<?}?>

<?}

function getContacts($contact=''){
	if ($contact!='') {
		return R::load('contacts', 1)[$contact];
	}
}

function showIndicator($title, $value, $color=''){
	$circleDia = 120;
	$radius = ($circleDia - 20) / 2;
	$perimetr = 2 * pi() * $radius;
	if ($color!='') {
		$color = "circle__indicator--" . $color;
	}

	$offset = $perimetr * (1 - intval($value)/100);

?>
	<div class="skill-wrap">
		<div class="indicator">
			<svg 
					width="<?=$circleDia?>" 
					height="<?=$circleDia?>" 
					class="circle" 
					viewbox="0 0 <?=$circleDia?> <?=$circleDia?>">
				<circle 
					class="circle__bg" 
					cx="<?=$circleDia / 2 ?>"
					cy="<?=$circleDia / 2 ?>" 
					r="<?=$radius?>">
				</circle>
				<circle 
					class="circle__indicator <?=$color?>" 
					stroke-dasharray="<?=$perimetr?>";
					stroke-dashoffset="<?=$offset?>"
					cx="<?=$circleDia / 2 ?>" 
					cy="<?=$circleDia / 2 ?>" 
					r="<?=$radius?>">
				</circle>
			</svg>
			<div class="indicator__value"><?=$title?></div>
		</div>
	</div>
<?}

function getContactsItem($name = '', $title = ''){
	global $contacts;
	
	if ($contacts[$name]!=''){
		if ($name=='email') {
			
			echo	"<th class='contacts-table__index'>" . $title . "</th>
			<td class='contacts-table__value pb-10'>
				<a href='mailto:" . $contacts[$name] . "'>" . $contacts[$name] . "</a></td>";

		} else if ($name=='phone') {
			
			echo	"<th class='contacts-table__index'>" . $title . "</th>
			<td class='contacts-table__value pb-10'>
				<a href='tel:" . $contacts[$name] . "'>+" . $contacts[$name] . "</a></td>";

		} else if ($name=='skype') {
			
			echo	"<th class='contacts-table__index'>" . $title . "</th>
			<td class='contacts-table__value pb-10'>
				<a href='skype:" . $contacts[$name] . "?chat'>" . $contacts[$name] . "</a></td>";
		} else if ($name=='address') {
			
			echo	"<th class='contacts-table__index'>" . $title . "</th>
			<td class='contacts-table__value pb-10'>" . $contacts[$name] . "</td>";
		} else if ($name=='vk' || $name=='fb' || $name=='twitter' || $name=='instagram'){

			echo	"<td class='contacts-table__value contacts-table__value--bold pb-10'>
				<a href='" . $contacts[$name] . "' target='_blank'>" . $title . "</a></td>";
		} else {

			echo	"<th class='contacts-table__index'>" . $title . "</th><td class='contacts-table__value pb-10'>
				<a href='" . $contacts[$name] . "' target='_blank'>" . $contacts[$name] . "</a></td>";
		}	
	}
}

function dataFromPost($fieldName, $array){
	if (@$_POST[$fieldName] != ''){
		echo $_POST[$fieldName];
	}else{
		echo $array[$fieldName];
	}
}


function dd($params){
	echo '<pre>';
	var_dump($params);
	echo '</pre>';
	die();
}

function mbCutString($string, $length, $postfix = '...', $encoding='UTF-8'){

	$strLen = mb_strlen($string, $encoding);
	$temp = mb_substr($string, 0,$length, $encoding);
	$posLastWord = mb_strripos($temp, " ", 0, $encoding);
	
	if ($strLen>=$length) {
		$result = mb_substr($temp, 0,$posLastWord, $encoding);
		return $result . $postfix;
	} else{
		return $temp;
	}
}

function getAvatar($fileName, $alt){
		if($fileName!='' && file_exists(ROOT . 'usercontent/avatar/' . $fileName)){
				echo "<img src=" . HOST . "usercontent/avatar/" . $fileName . " alt='" . $alt . "'/>";
		}
}

function getPostImg($filename){
		if($filename!='' && file_exists(ROOT . 'usercontent/blog/' . $filename)){

			echo "<img src=" . HOST . "usercontent/blog/" . $filename . " title=" . $filename . "/>";
		} else{
			echo "<img src=" . HOST . "/templates/assets/img/paceholders/no-photo.png title=no-photo.png/>";
		}
}

function getCaseImg($filename){
		if($filename!='' && file_exists(ROOT . 'usercontent/portfolio/' . $filename)){

			echo "<img src=" . HOST . "usercontent/portfolio/" . $filename . " title=" . $filename . "/>";
		} else{
			echo "<img src=" . HOST . "/templates/assets/img/paceholders/no-photo.png title=no-photo.png/>";
		}
}

function getFileLink($filenameOrig, $filename){
		if($filename!='' && file_exists(ROOT . 'usercontent/upload_files/' . $filename)){

		echo "<div class='user-message__attachments'>
				<div class='user-message__attachments-name'>Прикрепленные файлы:</div>
				<a class='button--link' href='" . HOST . "usercontent/upload_files/" . $filename . "' download='". $filenameOrig . "'>
				". $filenameOrig . "
				</a>
				</div>";
		} else{
			// echo "<img src=" . HOST . "/templates/assets/img/paceholders/no-photo.png title=no-photo.png/>";
		}
}


function isAdmin(){
	$result = false;
	if ( isset($_SESSION['logged_user']) && $_SESSION['login'] == 1 ) {
		if ($_SESSION['role'] == 'admin') {
				$result = true;
		}
	}
	return $result;
}

function isLoggedIn(){
	$result = false;
	if ( isset($_SESSION['logged_user']) && $_SESSION['login'] == 1 ) {
		$result = true;
	}
	return $result;
}

function rus_date() {
	// Перевод
	$translate = array(
		"am" => "дп",
		"pm" => "пп",
		"AM" => "ДП",
		"PM" => "ПП",
		"Monday" => "Понедельник",
		"Mon" => "Пн",
		"Tuesday" => "Вторник",
		"Tue" => "Вт",
		"Wednesday" => "Среда",
		"Wed" => "Ср",
		"Thursday" => "Четверг",
		"Thu" => "Чт",
		"Friday" => "Пятница",
		"Fri" => "Пт",
		"Saturday" => "Суббота",
		"Sat" => "Сб",
		"Sunday" => "Воскресенье",
		"Sun" => "Вс",
		"January" => "Января",
		"Jan" => "Янв",
		"February" => "Февраля",
		"Feb" => "Фев",
		"March" => "Марта",
		"Mar" => "Мар",
		"April" => "Апреля",
		"Apr" => "Апр",
		"May" => "Мая",
		"May" => "Мая",
		"June" => "Июня",
		"Jun" => "Июн",
		"July" => "Июля",
		"Jul" => "Июл",
		"August" => "Августа",
		"Aug" => "Авг",
		"September" => "Сентября",
		"Sep" => "Сен",
		"October" => "Октября",
		"Oct" => "Окт",
		"November" => "Ноября",
		"Nov" => "Ноя",
		"December" => "Декабря",
		"Dec" => "Дек",
		"st" => "ое",
		"nd" => "ое",
		"rd" => "е",
		"th" => "ое"
	);
 	// если передали дату, то переводим ее
	if (func_num_args() > 1) {
		$timestamp = func_get_arg(1);
		return strtr(date(func_get_arg(0), $timestamp), $translate);
	} else {
	// иначе текущую дату
		return strtr(date(func_get_arg(0)), $translate);
	}
}

function commentNumber ($num) {

    //Оставляем две последние цифры от $num
	$number = substr($num, -2);

    //Если 2 последние цифры входят в диапазон от 11 до 14
    //Тогда подставляем окончание "ЕВ" 
	if($number > 10 and $number < 15)
	{
		$term = "ев";
	}
	else
	{ 

		$number = substr($number, -1);

		if($number == 0) {$term = "ев";}
		if($number == 1 ) {$term = "й";}
		if($number > 1 ) {$term = "я";}
		if($number > 4 ) {$term = "ев";}
	}

	echo  $num.' комментари'.$term;
}


// Adjusting text encoding
function adopt($text) {
	return '=?UTF-8?B?'.base64_encode($text).'?=';
}
 ?>
