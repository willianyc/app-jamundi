$(document).ready(function () {
  $("#buscar").on("click", function () {
    getFuncionarios()
  });

  ///nivelEducativo()

  $(document).on("click", "#btnPdf", function () {
    loadReportePDF()
  });
  $(document).on("click", "#btnExcel", function () {
    loadReporteEcxel()
  });
  getFuncionarios();
});

function getFuncionarios() {
  
  var fecha_i = $("#fecha_ini").val();
  var fecha_f = $("#fecha_fin").val();

  
  // Si no hay fecha inicial, usar 2000-01-01
if (!fecha_i) {
  fecha_i = "2000-01-01";
}

// Si no hay fecha final, usar la fecha actual
if (!fecha_f) {
  var hoy = new Date();
  var yyyy = hoy.getFullYear();
  var mm = String(hoy.getMonth() + 1).padStart(2, '0');
  var dd = String(hoy.getDate()).padStart(2, '0');
  fecha_f = `${yyyy}-${mm}-${dd}`;
}

  $.post('ajaxGeneral.php?mode=getFuncionarioPorFechaCumple', {
      fecha_f: fecha_f,
      fecha_i: fecha_i
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
          <td >${i}</td>
          <input type="hidden" name="id_funcionario" value='${this.id_funcionario}'>
          <td name="identificacion">${this.documento}</td>
          <td name="nombre"><a href="https://app-jamundi.fksas.com/index.php?view=hojavida&mode=crear&id_funcionario=${this.id_funcionario}">
           ${this.nombre===null?"":this.nombre } ${this.apellidos===null?"":this.apellidos}
          </a></td>          
          <td name="celular">${this.nivel===null?"":this.nivel}</td>
          <td name="fecha_nac">${this.dia_funcionario===null?"":this.dia_funcionario}</td>
          <td name="fecha_nac">${this.mes_funcionario===null?"":this.mes_funcionario}</td>
		      <td name="fecha_nac">${this.ano_funcionario===null?"":this.ano_funcionario}</td>
		      <td name="fecha_nac">${this.edad===null?"":this.edad}</td>
          </tr>`
          i++
        });
        $("#tblCapacitaciones tbody").html(tr)
      }
    })
}

function loadReporteEcxel() {
  var fecha_ini = $("#fecha_ini").val();
  var fecha_fin = $("#fecha_fin").val();
  if (fecha_ini != '' && fecha_fin != null) {
    newwindow = window.open("?view=reportes&mode=reportesfuncionariosFechaCumpleEcxel&fecha_ini=" + fecha_ini + "&fecha_fin=" + fecha_fin, "width=815,height=460")
    if (newwindow == null) {
      alert('Configure el navegador para que permita las ventanas emergentes en esta pagina');
    } else {
      newwindow.creator = self
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
    newwindow = window.open("?view=reportes&mode=reportesfuncionariosCumplepdf&fecha_ini=" + fecha_ini + "&fecha_fin=" + fecha_fin, 'popUp', opciones)
    if (newwindow == null) {
      alert('Configure el navegador para que permita las ventanas emergentes en esta pagina');
    } else {
      newwindow.creator = self
    }
  }
}//