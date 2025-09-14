<h5>Movilidad</h5>
<hr>
<div class="row">
  <div class="form-row" id="MsjAJX"></div>
  <div class="col-md-12 mb-2">
    <h6 class="submenus">INFORMACIÓN DEL FUNCIONARIO</h6>
    <input type="hidden" id="id_funcionario">
    <div class="secciones">
      <div class="row padding-secciones">
        <div class="row">
          <div class="col-md-6 mb-2">
            <label class="label-form">Busque el funcionario</label>
            <input type="number" class="form-control input-form border-required color-t" required="" name="identificacion" id="identificacion" placeholder="Identificación...">
            <div class="invalid-feedback">Debe ingresar la identificación</div>
          </div>
          <div class="col-md-3 pl-0">
            <button type="button" id="btnBuscar" class="btn btn-otros"><i class="fa fa-eye"></i> BUSCAR</button>
          </div>
        </div>
        <div class="col-md-3 mb-2">
          <label class="label-form" for="nombres">Nombres</label>
          <input disabled type="text" class="form-control input-form color-t borderd-required" id="nombres" name="apellido_primer" maxlength="255" value="" required="" placeholder="Nombre">
          <div class="invalid-feedback">
            Debe escribir el Nombres
          </div>
        </div>
        <div class="col-md-3 mb-2">
          <label class="label-form" for="apellidos">Apellidos</label>
          <input disabled type="text" class="form-control input-form color-t border-required" id="apellidos" name="apellido_primer" maxlength="255" value="" required="" placeholder="Apellido">
          <div class="invalid-feedback">
            Debe escribir el Apellidos
          </div>
        </div>
        <div class="col-md-3 mb-2">
          <label class="label-form" for="vinculacion">Tipo de Vinculación</label>
          <input disabled type="text" class="form-control input-form color-t border-required" id="vinculacion" name="vinculacion" maxlength="255" value="" required="" placeholder="Tipo de Vinculación">
          <div class="invalid-feedback">
            Debe escribir el Apellidos
          </div>
        </div>
        <div class="col-md-3 mb-2">
          <label class="label-form" for="fecha_ingreso">Fecha de Ingreso</label>
          <input disabled type="date" class="form-control input-form color-t border-required" id="fecha_ingreso" name="fecha_ingreso" maxlength="255" value="" required="">
          <div class="invalid-feedback">
            Debe escribir el Apellidos
          </div>
        </div>
        <div class="col-md-3 mb-2">
          <label class="label-form" for="years">Año de Ingreso</label>
          <input disabled type="text" class="form-control input-form color-t border-required" id="years" name="years" maxlength="255" value="" required="" placeholder="Año">
          <div class="invalid-feedback">
            Debe escribir el Apellidos
          </div>
        </div>
        <div class="col-md-3 mb-2">
          <label class="label-form" for="cargo_propiedad">cargo en propiedad</label>
          <input disabled type="text" class="form-control input-form color-t border-required" id="cargo_propiedad" name="cargo_propiedad" maxlength="255" value="" required="" placeholder="Cargo en propiedad">
          <div class="invalid-feedback">
            Debe escribir el Apellidos
          </div>
        </div>
        <div class="col-md-3 mb-2">
          <label class="label-form" for="nivel">Nivel</label>
          <input disabled type="text" class="form-control input-form color-t border-required" id="nivel" name="nivel" maxlength="255" value="" required="" placeholder="Nivel">
          <div class="invalid-feedback">
            Debe escribir el Apellidos
          </div>
        </div>
        <div class="col-md-3 mb-2">
          <label class="label-form" for="codigo">Código</label>
          <input disabled type="text" class="form-control input-form color-t border-required" id="codigo" name="codigo" maxlength="255" value="" required="" placeholder="Código">
          <div class="invalid-feedback">
            Debe escribir el Apellidos
          </div>
        </div>
        <div class="col-md-3 mb-2">
          <label class="label-form" for="grado">Grado</label>
          <input disabled type="text" class="form-control input-form color-t border-required" id="grado" name="grado" maxlength="255" value="" required="" placeholder="Grado">
          <div class="invalid-feedback">
            Debe escribir el Apellidos
          </div>
        </div>
        <div class="col-md-3 mb-2">
          <label class="label-form" for="Dependencia">Dependencia</label>
          <input disabled type="text" class="form-control input-form color-t border-required" id="Dependencia" name="Dependencia" maxlength="255" value="" required="" placeholder="Dependencia">
          <div class="invalid-feedback">
            Debe escribir el Apellidos
          </div>
        </div>
        <div class="col-md-3 mb-2">
          <label class="label-form" for="sede">Sede</label>
          <input disabled type="text" class="form-control input-form color-t border-required" id="sede" name="sede" maxlength="255" value="" required="" placeholder="Sede">
          <div class="invalid-feedback">
            Debe escribir el Apellidos
          </div>
        </div>
        <div class="col-md-3 mb-2">
          <label class="label-form" for="cargo">Cargo</label>
          <input disabled type="text" class="form-control input-form color-t border-required" id="cargo" name="cargo" maxlength="255" value="" required="" placeholder="Cargo">
          <div class="invalid-feedback">
            Debe escribir el Apellidos
          </div>
        </div>
        <div class="col-md-3">
          <label for="sexo" class="label-form">Tiene Procesos disciplinario</label>
          <div class="form-inline">
            <div class="custom-control custom-radio pr-3">
              <label class="custom-control-label label-form" for="si_procesos">Si</label>
              <input type="radio" class="custom-control-input" id="si_procesos" disabled name="procesos_disc" value="1" required="">
              <label class="custom-control-label label-form" for="no_procesos">No</label>
              <input type="radio" class="custom-control-input" id="no_procesos" disabled name="procesos_disc" value="0" required="">
            </div>
          </div><br>
        </div>
      </div>
    </div>
  </div>
  <div class="col-md-12 mb-2 d-none" id="ubicacion_lab">
    <h6 class="submenus">NUEVA UBICACIÓN LABORAL</h6>
    <div class="secciones pb-2" id="movilidades">
      <form action="" class="mb-3">
        <div class="campos_movilidad">
          <input type="hidden" class="id_movilidad" value="">
          <div class="row padding-secciones">
            <div class="col-md-3 mb-2">
              <label class="label-form" for="tipo_vinculacion">Tipo de vinculación <span style="color: red;">*</span></label>
              <select class="form-control input-form color-t border-required tipo_vinculacion" placeholder='' required="">
                <option value="" selected disabled>Seleccione...</option>
              </select>
              <div class="invalid-feedback">
                Debe seleccionar el Tipo de vinculación
              </div>
            </div>
            <div class="col-md-3">
              <label for="fecha_ingreso_sel" class="label-form">Fecha de Novedad <span style="color: red;">*</span></label>
              <input type="date" class="form-control input-form color-t disabled border-required fecha_ingreso_sel" required="">
              <div class="invalid-feedback">Debe seleccionar la fecha.</div>
            </div>
            <div class="col-md-3 mb-2">
              <label class="label-form" for="ingreso">Año de ingreso <span style="color: red;">*</span></label>
              <input type="text" class="form-control input-form color-t border-required ingreso year_ingreso" disabled name="ingreso" placeholder="Año de ingreso..." maxlength="255" value="" required="">
            </div>
            <div class="col-md-3 mb-2">
              <label class="label-form" for="nivel_select">Nivel <span style="color: red;">*</span></label>
              <select class="form-control input-form color-t border-required nivel_sel" placeholder='Nivel educativo...' required="">
                <option value="" selected disabled>Seleccione...</option>
              </select>
              <div class="invalid-feedback">
                Debe seleccionar el Nivel
              </div>
            </div>
            <div class="col-md-3 mb-2">
              <label class="label-form" for="cargo_propiedad_sel">Cargo en propiedad <span style="color: red;">*</span></label>
              <select class="form-control input-form color-t border-required cargo_propiedad_sel" placeholder='Cargo en propiedad educativo...' required="">
                <option value="" selected disabled>Seleccione...</option>
              </select>
              <div class="invalid-feedback">
                Debe seleccionar el Cargo en propiedad
              </div>
            </div>
            <div class="col-md-3 mb-2">
              <label class="label-form" for="codigo">Codigo <span style="color: red;">*</span></label>
              <select class="form-control input-form color-t border-required codigo_sel" placeholder='Cargo...' required="">
                <option value="" selected disabled>Seleccione...</option>
              </select>
              <div class="invalid-feedback">
                Debe seleccionar el Codigo
              </div>
            </div>
            <div class="col-md-3 mb-2">
              <label class="label-form" for="grado">Grado <span style="color: red;">*</span></label>
              <select class="form-control input-form color-t border-required grado_sel" placeholder='Cargo...' required="">
                <option value="" selected disabled>Seleccione...</option>
              </select>
              <div class="invalid-feedback">
                Debe seleccionar el grado
              </div>
            </div>
            <div class="col-md-3 mb-2">
              <label class="label-form" for="dependencia">Dependencia <span style="color: red;">*</span></label>
              <select class="form-control input-form color-t border-required dependencia_sel" placeholder='Cargo...' required="">
                <option value="" selected disabled>Seleccione...</option>
              </select>
              <div class="invalid-feedback">
                Debe seleccionar el Dependencia
              </div>
            </div>
            <div class="col-md-3 mb-2">
              <label class="label-form" for="sede">Sede <span style="color: red;">*</span></label>
              <select class="form-control input-form color-t border-required sede_sel" placeholder='Cargo...' required="">
                <option value="" selected disabled>Seleccione...</option>
              </select>
              <div class="invalid-feedback">
                Debe seleccionar el Sede
              </div>
            </div>
            <div class="col-md-3 mb-2">
              <label class="label-form" for="num_posesion">N° Acto Administrativo</label>
              <input type="text" class="form-control input-form color-t border-required num_posesion" name="num_posesion" placeholder="Posesión..." maxlength="255" value="">
              <div class="invalid-feedback">
              </div>
            </div>
            <div class="col-md-3 mb-2">
              <label class="label-form" for="fecha_resolucion">Fecha de Acto Administrativo <span style="color: red;">*</span></label>
              <input type="date" class="form-control input-form color-t border-required fecha_resolucion" name="fecha_resolucion" maxlength="255" value="">
              <div class="invalid-feedback">
                Este campo es obligatorio
              </div>
            </div>
            <div class="col-md-3 mb-2">
              <label class="label-form" for="num_resolucion">N° Acta de Posesión 2<span style="color: red;">*</span></label>
              <input type="text" class="form-control input-form color-t border-required num_resolucion" name="num_resolucion" placeholder="Resolución..." maxlength="255" value="" required="">
              <div class="invalid-feedback">
              </div>
            </div> 
            <div class="col-md-3 mb-2">
              <label class="label-form" for="fecha_posesion">Fecha de Posesión <span style="color: red;">*</span></label>
              <input type="date" class="form-control input-form color-t border-required fecha_posesion" name="fecha_posesion" placeholder="Ingrese el Cargo..." maxlength="255" value="">
              <div class="invalid-feedback">
                Este campo es obligatorio
              </div>
            </div>
            <div class="col-md-3 mb-2">
              <label class="label-form" for="fecha_fin">Fecha Finalización </label>
              <input type="date" class="form-control input-form color-t border-required fecha_fin" name="fecha_fin" maxlength="255" value="" placeholder="Fecha Final">
              <div class="invalid-feedback">
                Este campo es requerido
              </div>
            </div>
            <div class="col-md-3 mb-2">
              <label class="label-form" for="">Motivo <span style="color: red;">*</span></label>
              <select class="form-control input-form color-t border-required motivo" placeholder='Cargo...' required="">
                <option value="" selected disabled>Seleccione...</option>
                <option value="Encargo">Encargo</option>
                <option value="Reubicacion">Reubicacion</option>
                <option value="Comision">Comisión</option>
                <option value="Otro">Otro</option>
              </select>
              <div class="invalid-feedback">
                Debe seleccionar este campo
              </div>
            </div>
            <div class="col-md-3 d-none mb-2 cont_otro">
              <label class="label-form" for="">Cual? <span style="color: red;">*</span></label>
              <input type="text" class="form-control input-form color-t border-required otro" name="otro" placeholder="cual..." maxlength="255" value="">
            </div>
            <div class="col-md-3 mb-2">
              <label class="label-form" for="modo_trabajo">Modalidad de Trabajo <span style="color: red;">*</span></label>
              <select class="form-control input-form color-t border-required modo_trabajo" placeholder='Cargo...' required="">
                <option value="" selected disabled>Seleccione...</option>
                <option value="Presencial">Presencial</option>
                <option value="Teletrabajo">Teletrabajo</option>
                <option value="Alternancia">Alternancia</option>
              </select>
              <div class="invalid-feedback">
                Debe seleccionar este campo
              </div>
            </div>
            <div class="col-md-3 mb-2">
              <label class="label-form" for="salario">Salario <span style="color: red;">*</span></label>
              <input type="number" class="form-control input-form color-t border-required salario" name="salario" maxlength="255" value="" required="" placeholder="Salario">
              <div class="invalid-feedback">
                Este campo es requerido
              </div>
            </div>
            <div class="col-md-3 mb-2">
              <label class="label-form" for="funciones">Seleccione un archivo</label>
              <input type="file" class="form-control input-form color-t border-required archivo_lab" name="archivo_lab" maxlength="255" value="" ">
            <div class=" invalid-feedback">
              Este campo es obligatorio
            </div>
          </div>
          <div class="col-md-6 mb-2">
            <label class="label-form" for="funciones">Funciones <span style="color: red;">*</span></label>
            <textarea type="text" class="form-control input-form color-t border-required funciones" name="funciones" maxlength="255" value="" required="" placehold er="Funciones"></textarea>
            <div class="invalid-feedback">
              Este campo es requerido
            </div>
          </div>
        </div>
        <div class="col-md-12 mb-5 mt-3" style="flex-direction: row-reverse" id="btns">
          <button class="btn color-button btnMakeSaldoinicla" style="float:right" type="button"> <i class="fa fa-save"></i> GUARDAR</button>
        </div>
      </form>
    </div>
  </div>
  <div class="col-md-12 mb-5 mt-3" style="flex-direction: row-reverse" id="btn_2">
    <button class="btn color-button " id="btnIrAtras" style="float:right; margin: 0 15px;" type="button"> <i class="fa fa-save"></i> IR ATRAS</button>
  </div>
</div>
<script type="text/javascript" src="views/js/administrador/datos/movilidad.js"></script>