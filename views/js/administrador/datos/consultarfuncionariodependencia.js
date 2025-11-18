$(document).ready(function () {
  $("#buscar").on("click", function () {
    getFuncionarios()
  });

  dependencia()

  $(document).on("click", "#btnPdf", function () {
    loadReportePDF()
  });
  $(document).on("click", "#btnExcel", function () {
    loadReporteEcxel()
  });
  getFuncionarios();
});

function getFuncionarios() {
  var dependencia = $("#dependencia").val();

    // Si no hay fecha inicial, usar 2000-01-01
if (!dependencia) {
  dependencia = 1;
}
  $.post('ajaxGeneral.php?mode=getFuncionarioNivelEducativo', {
      nivel_educativo: dependencia,
      num: 4
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
        let i =1;
        $(data).each(function () {
          tr += `<tr>
          <td>${i}</td>
          <input type="hidden" name="id_funcionario" value='${this.id_funcionario}'>
          <td name="identificacion">${this.documento}</td>
          <td name="nombre"><a href="?view=hojavida&mode=crear&id_funcionario=${this.id_funcionario}">
           ${this.nombre===null?"":this.nombre } ${this.apellidos===null?"":this.apellidos}
          </a></td>
          <td name="apellidos">${this.apellidos}</td>
          <td name="celular">${this.nivel}</td>
          <td name="direccion">${this.cargo}</td>
          <td name="edad_nac">${this.dependencia}</td>
          <td name="edad_nac">${this.sede}</td>
          </tr>`;
          i++;
        });
        $("#tblCapacitaciones tbody").html(tr)
      }
    })
}

function dependencia() {
  $.post("ajaxGeneral.php?mode=dependencia").done(function (data) {
    if (data.trim() !== "") {
      data = JSON.parse(data);
      // console.log(data);
      let educa = '<option value="" selected>Seleccione...</option>';
      if (data.error != undefined) {
        alertError(data.error);
        return;
      } else {
        $.each(data, function () {
          educa += `<option value="${this.id_dependencia}">${this.dependencia}</option>`;
        });
      }
      $("#dependencia").html(educa);
    }
  });
}

function loadReporteEcxel() {
  var dependencia = $("#dependencia").val();
  if (dependencia != '' && dependencia != null) {
    newwindow = window.open("?view=reportes&mode=reporteNivelEducativoexcel&num=4&dependencia=" + dependencia, "width=815,height=460")
    if (newwindow == null) {
      alert('Configure el navegador para que permita las ventanas emergentes en esta pagina');
    } else {
      newwindow.creator = self
    }
  }
}

function loadReportePDF() {
  var dependencia = $("#dependencia").val();
  if (dependencia != '' && dependencia != null) {
    newwindow = window.open("?view=reportes&mode=reporteNivelEducativopdf&num=4&dependencia=" + dependencia, "width=815,height=460")
    if (newwindow == null) {
      alert('Configure el navegador para que permita las ventanas emergentes en esta pagina');
    } else {
      newwindow.creator = self
    }
  }
}//