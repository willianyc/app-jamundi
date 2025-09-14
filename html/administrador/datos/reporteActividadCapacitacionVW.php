<h5>ACTIVIDADES Y CAPACITACIÓN</h5>
<hr>
<div class="form-row" id="MsjAJX"></div><br>
<div class="container mt-3">
    <!-- <h2>Filterable Table</h2>
  <p>Type something in the input field to search the table for first names, 
  last names or emails:</p>   -->
    <div class="row">
        <div class="col-md-12 row">
            <div class="col-md-9 row">
                <select class="form-control input-form color-t border-required desactivar" id="reportes_funvionarios" required="">
					<option value="?view=reportes&mode=reportecapacitacionexcel">reporte de capacitación</option>
                    <option value="?view=reportes&mode=reporteactividadesexcel">reporte de actividades</option>
				    <option value="?view=reportes&mode=participacionActividades">Participacion de funcionarios en actividades</option>
                    <option value="?view=reportes&mode=participacionCapacitaciones">Participacion de funcionarios en capacitaciones</option>
                    <option value="?view=reportes&mode=rankingFuncionariosCapacitacion">Ranking de parciticipación en Capacitaciones</option>
                    <option value="?view=reportes&mode=rankingFuncionariosActividades">Ranking de parciticipación en Actividades</option>
                
                    <!-- <option value="?view=consultas&mode=consultarfuncionarioNivel&id=hoja_vida">Repote de Funcionarios por nivel educativo</option> -->
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