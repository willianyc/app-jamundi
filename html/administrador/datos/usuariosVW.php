
<script type="text/javascript" src="views/js/generics/alertMessage.js"></script>
<script type="text/javascript" src="views/js/administrador/datos/usuario.js"></script>
<style>
  .submodulos ,.modulos{
    background:#e6e6e6 !important;
    color:#86878e;
    padding:0px;
    border-radius: 0px !important;
    border: 1px solid #86878e;
    font-weight:500;

  }
  
  
</style>
<h5>Administración de Usuarios</h5>
<hr>
<div class="row">
  
  <div class="form-row" id="MsjAJX"></div>
  <form action="" class="mb-3">

    <div class="col-md-12 mb-2">
    <button class="btn btn-success btn-sm btn-pdd desactivar" id="crearnuevo" title="Crear Usuario" ><i class="fa fa-plus-circle"></i></button>
      <h6 class="submenus">Creación de Usuarios</h6>
      <div class="secciones">
        <div class="row padding-secciones">
          <div class="row">
            <div class="col-md-6 mb-2">
              <label class="label-form" for="usuario">Usuario <span style="color: red;"></span></label>
              <input type="text"  required class="form-control input-form color-t border-required" id="usuario" name="usuario" placeholder="usuario">
              <div class="invalid-feedback">
                Debe ingresar el usuario
              </div>

              <label class="label-form" for="password">Contraseña<span style="color: red;"></span></label>
              <input type="password" required class="form-control input-form color-t border-required" id="password" name="password" placeholder="Contraseña">
              <div class="invalid-feedback">
                Debe ingresar la contraseña 
              </div>
          
            </div>
            <div class="col-md-1 mb-2"></div>
            <div class="col-md-4 mb-2">
                <label for="" class="form-control modulos">Asignar Permisos de Administrador</label>
                 <label class="form-control">
                    <input type="radio" id="r1" required value="1" name="nivel" > Administrador
                 </label> 
            
               <label class="form-control">
                 <input type="radio" id="r2" required value="2" checked  name="nivel"> Usuario
              </label>
           </div>
           
            <div class="col-md-12 mb-2">
            <hr>
            </div>
            <div class="col-md-12 mb-2">
              <label for="" class="form-control modulos"> &nbsp; <i class="fa fa-book" style="color:#13700b" aria-hidden="true"></i> CONFIGURACIÓN DE PERMISOS</label> 
              <div id="listopciones"></div>
           </div>
           <div class="col-md-12 mb-3">
             <hr>
           </div>
            <div class="col-md-12 mb-2">
        <table class="table table-striped" id="tblusuarios" >
          <thead>
            <tr>
              <th colspan="9" style="text-align:center;background-color:#e6e6e6">Usuarios Creados</th>
            </tr>
            <tr style="font-size:12px">
              <th scope="col">#</th>
              <th scope="col">Usuario</th>
              <th scope="col">Fecha de Creación</th>
              <th scope="col">Nivel</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
          </tbody>
        </table>
           </div>
          </div>
          </div>
      </div>
    </div>
    <div class="col-md-12 mb-2">
      <button class="btn color-button" id="btnGuardar" style="float:right" type="button"> <i class="fa fa-save"></i> GUARDAR</button>
      <button class="btn color-button" id="btnAtras" required="" style="float:right;margin-right: 15px" type="button"> <i class="fa fa-arrow-left"></i> IR ATRAS</button>
    </div>
  </form>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>  
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>