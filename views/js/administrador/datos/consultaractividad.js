$(document).ready(function () {
  $("#filterTable").on("keyup", function () {
    var value = $(this).val().toLowerCase();
    $("#tblActividad tbody tr").filter(function () {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
    });
  });
  $("#filterTable").on("keypress", function (e) {
    var identificacion = $(this).val();
    var keycode = e.keyCode ? e.keyCode : e.which;
    if (keycode == "13") {
      getActividades(identificacion);
    }
  });
  $("#btnNuevo").click(function () {
    location.href = "?view=actividad&mode=crear";
  });
  $("#btnExcel").click(function () {
    loadReporteEcxel();
  });
  $("#btnPdf").click(function () {
    loadReportePDF();
  });
  $("#btnBuscarAll").click(function () {
    $(this).html(`<i class="fa fa-eye"></i> BUSCANDO...`);
    getActividades();
  });
});

function getActividades(identificacion = null) {
  $.post("ajaxGeneral.php?mode=getActividades", {
    identificacion: identificacion,
  })
    .done(function (data) {
      if (data.trim() !== "") {
        // data.replace("getFuncionario", 'ss')
        data = JSON.parse(data);
        if (data.error != undefined) {
          alertError(data.error);
          return;
        }
        var tr = "";
        $(data).each(function () {
          tr += `<tr>
            <input type="hidden" name="id_actividad" value='"${
              this.id_actividad
            }"'>
            <td name="identificacion">${this.identificacion}</td>
            <td name="nombre">${this.nombre}</td>
            <td name="fecha_ini">${this.fecha_ini}</td>
            <td name="fecha_fin">${this.fecha_fin}</td>
            <td name="is_presencial">${this.is_presencial}</td>
            <td name="direccion">${this.direccion}</td>
            <td name="estado">${this.estado === "" || this.estado === null ? "PENDIENTE" : this.estado}</td>
            <td name="cantidad">${this.cantidad === null ? "0":this.cantidad}</td>
            <td><a href="?view=asignarFuncionarioActividad&mode=crear&id_actividad=${
              this.id_actividad
            }"><i class="fa fa-eye"></i></a>
            &nbsp;
            <a  ${this.archivo==null?"style='display:none'":""} target="blank" title="Ver documentos" href="${this.archivo}" ><i class="fa fa-download" aria-hidden="true"></i></a>
             </td>
            </tr>`;
        });
        $("#tblActividad tbody").html(tr);
        if (data.length > 0) $("#filterTable").show();
      }
    })
    .always(function () {
      $("#btnBuscarAll").html(`<i class="fa fa-eye"></i> BUSCAR TODO`);
    });
}
function loadReporteEcxel() {
  let params = new URLSearchParams(location.search);
  var id_capacitacion = params.get('id_capacitacion');
  // if (filtro != '' && filtro != null) {
   newwindow = window.open("?view=reportes&mode=actividadesexcel", "width=815,height=460")
   if (newwindow == null) {
     alert('Configure el navegador para que permita las ventanas emergentes en esta pagina');
   } else {
     newwindow.creator = self
   }
 }
 
 function loadReportePDF() {
  let params = new URLSearchParams(location.search);
  var id_capacitacion = params.get('id_capacitacion');
   newwindow = window.open("?view=reportes&mode=actividadespdf", "width=815,height=460")
   if (newwindow == null) {
     alert('Configure el navegador para que permita las ventanas emergentes en esta pagina');
   } else {
     newwindow.creator = self
 
   }
 }//