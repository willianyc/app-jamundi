<!-- <script type="text/javascript" src="views/js/generics/message.js"></script> -->
<!-- <script type="text/javascript" src="views/js/generics/autocom.js"></script> -->

<script type="text/javascript" src="views/js/generics/alertMessage.js"></script>
<script type="text/javascript" src="views/js/administrador/datos/actividadesProgramadas.js?v=<?php echo(rand());?>"></script>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document" style="max-width: 70%;">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Funcionarios</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <table class="table table-striped" id="tbl_funcionarios" style="display: block;overflow: auto;height: 350px;">
                    <thead>
                        <tr>
                            <td scope="col"><button class="btn btn-danger btn-sm" name="limpiarFiltros"><i class="fa fa-trash-o"></i></button></td>
                            <td scope="col"><input type="text" class="form-control" id="documento" placeholder="Identificación..."></td>
                            <td scope="col"><input type="text" class="form-control" id="tipo_vinculacion" placeholder="Tipo de contrato..."></td>
                            <td scope="col"><input type="text" class="form-control" id="nivel" placeholder="Nivel..."></td>
                            <td scope="col"><input type="text" class="form-control" id="cargo" placeholder="Denominación..."></td>
                        </tr>
                        <tr>
                            <th scope="col"><input type="checkbox" name="selectedAll" id=""></th>
                            <th scope="col">Identificación</th>
                            <th scope="col">Tipo de contrato</th>
                            <th scope="col">Nivel</th>
                            <th scope="col">Denominación</th>
                        </tr>

                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <!-- <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
                <button type="button" class="btn btn-primary" name="mdlAceptar" data-dismiss="modal">Aceptar</button>
            </div>
        </div>
    </div>
</div>
<h5>ACTIVIDADES PROGRAMADAS</h5>
<hr>
<div class="row">
    <div class="form-row" id="MsjAJX" required=""></div>
    <form action="" class="mb-3">
        <div class="col-md-12 mb-2">
            <h6 class="submenus">Crear actividad</h6>
            <input type="hidden" id="id_seguridadsocial">
            <div class="secciones">
                <div class="row padding-secciones">
                
                    <div class="row">
                        <div class="col-md-4 mb-2">
                            <label class="label-form" for="identificacion">Identificación <span style="color: red;">*</span></label>
                            <input type="text" class="form-control input-form color-t border-required" id="identificacion" required="" name="identificacion" placeholder="Identificacion...">
                            <div class="invalid-feedback">
                                Debe ingresar la Identificación
                            </div>
                        </div>
                        <div class="col-md-8 mb-2">
                            <label class="label-form" for="nombre">Nombre <span style="color: red;">*</span></label>
                            <input type="text" class="form-control input-form color-t border-required" id="nombre" required="" name="nombre" placeholder="Nombre...">
                            <div class="invalid-feedback">
                                Debe ingresar el Nombre
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-4 mb-2">
                            <label class="label-form" for="ciclo">Ciclo <span style="color: red;">*</span></label>
                            <select class="form-control input-form color-t border-required" id="ciclo" required="">
                                <option value="" selected disabled>Seleccione...</option>
                                <option value="PLANEAR">PLANEAR</option>
                                <option value="HACER">HACER</option>
                                <option value="VERIFICAR">VERIFICAR</option>
                                <option value="ACTUAR">ACTUAR</option>
                            </select>
                            <div class="invalid-feedback">
                                Debe seleccionar la Ciclo
                            </div>
                        </div>
                        <div class="col-md-8 mb-2" id="bloqRecurso">
                            <label class="label-form" for="recursos">Recursos <span style="color: red;">*</span></label>
                            <select class="form-control input-form color-t border-required" id="recursos" required="">
                                <option value="" selected disabled>Seleccione...</option>
                                <option value="ADMINISTRATIVO">ADMINISTRATIVO</option>
                                <option value="FINANCIERO">FINANCIERO</option>
                                <option value="AMBOS">AMBOS</option>
                            </select>
                            <div class="invalid-feedback">
                                Debe seleccionar la Recursos
                            </div>
                        </div>
                        <div class="col-md-4 mb-2" style="display: none;" id="divValorTotal">
                            <label class="label-form" for="valorTotal">Valor total <span style="color: red;">*</span></label>
                            <input type="number" class="form-control input-form color-t border-required" id="valorTotal" name="valorTotal" placeholder="Valor total..." value="0">
                            <div class="invalid-feedback">
                                Debe ingresar el Valor total
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-6 mb-2">
                            <label for="fecha_inicio" class="label-form">Fecha de inicio <span style="color: red;">*</span></label>
                            <input type="date" class="form-control input-form color-t disabled border-required" id="fecha_inicio" required="">
                            <div class="invalid-feedback">Debe seleccionar la fecha.</div>
                        </div>
                        <div class="col-md-6 mb-2">
                            <label for="fecha_finalizacion" class="label-form">Fecha de finalización <span style="color: red;">*</span></label>
                            <input type="date" class="form-control input-form color-t disabled border-required" id="fecha_finalizacion" required="">
                            <div class="invalid-feedback">Debe seleccionar la fecha.</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-2">
                            <label class="label-form" for="modalidad">Modalidad <span style="color: red;">*</span></label>
                            <select class="form-control input-form color-t border-required" id="modalidad" required="">
                                <option value="" selected disabled>Seleccione...</option>
                                <option value="PRESENCIAL">PRESENCIAL</option>
                                <option value="VIRTUAL">VIRTUAL</option>
                                <option value="MIXTA">MIXTA</option>
                            </select>
                            <div class="invalid-feedback">
                                Debe seleccionar la Modalidad
                            </div>
                        </div>
                        <div class="col-md-6 mb-2">
                            <label class="label-form" for="direccion">Lugar <span style="color: red;">*</span></label>
                            <input type="text" class="form-control input-form color-t border-required" id="direccion" required="" name="direccion" placeholder="Lugar...">
                            <div class="invalid-feedback">
                                Debe ingresar el Lugar
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-2">
                            <label class="label-form" for="entidad">Responsable de la actividad <span style="color: red;">*</span></label>
                            <input type="text" class="form-control input-form color-t border-required" id="entidad" required="" name="entidad" placeholder="Responsable de la actividad...">
                            <div class="invalid-feedback">
                                Debe ingresar el Responsable de la actividad
                            </div>
                        </div>
                        <div class="col-md-6 mb-2">
                            <label class="label-form" for="archivo">Adjuntar archivo</label>
                            <input type="file" class="form-control input-form color-t border-required" id="archivo" name="archivo" placeholder="Adjuntar archivo...">
                            <div class="invalid-feedback">
                                Debe ingresar la Adjuntar archivo
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- <div class="col-md-12 mb-2">
      <h6 class="submenus">Asignación</h6>
      <input type="hidden" id="id_seguridadsocial">
      <div class="secciones">
        <div class="row padding-secciones">
          <div class="row">
            <div class="col-md-6 pl-0">
               <button type="button" id="btnBuscar" class="btn btn-otros" data-toggle="modal" data-target="#exampleModal"><i class="fa fa-user"></i> ASIGNAR FUNCIONARIO</button>
            </div>
            <div class="col-md-4 mb-2">
                  <label for="fecha_asignacion" class="label-form">Fecha de asignación <span style="color: red;">*</span></label>
                  <input type="date" class="form-control input-form color-t disabled border-required" required="" id="fecha_asignacion">
                  <div class="invalid-feedback">Debe seleccionar la fecha.</div>
             </div>
          </div>
          <div class="form-row">
          <table class="table table-striped" id="tblFuncionariosAsignados">
            <thead>
                <tr>
                  <th colspan="8" style="text-align:center;background-color:#e6e6e6">FUNCIONARIOS ASIGNADOS</th>
                </tr>
                <tr>
                    <th scope="col">Identificación</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Apellidos</th>
                    <th scope="col">Dirección</th>
                    <th scope="col">Email</th>
                    <th scope="col">Código</th>
                    <th scope="col">Denominación</th>
                    <th scope="col">Séde</th>
                </tr>
                
            </thead>
            <tbody>
            </tbody>
          </table>
          </div>
        </div>
      </div>
    </div> -->
        <div class="col-md-12 mb-2">
            <button class="btn color-button" id="btnGuardar" required="" style="float:right;" type="button"> <i class="fa fa-save"></i> GUARDAR</button>
            <button class="btn color-button" id="btnAtras" required="" style="float:right;margin-right: 15px" type="button"> <i class="fa fa-arrow-left"></i> IR ATRAS</button>
        </div>
    </form>