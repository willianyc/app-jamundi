$(document).ready(function () {
  // getCapacitaciones()
  $("#btnBuscar").on("click", function () {
    var fecha_ini = $("#fecha_ini").val();
    var fecha_fin = $("#fecha_fin").val();
    if (
      fecha_ini == null ||
      fecha_ini == "" ||
      fecha_fin == "" ||
      fecha_fin == null
    ) {
      alertError(btoa("Todos los campos son requeridos"));
      return;
    }
    $("#MsjAJX").html("");
    getActividad1_2(fecha_ini, fecha_fin);
    return;
  });

  $(document).on("click", "#excel-btn", function () {
    loadReporteEcxel();
  });

   $(document).on("click", "#btnPdf", function () {
     loadReportePDF()
  });
});

function getActividad1_2(fecha_ini = null, fecha_fin = null) {
  $.post("ajaxGeneral.php?mode=getActividad1_2", {
    fecha_ini: fecha_ini,
    fecha_fin: fecha_fin,
  }).done(function (data) {
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
          <input type="hidden" name="id_capacitacion" value='"${
            this.id_actividad
          }"'>
          <td name="identificacion">${this.identificacion}</td>
          <td name="nombre">${this.nombre}</td>
          <td name="fecha_ini">${this.fecha_ini}</td>
          <td name="is_presencial">${this.is_presencial}</td>
          <td name="direccion">${this.direccion}</td>
		  <td name="entidad">${this.entidad_actividad}</td>
		  <td name="asistentes">${this.cantidad}</td>
		  <td name="estado">${this.estado === "" ? "PENDIENTE" : this.estado}</td>


         
          </tr>`;
      });
      $("#tblActividad tbody").html(tr);
    }
  });
}

function loadReporteEcxel() {
  var fecha_ini = $("#fecha_ini").val();
  var fecha_fin = $("#fecha_fin").val();
  if (fecha_ini != "" && fecha_fin != null) {
    newwindow = window.open(
      "?view=reportes&mode=reporteactividadesexcel&fecha_ini=" +
        fecha_ini +
        "&fecha_fin=" +
        fecha_fin,
      "width=815,height=460"
    );
    if (newwindow == null) {
      alert(
        "Configure el navegador para que permita las ventanas emergentes en esta pagina"
      );
    } else {
      newwindow.creator = self;
    }
  }
}

function loadReportePDF() {
  var fecha_ini = $("#fecha_ini").val();
  var fecha_fin = $("#fecha_fin").val();
  if (fecha_ini != '' && fecha_fin != null) {
    ancho = 815;
    alto = 460;
    barra = 0;
    izquierda = (screen.width) ? (screen.width-ancho)/2 : 100;
    arriba = (screen.height) ? (screen.height-alto)/2 : 100;
    opciones = 'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars='+barra+',resizable=0,width='+ancho+',height='+alto+',left='+izquierda+',top='+ arriba;
    newwindow = window.open("?view=reportes&mode=reporteactividadpdf&fecha_ini=" + fecha_ini + "&fecha_fin=" + fecha_fin, 'popUp', opciones)
    if (newwindow == null) {
      alert('Configure el navegador para que permita las ventanas emergentes en esta pagina');
    } else {
      newwindow.creator = self
    }
  }
}
//