$(document).ready(function () {
  $('#btnBuscarAll').on('click', function () {
    getFuncionarios()
    return
  })

  $("#filterFuncionario").on("keyup", function () {
    valor = $(this).val().toLowerCase()
    getFuncionarios(valor)
  });
  $(document).on("change", "#mes_cumple", function () {
    getFuncionarios(null, $(this).val())

  });
  $(document).on("click", "#excel-btn", function () {
    loadReporteEcxel()
  });

  $(document).on('click', '.delete_fun', function () {
    id_funcionario = $(this).parents('tr').find('input[name=id_funcionario]').val()
    deleteFuncionario(id_funcionario)
  })
});

function deleteFuncionario(id_funcionario) {
  $.post('set/hojavida/eliminar', {
      id_funcionario: id_funcionario
    })
    .done(function (data) {
      data = JSON.parse(data);
      if (data.error != undefined) {
        console.log(atob(data.error));
        alertError(btoa('Error al eliminar el funcionario'));
      } else
        alertSucces(data.success)
      $('#todos').trigger('click')
    })
}

function getFuncionarios(nombre = null, mes = null) {
  $.post('ajaxGeneral.php?mode=getFuncionario_2', {
      nombre: nombre,
      mes: mes
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
          <td name="identificacion">${this.documento}</td>
          <td name="nombre">${this.nombre}</td>
          <td name="apellidos">${this.apellidos}</td>
          <td name="celular">${this.nivel}</td>
          <td name="direccion">${this.cargo}</td>
          <td name="fecha_nac">${this.dependencia}</td>
          <td><a href="?view=hojavida&mode=crear&id_funcionario=${this.id_funcionario}" target="_blank"><i class="fa fa-eye"></a></td>
          </tr>`
        });
        $("#tblCapacitaciones tbody").html(tr)
      }
    })
}

// <td><a href="?view=hojavida&mode=crear&id_funcionario=${this.id_funcionario}" target="_blank"><i class="fas fa-edit"></i></a></td>
function loadReporteEcxel() {
  var mes = $("#mes_cumple").val();
  if (mes != '' && mes != null) {
    newwindow = window.open("?view=reporte&mode=reportefuncionariocumpleexcel&mes=" + mes, "width=815,height=460")
    if (newwindow == null) {
      alert('Configure el navegador para que permita las ventanas emergentes en esta pagina');
    } else {
      newwindow.creator = self
    }
  }
}//