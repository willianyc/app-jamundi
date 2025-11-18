function alertSucces(msg) {
  $(window).scrollTop(0);
  alert = `<div style="float:right" class="col-md-6 alert alert-success alert-dismissible fade show" role="alert">
  <strong></strong> ${decodeURIComponent(escape(window.atob(msg)))}
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>`
  $("#MsjAJX").html(alert)
}

function alertError(msg) {
  $(window).scrollTop(0);
  alert = `<div style="float:right" class="col-md-6 alert alert-danger alert-dismissible fade show" role="alert">
  <strong>*</strong> ${decodeURIComponent(escape(window.atob(msg)))}
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
  <span aria-hidden="true">&times;</span>
  </button>
  </div>`
  $("#MsjAJX").html(alert)
}//