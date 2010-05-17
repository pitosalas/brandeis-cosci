// $Id: ruby-source.js 111 2008-03-04 13:50:04Z jgn $
function sendSource() {
  var j = new Object;
  var textareas = document.getElementsByTagName('textarea');
  for (var i = 0; i < textareas.length; i++) {
    var e = textareas[i];
    j[e.id] = e.value;
  }
  js = j.toJSONString();
  location = location + "#" + encodeURI(js);
}
