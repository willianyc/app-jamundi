$(document).ready(function () {
  $('#btnBuscarAll').on('click', function () {
    $("#filterFuncionario").val('')
    getincapacidad(null)
    return
  })

  $(document).on("click", "#btnExcel", function () {
    loadReporteEcxel()
  });

  $(document).on("click", "#btnPdf", function () {
    loadReportePDF()
  });

  $(document).on('click', '#btnNuevo', function () {
    location.href = "?view=incapacidad&mode=crear";
  })

  $("#filterFuncionario").on("keyup", function () {
    valor = $(this).val().toLowerCase()
    getincapacidad(valor)
  });
});

function getincapacidad(nombre) {
  $.post('ajaxGeneral.php?mode=getFuncionario_4', {
      nombre: nombre,
      incapacidad: 1
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
          tipo_incapacidad = this.tipo_incapacidad == undefined || this.tipo_incapacidad == null ? '' : this.tipo_incapacidad;
          nombres = this.nombre == undefined || this.nombre == null ? '' : this.nombre;
          apellidos = this.apellidos == undefined || null == this.apellidos ? '' : this.apellidos;
          diagnostico = this.diagnostico == undefined || null == this.diagnostico ? '' : this.diagnostico;
          dias = this.dias == undefined || null == this.dias ? 0 : this.dias;
          fecha_ini = this.fecha_ini == undefined || null == this.fecha_ini ? '' : this.fecha_ini;
          fecha_fin = this.fecha_fin == undefined || null == this.fecha_fin ? '' : this.fecha_fin;
          url = this.archivo_incapacidad == undefined || null == this.archivo_incapacidad ? '' : this.archivo_incapacidad;
          
          tr += `<tr>
          <input type="hidden" name="id_funcionario" value='"${this.id_funcionario}"'>
          <td>${num}</td>
          <td name="identificacion">${documento}</td>
          <td name="nombre">${nombres}</td>
          <td name="apellidos">${apellidos}</td>
          <td name="apellidos">${tipo_incapacidad}</td>
          <td name="celular">${diagnostico}</td>
          <td name="direccion">${dias}</td>
          <td name="fecha_nac">${fecha_ini}</td>
          <td name="fecha_nac">${fecha_fin}</td>
          <td>
           <a href="?view=incapacidad&mode=crear&id_funcionario=${this.id_funcionario}"><i class="fa fa-eye"></i></a>
           &nbsp;
           <a  ${url==""?"style='display:none'":""} target="blank" title="Ver documentos" href="${url}" ><i class="fa fa-download" aria-hidden="true"></i></a>
          </td>
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
  newwindow = window.open("?view=reportes&mode=reporteincapacidadexcel&filtro=" + filtro + "&todos=All&id_f=", "width=815,height=460")
  if (newwindow == null) {
    alert('Configure el navegador para que permita las ventanas emergentes en esta pagina');
  } else {
    newwindow.creator = self
  }
}

function loadReportePDF() {
  var filtro = $("#filterFuncionario").val();
  newwindow = window.open("?view=reportes&mode=reporteincapacidadpdf&filtro=" + filtro + "&todos=All&id_f=", "width=815,height=460")
  if (newwindow == null) {
    alert('Configure el navegador para que permita las ventanas emergentes en esta pagina');
  } else {
    newwindow.creator = self

  }
}//