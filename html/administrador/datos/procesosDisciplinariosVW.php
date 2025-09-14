<div class="form-row" id="MsjAJX"></div>
<h5>APLICAR PROCESO DISCIPLINARIO</h5>
<hr>
<div class="row">
  <div class="col-md-12 mb-2">
    <button class="btn color-button" id="btnMakeSaldoinicla" style="float:right" type="button"> <i class="fa fa-save"></i> GUARDAR</button>
  </div>
  <div class="col-md-3 mb-2">
    <label class="label-form" for="tipo_documento">Tipo de proceso</label>
    <select class="form-control input-form color-t border-required" id="tipo_proceso" placeholder='Tipo de proceso...' required="">
      <option value="" selected disabled>Seleccione...</option>
      <option value="MEMORANDO">Memorando</option>
      <option value="OTROS">Otros</option>
    </select>
    <div class="invalid-feedback">
      Debe seleccionar el Tipo de proceso
    </div>
  </div>
  <div class="col-md-3">
    <label class="label-form">Empleado</label>
    <!-- <div class="input-group inputgroup-searchtbl"> -->
    <input type="search" class="form-control input-form border-required color-t" name="ciiu" id="ciiu" placeholder="Buscar empleado...">
    <!-- <span class="input-group-text bg-white span-search" data-toggle="tooltip" data-placement="top" data-original-title="" title="">
        <i class="fa fa-search icon-autocom"></i>
      </span> -->
    <!-- </div> -->
  </div>
  <div class="col-md-3">
    <label for="fecha_nac" class="label-form">Fecha de creación</label>
    <input type="date" class="form-control input-form color-t disabled border-required" id="fecha_nac" required="">
    <div class="invalid-feedback">Debe seleccionar la fecha.</div>
  </div>
  <div class="col-md-3">
    <label class="label-form">Otro</label>
    <!-- <div class="input-group inputgroup-searchtbl"> -->
    <input type="search" class="form-control input-form border-required color-t" name="ciiu" id="ciiu" placeholder="Otro...">
    <!-- <span class="input-group-text bg-white span-search" data-toggle="tooltip" data-placement="top" data-original-title="" title="">
        <i class="fa fa-search icon-autocom"></i>
      </span> -->
    <!-- </div> -->
  </div>
  <div class="col-md-6">
    <label class="label-form" for="descripcion">Motivo</label>
    <textarea class="form-control input-form color-t" id="descripcion" placeholder="Ingrese el motivo..." name="descripcion" maxlength="250"></textarea>
    <!-- <input type="textarea" class="form-control input-form color-t border-required" id="numero" name="numero" placeholder="Descripcion..." maxlength="20" value="" required=""> -->
    <div class="invalid-feedback">
      Digite la descripcion
    </div>
  </div>
</div>