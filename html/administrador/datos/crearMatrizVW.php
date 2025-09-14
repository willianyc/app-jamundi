<!-- <script type="text/javascript" src="views/js/generics/message.js"></script>

<script type="text/javascript" src="views/js/generics/autocom.js"></script> -->

<script type="text/javascript" src="views/js/generics/alertMessage.js"></script>

<script type="text/javascript" src="views/js/administrador/datos/matriz.js?v=<?php echo(rand()); ?>"></script>



<h5>MATRIZ DE HALLAZGO</h5>

<hr>

<div class="row">

    <div class="form-row" id="MsjAJX" required></div>

    <form action="" class="mb-3" >



        <div class="col-md-12 mb-2">

            <h6 class="submenus">Crear matriz</h6>

            <input type="hidden" id="id_matriz">

            <div class="secciones">

                <div class="row padding-secciones">



                    <div class="row">



                        <div class="col-md-12">

                            <div class="form-inline">

                                <div class="custom-control custom-radio pr-3">

                                    <label for="is_entidad" class="label-form">¿En La Entidad?</label>

                                    <label class="custom-control-label label-form" for="si_entidad">Si</label>

                                    <input type="radio" class="custom-control-input" id="si_entidad" name="is_entidad" value="1" required checked>

                                    <label class="custom-control-label label-form" for="no_entidad">No</label>

                                    <input type="radio" class="custom-control-input" id="no_entidad" name="is_entidad" value="0" required>

                                </div>

                            </div>

                        </div>



                        <div class="col-md-12 mb-2 contentLugar" style="display: none;">

                            <label class="label-form" for="lugar">Lugar <span style="color: red;">*</span></label>

                            <input type="text" class="form-control input-form color-t border-required" id="lugar" name="lugar" placeholder="Lugar...">

                            <div class="invalid-feedback">

                                Debe ingresar el Lugar

                            </div>

                        </div>



                        <div class="col-md-4 mb-2 contentSedeDenominacion" style="display: block;">

                            <label class="label-form" for="AllSede">Sede <span style="color: red;">*</span></label>

                            <select class="form-control input-form color-t border-required" id="AllSede" required>

                                <option value="" selected disabled>Seleccione...</option>

                            </select>

                            <div class="invalid-feedback">

                                Debe ingresar el Sede

                            </div>

                        </div>



                        <div class="col-md-4 mb-2 contentSedeDenominacion" style="display: block;">

                            <label class="label-form" for="dependencia">Dependencia <span style="color: red;">*</span></label>

                            <select class="form-control input-form color-t border-required" id="dependencia" required>

                                <option value="" selected disabled>Seleccione...</option>

                            </select>

                            <div class="invalid-feedback">

                                Debe ingresar la dependencia

                            </div>

                        </div>                        

                        

                        <div class="col-md-4 mb-2 contentSedeDenominacion" style="display: block;">

                            <label class="label-form" for="cargoPropiedad">Denominación</label>

                            <select class="form-control input-form color-t" id="cargoPropiedad">

                                <option value="" selected disabled>Seleccione...</option>

                            </select>

                            <div class="invalid-feedback">

                                Debe ingresar el Denominación

                            </div>

                        </div>                        



                    </div> 



                    <div class="row">



                        <div class="col-md-4 mb-2">

                            <label for="fecha" class="label-form">Fecha<span style="color: red;">*</span></label>

                            <input type="date" class="form-control input-form color-t disabled border-required" id="fecha" required>

                            <div class="invalid-feedback">Debe seleccionar la fecha.</div>

                        </div>

                        

                        <div class="col-md-8 mb-2">

                            <label class="label-form" for="origenHallazgo">Origen de Hallazgo <span style="color: red;">*</span></label>

                            <!-- <input type="text" class="form-control input-form color-t border-required" id="origenHallazgo" required name="origenHallazgo" placeholder="Origen de hallazgo..."> -->

                            <select class="form-control input-form color-t border-required" id="origenHallazgo" required>

                                <option value="" selected disabled>Seleccione...</option>

                                <option value="Auditoria (interna o externa)">Auditoria (interna o externa)</option>

                                <option value="COPASST">COPASST</option>

                                <option value="Directriz Organizacional">Directriz Organizacional</option>

                                <option value="Incidentes (casi accidentes)">Incidentes (casi accidentes)</option>

                                <option value="Inspección">Inspección</option>

                                <option value="Investigación">Investigación</option>

                                <option value="Manejo del Cambio">Manejo del Cambio</option>

                                <option value="Necesidades de Equipo">Necesidades de Equipo</option>

                                <option value="Quejas y Reclamos">Quejas y Reclamos</option>

                                <option value="Reporte de Actos Y Condiciones Inseguras">Reporte de Actos Y Condiciones Inseguras</option>

                                <option value="Revisión de Proceso">Revisión de Proceso</option>

                                <option value="Otro">Otro</option>

                            </select>

                            <div class="invalid-feedback">

                                Debe ingresar el Origen de hallazgo

                            </div>

                        </div>



                        <div class="col-md-12 mb-2">

                            <label for="descripcionHallazgo" class="label-form">Descripcion de Hallazgo <span style="color: red;">*</span></label>

                            <textarea class="form-control input-form color-t" id="descripcionHallazgo" placeholder="Descripcion de hallazgo..." name="descripcionHallazgo" rows="5" maxlength="250" required></textarea>

                            <div class="invalid-feedback">Debe ingresar la Descripcion de hallazgo</div>

                        </div>

                        

                    </div>



                    <div class="row">

                    

                        <div class="col-md-12 mb-2">

                            <label class="label-form" for="elementoSiguiente">Elemento Que Interviene <span style="color: red;">*</span></label>

                            <!-- <input type="text" class="form-control input-form color-t border-required" id="elementoSiguiente" required name="elementoSiguiente" placeholder="Elemento sig que interviene..."> -->

                            <select class="form-control input-form color-t border-required" id="elementoSiguiente" required>

                                <option value="" selected disabled>Seleccione...</option>

                                <option value="Liderazgo y Cultura Organizacional">Liderazgo y Cultura Organizacional</option>

                                <option value="Cumplimiento de Requisitos y Estándares">Cumplimiento de Requisitos y Estándares</option>

                                <option value="Participación y comunicación con partes interesadas">Participación y comunicación con partes interesadas</option>

                                <option value="Manejo de información y Documentación">Manejo de información y Documentación</option>

                                <option value="Identificación de Peligros, Análisis de Riesgos y Controles">Identificación de Peligros, Análisis de Riesgos y Controles</option>

                                <option value="Estructura y Responsabilidad">Estructura y Responsabilidad</option>

                                <option value="Aseguramiento de Competencias">Aseguramiento de Competencias</option>

                                <option value="Integridad de Activos y Confiabilidad">Integridad de Activos y Confiabilidad</option>

                                <option value="Procedimientos y Prácticas de Trabajo Seguro">Procedimientos y Prácticas de Trabajo Seguro</option>

                                <option value="Manejo del Cambio ">Manejo del Cambio </option>

                                <option value="Aseguramiento de Contratistas y Proveedores">Aseguramiento de Contratistas y Proveedores</option>

                                <option value="Manejo de Emergencias">Manejo de Emergencias</option>

                                <option value="Investigación de Incidentes">Investigación de Incidentes</option>

                                <option value="Medición y monitoreo">Medición y monitoreo</option>

                                <option value="Auditorias">Auditorias</option>

                                <option value="Revisión gerencial">Revisión gerencial</option>

                                <option value="Investigación de Accidentes">Investigación de Accidentes</option>

                            </select>

                            <div class="invalid-feedback">

                                Debe ingresar el Elemento sig que interviene

                            </div>

                        </div>

                        

                        <div class="col-md-12 mb-2">

                            <label class="label-form" for="recomendacion">Recomendación <span style="color: red;">*</span></label>

                            <!-- <input type="text" class="form-control input-form color-t border-required" id="recomendacion" required name="recomendacion" placeholder="Recomendación..."> -->

                            <textarea class="form-control input-form color-t" id="recomendacion" placeholder="Recomendacion..." name="recomendacion" rows="5" maxlength="250"></textarea>

                            <div class="invalid-feedback">

                                Debe ingresar el Recomendación

                            </div>

                        </div>



                        

                        

                        

                    </div>       

                    

                    <div class="row">

                    

                        <div class="col-md-4 mb-2">

                            <label class="label-form" for="tipoAccion">Tipo de Acción <span style="color: red;">*</span></label>

                            <select class="form-control input-form color-t" id="tipoAccion">

                                <option value="" selected disabled>Seleccione...</option>

                                <option value="A. Correctiva">A. Correctiva</option>

                                <option value="A. De mejora">A. De mejora</option>

                                <option value="A. Preventiva">A. Preventiva</option>

                            </select>

                            <div class="invalid-feedback">

                                Debe seleccionar la Tipo de acción

                            </div>

                        </div>

                        

                        <div class="col-md-4 mb-2">

                            <label class="label-form" for="responsable">Responsable <span style="color: red;">*</span></label>

                            <input type="text" class="form-control input-form color-t" id="responsable" name="responsable" placeholder="Responsable...">

                            <div class="invalid-feedback">

                                Debe ingresar el Responsable

                            </div>

                        </div>



                        <div class="col-md-4 mb-2">

                            <label for="fechaPropuestaCierre" class="label-form">Fecha Propuesta de Cierre<span style="color: red;">*</span></label>

                            <input type="date" class="form-control input-form color-t disabled" id="fechaPropuestaCierre">

                            <div class="invalid-feedback">Debe seleccionar la Fecha propuesta de cierre.</div>

                        </div>                        

                    </div>



                    <div class="row" style="display: none;">



                        <div class="col-md-12 mb-2">

                            <label class="label-form" for="accionTomada">Accion Tomada <span style="color: red;">*</span></label>

                            <!--<input type="text" class="form-control input-form color-t border-required" id="accionTomada" required name="accionTomada" placeholder="Accion tomada...">  -->

                            <textarea class="form-control input-form color-t" id="accionTomada" placeholder="Accion tomada..." name="accionTomada" rows="2" maxlength="250"></textarea>

                            <div class="invalid-feedback">

                                Debe ingresar el Accion tomada

                            </div>

                        </div>



                        <div class="col-md-4 mb-2">

                            <label class="label-form" for="estado">Estado <span style="color: red;">*</span></label>

                            <select class="form-control input-form color-t" id="estado">

                                <option value="" selected disabled>Seleccione...</option>

                                <option value="ABIERTO" selected>ABIERTO</option>

                                <option value="CERRADO">CERRADO</option>

                                <option value="EN PROCESO">EN PROCESO</option>

                            </select>

                            <div class="invalid-feedback">

                                Debe ingresar el Estado

                            </div>

                        </div>



                        <div class="col-md-4 mb-2">

                            <label for="fechaSeguimiento" class="label-form">Fecha Seguimiento<span style="color: red;">*</span></label>

                            <input type="date" class="form-control input-form color-t disabled" id="fechaSeguimiento">

                            <div class="invalid-feedback">Debe seleccionar la Fecha de Seguimiento.</div>

                        </div>



                        <div class="col-md-4 mb-2">

                            <label class="label-form" for="avance">Avance(%) <span style="color: red;">*</span></label>

                            <input type="text" class="form-control input-form color-t border-required" id="avance" name="avance" placeholder="Avance(%)..." value="0" readOnly>

                        </div>
                        
                        <div class="col-md-12 mb-2 contentFechaCierre" style="display: none;">

                            <label for="fechaCierre" class="label-form">Fecha de Cierre<span style="color: red;">*</span></label>

                            <input type="date" class="form-control input-form color-t disabled border-required" id="fechaCierre">

                            <div class="invalid-feedback">Debe seleccionar la Fecha de cierre.</div>

                        </div>




                        <div class="col-md-12 mb-2">

                            <label class="label-form" for="archivo">Documento Soporte</label>

                            <input type="file" class="form-control input-form color-t border-required" id="archivo" name="archivo" placeholder="Documento soporte...">

                            <div class="invalid-feedback">

                                Debe ingresar la Documento soporte

                            </div>

                        </div>



                        
                        

                    </div>                    

                    



                </div>

            </div>

        </div>



        <div class="col-md-12 mb-2">

            <button class="btn color-button" id="btnGuardar" required style="float:right" type="button"> <i class="fa fa-save"></i> GUARDAR</button>

            <button class="btn color-button" id="btnAtras" required style="float:right;margin-right: 15px" type="button"> <i class="fa fa-arrow-left"></i> IR ATRAS</button>

        </div>



    </form>