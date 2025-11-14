
<div class="d-flex justify-content-between align-items-center mb-3">
  <h5 class="mb-0">FUNCIONARIO</h5>
  <button type="button" class="btn btn-secondary btn-sm" onclick="window.history.back();">
    <i class="fa fa-arrow-left"></i> Regresar
  </button>
</div>
<hr>
<div class="form-row" id="MsjAJX"></div><br>
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
        <!--<button class="btn btn-otros m-1" id="btnPdf" style="float:right" type="button"> <i class="fa fa-file-pdf-o"></i> PDF</button>  -->
        <button class="btn btn-otros m-1" id="btnBuscarAll" style="float:right" type="button"> <i class="fa fa-eye"></i> BUSCAR TODO</button>
      </div>
    </div>
  </div>
  <br>
  <style>
#tblCapacitaciones th, 
#tblCapacitaciones td {
  font-size: 12px;
  padding: 4px 6px;
}
</style>

  <table class="table table-striped" id="tblfuncionarios">
    <thead>
      <tr>
        <th colspan="9" style="text-align:center;background-color:#e6e6e6">FUNCIONARIOS</th>
      </tr>
      <tr style="font-size:12px">
        <th scope="col">Número</th>
        <th scope="col">Identificación</th>
        <th scope="col">Nombres y Apellidos</th>
        <th scope="col">Nivel</th>
        <th scope="col">Denominación</th>
        <th scope="col">Dependecia</th>
        <th scope="col">Sede</th>
        <th></th>
      </tr>

    </thead>
    <tbody>
    </tbody>
  </table>
</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>  
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="views/js/administrador/datos/consultarfuncionarios.js"></script>