<?php


switch (isset($_GET['error']) ? $_GET['error'] : null) {
	case 'sesion':
		header('location: ?view=logout&type=force');
	default:
?>
		<!DOCTYPE html>
		<html lang="en">

		<head>
			<meta charset="UTF-8">
			<meta name="description" content="Jamundi">
			<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
			<title>Jamundi - 404</title>


			<link rel="stylesheet" href="views/js/bootstrap/bootstrap.min.css" type="text/css">

			<script type="text/javascript" src="views/js/jquery/jquery.min.js"></script>
			<script type="text/javascript" src="views/js/bootstrap/bootstrap.min.js"></script>


		</head>

		<body>
	<?php
		include('html/public/error404.php');
		break;
}


	?>