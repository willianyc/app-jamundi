$(document).ready(function () {
  $("#buscar").on("click", function () {
    newwindow = window.open($('#reportes_funvionarios').val(), "width=815,height=460")
  if (newwindow == null) {
    alert('Configure el navegador para que permita las ventanas emergentes en esta pagina');
  } else {
    newwindow.creator = self
  }
  });
});
//