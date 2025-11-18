$(document).ready(function () {
  let params = new URLSearchParams(location.search);
  id_funcionario = params.get("id_funcionario");
  if (id_funcionario != null) {
    getFuncionario(id_funcionario);
  }
  $('#btnBuscarAll').click(function () {
    $("#filterFuncionario").val('')
    $(this).html(`<i class="fa fa-eye"></i> BUSCANDO...`);
    getFuncionarios()
    return
  })
  $("#filterFuncionario").on("keypress", function (e) {
    var identificacion = $(this).val();
    var keycode = e.keyCode ? e.keyCode : e.which;
    if (keycode == "13") {
    getFuncionarios(identificacion)
    }
  });
});

function getFuncionario() {
  $.post("ajaxGeneral.php?mode=getFuncionario_2", {
    documento: $("#identificacion").val(),
    id_funcionario: id_funcionario,
  }).done(function (data) {
    if (data.trim() !== "") {
      data = JSON.parse(data);
      if (data.error == undefined) {
        $(data).each(function () {
          $("#id_funcionario").val(this.id_funcionario);
          $("#identificacion").val(this.documento);
          $("#nombres").val(this.nombre);
          $("#apellidos").val(this.apellidos);
          $("#vinculacion").val(this.tipo_vinculacion);
          $("#fecha_ingreso").val(this.fecha_ingreso_nombra);
          $("#cargo_propiedad").val(this.cargo);
          $("#years").val(this.ano_ingreso);
          $("#nivel").val(this.nivel);
          $("#codigo").val(this.codigo);
          $("#grado").val(this.grado);
          $("#Dependencia").val(this.dependencia);
          $("#sede").val(this.sede);
          $("#cargo").val(this.cargo);
		  $("#totalEvaluacion").val(this.valor_evaluacion);
          $("input[name=procesos_disc]")
            .filter("[value=" + this.is_procesodisciplinario + "]")
            .attr("checked", true);
        });
        // cargar();
        $("#ubicacion_lab").removeClass("d-none");
      } else {
        $("#id_funcionario").val("");
        $("#nombres").val("");
        $("#apellidos").val("");
        $("#vinculacion").val("");
        $("#fecha_ingreso").val("");
        $("#years").val("");
        $("#nivel").val("");
        $("#cargo_propiedad").val("");
        $("#codigo").val("");
        $("#grado").val("");
        $("#Dependencia").val("");
        $("#sede").val("");
        $("#cargo").val("");
        $("#ubicacion_lab").addClass("d-none");
      }
    }
  });
}

function getFuncionarios(documento = null) {
  $.post('ajaxGeneral.php?mode=getFuncionariosEvaluaciones', {
      documento: documento
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
        $(data).each(function () {
          tr += `<tr>
          <input type="hidden" name="id_funcionario" value='${this.id_funcionario}'>
          <td name="identificacion">${this.documento == null ? "" : this.documento}</td>
          <td name="nombre">${this.nombre == null ? "" : this.nombre}</td>
          <td name="apellidos">${this.apellidos == null ? "" : this.apellidos}</td>
          <td name="celular">${this.nivel == null ? "" : this.nivel}</td>
          <td name="direccion">${this.cargo == null ? "" : this.cargo}</td>
          <td name="fecha_nac">${this.dependencia == null ? "" : this.dependencia}</td>
          <td name="fecha_nac">${this.sede == null ? "" : this.sede}</td>
          <td>${this.valor_evaluacion == null ? "" : this.valor_evaluacion}</td>
          <td><a href="?view=consultarFuncionarioEvaluado&mode=crear&id_funcionario=${
            this.id_funcionario
          }"><i class="fa fa-eye"></a></td>
          </tr>`
        });
        $("#tblCapacitaciones tbody").html(tr)
      }
    })
    .always(function () {
      $("#btnBuscarAll").html(`<i class="fa fa-eye"></i> BUSCAR TODO`);
    });
}//