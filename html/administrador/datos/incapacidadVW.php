<!-- <script type="text/javascript" src="views/js/generics/autocom.js"></script> -->
<script type="text/javascript" src="views/js/generics/alertMessage.js"></script>
<script type="text/javascript" src="views/js/administrador/datos/incapacidad.js"></script>


<h5>INCAPACIDAD</h5>
<hr>
<div class="row">
  <div class="form-row" id="MsjAJX"></div>
  <div class="col-md-12 mb-2">
    <h6 class="submenus">Datos del funcionario</h6>
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
        <div class="row">
          <div class="col-md-6 mb-2">
            <label class="label-form">Funcionario</label>
            <input type="text" class="form-control input-form border-required color-t" disabled name="nombre" id="nombre" placeholder="Nombre del funcionario...">
          </div>
          <div class="col-md-6 mb-2">
            <label class="label-form">Identificaión</label>
            <input type="text" class="form-control input-form border-required color-t" disabled name="documento" id="documento" placeholder="Identificación...">
          </div>
          <div class="col-md-6 mb-2">
            <label class="label-form">Cargo</label>
            <input type="text" class="form-control input-form border-required color-t" disabled name="cargo" id="cargo" placeholder="Cargo a desempeñar...">
          </div>
          <div class="col-md-6 mb-2">
            <label class="label-form">Salario</label>
            <input type="text" class="form-control input-form border-required color-t" disabled name="salario" id="salario" placeholder="Salario...">
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="col-md-12 mb-2" style="display:none" id="datos_incapacidad">
    <h6 class="submenus">Datos de incapacidad</h6>
    <div id="incapacidades">
      <form action="" enctype="multipart/form-data" class="mb-3">
        <div class="incapacidades secciones pb-3">
          <div class="row padding-secciones">
            <input type="hidden" class="id_incapacidad">
            <div class="row">
              <div class="col-md-6 mb-2">
                <label class="label-form">Días de incapacidad <span style="color: red;">*</span></label>
                <input type="number" class="form-control input-form border-required color-t dias_incapacidad" required="" name="dias_incapacidad" placeholder="Días de incapacidad...">
                <div class="invalid-feedback">Debe ingresar los días de incapacidad</div>
              </div>
              <div class="col-md-6 mb-2">
                <label for="fecha_inicio" class="label-form">Fecha de inicio <span style="color: red;">*</span></label>
                <input type="date" id="fecha_inicio" class="form-control input-form color-t border-required fecha_inicio" required="">
                <div class="invalid-feedback">Debe seleccionar la fecha.</div>
              </div>
              <div class="col-md-6 mb-2">
                <label for="fecha_fin" class="label-form">Fecha final <span style="color: red;">*</span></label>
                <input type="date" class="form-control input-form color-t border-required fecha_fin" required="">
                <div class="invalid-feedback">Debe seleccionar la fecha.</div>
              </div>
              <div class="col-md-6 mb-2">
                <label class="label-form">Diagnóstico <span style="color: red;">*</span></label>
                <input type="text" class="form-control input-form border-required color-t diagnostico" name="diagnostico" required="" placeholder="Diagnóstico...">
                <div class="invalid-feedback">Debe ingresar el Diagnostico.</div>
              </div>
              <div class="col-md-6 mb-2">
                <label class="label-form" for="tipo_incapacidad">Tipo de incapacidad <span style="color: red;">*</span></label>
                <select class="form-control input-form color-t border-required tipo_incapacidad" required="">
                  <option value="" selected disabled>Seleccione...</option>
                  <option value="EG">EG</option>
                  <option value="AL">AL</option>
                  <option value="SOAT">SOAT</option>
                  <option value="LM">LM</option>
                  <option value="LP">LP</option>
                </select>
                <div class="invalid-feedback">
                  Debe seleccionar la Tipo de incapacidad
                </div>
              </div>
              <div class="col-md-6 mb-2">
                <label class="label-form">Adjuntar archivo <span style="color: red;">*</span></label>
                <input type="file" accept="application/pdf" class="form-control input-form border-required color-t archivo_incapacidad" name="archivo_incapacidad" required="" id="archivo_incapacidad" placeholder="Diagnóstico...">
                <div class="invalid-feedback">Debe ingresar el Diagnostico.</div>
              </div>
            </div>
          </div>
          <div class="col-md-12 mb-5 mt-1" style="flex-direction: row-reverse" id="btns">
            <button class="btn color-button btnMakeSaldoinicla" style="float:right; margin: 0 15px;" type="button"> <i class="fa fa-save"></i> GUARDAR</button>
          </div>
        </div>
    </div>
  </div>
  <div class="col-md-12 mb-5 mt-3" style="flex-direction: row-reverse" id="btn_2">
    <button class="btn color-button " id="btnIrAtras" style="float:right" type="button"> <i class="fa fa-save"></i> IR ATRAS</button>
  </div>
  </form>