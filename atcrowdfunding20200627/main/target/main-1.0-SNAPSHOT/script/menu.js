function showMenu(){
    var href = window.location.href;
    var host = window.location.host;
    var index = href.indexOf(host);
    var path = href.substring(index + host.length);

    // var contextPath = "${APP_PATH}";
    // var pathAddress = path.substring(contextPath.length);
    // alert(path );
    var alink = $(".list-group a[href*='" + path + "']");
    alink.css("color", "red");
    alink.parent().parent().parent().removeClass("tree-closed");
    alink.parent().parent().show();
}