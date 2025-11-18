$(document).ready(function () {
  $("#buscar").on("click", function () {
    getFuncionarios()
  });

  sede()

  $(document).on("click", "#btnPdf", function () {
    loadReportePDF()
  });
  $(document).on("click", "#btnExcel", function () {
    loadReporteEcxel()
  });
});

function getFuncionarios() {
  var sede = $("#sede").val();
  $.post('ajaxGeneral.php?mode=getFuncionarioNivelEducativo', {
      nivel_educativo: sede,
      num: 3
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
        let i = 1;
        $(data).each(function () {
          tr += `<tr>
          <td>${i}</td>
          <input type="hidden" name="id_funcionario" value='${this.id_funcionario}'>
          <td name="identificacion">${this.documento}</td>
          <td name="nombre">${this.nombre}</td>
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

function sede() {
  $.post("ajaxGeneral.php?mode=sede").done(function (data) {
    if (data.trim() !== "") {
      data = JSON.parse(data);
      // console.log(data);
      let educa = '<option value="" selected>Seleccione...</option>';
      if (data.error != undefined) {
        alertError(data.error);
        return;
      } else {
        $.each(data, function () {
          educa += `<option value="${this.id_sede}">${this.sede}</option>`;
        });
      }
      $("#sede").html(educa);
    }
  });
}

function loadReporteEcxel() {
  var sede = $("#sede").val();
  if (sede != '' && sede != null) {
    newwindow = window.open("?view=reportes&mode=reporteNivelEducativoexcel&num=3&sede=" + sede, "width=815,height=460")
    if (newwindow == null) {
      alert('Configure el navegador para que permita las ventanas emergentes en esta pagina');
    } else {
      newwindow.creator = self
    }
  }
}

function loadReportePDF() {
  var sede = $("#sede").val();
  if (sede != '' && sede != null) {
    newwindow = window.open("?view=reportes&mode=reporteNivelEducativopdf&num=3&sede=" + sede, "width=815,height=460")
    if (newwindow == null) {
      alert('Configure el navegador para que permita las ventanas emergentes en esta pagina');
    } else {
      newwindow.creator = self
    }
  }
}//