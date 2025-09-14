<?php   
// error_log('+** Index [Var1]: '.	print_r($_SERVER,1));//.' - [Var2]: '.);//.' - [Var3]: '.);
// error_log('+** Index [Var1]:  - [Var2]: ');//.' - [Var3]: '.);
if (isset($_GET['view'])) {
  if (file_exists('core/controllers/' . ($_GET['view']) . 'Controller.php')) {
    include('core/controllers/' . ($_GET['view']) . 'Controller.php');
  } else {
    include('core/controllers/errorController.php');
  }
} else if (isset($_GET['error'])) {
  include('core/controllers/errorController.php');
} else {
  include('core/controllers/indexController.php');
}
