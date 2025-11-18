$(document).ready(function () {
  $("#buscar").on("click", function () {
    getFuncionarios()
  });

  $(document).on("click", "#btnPdf", function () {
    loadReportePDF()
  });
  $(document).on("click", "#btnExcel", function () {
    loadReporteEcxel()
  });
   // 👇 Ejecutar automáticamente al cargar la vista
  getFuncionarios();
});

function getFuncionarios() {
  var edad_ini = $("#edad_ini").val();
  var edad_fin = $("#edad_fin").val();
  
  
// Si no hay fecha inicial, usar 2000-01-01
if (!edad_ini) {
  edad_ini = 0;
}

// Si no hay fecha final, usar la fecha actual
if (!edad_fin) {
  
  edad_fin = 150;
}
  $.post('ajaxGeneral.php?mode=getFuncionarioEdad', {
      edad_fin: edad_fin,
      edad_ini: edad_ini
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
          <td >${i}</td>
          <input type="hidden" name="id_funcionario" value='${this.id_funcionario}'>
          <td name="identificacion">${this.documento}</td>
          <td name="nombre">
           <a href="https://app-jamundi.fksas.com/index.php?view=hojavida&mode=crear&id_funcionario=${this.id_funcionario}">
           ${this.nombre===null?"":this.nombre } ${this.apellidos===null?"":this.apellidos}
          </a>
          </td> 
          <td name="edad">${this.edad===null?"":this.edad}</td>
          <td name="celular">${this.nivel===null?"":this.nivel}</td>
          <td name="direccion">${this.cargo===null?"":this.cargo}</td>
          <td name="fecha_nac">${this.dependencia===null?"":this.dependencia}</td>
          <td name="fecha_nac">${this.sede===null?"":this.sede}</td>
          </tr>`
          i++;
        });

        $("#tblCapacitaciones tbody").html(tr)
      }
    })
}

function loadReporteEcxel() {
  var edad_ini = $("#edad_ini").val();
  var edad_fin = $("#edad_fin").val();
  if (edad_ini != '' && edad_fin != null) {
    newwindow = window.open("?view=reportes&mode=reporteEdadexcel&edad_ini=" + edad_ini + "&edad_fin=" + edad_fin, "width=815,height=460")
    if (newwindow == null) {
      alert('Configure el navegador para que permita las ventanas emergentes en esta pagina');
    } else {
      newwindow.creator = self
    }
  }
}

function loadReportePDF() {
  var edad_ini = $("#edad_ini").val();
  var edad_fin = $("#edad_fin").val();
  if (edad_ini != '' && edad_fin != null) {
	ancho = 815;
    alto = 460;
    barra = 0;
    izquierda = (screen.width) ? (screen.width-ancho)/2 : 100;
    arriba = (screen.height) ? (screen.height-alto)/2 : 100;
    opciones = 'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars='+barra+',resizable=0,width='+ancho+',height='+alto+',left='+izquierda+',top='+ arriba;
    newwindow = window.open("?view=reportes&mode=reporteEdadpdf&edad_ini=" + edad_ini + "&edad_fin=" + edad_fin, 'popUp', opciones)  
	  
	if (newwindow == null) {
      alert('Configure el navegador para que permita las ventanas emergentes en esta pagina');
    } else {
      newwindow.creator = self
    }
  }
}//