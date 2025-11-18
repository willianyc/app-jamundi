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
      location.href = "?view=actividadesProgramadas&mode=crear";
    });

    //Majjul
    $(document).on("click", "#btnPdf", () => {
      loadReportePDF();
    });

    // Majjul
    $("#btnReporte").click(function () {
      getReporteActividadesProgramadas();
    });

    //Majjul 
    $("#btnExcel").click(function () {
      loadReporteEcxel();
    });

    $("#btnBuscarAll").click(function () {
      $(this).html(`<i class="fa fa-eye"></i> BUSCANDO...`);
      getActividades();
    });

    $("#mes").change(function () {
      getActividades(null, $(this).val());
    });

  });

//Majjul
$(document).on("change", "#reporteEstado", function (){
   let estado = $("#reporteEstado").val();
   getReporteActividadesProgramadas(estado);
});

/*
function getReporteActividadesProgramadas(estado = null) {
    $.post("ajaxGeneral.php?mode=getReporteActividadesProgramadas", {
     	   estado: estado
     })
     .done(function (data) {
	  $("#tblActvidadesReportes").removeClass('d-none');
        $("#tblActividad").addClass('d-none');
        if (data.trim() !== "") { 
            data = JSON.parse(data);
            if (data.error != undefined) {
                alertError(data.error);
                return;
            }
	      var tr = "";
		$(data).each(function () {
             tr += `<tr>
			<td name="identificacion">${this.identificacion}</td>
              	<td name="nombre">${this.nombre}</td>
			<td name="direccion">${ this.direccion }</td>
			<td name="estado">${ this.estado == undefined ? "PENDIENTE" : this.estado }</td>
			<td name="opcion">
			   <a href="?view=asignacionFuncionariosActividadesProgramadas&mode=crear&id_actividad=${this.id_actividadprogramada}">
		      	<i class="fa fa-eye">
			   </a>
			</td>
             </tr>`
		});
        $("#tblActvidadesReportes tbody").html(tr);
        }
    });
}
*/
function getReporteActividadesProgramadas(estado = null) {
  $.post("ajaxGeneral.php?mode=getReporteActividadesProgramadas", {
       estado: estado
   })
   .done(function (data) {
    $("#tblActvidadesReportes").removeClass('d-none');
    $("#tblActividad").addClass('d-none');
      if (data.trim() !== "") { 
          data = JSON.parse(data);
          if (data.error != undefined) {
              alertError(data.error);
              return;
          }
      var tr = "";
      $(data).each(function () {
        tr += `
        <tr>
          <td name="identificacion">${this.identificacion}</td>
          <td name="nombre">${this.nombre}</td>
          <td name="fecha_ini">${this.fecha_ini}</td>
          <td name="fecha_fin">${this.fecha_fin}</td>
          <td name="is_presencial">${this.is_presencial}</td>
          <td name="direccion">${this.direccion}</td>
          <td name="ciclo">${this.ciclo}</td>
          <td name="estado">${this.estado == undefined ? "PENDIENTE" : this.estado}</td>
          <td name="opcion">
            <a href="?view=asignacionFuncionariosActividadesProgramadas&mode=crear&id_actividad=${this.id_actividadprogramada}">
                <i class="fa fa-eye"></i>
            </a>
			    </td>
        </tr>`
      });
      $("#tblActvidadesReportes tbody").html(tr);
    }
  });
}  

  
  function getActividades(identificacion = null, mes = null) {
    $.post("ajaxGeneral.php?mode=getActividadesProgramadas", {
      identificacion: identificacion,
      mes: mes,
    })
      .done(function (data) {
	  // Majjul
	  $("#tblActividad").removeClass('d-none');
	  $("#tblActvidadesReportes").addClass('d-none');
        if (data.trim() !== "") {
          // data.replace("getFuncionario", 'ss')
          data = JSON.parse(data);
          if (data.error != undefined) {
            alertError(data.error);
            return;
          }
          var tr = "";
          $(data).each(function () {
            tr +=
            `<tr>
              <input type="hidden" name="id_actividad" value='"${this.id_actividad}"'>
              <td name="identificacion">${this.identificacion}</td>
              <td name="nombre">${this.nombre}</td>
              <td name="fecha_ini">${this.fecha_ini}</td>
              <td name="fecha_fin">${this.fecha_fin}</td>
              <td name="is_presencial">${this.is_presencial}</td>
              <td name="direccion">${this.direccion}</td>
              <td name="ciclo">${this.ciclo}</td>
              <td name="estado">${this.estado == undefined ? "PENDIENTE" : this.estado}</td>
              <td>
                <a href="?view=asignacionFuncionariosActividadesProgramadas&mode=crear&id_actividad=${this.id_actividadprogramada}">
                  <i class="fa fa-eye"> </i>
                </a>
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

  function loadReportePDF() {

    ancho = 815;
    alto = 460;
    barra = 0;
    izquierda = (screen.width) ? (screen.width-ancho)/2 : 100;
    arriba = (screen.height) ? (screen.height-alto)/2 : 100;
    opciones = 'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars='+barra+',resizable=0,width='+ancho+',height='+alto+',left='+izquierda+',top='+ arriba;
    newwindow = window.open("?view=reportes&mode=consultaractividadesprogramadaspdf", 'popUp', opciones)
    if (newwindow == null) {
      alert('Configure el navegador para que permita las ventanas emergentes en esta pagina');
    } else {
      newwindow.creator = self
    }
  }

  // Majjul
  function loadReporteEcxel() {
      newwindow = window.open("?view=reportes&mode=consultaactividadesprogramadasexcel", "width=815,height=460")
      if (newwindow == null) {
        alert('Configure el navegador para que permita las ventanas emergentes en esta pagina');
      } else {
        newwindow.creator = self
      }
  }//