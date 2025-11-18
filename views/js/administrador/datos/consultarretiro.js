$(document).ready(function () {
  $('#btnBuscarAll').on('click', function () {
    $("#filterFuncionario").val('')
    getRetiro(null)
    return
  })

  $(document).on('click', '#btnNuevo', function () {
    location.href = "?view=retiro&mode=crear";
  })

  $(document).on("click", "#btnPdf", function () {
    loadReportePDF()
  });

  $(document).on("click", "#btnExcel", function () {
    loadReporteEcxel()
  });

  $("#filterFuncionario").on("keyup", function () {
    valor = $(this).val().toLowerCase()
    getRetiro(valor)
  });
});

function getRetiro(nombre) {
  $.post('ajaxGeneral.php?mode=getFuncionario_3', {
      nombre: nombre,
      retiro: 1
    })
    .done(function (data) {
      if (data.trim() !== '') {
        // data.replace("getFuncionario", 'ss')

        data = JSON.parse(data);
        if (data.error != undefined) {
          $("#tblCapacitaciones tbody").html('')
          return
        }
        var tr = ""
        num = 1;
        $(data).each(function () {
          documento = this.documento == undefined || this.documento == null ? '' : this.documento;
          nombres = this.nombre == undefined || this.nombre == null ? '' : this.nombre;
          apellidos = this.apellidos == undefined || this.apellidos == null ? '' : this.apellidos;
          celular = this.celular == undefined || this.celular == null ? '' : this.celular;
          tipo_retiro = this.tipo_retiro == undefined || this.tipo_retiro == null ? '' : this.tipo_retiro;
          causa = this.causa == undefined || this.causa == null ? '' : this.causa;
          estado = this.estado == undefined || this.estado == null ? '' : this.estado;
          url = this.paz_salvo == undefined || this.paz_salvo == null ? '' : this.paz_salvo;
          tr += `<tr>
          <input type="hidden" name="id_funcionario" value='"${this.id_funcionario}"'>
          <td>${num == 1?'<span style="background:green; padding:5px; color:yellow; border-radius:5px;">Nuevo</span>':""}</td>
          <td name="identificacion">${documento}</td>
          <td name="nombre">${nombres}</td>
          <td name="apellidos">${apellidos}</td>
          <td name="celular">${celular}</td>
          <td name="direccion">${tipo_retiro}</td>
          <td name="estado">
          <span style="${estado=="pendiente"?"Background:#FFC300;":''} ${estado=="ok"?"Background:#41B425;":''} padding:5px; border-radius:5px">${estado}</span>          </td>
          <td name="fecha_nac">${causa}</td>
          <td>
            <a target="blank" title="Ver Detalles" href="?view=retiro&mode=crear&id_funcionario=${this.id_funcionario}"><i class="fa fa-eye"></i></a>
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
  newwindow = window.open("?view=reportes&mode=reporteretiroexcel&filtro=" + filtro + "&todos=All&id_f=", "width=815,height=460")
  if (newwindow == null) {
    alert('Configure el navegador para que permita las ventanas emergentes en esta pagina');
  } else {
    newwindow.creator = self
  }
}

function loadReportePDF() {
  var filtro = $("#filterFuncionario").val();
  newwindow = window.open("?view=reportes&mode=reporteretiropdf&filtro=" + filtro + "&todos=All&id_f=", "width=815,height=460")
  if (newwindow == null) {
    alert('Configure el navegador para que permita las ventanas emergentes en esta pagina');
  } else {
    newwindow.creator = self

  }
}

function downloadfile(id_funcionario) {
  $.post('ajaxGeneral.php?mode=download', {
    id_funcionario
  }).done(function (data) {
    if (data.trim() !== '') {
      data = JSON.parse(data);
      if (data.error != undefined) {
        alertError(data.error)
        return
      } else {
        return data;
      }
    }
  })
}//