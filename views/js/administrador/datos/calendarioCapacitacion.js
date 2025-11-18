// $(document).ready(function () {
//     $("#calendar").fullCalendar()
// })
$(document).on("click",".closeMdl", function () {
    $("#exampleModal").modal("hide")
})
document.addEventListener('DOMContentLoaded', function () {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
        // initialView: 'dayGridMonth',
        // locale: "es",
        // height: 800,
        // droppable: true,
        locale: 'es',
        // showNonCurrentDates: false,
        editable: true,
        headerToolbar: {
            left: 'prev next today',
            center: 'title',
            right: 'dayGridWeek, timeGridDay,listWeek'
        },
        dateClick: function(info) {
            $("#exampleModal").modal("show")
        }
        // events: [
        //     { // this object will be "parsed" into an Event Object
        //       title: 'The Title', // a property!
        //       start: '2021-11-17', // a property!
        //       end: '2021-11-20' // a property! ** see important note below about 'end' **
        //     }
        //   ]
    });
    
    calendar.render();
});//