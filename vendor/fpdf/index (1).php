<?php

require_once(__DIR__.'/View/JSONView.php');
require_once(__DIR__.'/Helpers/ExceptionMessages.php');
require_once(__DIR__.'/Helpers/Helper.php');

$Controller	=	NULL;
$Method		=	NULL;
$Value		=	NULL;

$Helper 	= 	new 	Helper();
$JSONView 	=	new 	JSONView();

//exception handler:
set_exception_handler(function ($exception) use ($JSONView) {
	$content = array(
		"status" => $exception->status,
		"Message" => $exception->getMessage()
		);
	if ($exception->getCode()) {

		$statusCode = $exception->getCode();

	}else{
		$statusCode = 	500;
	}

	$JSONView->printResult($statusCode , $content);
}
);
//END: Exception Handler;

if (!is_null($_GET['PATH_INFO']))
{
	//get url data
	$call	=	array_filter(explode("/", $_GET['PATH_INFO']));

	//Det: #Params 2 = ok; less = ERROR
	if (count($call)>=2) {
		//get controller
		$Controller 	=	array_shift($call);
		//get method
		$Method 		=	array_shift($call);

		//get Value
		switch (strtolower($_SERVER['REQUEST_METHOD'])) {

			case 'get':
			if (!empty($call[0])) {
				$Value 	=	$call[0];
			}
			break;
			case 'post':
			$Value 	=	$Helper->setDataFromJSON($_POST['VALUES']);
			break;
			default:
			throw new ExceptionMessages(2, utf8_encode("Error : Method not Allowed"),405);
			break;
		}
		//END: Get Value;
		if (file_exists('Controller/'.$Controller.'.php')) {

			require('Controller/'.$Controller.'.php');

			$controller		=	new 	$Controller();

			if (method_exists($controller, $Method)) {

				$result 	=	$controller->$Method($Value);

				$statusCode =	array_shift($result);

				$JSONView->printResult($statusCode, $result);
					//echo $result;
				//$controller->$Method();
			}else{
				throw new ExceptionMessages(2, utf8_encode("method not founded"));
			}
		}else{
			throw new ExceptionMessages(2, utf8_encode("controller not founded"));
		}

	}else{
		throw new ExceptionMessages(2, utf8_encode("Error : Missing Resource or Method"));
	}
}
else
{
	throw new ExceptionMessages(2, utf8_encode("Error : Error Url"));
}
?>
