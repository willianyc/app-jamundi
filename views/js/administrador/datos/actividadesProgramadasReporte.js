$(document).ready(function () {
  console.log("ok");
  $.post("ajaxGeneral.php?mode=reporteActividades")
   .done(function (data) {
      console.log(data);
	  if(data.trim() !== ""){
       	data = JSON.parse(data);
		if(data.error != undefined){
		   alertError(data.error);
		   return;
		}
	  }
    });
});//