// 태그생성 함수
function makeTag(tagName, attributes){
	  var $tag = $("<" + tagName + ">");
	  for (var at in attributes) {
		  if(at != "name"){
		    $tag.prop(at, attributes[at]);
		  } else {
		  	$tag.attr(at, attributes[at]);
		  }
	  }
		  return $tag;
}
// 지도 태그내의 상세정보 가져오는 함수
function infoFind(type, tagName, num){
	return $(type).children(tagName).children().eq(num).text();
}