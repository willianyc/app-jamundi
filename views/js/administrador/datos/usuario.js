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
//