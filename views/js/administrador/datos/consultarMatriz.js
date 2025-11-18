$(document).ready(function () {
    
    $("#filterTable").on("keyup", function () {
      var value = $(this).val().toLowerCase();
      $("#tblMatriz tbody tr").filter(function () {
        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
      });
    });
    
    $("#filterTable").on("keypress", function (e) {
      var identificacion = $(this).val();
      var keycode = e.keyCode ? e.keyCode : e.which;
      if (keycode == "13") {
        getMatriz(identificacion);
      }
    });
    
    $("#btnNuevo").click(function () {
      location.href = "?view=matrizCumplimiento&mode=crear";
    });

    //Majjul 
    $("#btnExcel").click(function () {
      loadReporteEcxel();
    });

    //Majjul
    $("#btnPdf").click(function () {
      loadReportePDF();
    });
    
    $("#btnBuscarAll").click(function () {
      $(this).html(`<i class="fa fa-eye"></i> BUSCANDO Datos...`);
      getMatriz();
    });
    
    $(".procesos").hide();
    
  });
  
  function getMatriz(matriz = null) {
    $.post("ajaxGeneral.php?mode=getMatriz", {
      matriz: matriz,
    })
      .done(function (data) {
        if (data.trim() !== "") {
          // data.replace("getFuncionario", 'ss')
          data = JSON.parse(data);
          if (data.error != undefined) {
            alertError(data.error);
            return;
          }
          $(".procesos").show();
          var tr = "";
          var colorEstado;
          var colorSemaforo = "silver";
          var numAbiertos = 0;
          var numCerrados = 0;
          var numEnProcesos = 0;
            
          $(data).each(function () {
            if(this.estado == "ABIERTO")  {
              colorEstado = "red";   
              numAbiertos += 1;        
            }
            else if(this.estado == "CERRADO"){
              colorEstado = "green";   
              numCerrados += 1;        
            }
            else if(this.estado == "EN PROCESO"){
              colorEstado = "orange";   
              numEnProcesos += 1;        
            }
            
            tr += 
            `<tr>
               <input type="hidden" name="id_matriz" value='" $this.id_matriz}"'>
               <td name="lugar">${this.is_entidad == "1" ? this.nom_sede : this.lugar}</td>
               <td name="fecha">${this.fecha}</td>
               <td name="origen_hallazgo">${this.origen_hallazgo}</td>
               <td name="tipo_accion">${this.tipo_accion}</td>
               <td name="responsable">${this.responsable}</td>
               <td name="semaforo">
                  <i class="fa fa-circle-o" aria-hidden="true" style="color:${colorSemaforo}"></i>
               </td>
               <td name="estado" style="color:${colorEstado}">
                 ${this.estado == undefined ? "" : this.estado}
              </td>
              <td>
                <a href="?view=matrizCumplimiento&mode=modificar&id_matriz=${this.id_matriz}">
                  <i class="fa fa-eye"></i>
                </a>
              </td>

            </tr>`;
              
          });
          console.log(numAbiertos, numCerrados,  numEnProcesos);
          $("#numAbiertos").val(numAbiertos);
          $("#numCerrados").val(numCerrados);
          $("#numEnProcesos").val(numEnProcesos);
          $("#tblMatriz tbody").html(tr);
          if (data.length > 0) $("#filterTable").show();
        }
      })
      .always(function () {
        $("#btnBuscarAll").html(`<i class="fa fa-eye"></i> BUSCAR TODO`);
      });
  }
  
  // Majjul
  function loadReportePDF(){
    ancho = 815;
    alto = 460;
    barra = 0;
    izquierda = (screen.width) ? (screen.width-ancho)/2 : 100;
    arriba = (screen.height) ? (screen.height-alto)/2 : 100;
    opciones = 'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars='+barra+',resizable=0,width='+ancho+',height='+alto+',left='+izquierda+',top='+ arriba;
    newwindow = window.open("?view=reportes&mode=consultarmatrizpdf", 'popUp', opciones)
    if (newwindow == null) {
      alert('Configure el navegador para que permita las ventanas emergentes en esta pagina');
    } else {
      newwindow.creator = self
    }
  }

  // Majjul
  function loadReporteEcxel() {
    newwindow = window.open("?view=reportes&mode=consultamatrizexcel", "width=815,height=460")
    if (newwindow == null) {
      alert('Configure el navegador para que permita las ventanas emergentes en esta pagina');
    } else {
      newwindow.creator = self
    }
  }//