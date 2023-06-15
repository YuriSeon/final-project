// 태그생성 함수
function makeTag(tagName, type, name){
	return $("<"+tagName+">").prop(type, name);
}

function makeTag(tagName, type, name, type2, name2){
	return $("<"+tagName+">").prop(type, name).prop(type2, name2);
}

// 지도 태그내의 상세정보 가져오는 함수
function infoFind(type, tagName, num){
	return $(type).children(tagName).children().eq(num).text();
}