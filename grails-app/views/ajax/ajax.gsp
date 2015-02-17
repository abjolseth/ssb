<%--
  Created by IntelliJ IDEA.
  User: abj
  Date: 14.02.15
  Time: 15.32
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <%-- Sitemesh template layout directive --%>
    <meta name="layout" content="main"/>
    <title>Ajax demo page</title>
    <script>
        var onSuccess = function(response){
            console.log(response);
            var json = JSON.parse(response);
            $('#ajaxresult').text(response);
        };
        function onFailure(){
            console.log('onFailure');
        }
    </script>
</head>

<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-3">
            <g:render template="/tpl/menu"/>
        </div>

        <div class="col-md-9">
            <div class="row">
<g:remoteLink action="getaction" method="GET" params="['getid':'g-message']" onSuccess="onSuccess(data)" onFailure="onFailure()">g:remoteLink</g:remoteLink>
                <div class="btn-group" role="group" aria-label="ajaxToolbar">
                    <button id="get" type="button" class="btn btn-default">GET</button>
                    <button id="post" type="button" class="btn btn-default">POST</button>
                </div>

                <code id="ajaxresult"></code>
            </div>
        </div>
    </div>
    </div>
</div>
<script>
    $('#get').click(function(){
        var param = {getid:'get-message'};
        $.get('/ssb/ajax/getaction', param, function(result, textStatus){
            console.log(result);
            console.log('textStatus',textStatus);
            /*
            console.log(result.split(''));
            var obj = eval("(" + result + ')');
            console.log(obj.hello);
            */
            var json = $.parseJSON(result);
            $('#ajaxresult').text(json);
            console.log(json);
        });
        /*
        $.get('/ssb/ajax/getaction', param).then(
                function() {
                    alert( "$.get succeeded" );
                }, function() {
                    alert( "$.get failed!" );
                }
        );
        */
        //console.log(ajax.success(function(){}));
    });

    $('#post').click(function() {
        var param = {postid:'post-message'};
        $.post('/ssb/ajax/postaction', param, function (responseObj, textStatus) {
            console.log('textStatus',textStatus);
            console.log('responseObj',responseObj);
            $('#ajaxresult').text(responseObj);

        });
    });
</script>
</body>
</html>