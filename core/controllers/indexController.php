<?php
session_start();
if (!isset($_SESSION['usuario']) || !isset($_SESSION['password']) || !isset($_SESSION['nivel'])  ) {
  // session_destroy();
  include('html/administrador/datos/loginVW.php');
} else {
  include('html/administrador/overall/headerVW.php');
  include('html/administrador/datos/principalVW.php');
}
