/**
 * Created by macbook on 2016-11-25.
 */
<!-- Latest compiled and minified JavaScript -->
//
// var star=function () {
//     $("#rateYo").rateYo({
//         rating: 3.6
//     });
//
//     $("#rateYo").click(function () {
//         $('#comment_rate').val($("#rateYo").rateYo("rating"))
//
//     })
// };





$(document).ready(
    function () {

        $("#rateYo").rateYo({
            rating: 3.6
        });

        $("#rateYo").click(function () {
            $('#comment_rate').val($("#rateYo").rateYo("rating"))

        })

    }


);


// $(function () {
//
//     $("#rateYo").rateYo({
//         rating: 3.6
//     });
//
//     $("#rateYo").click(function () {
//         $('#comment_rate').val($("#rateYo").rateYo("rating"))
//
//     })
//
// });