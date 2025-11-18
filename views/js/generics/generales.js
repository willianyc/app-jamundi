window.addEventListener('DOMContentLoaded', event => {

  // Toggle the side navigation
  const sidebarToggle = document.body.querySelector('#sidebarToggle');
  var leftConten =  $("#layoutSidenav_nav")[0].clientWidth
  if (sidebarToggle) {
    // Uncomment Below to persist sidebar toggle between refreshes
    // if (localStorage.getItem('sb|sidebar-toggle') === 'true') {
      //     document.body.classList.toggle('sb-sidenav-toggled');
      // }
      $(".container_view").css({
        left:`${leftConten}px`,
        width: "83%"
      })  
      sidebarToggle.addEventListener('click', event => {
        event.preventDefault();
        // console.log($("#layoutSidenav_nav")[0].clientWidth)
        document.body.classList.toggle('sb-sidenav-toggled');
        localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
        if($("body").hasClass("sb-sidenav-toggled")){
          $(".container_view").css({
            left:"",
            width: "100%"
          })  
        }else{
          $(".container_view").css({
            left:`${leftConten}px`,
            width: "83%"
          })  
        }
      });
  }
  nivel = $("#nivel").val()
  console.log(nivel)
  switch (nivel) {
    case "1":
      
      break;
    case "2":
      $("a[aria-controls=ElementosTrabajo]").hide()
      $("a[aria-controls=seguridadSocial]").hide()
      break;
      case "3":
        $(".container_view").hide()
      $("a[aria-controls=HojaVida]").hide()
      $("a[aria-controls=seguridadSocial]").hide()
      break;
      case "4":
        $(".container_view").hide()
      $("a[aria-controls=HojaVida]").hide()
      $("a[aria-controls=ElementosTrabajo]").hide()
      
      break;
  
    default:
      break;
  }

});
$(document).ready(function () {
  $('#btnAtras').on('click', function(e){
    e.preventDefault();
    window.history.back();
  });
});
function getConsecutivo(tabla) {
  $.post("ajaxGeneral.php?mode=getConsecutivo",{
    tabla: tabla
  }).done(function (data) {
    if (data.trim() !== "") {
      data = JSON.parse(data);
      if (data.error != undefined) {
        alertError(data.error);
        return;
      }
      $(data).each(function () {
        $("#identificacion").val(this.consecutivoConcat).prop("disabled", true);
        $("#identificacion").attr("consecutivo", this.consecutivo);
      });
    }
  });
}//