<!DOCTYPE html>
<html lang="en" class="admin">

<head>
  <meta charset="UTF-8">
  <meta name="description" content="Jamundi">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Kontrola - Admin</title>


  <link rel="stylesheet" href="views/js/bootstrap/bootstrap.min.css" type="text/css">
  <link rel="stylesheet" href="views/css/admin/style.css" type="text/css">
  <link rel="stylesheet" href="views/css/admin/admin.css" type="text/css">

  <script type="text/javascript" src="views/js/jquery/jquery.min.js"></script>
  <script type="text/javascript" src="views/js/bootstrap/bootstrap.min.js"></script>
  <script type="text/javascript" src="views/js/admin.js"></script>


</head>

<body class="my-login-page body-admin" style="background-image: url(views/images/admin/bck_inicio_kontrola.jpg)">
  <section class="h-100">
    <div class="container h-100">
      <div class="row justify-content-md-center h-100">
        <div class="card-wrapper mrg-card">
          <div class="card fat card-admin" id="card_admin">
            <div class="card-body">
              <center>
                <div class="my-2">
                  <img class="img-responsive" src="views/images/logo-215.png">
                </div>
              </center>
              <br>
              <h5 class="card-title text-center" style="font-family: none;">Ingresa tu cuenta</h5>
              <div id="MsjAJX"><?php if (isset($_GET['error']) && $_GET['error'] == 'session')
                                  echo '<div class="alert alert-danger alert-dismissible fade show" role="alert">'
                                    . '  <label for="msjAJX">Su sesión ha terminado!</label>'
                                    . '  <button type="button" class="close" data-dismiss="alert" aria-label="Close">'
                                    . '    <span aria-hidden="true">&times;</span>'
                                    . '  </button>'
                                    . '</div>';
                                ?></div>
              <form novalidate>
                <div class="form-group">
                  <!-- <label for="usuario">Usuario</label> -->

                  <input id="usuario" type="text" class="form-control" maxlength="10" minlength="1" placeholder="correo@gmail.com" required autofocus>
                  <div class="invalid-feedback">El usuario no es valido</div>
                </div>

                <div class="form-group">
                  <!-- <label for="password">Contraseña -->
                  <!-- </label> -->
                  <input id="password" type="password" class="form-control" maxlength="32" placeholder="***********" minlength="3" required data-eye>
                  <div class="invalid-feedback">La contraseña no es valida</div>
                </div>

                <!-- <div class="form-group">
                  <label>
                    <input type="checkbox" name="remember"> Remember Me
                  </label>
                </div> -->

                <div class="form-group no-margin">
                  <button id="btn-ingresar" type="button" class="btn btn-cust-secondary btn-block" style="background-color: #2559A6;color: white;">
                    INGRESAR
                  </button>
                </div>
              </form>
            </div>
            <div class="text-center">
              <label><a href="?view=proximamente&mode=crear">
                  ¿Olvidaste tu contraseña?
                </a></label>
            </div>
            <div class="text-center">
              <label>¿Aun no tienes cuenta?<a href="?view=proximamente&mode=crear">
                  CREAR CUENTA
                </a></label>
            </div>
            <div class="footer copyright-1" style="color: #888">
              Copyright &copy; Kontrola 2020 | Diseñado por Ventasoft Ltda
            </div>
          </div>
          <div class="footer copyright-2" style="color: white">
            Copyright &copy; Kontrola 2020 | Diseñado por Ventasoft Ltda
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- <script src="js/jquery.min.js"></script>
  <script src="bootstrap/js/bootstrap.min.js"></script>
  <script src="js/my-login.js"></script> -->
</body>

</html>