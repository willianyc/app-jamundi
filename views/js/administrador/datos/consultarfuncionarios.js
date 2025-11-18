var tabla = null;
$(document).ready(function () {
  // Automatically add a first row of data
  // tabla = $('#tblfuncionarios').DataTable(
  //   {
  //     "language":idioma
  //   }
  // );
  $('#addRow').click();
  
  $('#btnBuscarAll').on('click', function () {
    $("#filterFuncionario").val('')
    getFuncionarios()
    return
  })

  $("#filterFuncionario").on("keyup", function () {
    valor = $(this).val().toLowerCase()
    getFuncionarios(valor)
  });

  $(document).on("click", "#btnPdf", function () {
    loadReportePDF()
  });

  $(document).on("change", "#mes_cumple", function () {
    getFuncionarios(null, $(this).val())
  });

  $(document).on("click", "#btnExcel", function () {
    loadReporteEcxel()
  });

  $(document).on('click', '#btnNuevo', function () {
    location.href = "?view=hojavida&mode=crear";
  })

  $(document).on('click', '.delete_fun', function () {
    id_funcionario = $(this).parents('tr').find('input[name=id_funcionario]').val()
    deleteFuncionario(id_funcionario)
  })
  getFuncionarios();
});

function deleteFuncionario(id_funcionario) {
  $.post('set/hojavida/eliminar', {
      id_funcionario: id_funcionario
    })
    .done(function (data) {
      data = JSON.parse(data);
      if (data.error != undefined) {
        console.log(atob(data.error));
        alertError(btoa('Error al eliminar el funcionario'));
      } else
        alertSucces(data.success)
      $('#todos').trigger('click')
    })
}

function getFuncionarios(nombre = null, mes = null) {
  $.post('core/ajaxGeneral.php?mode=getFuncionario_2', {
      nombre: nombre,
      mes: mes
    })
    .done(function (data) {
      if (data.trim() !== '') {
        // data.replace("getFuncionario", 'ss')
        data = JSON.parse(data);
        if (data.error != undefined) {
          // alertError(data.error)
          
          $("#tblfuncionarios tbody").html('')
          return
        }
        var tr = ""
        num = 1;
        $(data).each(function () {
          documento = this.documento == undefined || this.documento == null ? '' : this.documento;
          nombres = this.nombre == undefined || this.nombre == null ? '' : this.nombre;
          apellidos = this.apellidos == undefined || null == this.apellidos ? '' : this.apellidos;
          nivel = this.nivel == undefined || this.nivel == null ? '' : this.nivel;
          cargos = this.cargo == undefined || this.cargo == null ? '' : this.cargo;
          dependencia = this.dependencia == undefined || this.dependencia == null ? '' : this.dependencia;
          sede = this.sede == undefined || this.sede == null ? '' : this.sede;
          
          
          tr += `<tr>
          <input type="hidden" name="id_funcionario" value='${this.id_funcionario}'>
          <td>${num}</td>
          <td name="identificacion">${documento}</td>
          <td name="nombre" style='fontsize:8px'><a href="?view=hojavida&mode=crear&id_funcionario=${this.id_funcionario}">
               ${nombres} ${apellidos}
             </a></td>
          <td name="celular">${nivel}</td>
          <td name="direccion">${cargos}</td>
          <td name="">${dependencia}</td>
          <td name="">${sede}</td>
          <td>
          <a href="?view=hojavida&mode=crear&id_funcionario=${this.id_funcionario}"><i class="fa fa-eye"></i></a>
          </td>
          </tr>`
          num++;
        });

        $("#tblfuncionarios tbody").html(tr);
        $("#tblfuncionarios tbody").css("font-size","12px")
        
      }
    })
}
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
function loadReporteEcxel() {
  var filtro = $("#filterFuncionario").val();
  // if (filtro != '' && filtro != null) {
  newwindow = window.open("?view=reportes&mode=reportefuncionarioexcel&filtro=" + filtro + "&todos=All", "width=815,height=460")
  if (newwindow == null) {
    alert('Configure el navegador para que permita las ventanas emergentes en esta pagina');
  } else {
    newwindow.creator = self
  }
}

function loadReportePDF() {
  var filtro = $("#filterFuncionario").val();
  newwindow = window.open("?view=reportes&mode=reportefuncionariopdf&filtro=" + filtro + "&todos=All", "width=815,height=460")
  if (newwindow == null) {
    alert('Configure el navegador para que permita las ventanas emergentes en esta pagina');
  } else {
    newwindow.creator = self
  }
}