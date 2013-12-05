<?php
session_start();
// в самом начале пробегаем по всем изображениям паттернов символов и вычисляем md5sum, в дальнейшем будем использовать только эти значения
if (!isset($_SESSION['files']))
{ 
	$_SESSION['pos'] = 0;
	$_SESSION['empty'] = checksum("./patt/empty.png");
	for($i=32; $i<=122; $i++)
		$_SESSION['files'][$i] = checksum("./patt/img" . $i . ".png");
}
// файл готов. берем его хеш и сравниваем с уже вычисленными значениями

if($_GET['q']==1)
{
	$tmp = explode("\r\n", file_get_contents('./query.txt'));
	$_SESSION['query'] = $tmp['0'];	
	$cmp = checksum("./cmp.png");
	$found = array_search($cmp, $_SESSION['files']);
// помещаем в файл с именем запроса подобранный символ
	if ($found!==false)
		file_put_contents($_SESSION['query'] . ".txt", chr($found), FILE_APPEND);
// если md5sum совпала с “пустым” шаблоном, значит подзапрос ничего не вернул - обнуляем счетчик и переходим к следующему запросу	
	elseif($cmp===$_SESSION['empty'])
	{
		next_query();
	}	
}
else
{
	$_SESSION['pos']++;
	$tmp = explode("\r\n", file_get_contents('./query.txt'));
	$_SESSION['query'] = $tmp['0'];
	echo $_SESSION['query']. ")," . $_SESSION['pos'];
}	  

function next_query()
{
	$tmp = explode("\r\n", file_get_contents('./query.txt'));
	unset($tmp['0']);
	file_put_contents('./query.txt',implode("\r\n",$tmp));
	$_SESSION['pos'] = 0;
}

function checksum($img)
{
	$image = imageCreateFromPng($img);
	$check = '';
	for ($i=38;$i<=197;$i++)
	{
		$color = imagecolorat($image, $i, 17);
		$r = ($color >> 16) & 0xFF;
		$g = ($color >> 8) & 0xFF;
		$b = $color & 0xFF;
		$check .= $r.$g.$b;
	}	
	imageDestroy($image);
	return md5($check);	
}

?>
