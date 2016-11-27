/**
 * Created by macbook on 2016-11-26.
 */


var calendar=function() {
    $('#calendar').fullCalendar({});


    $("#calendar").fullCalendar({
        header:"My calendar",
        left: "prev,next today",
        center: "title",
        right: "month,agendaWeek,agendaDay",
        defaultView: "month",
        height: 500,
        slotMinutes: 15,
        events: "/dashboard/get_events",
        timeFormat: "h:mm t{ - h:mm t} ",
        dragOpacity: "0.5"
    });
};


// $(document).ready(ready)
// $(document).on('page:load', ready)
document.addEventListener("turbolinks:load", function() {
    calendar();
});
