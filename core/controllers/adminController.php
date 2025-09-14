<?php
session_start();
// error_log('+** [session]: '.print_r($_SESSION,1));//.' - [Var2]: '.);//.' - [Var3]: '.);
if (!isset($_SESSION['usuario'])) {
	// include 'core/bin/functions/views.php';
	// include('html/public/admin.php');
	header('location: index.php?view=principal');
} else {
    // echo("principal");
    include('html/administrador/datos/loginVW.php');
}