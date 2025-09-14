<?php
/*
* 
*/

?>
<script type="text/javascript" src="views/js/jquery/custom/jquery-ui.min.js"></script>
<link rel="stylesheet" href="views/js/jquery/custom/css/jquery-ui.min.css">
</link>
<link rel="stylesheet" href="views/fonts/font-awesome/css/font-awesome.min.css">
</link>
<script type="text/javascript" src="views/js/generics/message.js"></script>
<script type="text/javascript" src="views/js/generics/autocom.js"></script>
<script type="text/javascript" src="views/js/administrador/datos/tercerosCrear.js"></script>

<div class="container-fluid position-cont color-form">
  <div class="form-row" id="MsjAJX"></div>
  <div id="Nit" style="display: none;">
    <div class="" id="MsjAJX"> </div>
    <div id="collapseCero" class="collapse show" aria-labelledby="headingCero" data-parent="#accordion">
      <div class="form-row">
        <div class="col-md-2">
          <label class="input-radio" for="nit">Nit</label>
          <input type="number" class="form-control input-form color-t border-required" id="nit" name="nit" placeholder="Nit..." maxlength="10" value="" required="">
          <div class="invalid-feedback">
            Debe escribir el Nit
          </div>
        </div>
        <div class="col-md-2">
          <label class="input-radio" for="digito_verificacion">D. Verificación</label>
          <input type="number" class="form-control input-form color-t border-required" id="digito_verificacion" name="digito_verificacion" placeholder="D. Verificación..." maxlength="10" value="" required="">
          <div class="invalid-feedback">
            Debe escribir el Digito de Verificacion
          </div>
        </div>
      </div><br>
      <div class="form-row">
        <div class="col-md-6">
          <label class="input-radio" for="razon_social">Nombre</label>
          <input type="text" class="form-control input-form color-t border-required" id="razon_social" name="razon_social" placeholder="Nombre..." maxlength="50" value="" required="">
          <div class="invalid-feedback">
            Debe escribir el Nombre
          </div>
        </div>
        <div class="col-md-3">
          <label class="input-radio" for="direccion_principal">Dirección</label>
          <input type="text" class="form-control input-form color-t border-required" id="direccion_principal" name="direccion_principal" placeholder="Dirección..." maxlength="30" value="" required="">
          <div class="invalid-feedback">
            Debe escribir la Dirección
          </div>
        </div>
        <div class="col-md-3">
          <label class="input-radio" for="persona_contacto">Contacto</label>
          <input type="text" class="form-control input-form color-t border-required" id="persona_contacto" name="persona_contacto" placeholder="Contacto..." maxlength="30" value="" required="">
          <div class="invalid-feedback">
            Debe escribir La persona de contacto
          </div>
        </div>
      </div><br>
      <div class="form-row">
        <div class="col-md-2">
          <input type="hidden" id="id_pais_empresa">
          <label class="input-radio" for="id_pais">País</label>
          <select class="form-control input-form color-t border-required" id="id_pais" placeholder='País...' required="">
          </select>
          <div class="invalid-feedback">
            Debe escribir el Codigo del País
          </div>
        </div>
        <div class="col-md-2">
          <input type="hidden" id="id_departamento_empresa">
          <label class="input-radio" for="id_departamento">Departamento</label>
          <select class="form-control input-form color-t" id="id_departamento" placeholder='Departamento...'>
            <option value="" selected>Departamento...</option>
          </select>
          <div class="invalid-feedback">
            Debe escribir el Codigo de la Departamento
          </div>
        </div>
        <div class="col-md-2">
          <input type="hidden" id="id_ciudad_empresa">
          <label class="input-radio" for="id_departamento">Ciudad</label>
          <select class="form-control input-form color-t" id="id_ciudad" placeholder='Ciudad...'>
            <option value="" selected>Ciudad...</option>
          </select>
          <div class="invalid-feedback">
            Debe escribir el Codigo del Ciudad
          </div>
        </div>
        <div class="col-md-3">
          <label class="input-radio" for="correo2">Correo</label>
          <input type="text" class="form-control input-form color-t border-required" id="correo2" name="correo" placeholder="Correo..." maxlength="30" value="" required="">
          <div class="invalid-feedback">
            Debe escribir el Correo
          </div>
        </div>
        <div class="col-md-3">
          <label class="input-radio" for="fax">Fax</label>
          <input type="text" class="form-control input-form color-t" id="fax" name="fax" placeholder="Fax..." maxlength="30" value="">
          <div class="invalid-feedback">
            Debe escribir el Fax
          </div>
        </div>
      </div><br>
      <div class="form-row">
        <div class="col-md-3">
          <label class="input-radio" for="celular">Celular</label>
          <input type="text" class="form-control input-form color-t border-required" id="celular" name="celular" placeholder="Celular..." maxlength="10" value="" required="">
          <div class="invalid-feedback">
            Debe escribir el Celular
          </div>
        </div>
        <div class="col-md-3">
          <label class="input-radio" for="tel1">Telefono 1</label>
          <input type="text" class="form-control input-form color-t" id="tel1" name="tel1" placeholder="Telefono 1..." maxlength="10" value="">
          <div class="invalid-feedback">
            Debe escribir el Telefono 1
          </div>
        </div>
        <div class="col-md-3">
          <label class="input-radio" for="tel2">Telefono 2</label>
          <input type="text" class="form-control input-form color-t" id="tel2" name="tel2" placeholder="Telefono 2..." maxlength="10" value="">
          <div class="invalid-feedback">
            Debe escribir el Telefono 2
          </div>
        </div>
        <div class="col-md-3">
          <label class="input-radio" for="tel3">Telefono 3</label>
          <input type="text" class="form-control input-form color-t" id="tel3" name="tel3" placeholder="Telefono 3..." maxlength="10" value="">
          <div class="invalid-feedback">
            Debe escribir el Telefono 3
          </div>
        </div>
      </div><br>
      <div class="form-row">
        <div class="col-md-3">
          <label class="input-radio" for="ciiu">Ciiu</label>
          <input type="text" class="form-control input-form color-t border-required" id="ciiu" name="ciiu" placeholder="Ciiu..." maxlength="4" value="" required="">
          <div class="invalid-feedback">
            Debe escribir el Ciiu
          </div>
        </div>
        <div class="col-md-4">
          <label class="input-radio" for="fecha_crea">Fecha de creación</label>
          <div class="input-group">
            <input type="text" class="form-control input-form color-t datepick disabled height border-required" id="fecha_crea" placeholder="Fecha de creación" maxlength="10" minlength="10" required="">
            <div class="invalid-feedback">Debe seleccionar la fecha.</div>
          </div>
        </div>
        <div class="col-md-4">
          <label class="input-radio" for="archivo_rut_empresa" style="margin-right: 5%;">Escoja el Rut</label>
          <a id="descargar_rut_empr" download>Descargar Rut</a>
          <div class="custom-file">
            <div class="custom-file">
              <input id="archivo_rut_empresa" type="file" class="custom-file-input form-control height" accept="image/*">
              <label for="archivo_rut" class="custom-file-label input-form color-t  height">Escoja el Rut...</label>
              <div class="invalid-feedback">Debe adjuntar el Rut</div>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12 my-3 d-flex justify-content-center">
          <input type="hidden" id="action_emp" value="crear">
          <button class="btn  color-button" id="btnMakeTercero2" type="button">GUARDAR</button>
        </div>
      </div>
    </div>
  </div>
  <!-- </div>  -->
  </form>
  <!-- </div> -->
</div>
</div>
</div>


</body>

</html>