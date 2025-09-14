<!-- <script type="text/javascript" src="views/js/generics/message.js"></script>
<script type="text/javascript" src="views/js/generics/autocom.js"></script> -->
<script type="text/javascript" src="views/js/generics/alertMessage.js"></script>
<script type="text/javascript" src="views/js/administrador/datos/seguridadSocial.js"></script>

<h5>ASIGNAR SEGURIDAD SOCIAL</h5>
<hr>
<div class="row">
  <div class="form-row" id="MsjAJX"></div>
  <div class="col-md-6 mb-2"></div>
  <div class="col-md-6 mb-2" id="btn-2"></div>
  <form action="" class="mb-3">
    <div class="col-md-12 mb-2">
      <h6 class="submenus">Datos del funcionario</h6>
      <input type="hidden" id="id_funcionario">
      <div class="secciones">
        <div class="row padding-secciones">
          <div class="row">
            <div class="col-md-6 mb-2">
              <label class="label-form">Busque el funcionario</label>
              <input type="number" class="form-control input-form border-required color-t" tblfuncionarios name="identificacion" id="identificacion" placeholder="Identificación...">
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
              <label class="label-form">Cargo a desempeñar</label>
              <input type="text" class="form-control input-form border-required color-t" disabled name="cargo" id="cargo" placeholder="Cargo a desempeñar...">
            </div>
            <div class="col-md-6 mb-2">
              <label class="label-form">Salario</label>
              <input type="text" class="form-control input-form border-required color-t" name="salario" id="salario" placeholder="Salario...">
            </div>
          </div>
        </div>
      </div>
    </div>
    <div id ="asignacionseguridad" style="display:none" class="col-md-12 mb-2">
      <h6 class="submenus">Asignación de seguridad social</h6>
      <div id="seguridad_social">
        <div class="secciones seguridad_social">
          <input type="hidden" class="id_seguridadsocial">
          <div class="row padding-secciones">
            <div class="row">
              <div class="col-md-6 mb-2">
                <label class="label-form" for="entidad_salud">Entidad Promotora de Salud <span style="color: red;">*</span></label>
                <select id="eps" class="form-control input-form color-t border-required entidad_salud">
                  <option value="" selected disabled>Seleccione...</option>
                  <!-- <option value="MEMORANDO">Memorando</option>
                <option value="OTROS">Otros</option> -->
                </select>
                <div class="invalid-feedback">
                  Debe seleccionar la Entidad de salud
                </div>
              </div>
              <div class="col-md-6 mb-2">
                <label class="label-form" for="administradora_pension">Entidad Administradora de Fondo de Pensión <span style="color: red;">*</span></label>
                <select id="pension" class="form-control input-form color-t border-required administradora_pension">
                  <option value="" selected disabled>Seleccione...</option>
                  <!-- <option value="MEMORANDO">Memorando</option>
                <option value="OTROS">Otros</option> -->
                </select>
                <div class="invalid-feedback">
                  Debe seleccionar la Administradora de pensión
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6 mb-2">
                <label class="label-form" for="fondo_cesantias">Fondo de Cesantías <span style="color: red;">*</span></label>
                <select id="cesantias" class="form-control input-form color-t border-required fondo_cesantias" tblfuncionarios>
                  <option value="" selected disabled>Seleccione...</option>
                  <!-- <option value="MEMORANDO">Memorando</option>
                <option value="OTROS">Otros</option> -->
                </select>
                <div class="invalid-feedback">
                  Debe seleccionar el Fondo de cesantías
                </div>
              </div>
              <div class="col-md-6 mb-2">
                <label class="label-form" for="arl">Administradora de Riesgos Laborales <span style="color: red;">*</span></label>
                <select id="arl" class="form-control input-form color-t border-required arl" tblfuncionarios>
                  <option value="" selected disabled>Seleccione...</option>
                  <!-- <option value="MEMORANDO">Memorando</option>
                <option value="OTROS">Otros</option> -->
                </select>
                <div class="invalid-feedback">
                  Debe seleccionar la Arl
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6 mb-2">
                <label class="label-form" for="caja_compensacion">Caja de Compensación Familiar <span style="color: red;">*</span></label>
                <select id="cajacompensacion" class="form-control input-form color-t border-required caja_compensacion" tblfuncionarios>
                  <option value="" selected disabled>Seleccione...</option>
                  <!-- <option value="MEMORANDO">Memorando</option>
                <option value="OTROS">Otros</option> -->
                </select>
                <div class="invalid-feedback">
                  Debe seleccionar la Caja de compensación
                </div>
              </div>
              <div class="col-md-6 mb-2">
                <label for="fecha_registro" class="label-form">Fecha de retiro de seguridad social</label>
                <input type="date" id="fecharetiro" class="form-control input-form color-t disabled border-required fecha_registro">
                <div class="invalid-feedback">Debe seleccionar la fecha.</div>
              </div>
            </div>
          </div>
          <div class="col-md-12 mb-5 mt-1" style="flex-direction: row-reverse" id="btns">
            <button class="btn color-button btnMakeSaldoinicla" style="float:right; margin: 0 15px;" type="button"> <i class="fa fa-save"></i> GUARDAR</button>
            <button class="btn color-button " id="btnIrAtras" style="float:right" type="button"> <i class="fa fa-save"></i> IR ATRAS</button>
          </div>
        </div>
      </div>
    </div><br>
    <div id="histori d-none"></div>
    <div class="col-md-12 mb-5 mt-1" style="flex-direction: row-reverse" id="btn_2">
    </div>
  </form>