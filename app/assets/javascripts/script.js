$(function () {

    function getTime(){
        $.ajax({
            url: '/',
            dataType: 'json',
            complete: function(xhr){
                var ts = new Date($.parseJSON(xhr.responseText)['time'])
                $('#countdown').countdown({
                    timestamp: ts,
                    callback: function (days, hours, minutes, seconds) {
                        if (days <= 0 && hours <= 0 && minutes <= 0 && seconds <= 0){
                            $.ajax({
                                url: '/assign',
                                dataType: 'script'
                            });

                            $.ajax({
                                url:'/',
                                data: null,
                                dataType: 'script'
                            });
                        }
                    }
                });
            }
        });
    }

    getTime();
});