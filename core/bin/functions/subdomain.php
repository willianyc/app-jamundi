<?php

function get_subdomain(){
  $host = $_SERVER['HTTP_HOST'];
	$rg_subdom = '/^([a-zA-Z0-9-_]+)\.[a-zA-Z0-9][a-zA-Z0-9-_]+\..*$/';
	if(preg_match($rg_subdom, $host, $match)){
    return $subdom=$match[1];
  }
  return false;
}