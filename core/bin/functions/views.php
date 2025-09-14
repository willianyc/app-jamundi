<?php
// Versiona el archivo css o js para evitar problemas con la cache
function autoVerFile($url){
	$path_serv = pathinfo($_SERVER['SCRIPT_FILENAME'])['dirname'];
  $path = pathinfo($url);
  if(!file_exists($path_serv.'/'.$url))
  	return $path['dirname'].'/'.$path['basename'].'?v=0';
  $ver = '?v='.filemtime($path_serv.'/'.$url);
  return $path['dirname'].'/'.$path['basename'].$ver;
}

?>