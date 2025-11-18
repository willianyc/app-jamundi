$(document).ready(function () {
  $('#btnBuscarAll').on('click', function () {
    $("#filterFuncionario").val('')
    getSeguridadSocial(null)
    return
  })

  $(document).on("click", "#btnExcel", function () {
    loadReporteEcxel()
  });

  $(document).on("click", "#btnPdf", function () {
    loadReportePDF()
  });

  $(document).on('click', '#btnNuevo', function () {
    location.href = "?view=seguridadSocial&mode=crear";
  })

  $("#filterFuncionario").on("keyup", function () {
    valor = $(this).val().toLowerCase()
    getSeguridadSocial(valor)
  });
});

function getSeguridadSocial(nombre) {
  $.post('ajaxGeneral.php?mode=getFuncionarioSeguridadSocial_2', {
      nombre: nombre,
      seguridadsocial: 1
    })
    .done(function (data) {
      if (data.trim() !== '') {
        // data.replace("getFuncionario", 'ss')
        data = JSON.parse(data);
        if (data.error != undefined) {
          alertError(data.error)
          return
        }
        var tr = ""
        num = 1;
        $(data).each(function () {
          documento = this.documento == undefined || this.documento == null ? '' : this.documento;
          nombres = this.nombre == undefined || this.nombre == null ? '' : this.nombre;
          eps = this.eps == undefined || this.eps == null ? '' : this.eps;
          fondo_pension = this.fondo_pension == undefined || this.fondo_pension == null ? '' : this.fondo_pension;
          caja_compensacion2 = this.caja_compensacion == undefined || this.caja_compensacion == null ? '' : this.caja_compensacion;
          arl2 = this.arl == undefined || this.arl == null ? '' : this.arl;
          apellidos = this.apellidos == undefined || this.apellidos == null ? '' : this.apellidos;
         
          tr += `<tr>
          <input type="hidden" name="id_funcionario" value='"${this.id_funcionario}"'>
          <td> ${num} ${num == 1?'<span style="background:green; padding:5px; color:yellow; border-radius:5px;">Nuevo</span>':""}</td>
          <td name="identificacion">${documento}</td>
          <td name="nombre">${nombres}</td>
          <td name="celular">${eps}</td>
          <td name="direccion">${fondo_pension}</td>
          <td name="fecha_nac">${arl2}</td>
          <td name="fecha_nac">${caja_compensacion2}</td>
          <td><a href="?view=seguridadSocial&mode=crear&id_funcionario=${this.id_funcionario}"><i class="fa fa-eye"></a></td>
          </tr>`
          num++;
        });
        $("#tblCapacitaciones tbody").html(tr)
        $("#tblCapacitaciones tbody").css("font-size","12px")
      }
    })
}

function loadReporteEcxel() {
  var filtro = $("#filterFuncionario").val();
  // if (filtro != '' && filtro != null) {
  newwindow = window.open("?view=reportes&mode=reporteseguridadsocialexcel&filtro=" + filtro + "&todos=All&id_f", "width=815,height=460")
  if (newwindow == null) {
    alert('Configure el navegador para que permita las ventanas emergentes en esta pagina');
  } else {
    newwindow.creator = self
  }
}

function loadReportePDF() {
  var filtro = $("#filterFuncionario").val();
  newwindow = window.open("?view=reportes&mode=reporteseguridadsocialpdf&filtro=" + filtro + "&todos=All&id_f", "width=815,height=460")
  if (newwindow == null) {
    alert('Configure el navegador para que permita las ventanas emergentes en esta pagina');
  } else {
    newwindow.creator = self
  }
}//