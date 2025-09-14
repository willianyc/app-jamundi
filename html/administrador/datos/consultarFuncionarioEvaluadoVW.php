<h5>Funcionario evaluado</h5>
<hr>
<div class="row">
    <div class="form-row" id="MsjAJX"></div>
    <div class="col-md-12 mb-2">
        <h6 class="submenus">INFORMACIÓN DEL FUNCIONARIO</h6>
        <input type="hidden" id="id_funcionario">
        <div class="secciones">
            <div class="row padding-secciones">
                <div class="row">
                    <div class="col-md-6 mb-2">
                        <label class="label-form">Busque el funcionario</label>
                        <input type="number" class="form-control input-form border-required color-t" disabled required="" name="identificacion" id="identificacion" placeholder="Identificación...">
                        <div class="invalid-feedback">Debe ingresar la identificación</div>
                    </div>
                    <!-- <div class="col-md-3 pl-0">
                        <button type="button" id="btnBuscar" class="btn btn-otros"><i class="fa fa-eye"></i> BUSCAR</button>
                    </div> -->
                </div>
                <div class="col-md-3 mb-2">
                    <label class="label-form" for="nombres">Nombres</label>
                    <input disabled type="text" class="form-control input-form color-t borderd-required" id="nombres" name="apellido_primer" maxlength="255" value="" required="" placeholder="Nombre">
                    <div class="invalid-feedback">
                        Debe escribir el Nombres
                    </div>
                </div>
                <div class="col-md-3 mb-2">
                    <label class="label-form" for="apellidos">Apellidos</label>
                    <input disabled type="text" class="form-control input-form color-t border-required" id="apellidos" name="apellido_primer" maxlength="255" value="" required="" placeholder="Apellido">
                    <div class="invalid-feedback">
                        Debe escribir el Apellidos
                    </div>
                </div>
                <div class="col-md-3 mb-2">
                    <label class="label-form" for="vinculacion">Tipo de Vinculación</label>
                    <input disabled type="text" class="form-control input-form color-t border-required" id="vinculacion" name="vinculacion" maxlength="255" value="" required="" placeholder="Tipo de Vinculación">
                    <div class="invalid-feedback">
                        Debe escribir el Apellidos
                    </div>
                </div>
                <div class="col-md-3 mb-2">
                    <label class="label-form" for="fecha_ingreso">Fecha de Ingreso</label>
                    <input disabled type="date" class="form-control input-form color-t border-required" id="fecha_ingreso" name="fecha_ingreso" maxlength="255" value="" required="">
                    <div class="invalid-feedback">
                        Debe escribir el Apellidos
                    </div>
                </div>
                <div class="col-md-3 mb-2">
                    <label class="label-form" for="years">Año de Ingreso</label>
                    <input disabled type="text" class="form-control input-form color-t border-required" id="years" name="years" maxlength="255" value="" required="" placeholder="Año">
                    <div class="invalid-feedback">
                        Debe escribir el Apellidos
                    </div>
                </div>
                <div class="col-md-3 mb-2">
                    <label class="label-form" for="cargo_propiedad">cargo en propiedad</label>
                    <input disabled type="text" class="form-control input-form color-t border-required" id="cargo_propiedad" name="cargo_propiedad" maxlength="255" value="" required="" placeholder="Cargo en propiedad">
                    <div class="invalid-feedback">
                        Debe escribir el Apellidos
                    </div>
                </div>
                <div class="col-md-3 mb-2">
                    <label class="label-form" for="nivel">Nivel</label>
                    <input disabled type="text" class="form-control input-form color-t border-required" id="nivel" name="nivel" maxlength="255" value="" required="" placeholder="Nivel">
                    <div class="invalid-feedback">
                        Debe escribir el Apellidos
                    </div>
                </div>
                <div class="col-md-3 mb-2">
                    <label class="label-form" for="codigo">Código</label>
                    <input disabled type="text" class="form-control input-form color-t border-required" id="codigo" name="codigo" maxlength="255" value="" required="" placeholder="Código">
                    <div class="invalid-feedback">
                        Debe escribir el Apellidos
                    </div>
                </div>
                <div class="col-md-3 mb-2">
                    <label class="label-form" for="grado">Grado</label>
                    <input disabled type="text" class="form-control input-form color-t border-required" id="grado" name="grado" maxlength="255" value="" required="" placeholder="Grado">
                    <div class="invalid-feedback">
                        Debe escribir el Apellidos
                    </div>
                </div>
                <div class="col-md-3 mb-2">
                    <label class="label-form" for="Dependencia">Dependencia</label>
                    <input disabled type="text" class="form-control input-form color-t border-required" id="Dependencia" name="Dependencia" maxlength="255" value="" required="" placeholder="Dependencia">
                    <div class="invalid-feedback">
                        Debe escribir el Apellidos
                    </div>
                </div>
                <div class="col-md-3 mb-2">
                    <label class="label-form" for="sede">Sede</label>
                    <input disabled type="text" class="form-control input-form color-t border-required" id="sede" name="sede" maxlength="255" value="" required="" placeholder="Sede">
                    <div class="invalid-feedback">
                        Debe escribir el Apellidos
                    </div>
                </div>
                <div class="col-md-3 mb-2">
                    <label class="label-form" for="cargo">Cargo</label>
                    <input disabled type="text" class="form-control input-form color-t border-required" id="cargo" name="cargo" maxlength="255" value="" required="" placeholder="Cargo">
                    <div class="invalid-feedback">
                        Debe escribir el Apellidos
                    </div>
                </div>
                <div class="col-md-3 mb-2">
                    <label class="label-form" for="totalEvaluacion">Total evaluacion</label>
                    <input disabled type="text" class="form-control input-form color-t border-required" id="totalEvaluacion" name="totalEvaluacion" maxlength="255" value="" required="" placeholder="0">
                    <div class="invalid-feedback">
                        Debe escribir el Apellidos
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-12 mb-5 mt-3" style="flex-direction: row-reverse" id="btn_2">
        <button class="btn color-button " id="btnIrAtras" style="float:right; margin: 0 15px;" type="button"> <i class="fa fa-save"></i> IR ATRAS</button>
    </div>
</div>
<script type="text/javascript" src="views/js/administrador/datos/consultarEvaluacion.js"></script>