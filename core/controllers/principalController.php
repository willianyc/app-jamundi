<?php
session_start();
if (
  !isset($_SESSION['usuario']) || !isset($_SESSION['password'])
  || !isset($_SESSION['nivel'])
) {
  session_destroy();
  header('location: index.php');
  exit();
}

switch (isset($_GET['mode']) ? $_GET['mode'] : null) {
  case 'inicio':
    include('html/administrador/overall/headerVW.php');
    include('html/administrador/datos/principalVW.php');
    break;
}
