<?php

$title = "Портфолио - все записи";

$portfolio=R::find('portfolio', 'ORDER BY id DESC');

//dd($posts);

ob_start();
include ROOT . "/templates/_parts/_header.tpl";
include ROOT . "/templates/portfolio/portfolio-all-cases.tpl";
$content = ob_get_contents();
ob_end_clean();

include ROOT . "/templates/_parts/_head.tpl";
include ROOT . "/templates/template.tpl";
include ROOT . "/templates/_parts/_footer.tpl";
include ROOT . "/templates/_parts/_foot.tpl";
 ?>