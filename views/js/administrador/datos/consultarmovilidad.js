$(document).ready(function () {
  $('#btnBuscarAll').on('click', function () {
    $("#filterFuncionario").val('')
    getMovilidad(null)
    return
  })

  $(document).on("click", "#btnExcel", function () {
    loadReporteEcxel()
  });

  $(document).on("click", "#btnPdf", function () {
    loadReportePDF()
  });

  $(document).on('click', '#btnNuevo', function () {
    location.href = "?view=movilidad&mode=crear";
  })

  $("#filterFuncionario").on("keyup", function () {
    valor = $(this).val().toLowerCase()
    getMovilidad(valor)
  });
});

function getMovilidad(nombre) {
  $.post('core/ajaxGeneral.php?mode=getFuncionario_3', {
      nombre: nombre,
      movilidad: 1
    })
    .done(function (data) {
      if (data.trim() !== '') {
        // data.replace("getFuncionario", 'ss')
        data = JSON.parse(data);
        if (data.error != undefined) {
          // alertError(data.error)
          $("#tblCapacitaciones tbody").html('')
          return
        }
        var tr = ""
        num = 1;
        $(data).each(function () {
          documento = this.documento == undefined || this.documento == null ? '' : this.documento;
          nombres = this.nombre == undefined || this.nombre == null ? '' : this.nombre;
          apellidos = this.apellidos == undefined || null == this.apellidos ? '' : this.apellidos;
          nivel = this.nivel == undefined || this.nivel == null ? '' : this.nivel;
          cargos = this.cargo == undefined || this.cargo == null ? '' : this.cargo;
          dependencia = this.dependencia == undefined || this.dependencia == null ? '' : this.dependencia;
          
          tr += `<tr>
          <input type="hidden" name="id_funcionario" value='"${this.id_funcionario}"'>
          <td>${num}</td>
          <td name="identificacion">${documento}</td>
          <td name="nombre">${nombres}</td>
          <td name="apellidos">${apellidos}</td>
          <td name="direccion">${nivel}</td>
          <td name="fecha_nac">${cargos}</td>
          <td name="dependencia">${dependencia}</td>
          <td><a href="?view=movilidad&mode=crear&id_funcionario=${this.id_funcionario}"><i class="fa fa-eye"></a></td>
          </tr>`
          num++;
        });
        $("#tblCapacitaciones tbody").html(tr)
      }
    })
}

function loadReporteEcxel() {
  var filtro = $("#filterFuncionario").val();
  // if (filtro != '' && filtro != null) {
  newwindow = window.open("?view=reportes&mode=reportemovilidadexcel&filtro=" + filtro + "&todos=All&id_f=", "width=815,height=460")
  if (newwindow == null) {
    alert('Configure el navegador para que permita las ventanas emergentes en esta pagina');
  } else {
    newwindow.creator = self
  }
}

function loadReportePDF() {
  var filtro = $("#filterFuncionario").val();
  newwindow = window.open("?view=reportes&mode=reportemovilidadpdf&filtro=" + filtro + "&todos=All&id_f=", "width=815,height=460")
  if (newwindow == null) {
    alert('Configure el navegador para que permita las ventanas emergentes en esta pagina');
  } else {
    newwindow.creator = self
  }
}//