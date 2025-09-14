<h5>CONSULTA DE FUNCIONARIOS POR HIJOS MENORES DE EDAD</h5>
<hr>
<div class="form-row" id="MsjAJX"></div><br>
<div class="container mt-3">
  <!-- <h2>Filterable Table</h2>
  <p>Type something in the input field to search the table for first names, 
  last names or emails:</p>   -->
  <div class="row">
    <div class="col-md-12 row">
      <div class="col-md-6 row">
        
        <div class="col-md-6">
          <label for="">fecha inicio</label>
          <input class="form-control input-form color-t" id="fecha_ini" type="date" placeholder="Buscar..">
        </div>
        <div class="col-md-6">
          <label>fecha final</label>
          <input class="form-control input-form color-t" id="fecha_fin" type="date" placeholder="Buscar..">
        </div>
       
      </div>
      <div class="col-md-4">
        <button class="btn btn-otros m-1" id="btnPdf" style="float:right" type="button"> <i class="fa fa-file-pdf-o"></i> PDF</button>
        <button class="btn btn-otros m-1" id="btnExcel" style="float:right" type="button"> <i class="fa fa-file-excel-o"></i> EXCEL</button>
        <button class="btn btn-otros m-1" id="buscar" style="float:right" type="button"> <i class="fa fa-eye"></i> BUSCAR</button>
      </div>
    </div>
  </div>
  <br>
  <table class="table table-striped" id="tblCapacitaciones">
    <thead>
      <tr>
        <th colspan="8" style="text-align:center;background-color:#e6e6e6">FUNCIONARIOS</th>
      </tr>
      <tr>
        <th scope="col">#</th>
        <th scope="col">Identificación</th>
        <th scope="col">Nombre</th>
        <th scope="col">Nivel</th>
        <th scope="col">Cargo</th>
        <th scope="col">Nombre Hijo</th>
        <th scope="col">Fecha Nacimiento</th>
        <th scope="col">Edad</th>
      </tr>

    </thead>
    <tbody>
    </tbody>
  </table>
</div>
</div>
<script type="text/javascript" src="views/js/administrador/datos/consultarfuncionariohijosmenores.js"></script>