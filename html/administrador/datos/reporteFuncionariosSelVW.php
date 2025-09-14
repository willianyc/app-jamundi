<h5>SELECCIONAR REPORTE DE FUNCIONARIOS</h5>
<hr>
<div class="form-row" id="MsjAJX"></div><br>
<div class="container mt-3">
  <!-- <h2>Filterable Table</h2>
  <p>Type something in the input field to search the table for first names, 
  last names or emails:</p>   -->
  <div class="row">
    <div class="col-md-12 row">
      <div class="col-md-9 row">
        <select class="form-control input-form color-t border-required desactivar" id="reportes_funvionarios" placeholder='Nivel educativo...' required="">
          <option value="?view=consultas&mode=consultarfuncionarioIngreso&id=hoja_vida">Repote de Funcionarios por fecha de Ingresos</option>
          <option value="?view=consultas&mode=consultarfuncionarioEdad&id=hoja_vida">Repote de Funcionarios por rango de edades</option>
          <option value="?view=consultas&mode=consultarfuncionarioGenero&id=hoja_vida">Repote de Funcionarios por genero</option>
          <option value="?view=consultas&mode=consultarfuncionarioNivelEducativo&id=hoja_vida">Repote de Funcionarios por nivel educativo</option>
		  <option value="?view=consultas&mode=consultarfuncionarioHijosMenoresEdad&id=hoja_vida">Repote de Funcionarios hijos menores de 18 años</option>
          <option value="?view=consultas&mode=consultarfuncionarioCumpleanos&id=hoja_vida">Repote de Cumpleaños de Funcionarios y Familiares</option>
		 <option value="?view=consultas&mode=consultarfuncionarioDependencia&id=hoja_vida">Repote de Funcionarios por dependencia</option>
		      <!-- 
          <option value="?view=consultas&mode=consultarfuncionarioSede&id=hoja_vida">Repote de Funcionarios por sede</option>
          
          <option value="?view=consultas&mode=consultarfuncionarioNivel&id=hoja_vida">Repote de Funcionarios por nivel educativo</option>
          -->
        </select>
      </div>
      <div class="col-md-3">
        <button class="btn btn-otros m-1" id="buscar" style="float:right" type="button"> <i class="fa fa-eye"></i> BUSCAR</button>
      </div>
    </div>
  </div>
  <br>
</div>
<script type="text/javascript" src="views/js/administrador/datos/reportesFuncionario.js"></script>