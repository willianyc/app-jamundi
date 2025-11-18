$(document).ready(function () {
  
  $('#guardar').click(function(){
    
    data = {
      usuario: $("#usuario").val(),
      pass: $("#pass").val()
    }
    
    //$.post('/index.php?view=login&mode=login',{
    //$.post('set/login/login',{
    $.post('?view=login&mode=login',{
      general: JSON.stringify(data)
    }).done(function (data) {
      if (data.trim() !== '') {
        data = JSON.parse(data);
        if (data.error != undefined) {
          // objMsjAJX.showError(data.error)
          alert(decodeURIComponent(escape(window.atob(data.error))))
          return
        }
        if (data.success != undefined) {
          window.location="?view=principal&mode=inicio";
        }
        // if (data.error == undefined) {
        // }else{
        // alert('Usuario o contraseña incorrecta')
        // return
        // }
        // if (data != "") {
          //   $("#id_perfil").val(data[0].id_perfil);
          // }
      }
    })
  })
});