var tabla = null;

$(document).ready(function () {
  // Inicializamos DataTable vacío al inicio
  tabla = $('#tblfuncionarios').DataTable({
    language: idioma,
    paging: true,
    searching: true,
    ordering: true,
    columnDefs: [
      { orderable: false, targets: 7 } // desactiva orden en "Acciones"
    ]
  });

  // Eventos
  $('#btnBuscarAll').on('click', function () {
    getFuncionarios();
  });

  $(document).on("click", "#btnPdf", function () {
    loadReportePDF();
  });

  $(document).on("change", "#mes_cumple", function () {
    getFuncionarios(null, $(this).val());
  });

  $(document).on("click", "#btnExcel", function () {
    loadReporteEcxel();
  });

  $(document).on('click', '#btnNuevo', function () {
    location.href = "?view=hojavida&mode=crear";
  });

  $(document).on('click', '.delete_fun', function () {
    let id_funcionario = $(this).parents('tr').find('input[name=id_funcionario]').val();
    deleteFuncionario(id_funcionario);
  });

  // Primera carga
  getFuncionarios();
});

function deleteFuncionario(id_funcionario) {
  $.post('set/hojavida/eliminar', { id_funcionario: id_funcionario })
    .done(function (data) {
      data = JSON.parse(data);
      if (data.error != undefined) {
        console.log(atob(data.error));
        alertError(btoa('Error al eliminar el funcionario'));
      } else {
        alertSucces(data.success);
        getFuncionarios();
      }
    });
}

function getFuncionarios(nombre = null, mes = null) {
  $.post('ajaxGeneral.php?mode=getFuncionario_2', { nombre: nombre, mes: mes })
    .done(function (data) {
      if (data.trim() !== '') {
        data = JSON.parse(data);
        if (data.error != undefined) {
          tabla.clear().draw();
          return;
        }

        // limpiamos y cargamos con DataTable
        tabla.clear();
        let num = 1;

        $(data).each(function () {
          let documento = this.documento ?? '';
          let nombres = this.nombre ?? '';
          let apellidos = this.apellidos ?? '';
          let nivel = this.nivel ?? '';
          let cargos = this.cargo ?? '';
          let dependencia = this.dependencia ?? '';
          let sede = this.sede ?? '';

          tabla.row.add([
            num == 1 ? '<span style="background:green; padding:5px; color:yellow; border-radius:5px;">Nuevo</span>' : "",
            documento,
            `<a href="?view=hojavida&mode=crear&id_funcionario=${this.id_funcionario}">
               ${nombres} ${apellidos}
             </a>`,
            nivel,
            cargos,
            dependencia,
            sede,
            `<a href="?view=hojavida&mode=crear&id_funcionario=${this.id_funcionario}">
               <i class="fa fa-eye"></i>
             </a>`
          ]);

          num++;
        });

        tabla.draw();
      }
    });
}
