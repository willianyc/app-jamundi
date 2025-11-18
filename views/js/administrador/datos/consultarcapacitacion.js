$(document).ready(function () {
  $("#filterTable").on("keyup", function () {
    var value = $(this).val().toLowerCase();
    $("#tblCapacitaciones tbody tr").filter(function () {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
    });
  });
  $("#filterTable").on("keypress", function (e) {
    var identificacion = $(this).val();
    var keycode = e.keyCode ? e.keyCode : e.which;
    if (keycode == "13") {
      getCapacitaciones(identificacion);
    }
  });
  $("#btnNuevo").click(function () {
    location.href = "?view=capacitacion&mode=crear";
  });
  $("#btnExcel").click(function () {
    loadReporteEcxel();
  });
  $("#btnPdf").click(function () {
    loadReportePDF();
  });
  $("#btnBuscarAll").click(function () {
    $(this).html(`<i class="fa fa-eye"></i> BUSCANDO...`);
    getCapacitaciones();
  });
});

function getCapacitaciones(identificacion = null) {
  $.post("ajaxGeneral.php?mode=getListadoCapacitaciones", {
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
        var i =1;
        $(data).each(function () {
          var estadoCap    
          if(this.estado === null || this.estado == "") estadoCap = 'PENDIENTE';
          else estadoCap = this.estado;     
          tr += `<tr>
            <input type="hidden" name="id_capacitacion" value='"${this.id_capacitacion}"'>
            <td name="identificacion">${i}</td>
            <td name="identificacion">${this.identificacion}</td>
            <td name="nombre">${this.nombre}</td>
            <td name="fecha_ini">${this.fecha_ini}</td>
            <td name="fecha_fin">${this.fecha_fin}</td>
            <td name="is_presencial">${this.is_presencial}</td>
            <td name="direccion">${this.direccion}</td>
            <td name="estado">
            
                ${estadoCap}
                
            </td>
            <td name="cantidad">${this.cantidad > 0 ? this.cantidad : 0 }</td>
            <td><a href="?view=asignacionFuncionarios&mode=crear&id_capacitacion=${
              this.id_capacitacion
            }"><i class="fa fa-eye"></i></a>
            &nbsp;
            <a  ${this.archivo==null?"style='display:none'":""} target="blank" title="Ver documentos" href="${this.archivo}" ><i class="fa fa-download" aria-hidden="true"></i></a>
            </td>
            </tr>`;
            i++;
        });
        $("#tblCapacitaciones tbody").html(tr);
        if (data.length > 0) $("#filterTable").show();
      }
    })
    .always(function () {
      $("#btnBuscarAll").html(`<i class="fa fa-eye"></i> BUSCAR TODO`);
    });
}
function loadReporteEcxel() {
 // if (filtro != '' && filtro != null) {
  newwindow = window.open("?view=reportes&mode=consultacapacitacionexcel", "width=815,height=460")
  if (newwindow == null) {
    alert('Configure el navegador para que permita las ventanas emergentes en esta pagina');
  } else {
    newwindow.creator = self
  }
}
/*
function loadReportePDF() {
  newwindow = window.open("?view=reportes&mode=consultacapacitacionpdf", "width=815,height=460")
  if (newwindow == null) {
    alert('Configure el navegador para que permita las ventanas emergentes en esta pagina');
  } else {
    newwindow.creator = self

  }
}*/

function loadReportePDF() {

    ancho = 815;
    alto = 460;
    barra = 0;
    izquierda = (screen.width) ? (screen.width-ancho)/2 : 100;
    arriba = (screen.height) ? (screen.height-alto)/2 : 100;
    opciones = 'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars='+barra+',resizable=0,width='+ancho+',height='+alto+',left='+izquierda+',top='+ arriba;
    newwindow = window.open("?view=reportes&mode=consultacapacitacionpdf", 'popUp', opciones)
    if (newwindow == null) {
      alert('Configure el navegador para que permita las ventanas emergentes en esta pagina');
    } else {
      newwindow.creator = self
    }
  
}//