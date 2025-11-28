<?php

?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <link rel="icon" type="image/png" href="views/images/Escudo_solo.png">
  <title> Jamundi</title>

  <link rel="stylesheet" href="views/js/jquery/custom/css/jquery-ui.min.css">
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
  </link>
  <link rel="stylesheet" href="views/css/admin/fileinput.min.css">
  </link>
  <link rel="stylesheet" href="views/css/admin/all.css">
  </link>
  <link rel="stylesheet" href="views/fonts/font-awesome/css/font-awesome.min.css">
  </link>
  <!-- <link rel="stylesheet" href="views/fonts/Work_Sans.woff2">
  </link> -->
  <!-- <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>  
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
  <link href="https://fonts.googleapis.com/css2?family=Work+Sans:ital,wght@0,500;1,600&display=swap" rel="stylesheet">
  <!-- <link rel="stylesheet" href="views/fonts/Graviola SoftGraviola Soft/GraviolaSoft-MediumItalic.otf">
  </link> -->
  <link href="views/css/admin/styles.css" rel="stylesheet" />
  <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
  <script src="" crossorigin="anonymous"></script> -->
     <!-- Estilos del nuevo tema -->
    <link rel="stylesheet" href="views/css/admin/jamundi-theme.css">

  
</head>

<body class="sb-nav-fixed jamundi-theme">

  <!-- NAVBAR SUPERIOR NUEVA -->
  <nav class="sb-topnav navbar navbar-expand topbar-modern">
    
    <a class="navbar-brand ps-3 topbar-logo" href="index.php">
      <img src="views/images/Escudo_Horizontal.png" alt="Logo" class="logo-img">
      <span class="topbar-title">Talento Humano</span>
    </a>

    <!-- BOTÓN SIDEBAR -->
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0 topbar-toggle" 
            id="sidebarToggle">
      <i class="fa fa-bars"></i>
    </button>

    <!-- BUSCADOR -->
    

    <!-- MENÚ USUARIO -->
    <ul class="navbar-nav ms-auto me-3 me-lg-4 topbar-icons">
      <li class="nav-item">
        <i class="fa-regular fa-bell topbar-action"></i>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle user-icon" id="navbarDropdown" href="#" role="button" 
           data-bs-toggle="dropdown">
          <i class="fa fa-user fa-fw"></i>
        </a>

        <ul class="dropdown-menu dropdown-menu-end profile-menu">

          <?php if($_SESSION['nivel'] == 1) { ?>  
            <li><a class="dropdown-item" href="?view=usuario&mode=crear">
              Administración de Usuarios
            </a></li>
          <?php } ?>

          <li><a class="dropdown-item" href="?view=configuracion&mode=crear">Configuraciones</a></li>

          <?php if($_SESSION['nivel'] != 1) { ?>  
            <li><a class="dropdown-item" href="?view=usuario&mode=modificarpass">Cambiar contraseña</a></li>
          <?php } ?>

          <li><hr class="dropdown-divider" /></li>

          <li><a class="dropdown-item" href="?view=login&mode=cerrar">Cerrar sesión</a></li>
        </ul>
      </li>
    </ul>
  </nav>

  <!-- CONTENEDOR GENERAL -->
  <div id="layoutSidenav">

    <!-- SIDEBAR MODERNO -->
    <div id="layoutSidenav_nav">
      <nav class="sb-sidenav accordion sidebar-modern" id="sidenavAccordion">

        <div class="sb-sidenav-menu">
          <div class="nav nunito-menu">

            <!-- TÍTULO SECCIÓN -->
            <?php if(!empty($_SESSION['mod1']) || !empty($_SESSION['mod2'])){ ?>  
              <div class="sb-sidenav-menu-heading">ADM. TALENTO HUMANO</div>
              
            <?php } ?>

            <!-- ORIGINAL HR PERO MÁS SUAVE -->
            <div class="menu-separator"></div>

            <!-- 🔽 TODO TU MENÚ ORIGINAL SE CONSERVA ABAJO 🔽 -->

           
            <!-- TODOS TUS SUBMENÚS ORIGINALES QUEDAN IGUAL -->
            <!-- (NO TOCADO) -->

            
            <?php if(!empty($_SESSION['mod1'])){ ?>
            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#HojaVida" aria-expanded="false" aria-controls="HojaVida">
              <div class="sb-nav-link-icon"><i class="fa fa-file-text-o"></i></div>
              Datos del funcionario
              <div class="sb-sidenav-collapse-arrow"><i class="fa fa-angle-down"></i></div>
            </a>

            <div class="collapse" id="HojaVida" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
             <?php
              foreach ($_SESSION['mod1'] as $submod) {
                  if($submod == 1){
             ?>
             <nav class="sb-sidenav-menu-nested nav">
                

                <a class="nav-link <?= ($_GET['view'] == 'consultas' ? 'active' : '') ?>" 
                  href="?view=consultas&mode=consultarfuncionario&id=hoja_vida">
    <div class="sb-nav-link-icon"><i class="fa fa-floppy-o"></i></div>
    Funcionarios
</a>
              </nav>
              <?php } if($submod == 8){ ?>
              <nav class="sb-sidenav-menu-nested nav">
                <a class="nav-link" href="?view=consultas&mode=reporteFuncionariosSel">
                  <div class="sb-nav-link-icon"><i class="fa fa-eye"></i></div>
                  Reporte de Funcionarios
                </a>
              </nav>
              <?php } }?>
            </div>

            <?php }?>
            <?php if(!empty($_SESSION['mod2'])){ ?>
            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#seguridadSocial" aria-expanded="false" aria-controls="seguridadSocial">
              <div class="sb-nav-link-icon"><i class="fa fa-address-book-o"></i></div>
              Seguridad social
              <div class="sb-sidenav-collapse-arrow"><i class="fa fa-angle-down"></i></div>
            </a>
            <?php }?>
            <div class="collapse" id="seguridadSocial" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
             <?php
              foreach ($_SESSION['mod2'] as $submod) {
                  if($submod == 2){
             ?>
              <nav class="sb-sidenav-menu-nested nav">
                <a class="nav-link" href="?view=consultas&mode=consultarseguidadSocial">
                  <div class="sb-nav-link-icon"><i class="fa fa-cogs"></i></div>
                  Seguridad social
                </a>
              </nav>
                <?php } 
                    if($submod == 3){
                ?>
                <nav class="sb-sidenav-menu-nested nav">
                <a class="nav-link" href="?view=consultas&mode=consultarincapacidad&id=incapacidad">
                  <div class="sb-nav-link-icon"><i class="fa fa-file-text-o"></i></div>
                  Incapacidad
                </a>
              </nav>
              <?php } }?>
            </div>

            <?php if(!empty($_SESSION['mod3'])){ ?>
            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#ElementosTrabajo" aria-expanded="false" aria-controls="ElementosTrabajo">
              <div class="sb-nav-link-icon"><i class="fa fa-briefcase"></i></div>
              Movilidad del funcionario
              <div class="sb-sidenav-collapse-arrow"><i class="fa fa-angle-down"></i></div>
            </a>

            <div class="collapse" id="ElementosTrabajo" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">

              <?php
                foreach ($_SESSION['mod3'] as $submod) {
                    if($submod == 4){ ?>
                <nav class="sb-sidenav-menu-nested nav">
                  <a class="nav-link" href="?view=consultas&mode=consultarmovilidad">Movilidad</a>
                </nav>
                <?php } if($submod == 5){ ?>
                <nav class="sb-sidenav-menu-nested nav">
                  <a class="nav-link" href="?view=consultas&mode=consultarretiro">Entrega del Cargo</a>
                </nav>
            </div>
            <?php } } } ?>


            <?php if(!empty($_SESSION['mod4']) || !empty($_SESSION['mod5']) || !empty($_SESSION['mod6'])){ ?> 
            <hr style="margin: 1px;">
            <div class="sb-sidenav-menu-heading">Bientestar y capacitación</div>
            <hr style="margin: 1px;">
            <?php if(!empty($_SESSION['mod4'])){ ?>
            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#capacitaciones" aria-expanded="false" aria-controls="capacitaciones">
              <div class="sb-nav-link-icon"><i class="fa fa-file-text-o"></i></div>
              Capacitación
              <div class="sb-sidenav-collapse-arrow"><i class="fa fa-angle-down"></i></div>
            </a>
            <?php }}?>

            <div class="collapse" id="capacitaciones" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
            <?php
              foreach ($_SESSION['mod4'] as $submod) {
                  if($submod == 6){
             ?>
            <nav class="sb-sidenav-menu-nested nav">
                <a class="nav-link" href="?view=capacitacion&mode=consultar">
                  <div class="sb-nav-link-icon"><i class="fa fa-floppy-o"></i></div>
                  Capacitaciones
                </a>
            </nav>
            <?php } 
             }?>
            </div>

            <?php if(!empty($_SESSION['mod5'])){ ?>
            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#bienestar" aria-expanded="false" aria-controls="bienestar">
              <div class="sb-nav-link-icon"><i class="fa fa-file-text-o"></i></div>
              Bienestar
              <div class="sb-sidenav-collapse-arrow"><i class="fa fa-angle-down"></i></div>
            </a>
            <?php }?>
            <div class="collapse" id="bienestar" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
            <?php
              foreach ($_SESSION['mod5'] as $submod) {
                  if($submod == 7){
             ?>
              <nav class="sb-sidenav-menu-nested nav">
                <a class="nav-link" href="?view=actividad&mode=consultar">
                  <div class="sb-nav-link-icon"><i class="fa fa-floppy-o"></i></div>
                  Actividades
                </a>
              </nav>
              <?php } }?>
            </div>
            
            <?php if(!empty($_SESSION['mod6'])){ ?>
            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#reportes" aria-expanded="false" aria-controls="reportes">
              <div class="sb-nav-link-icon"><i class="fa fa-file-text-o"></i></div>
              Reportes
              <div class="sb-sidenav-collapse-arrow"><i class="fa fa-angle-down"></i></div>
            </a>
            <?php }?>
            <div class="collapse" id="reportes" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
            <?php
              foreach ($_SESSION['mod6'] as $submod) { ?>
              <?php 
                  if($submod == 9){
              ?>
              <nav class="sb-sidenav-menu-nested nav">
                <a class="nav-link" href="?view=consultas&mode=reporteActividadCapacitacion">
                  <div class="sb-nav-link-icon"><i class="fa fa-eye"></i></div>
                  Repote de Actividades y Capacitaciones
                </a>
              </nav>
              <?php } 
              }?>

            </div>
            <?php if(!empty($_SESSION['mod7'])){ ?> 
            <hr style="margin: 1px;">
            <div class="sb-sidenav-menu-heading">Evaluación de desempeño</div>
            <hr style="margin: 1px;">
            <?php }?>
            <?php if(!empty($_SESSION['mod7'])){ ?>
            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#evaluacionFuncionario" aria-expanded="false" aria-controls="evaluacionFuncionario">
              <div class="sb-nav-link-icon"><i class="fa fa-file-text-o"></i></div>
              Reporte de evaluación
              <div class="sb-sidenav-collapse-arrow"><i class="fa fa-angle-down"></i></div>
            </a>
            <?php }?>
            <div class="collapse" id="evaluacionFuncionario" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
            <?php
              foreach ($_SESSION['mod7'] as $submod) {
                  if($submod == 10){
             ?>
            <nav class="sb-sidenav-menu-nested nav">
                <a class="nav-link" href="?view=evaluacionDesempeno&mode=subir">
                  <div class="sb-nav-link-icon"><i class="fa fa-floppy-o"></i></div>
                  Subir reporte de evaluación
                </a>
            </nav>
              <?php } if($submod == 11){ ?>
              <nav class="sb-sidenav-menu-nested nav">
                <a class="nav-link" href="?view=evaluacionDesempeno&mode=consultar">
                  <div class="sb-nav-link-icon"><i class="fa fa-floppy-o"></i></div>
                  Consultar evaluación
                </a>
              </nav>
              <?php } }?>
            </div>
            <?php if(!empty($_SESSION['mod8'])){ ?> 
            <hr style="margin: 1px;">
            <div class="sb-sidenav-menu-heading">Sistema de salud y seguridad en el trabajo</div>
            <hr style="margin: 1px;">
            <?php }?>
            <?php if(!empty($_SESSION['mod8'])){ ?>
            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#plandeTrabajo" aria-expanded="false" aria-controls="plandeTrabajo">
              <div class="sb-nav-link-icon"><i class="fa fa-file-text-o"></i></div>
              Plan de trabajo
              <div class="sb-sidenav-collapse-arrow"><i class="fa fa-angle-down"></i></div>
            </a>
            <?php }?>
            <div class="collapse" id="plandeTrabajo" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
            <?php
              foreach ($_SESSION['mod8'] as $submod) {
                  if($submod == 12){
             ?>

             <nav class="sb-sidenav-menu-nested nav">
                <a class="nav-link" href="?view=actividadesProgramadas&mode=consultar">
                  <div class="sb-nav-link-icon"><i class="fa fa-floppy-o"></i></div>
                  Actividades
                </a>
             </nav>
             <?php } if($submod == 13){ ?>

              <nav class="sb-sidenav-menu-nested nav">
                <a class="nav-link" href="?view=capacitacionesProgramadas&mode=consultar">
                  <div class="sb-nav-link-icon"><i class="fa fa-floppy-o"></i></div>
                  Capacitaciones
                </a>
              </nav>
              <?php } if($submod == 14){ ?>
              <nav class="sb-sidenav-menu-nested nav">
                <a class="nav-link" href="?view=inspeccion&mode=consultar">
                  <div class="sb-nav-link-icon"><i class="fa fa-floppy-o"></i></div>
                  Inspección
                </a>
              </nav>
              <?php } if($submod == 15){ ?>
              <nav class="sb-sidenav-menu-nested nav">
                <a class="nav-link" href="?view=matrizCumplimiento&mode=consultar">
                  <div class="sb-nav-link-icon"><i class="fa fa-floppy-o"></i></div>
                  Matriz de cumplimiento
                </a>
              </nav>
              <?php } }  ?>
            </div>
          </div>
      </nav>
    </div>
  </div>
  <div class="container-fluid container_view">

    <!-- <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" /> -->
    <!-- <script type="text/javascript" src="views/js/jquery/custom/jquery-ui.min.js"></script> -->
    <script src="views/js/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="views/js/bootstrap/popper.min.js"></script>
    <script src="views/js/jquery/bootstrap.min.js"></script>
    <script src="views/js/plugins/perfect-scrollbar.jquery.min.js"></script>
    <script src="views/js/bootstrap/bootstrap.bundle.min.js"></script>
    <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script> -->
    <script type="text/javascript" src="views/js/generics/generales.js"></script>
    <script type="text/javascript" src="views/js/generics/alertMessage.js"></script>
    <!-- <script src="js/scripts.js"></script> -->
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script> -->
    <!-- <script src="assets/demo/chart-area-demo.js"></script>
  <script src="assets/demo/chart-bar-demo.js"></script> -->
    <!-- <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script> -->
    <!-- <script src="js/datatables-simple-demo.js"></script> -->