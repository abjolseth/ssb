package org.ssb

class AjaxController {

    def index() {
        render (view: 'ajax')
    }
    def getaction() {
        println params.getid
        //@See http://api.jquery.com/jquery.parsejson/
        def jsonData = """\"{'hello':'world'}\"""";
        render(jsonData, contentType:"text/javascript", status: 200)
    }
    def postaction(){
        println params.postid
        render('OK', status: 200)
    }
}
