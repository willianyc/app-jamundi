$(document).ready(function () {
  getFuncianariosActividadAnual();
  var ctx = document.getElementById("myChart").getContext("2d");
  var myChart = new Chart(ctx, {
    type: "bar",
    data: {
      labels: [
        "Enero",
        "Frebrero",
        "Marzo",
        "Abril",
        "Mayo",
        "Junio",
        "Julio",
        "Agosto",
        "Septiembre",
        "Octubre",
        "Noviembre",
        "Diciembre",
      ],
    },
    options: {
      scales: {
        yAxes: [
          {
            ticks: {
              beginAtZero: true,
            },
          },
        ],
      },
    },
  });
  var ctxP = document.getElementById("labelChart").getContext("2d");
  var myPieChart = new Chart(ctxP, {
    // plugins: [ChartDataLabels],
    type: "pie",
    data: {
      labels: ["Red", "Green", "Yellow", "Grey", "Dark Grey"],
    },
    options: {
      responsive: true,
      legend: {
        position: "right",
        labels: {
          padding: 20,
          boxWidth: 10,
        },
      },
      plugins: {
        datalabels: {
          formatter: (value, ctx) => {
            let sum = 0;
            let dataArr = ctx.chart.data.datasets[0].data;
            dataArr.map((data) => {
              sum += data;
            });
            let percentage = ((value * 100) / sum).toFixed(2) + "%";
            return percentage;
          },
          color: "white",
          labels: {
            title: {
              font: {
                size: "16",
              },
            },
          },
        },
      },
    },
  });
});
function getFuncianariosActividadAnual() {
  $.post("ajaxGeneral.php?mode=getFuncianariosActividadAnual").done(function (
    data
  ) {
    if (data.trim() !== "") {
      // data.replace("getFuncionario", 'ss')
      data = JSON.parse(data);
      if (data.error != undefined) {
        alertError(data.error);
        return;
      }
      $(data).each(function () {
        cargarBarra(this);
        cargarTorta(this);
      });
      // console.log(data);
      // $("#tbl_funcionarios tbody").html(tr);
    }
  });
}
function cargarBarra(cantidadesDatas) {
  var ctx = document.getElementById("myChart").getContext("2d");
  var myChart = new Chart(ctx, {
    type: "bar",
    data: {
      labels: [
        "Enero",
        "Frebrero",
        "Marzo",
        "Abril",
        "Mayo",
        "Junio",
        "Julio",
        "Agosto",
        "Septiembre",
        "Octubre",
        "Noviembre",
        "Diciembre",
      ],
      datasets: [
        {
          label: "Cant. de Funcionarios",
          data: [
            cantidadesDatas.enero.cant_funcionarios,
            cantidadesDatas.febrero.cant_funcionarios,
            cantidadesDatas.marzo.cant_funcionarios,
            cantidadesDatas.abril.cant_funcionarios,
            cantidadesDatas.mayo.cant_funcionarios,
            cantidadesDatas.junio.cant_funcionarios,
            cantidadesDatas.julio.cant_funcionarios,
            cantidadesDatas.agosto.cant_funcionarios,
            cantidadesDatas.septiembre.cant_funcionarios,
            cantidadesDatas.octubre.cant_funcionarios,
            cantidadesDatas.noviembre.cant_funcionarios,
            cantidadesDatas.diciembre.cant_funcionarios,
          ],
          backgroundColor: [
            "rgba(244, 16, 16)",
            "rgba(54, 162, 235)",
            "rgba(83, 82, 82)",
            "rgba(245, 238, 15)",
            "rgba(19, 227, 41 )",
            "rgba(153, 102, 255)",
            "rgba(255, 159, 64)",
            "rgba(15, 245, 190)",
            "rgba(231, 15, 245)",
            "rgba(119, 30, 30)",
            "rgba(3, 189, 99)",
            "rgba(19, 57, 227)",
          ],
          borderColor: [
            "rgba(244,16,16,1)",
            "rgba(54, 162, 235, 1)",
            "rgba(83, 82, 82, 1)",
            "rgba(245, 238, 15, 1)",
            "rgba(19, 227, 41 , 1)",
            "rgba(153, 102, 255, 1)",
            "rgba(255, 159, 64, 1)",
            "rgba(15, 245, 190, 1)",
            "rgba(231, 15, 245, 1)",
            "rgba(119, 30, 30, 1)",
            "rgba(3, 189, 99, 1)",
            "rgba(19, 57, 227, 1)",
          ],
          borderWidth: 1,
        },
      ],
    },
    options: {
      scales: {
        yAxes: [
          {
            ticks: {
              beginAtZero: true,
            },
          },
        ],
      },
    },
  });
}
function cargarTorta(cantidadesDatas) {
  var ctxP = document.getElementById("labelChart").getContext("2d");
  var myPieChart = new Chart(ctxP, {
    // plugins: [ChartDataLabels],
    type: "pie",
    data: {
      labels: [
        "Enero",
        "Frebrero",
        "Marzo",
        "Abril",
        "Mayo",
        "Junio",
        "Julio",
        "Agosto",
        "Septiembre",
        "Octubre",
        "Noviembre",
        "Diciembre",
      ],
      datasets: [
        {
          label: "Cant. de Funcionarios",
          data: [
            cantidadesDatas.enero.cant_funcionarios,
            cantidadesDatas.febrero.cant_funcionarios,
            cantidadesDatas.marzo.cant_funcionarios,
            cantidadesDatas.abril.cant_funcionarios,
            cantidadesDatas.mayo.cant_funcionarios,
            cantidadesDatas.junio.cant_funcionarios,
            cantidadesDatas.julio.cant_funcionarios,
            cantidadesDatas.agosto.cant_funcionarios,
            cantidadesDatas.septiembre.cant_funcionarios,
            cantidadesDatas.octubre.cant_funcionarios,
            cantidadesDatas.noviembre.cant_funcionarios,
            cantidadesDatas.diciembre.cant_funcionarios,
          ],
          backgroundColor: [
            "rgba(244, 16, 16)",
            "rgba(54, 162, 235)",
            "rgba(83, 82, 82)",
            "rgba(245, 238, 15)",
            "rgba(19, 227, 41 )",
            "rgba(153, 102, 255)",
            "rgba(255, 159, 64)",
            "rgba(15, 245, 190)",
            "rgba(231, 15, 245)",
            "rgba(119, 30, 30, 0.3)",
            "rgba(3, 189, 99)",
            "rgba(19, 57, 227)",
          ],
          borderColor: [
            "rgba(244,16,16,1)",
            "rgba(54, 162, 235, 1)",
            "rgba(83, 82, 82, 1)",
            "rgba(245, 238, 15, 1)",
            "rgba(19, 227, 41 , 1)",
            "rgba(153, 102, 255, 1)",
            "rgba(255, 159, 64, 1)",
            "rgba(15, 245, 190, 1)",
            "rgba(231, 15, 245, 1)",
            "rgba(119, 30, 30, 1)",
            "rgba(3, 189, 99, 1)",
            "rgba(19, 57, 227, 1)",
          ],
          borderWidth: 1,
        },
      ],
    },
    options: {
      responsive: true,
      legend: {
        position: "right",
        labels: {
          padding: 20,
          boxWidth: 10,
        },
      },
      plugins: {
        datalabels: {
          formatter: (value, ctx) => {
            let sum = 0;
            let dataArr = ctx.chart.data.datasets[0].data;
            dataArr.map((data) => {
              sum += data;
            });
            let percentage = ((value * 100) / sum).toFixed(2) + "%";
            return percentage;
          },
          color: "white",
          labels: {
            title: {
              font: {
                size: "16",
              },
            },
          },
        },
      },
    },
  });
}
//