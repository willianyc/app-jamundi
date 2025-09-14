<h5>CONSULTAR ENTREGA DEL CARGO</h5>
<hr>
<div class="container mt-3">
  <!-- <h2>Filterable Table</h2>
  <p>Type something in the input field to search the table for first names, 
  last names or emails:</p>   -->
  <div class="row">
    <div class="col-md-12 row">
      <div class="col-md-6">
        <input class="form-control input-form color-t" id="filterFuncionario" type="text" placeholder="Buscar..">
      </div>
      <div class="col-md-6">
        <button class="btn btn-otros m-1" id="btnNuevo" style="float:right" type="button"> <i class="fa fa-plus"></i> NUEVO</button>
        <button class="btn btn-otros m-1" id="btnExcel" style="float:right" type="button"> <i class="fa fa-file-excel-o"></i> EXCEL</button>
        <button class="btn btn-otros m-1" id="btnPdf" style="float:right" type="button"> <i class="fa fa-file-pdf-o"></i> PDF</button>
        <button class="btn btn-otros m-1" id="btnBuscarAll" style="float:right" type="button"> <i class="fa fa-eye"></i> BUSCAR TODO</button>
      </div>
    </div>
  </div>
  <br>
  <table class="table table-striped" id="tblCapacitaciones">
    <thead>
      <tr>
        <th colspan="9" style="text-align:center;background-color:#e6e6e6">RETIRO DEL FUNCIONARIOS</th>
      </tr>
      <tr>
        <th scope="col">Número</th>
        <th scope="col">Identificación</th>
        <th scope="col">Nombre</th>
        <th scope="col">Apellido</th>
        <th scope="col">Celular</th>
        <th scope="col">Tipo de Retiro</th>
        <th scope="col">Estado</th>
        <th scope="col">Causa del Retiro</th>
        <th scope="col"></th>
      </tr>

    </thead>
    <tbody>
    </tbody>
  </table>
</div>
</div>
<script type="text/javascript" src="views/js/administrador/datos/consultarretiro.js"></script>