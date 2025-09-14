<h5>REPORTE FUNCIONARIOS</h5>
<hr>
<div class="container mt-3">
  <!-- <h2>Filterable Table</h2>
  <p>Type something in the input field to search the table for first names, 
  last names or emails:</p>   -->
  <div class="row">
    <div class="col-md-6 mb-2">
      <label class="label-form" for="madre_padre">MES DE CUMPLEAÑOS <span style="color: red;">*</span></label>
      <select class="form-control input-form color-t border-required" id="mes_cumple" placeholder='ARL...' required="">
        <option value="" selected disabled>Seleccione...</option>
        <option value="1">ENERO</option>
        <option value="2">FEBRERO</option>
        <option value="3">MARZO</option>
        <option value="4">ABRIL</option>
        <option value="5">MAYO</option>
        <option value="6">JUNIO</option>
        <option value="7">JULIO</option>
        <option value="8">AGOSTO</option>
        <option value="9">SEPTIEMBRE</option>
        <option value="10">OCTUBRE</option>
        <option value="11">NOVIEMBRE</option>
        <option value="12">DICIEMBRE</option>
      </select>
    </div>
    <div class="col-md-3">
      <!-- <label class="label-form" for="">Exportar</label><br> -->
      <button id="excel-btn" style="padding: 5px 15px; border: 1px solid #FFF; border-radius: 10px; background: #137005; color: #FFF; margin: 30px;"><b><i class="fa fa-file-excel-o" aria-hidden="true"></i> Excel</b></button>
    </div>
  </div>
  <br>
  <table class="table table-striped" id="tblCapacitaciones">
    <thead>
      <tr>
        <th colspan="8" style="text-align:center;background-color:#e6e6e6">FUNCIONARIOS</th>
      </tr>
      <tr>
        <th scope="col">Identificación</th>
        <th scope="col">Nombre</th>
        <th scope="col">Apellido</th>
        <th scope="col">Celular</th>
        <th scope="col">Dirección</th>
        <th scope="col">Fecha de nacimiento</th>
        <th scope="col"></th>
      </tr>

    </thead>
    <tbody>
    </tbody>
  </table>
</div>
</div>
<script type="text/javascript" src="views/js/administrador/datos/consultarfuncionarios.js"></script>