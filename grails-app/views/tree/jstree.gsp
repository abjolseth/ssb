<%--
  Created by IntelliJ IDEA.
  User: abj
  Date: 14.02.15
  Time: 21.33
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <%-- Sitemesh template layout directive --%>
    <meta name="layout" content="main"/>
    <title>JSTree Demo page</title>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/jquery.jstree/3.0.0-beta10/themes/default/style.css">
    <script src="//cdn.jsdelivr.net/jquery.jstree/3.0.0-beta10/jstree.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/css/bootstrap-select.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-md-3">
            <g:render template="/tpl/menu"/>
        </div>

        <div class="col-md-9">
            <div class="row">
                <%--
                <div class="btn-group" role="group" aria-label="ajaxToolbar">
                    <button id="get" type="button" class="btn btn-default">GET</button>
                    <button id="post" type="button" class="btn btn-default">POST</button>
                    <button type="button" class="btn btn-default">Right</button>
                </div>
                --%>
                <select class="selectpicker" data-live-search="true" data-size="auto">
                    <option>Mustard</option>
                    <option>Ketchup</option>
                    <option>Relish</option>
                </select>
            </div>
            <div class="row">
                <div id="treewidget"></div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function(){
        $('.selectpicker').selectpicker();
        $('.selectpicker').change(function(){
            var item = $('.selectpicker :selected').val();
            console.log('item',item);
            var param = {getid:item};

            $.get('/ssb/tree/getaction', param, function(result, textStatus){
                //console.log(result);
                //console.log('textStatus',textStatus);
                var json = $.parseJSON(result);
                if ($('#treewidget ul').length){
                    $('#treewidget').jstree(true).settings.core.data = json;
                    $('#treewidget').jstree(true).refresh();
                }
                else {
                    $('#treewidget').jstree({
                        'plugins': [],
                        'core' : {
                            'data' : json
                        }
                    });
                }
            });
        });
    });
</script>
</body>
</html>