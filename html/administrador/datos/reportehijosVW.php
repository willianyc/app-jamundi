<script type="text/javascript" src="views/js/generics/alertMessage.js"></script>
<script type="text/javascript" src="views/js/administrador/datos/reportehijos.js"></script>

<h5>REPORTE DE HIJOS</h5>
<hr>
<div class="container mt-3">
  <div class="row">
    <div class="form-row" id="MsjAJX"></div>
    <div class="col-md-3">
      <label for="fecha_nac" class="label-form">Edad Maxima<span style="color: red;">*</span></label>
      <input type="number" class="form-control input-form color-t disabled border-required" id="edad" required="">
      <div class="invalid-feedback">Debe seleccionar el campo.</div>
    </div>
    <div class="col-md-3 pl-0">
      <button type="button" id="btnBuscar" class="btn btn-otros"><i class="fa fa-eye"></i> BUSCAR</button>
    </div>
  </div>
  <br>
  <table class="table table-striped" id="tblHijos">
    <thead>
      <tr>
        <th colspan="8" style="text-align:center;background-color:#e6e6e6">HIJOS</th>
      </tr>
      <tr>
        <th scope="col">Funcionario</th>
        <th scope="col">Nombre</th>
        <th scope="col">Fecha Nacimiento</th>
        <th scope="col">Edad</th>
      </tr>
    </thead>
    <tbody>
    </tbody>
  </table>
  <div class="col-md-2">
    <button id="excel-btn" style="padding: 5px 15px; border: 1px solid #FFF; border-radius: 10px; background: #137005; color: #FFF;"><b><i class="fa fa-file-excel-o" aria-hidden="true"></i> Excel</b></button>
  </div>
</div>