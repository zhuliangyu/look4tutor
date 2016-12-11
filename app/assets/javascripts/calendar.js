/**
 * Created by macbook on 2016-11-26.
 */


// var calendar=function() {
//     var url = window.location.pathname;
//     var id = url.substring(url.lastIndexOf('/') + 1);
//
//      $('#calendar').fullCalendar({
//          header: {
//              left: 'prev,next today',
//              center: 'title',
//              right: 'month,basicWeek, basicDay'
//          },
//          dayClick: function(date, jsEvent, view) {
//              var ajandamodu=view.name;
//              if(ajandamodu=='month')
//              {
//                  $('#calendar').fullCalendar( 'changeView', 'listDay'  );
//              }
//          },
//          events: '/tutors/'+id+'/events.json'
//
//      });

    // $('#calendar').fullCalendar('next');


    // $("#calendar").fullCalendar({
    //     header:"My calendar",
    //     left: "prev,next today",
    //     center: "title",
    //     right: "month,agendaWeek,agendaDay",
    //     defaultView: "month",
    //     height: 500,
    //     slotMinutes: 15,
    //     events: "/dashboard/get_events",
    //     timeFormat: "h:mm t{ - h:mm t} ",
    //     dragOpacity: "0.5"
    // });
// };



// document.addEventListener("turbolinks:load", function() {
//     calendar();
// });



$(document).ready(function() {

    var url = window.location.pathname;
    var id = url.substring(url.lastIndexOf('/') + 1);
    $('#calendar').fullCalendar({
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,basicWeek, basicDay'
        },
        dayClick: function(date, jsEvent, view) {
            var ajandamodu=view.name;
            if(ajandamodu=='month')
            {
                $('#calendar').fullCalendar( 'changeView', 'listDay'  );
            }
        },
        events: '/tutors/'+id+'/events.json'

    });


});

