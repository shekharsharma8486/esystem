<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CalenderPage.aspx.cs" Inherits="EbookingWebProject.CalenderPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href='AddCalenderInfo/fullcalendar.css' rel='stylesheet' />
<link href='AddCalenderInfo/fullcalendar.print.css' rel='stylesheet' media='print' />
<script src='AddCalenderInfo/lib/moment.min.js'></script>
<script src='AddCalenderInfo/lib/jquery.min.js'></script>
<script src='AddCalenderInfo/fullcalendar.min.js'></script>
    <%--<script>

        $(document).ready(function () {

            $('#calendar').fullCalendar({
                header: {
                    left: 'prev,next today',x`
                    center: 'title',
                    right: 'month,basicWeek,basicDay'
                },
                defaultDate: '2015-02-12',
                editable: true,
                eventLimit: true, // allow "more" link when too many events
                events: [
                    {
                        title: 'All Day Event',
                        start: '2015-02-01'
                    },
                    {
                        title: 'Long Event',
                        start: '2015-02-07',
                        end: '2015-02-10'
                    },
                    {
                        id: 999,
                        title: 'Repeating Event',
                        start: '2015-02-09T16:00:00'
                    },
                    {
                        id: 999,
                        title: 'Repeating Event',
                        start: '2015-02-16T16:00:00'
                    },
                    {
                        title: 'Conference',
                        start: '2015-02-11',
                        end: '2015-02-13'
                    },
                    {
                        title: 'Meeting',
                        start: '2015-02-12T10:30:00',
                        end: '2015-02-12T12:30:00'
                    },
                    {
                        title: 'Lunch',
                        start: '2015-02-12T12:00:00'
                    },
                    {
                        title: 'Meeting',
                        start: '2015-02-12T14:30:00'
                    },
                    {
                        title: 'Happy Hour',
                        start: '2015-02-12T17:30:00'
                    },
                    {
                        title: 'Dinner',
                        start: '2015-02-12T20:00:00'
                    },
                    {
                        title: 'Birthday Party',
                        start: '2015-02-13T07:00:00'
                    },
                    {
                        title: 'Click for Google',
                        url: 'http://google.com/',
                        start: '2015-02-28'
                    }
                ]
            });

        });

</script>--%>
    <script type="text/javascript">



        jQuery(document).ready(function () {

            $.ajax({
                type: "POST",
                contentType: "application/json",
                data: "{}",
                url: "Home.aspx/GetEvents",
                dataType: "json",
                success: function (data) {
                    $('div[id*=calendar]').fullCalendar({

                        header: {
                            //left: 'prev,next ',
                            //center: 'title',
                            //right: 'today12'

                            left: 'prev,next today',
                            center: 'title',
                            right: 'month,basicWeek,basicDay'

                        },
                        editable: true,
                        eventLimit: true,
                        events: $.map(data.d, function (item, i) {
                            var event = new Object();
                            event.id = item.EventID;
                            event.start = new Date(item.StartDate);
                            event.end = new Date(item.EndDate);
                            event.title = item.EventName;
                            event.color = item.color;
                            event.url = "Details.aspx?id=" + item.EventID;
                            return event;
                        })
                    });
                    //$("div[id=loading]").hide();
                    //$("div[id=fullcal]").show();

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                }
            });

        });

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div id='calendar'></div>
    </div>
    </form>
</body>
</html>
