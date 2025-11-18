$(document).ready(function () {
    // $('#grupoObjetivo').selectpicker();
    getFuncionarioAll();
    selectCargo()
    getConsecutivo("capacitaciones_programadas")
    $(document).on("click", "#btnGuardar", function () {
      var frm = $(this).parents("form:first").addClass("was-validated");
      invalid = $(frm).find(".form-control:invalid").length;
      // Se continua al siguiente paso si el formulario no tiene datos invalidos
      if (invalid == 0) {
        $(this).html("Creando...").prop("disabled", true);
        guardarActividad();
      }
    });
    $("#divAsignacionFuncionarios").hide();
    $(document).on("click", "input[name=selectedAll]", function () {
      if ($(this).is(":checked")) {
        $("input[name=selected]").prop("checked", true);
      } else {
        $("input[name=selected]").prop("checked", false);
      }
    });
    $(document).on("change", "#recursos", function () {
      // Majull
      let div = $("#divRecursos");
      if ($(this).val() =="FINANCIERO" || $(this).val() =="AMBOS"){
        $("#divValorTotal").show();
        // Majull
        div.removeClass('col-md-6');
        div.addClass('col-md-3');
      } else {
        $("#divValorTotal").hide();
        // Majull
        div.removeClass('col-md-3');
        div.addClass('col-md-6');
      }
    });
    $(document).on('changed.bs.select','#grupoObjetivo', function (e, clickedIndex, isSelected, previousValue) {
      getFuncionarioAllFilter()
    });
    $(document).on("click", "button[name=limpiarFiltros]", function () {
      $("#tbl_funcionarios thead input[type=text]").val("");
	getFuncionarioAll();
    });
    $(document).on("click", "#btnNuevo", function () {
      $("#identificacionActividad").val("").prop("disabled", false);
      $("#nombreActividad").val("").prop("disabled", false);
      $("#btnBuscar").prop("disabled", false);
      $("#tblAsignarFuncionarios tbody tr").remove();
      $("input[name=selectedAll]").prop("checked", false);
      $("input[name=selected]").prop("checked", false);
    });
    $(document).on("click", "button[name=mdlAceptar]", function () {
      $("#tblAsignarFuncionarios tbody tr").remove();
      $("input[name=selected]:checked").each(function () {
        var documento = $(this).parents("tr").find("td[name=documento]").text();
        var cargo = $(this).parents("tr").find("td[name=cargo]").text();
        var sede = $(this).parents("tr").find("td[name=sede]").text();
        var codigo = $(this).parents("tr").find("td[name=codigo]").text();
        var id_funcionario = $(this)
          .parents("tr")
          .find("input[name=id_funcionario]")
          .val();
        var nombre = $(this).parents("tr").find("input[name=nombres]").val();
        var apellidos = $(this).parents("tr").find("input[name=apellidos]").val();
        var direccion = $(this).parents("tr").find("input[name=direccion]").val();
        var email = $(this).parents("tr").find("input[name=email]").val();
        var tr = `<tr>
          <input type="hidden" name="id_funcionario" value=${id_funcionario}>
          <td>${documento == "null" ? "":documento}</td>
          <td>${nombre == "null" ? "":nombre}</td>
          <td>${apellidos == "null" ? "":apellidos}</td>
	    <!-- Majjul -->
	    <!--
          <td>${direccion == "null" ? "":direccion}</td>
          -->
	    <td>${email == "null" ? "":email}</td>
	    <!--
          <td>${codigo == "null" ? "":codigo}</td>
	    -->
          <td>${cargo == "null" ? "":cargo}</td>
          <td>${sede == "null" ? "":sede}</td>
          </tr>`;
        $("#tblAsignarFuncionarios tbody").append(tr);
      });
    });
    // Majjul
    // $(document).on(
    //  "keypress",
    //  "#tbl_funcionarios thead input[type=text]",
    //  function (e) {
    //    var keycode = e.keyCode ? e.keyCode : e.which;
    //    if (keycode == "13") {
    //      getFuncionarioAllFilter();
    //    }
    //  }
    // );
    //Majjul
	document.addEventListener("keyup", e => {
        if(e.target.matches("#searchByIdentification")){
          hiddenShowDataFilter(e);
        }
        if(e.target.matches("#searchByCode")){
	        hiddenShowDataFilter(e);
        }
        if(e.target.matches("#searchByPosition")){
	        hiddenShowDataFilter(e);
        }
        if(e.target.matches("#searchByCampus")){
	        hiddenShowDataFilter(e);
        }
	      if(e.target.matches("#searchByName")){
	        hiddenShowDataFilter(e);
        }
        if(e.target.matches("#searchByLastName")){
	        hiddenShowDataFilter(e);
	      }
      });
  });
  
  function guardarActividad() {
    let funcionariosAsignados = [];
    let arrayGrupoObjetivo = [];
    let grupoObjetivo = $("#grupoObjetivo").val();
    $("#tblAsignarFuncionarios tbody tr").each(function () {
      fila = {
        id_funcionario:
          $(this).find("input[name=id_funcionario]").val() == ""
            ? ""
            : $(this).find("input[name=id_funcionario]").val(),
      };
      funcionariosAsignados.push(fila);
    });
    $(grupoObjetivo).each(function(){
      fila = {
        id_cargo: this[0]
      }
      arrayGrupoObjetivo.push(fila);
    })
    data = {
      identificacion: $("#identificacion").val(),
      consecutivo: $("#identificacion").attr("consecutivo"),
      nombre: $("#nombre").val(),
      fecha_inicio: $("#fecha_inicio").val(),
      fecha_finalizacion: $("#fecha_finalizacion").val(),
      modalidad: $("#modalidad").val(),
      direccion: $("#direccion").val(),
      recursos: $("#recursos").val(),
      valorTotal: $("#valorTotal").val(),
      entidad: $("#entidad").val(),
      archivo: $("#archivo").val(),
      fecha_asignacion: $("#fecha_asignacion").val(),
      calificacion: $("input[name=calificacion]:checked").val(),
      gruposObjetivo: arrayGrupoObjetivo,
      funcionariosAsignados: funcionariosAsignados,
    };
    $.post("set/capacitacionesProgramadas/crear", {
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
  
  function getFuncionarioAll() {
    $.post("ajaxGeneral.php?mode=funcionariosAll")
      .done(function (data) {
        if (data.trim() !== "") {
          // data.replace("getFuncionario", 'ss')
          data = JSON.parse(data);
          if (data.error != undefined) {
            alertError(data.error);
            return;
          }
          var tr = "";
          $(data).each(function () {
            tr += `<tr class="element-data-filter">
                  <th scope="row"><input type="checkbox" name="selected"></th>
                  <input type="hidden" name="id_funcionario" value="${this.id_funcionario}">
                  <input type="hidden" name="nombres" value="${this.nombre}">
                  <input type="hidden" name="apellidos" value="${this.apellidos}">
                  <input type="hidden" name="direccion" value="${this.direccion}">
                  <input type="hidden" name="email" value="${this.email}">
                  <input type="hidden" name="tipo_vinculacion" value="${this.tipo_vinculacion}">
                  <input type="hidden" name="nivel" value="${this.nivel}">
                  <td name="documento">${this.documento}</td>
			        <!--Majjul -->
			            <td name="nombre">${this.nombre}</td>
			            <td name="apellidos">${this.apellidos}</td>
                  <td name="codigo">${this.codigo}</td>
                  <td name="cargo">${this.cargo}</td>
                  <td name="sede">${this.sede}</td>
                </tr>`;
          });
          $("#tbl_funcionarios tbody").html(tr);
        }
      })
      .always(function () {
        $("#btnBuscar")
          .html('<i class="fa fa-eye"></i> BUSCAR')
          .prop("disabled", false)
          .parents("form:first")
          .removeClass("was-validated");
      });
  }
  function selectCargo() {
    $.post('ajaxGeneral.php?mode=cargo')
      .done(function (data) {
        if (data.trim() !== '') {
          data = JSON.parse(data);
          if (data.error != undefined) {
            // objMsjAJX.showError(data.error)
            return
          }
          // options = '<option selected>Seleccione...</option>';
          options = '';
          $(data).each(function () {
            options += '<option value="' + this.id_cargo + '" cargo="' + this.cargo + '">' + this.cargo + '</option>'
          })
  
          $('#grupoObjetivo').html(options)
          $('#grupoObjetivo').selectpicker('refresh')
          $('div.filter-option-inner-inner').html("Seleccione el cargo")
        }
      })
  }
  function getFuncionarioAllFilter() {
    let arrayGrupoObjetivo = [];
    let grupoObjetivo = $("#grupoObjetivo").val();
    $(grupoObjetivo).each(function(){
      fila = {
        id_cargo: this[0]
      }
      arrayGrupoObjetivo.push(fila);
    })
    $.post("ajaxGeneral.php?mode=funcionariosAllFilter", {
      documento: $("#documento").val(),
      sede: $("#sede").val(),
      cargo: $("#cargo").val(),
      codigo: $("#codigo").val(),
      grupoObjetivo: arrayGrupoObjetivo,
    })
      .done(function (data) {
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
                <th scope="row"><input type="checkbox" name="selected"></th>
                <input type="hidden" name="id_funcionario" value="${this.id_funcionario}">
                <input type="hidden" name="nombres" value="${this.nombre}">
                <input type="hidden" name="apellidos" value="${this.apellidos}">
                <input type="hidden" name="direccion" value="${this.direccion}">
                <input type="hidden" name="email" value="${this.email}">
                <input type="hidden" name="tipo_vinculacion" value="${this.tipo_vinculacion}">
                <input type="hidden" name="nivel" value="${this.nivel}">
                <td name="documento">${this.documento}</td>
                <td name="codigo">${this.codigo}</td>
                <td name="cargo">${this.cargo}</td>
                <td name="sede">${this.sede}</td>
              </tr>`;
          });
          $("#tbl_funcionarios tbody").html(tr);
        }
      })
      .always(function () {
        $("#btnBuscar")
          .html('<i class="fa fa-eye"></i> BUSCAR')
          .prop("disabled", false)
          .parents("form:first")
          .removeClass("was-validated");
      });
  }

function hiddenShowDataFilter(event){
    document.querySelectorAll(".element-data-filter").forEach(elements => {
      elements.textContent.toLowerCase().includes(event.target.value.toLowerCase())
      ?elements.classList.remove("d-none")
      :elements.classList.add("d-none")	
    });
  }
  //