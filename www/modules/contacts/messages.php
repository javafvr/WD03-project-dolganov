<?

if (!isAdmin()) {
	header("Location: " . HOST);
	die();
}

$title = "Сообщения";

$messages = R::find('messages', 'ORDER BY id DESC');


ob_start();
include ROOT . "/templates/_parts/_header.tpl";
include ROOT . "/templates/contacts/messages.tpl";
$content = ob_get_contents();
ob_end_clean();

include ROOT . "/templates/_parts/_head.tpl";
include ROOT . "/templates/template.tpl";
include ROOT . "/templates/_parts/_footer.tpl";
include ROOT . "/templates/_parts/_foot.tpl";
 ?>