$(document).ready(function () {
 $("#btnBuscar").on("click", function () {
    var fecha_ini = $('#fecha_ini').val();
    var fecha_fin = $('#fecha_fin').val();
    if (fecha_ini == null || fecha_ini == '' || fecha_fin == '' || fecha_fin == null) {
      alertError(btoa('Todos los campos son requeridos'));
      return
    }
    $('#MsjAJX').html('')
   ParticipacionesenActividedes()
    return
    });

$(document).on("click", "#excel-btn", function () {
    loadReporteEcxel();
    });

   $(document).on("click", "#btnPdf", function () {
     loadReportePDF()
    });



});

function ParticipacionesenActividedes() {
  var fecha_i = $("#fecha_ini").val();
  var fecha_f = $("#fecha_fin").val();
 $.post('ajaxGeneral.php?mode=ParticipacionesenActividades', {
      fecha_fin: fecha_f,
      fecha_ini: fecha_i
    }).done(function (data) {
    if (data.trim() !== "") {
      // data.replace("getFuncionario", 'ss')
      data =JSON.parse(data);
      if (data.error != undefined) {
        alertError(data.error);
        return;
      }
      tr = "";
      cont = 0;
      $(data).each(function () {
        cont++;
        tr += `<tr>
       
        <td name="identificacion">${this.documento===null?"":this.documento}</td>
        <td name="nombre">${this.nombre===null?"":this.nombre} ${this.apellidos===null?"":this.apellidos}  </td>      
        <td name="participaciones">${this.cantidad===0?"No":"Si"}</td>
        
        </tr>`;
      });
      $("#tblRankinCapacitaciones tbody").html(tr);
    }
  });
}

function loadReporteEcxel() {
  //var filtro = $("#filterFuncionario").val();
  // if (filtro != '' && filtro != null) {
  var fecha_ini = $("#fecha_ini").val();
  var fecha_fin = $("#fecha_fin").val();
  if (fecha_ini != '' && fecha_fin != null) {
  newwindow = window.open("?view=reportes&mode=participacionActividedesexcel&fecha_ini=" + fecha_ini + "&fecha_fin=" + fecha_fin, "width=815,height=460")
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
    newwindow = window.open("?view=reportes&mode=reporteparticipacionenactividadespdf&fecha_ini=" + fecha_ini + "&fecha_fin=" + fecha_fin, 'popUp', opciones)
    if (newwindow == null) {
      alert('Configure el navegador para que permita las ventanas emergentes en esta pagina');
    } else {
      newwindow.creator = self
    }
  }
}
//