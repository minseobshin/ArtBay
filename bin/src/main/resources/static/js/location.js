$(function() {
	//지도 생성
	var container = document.getElementById('map');
	var options = {
		center: new kakao.maps.LatLng(37.480969, 126.952147), 
		level: 3 //지도의 레벨(확대, 축소 정도)
	};
	var map = new kakao.maps.Map(container, options);
	
	//마커
	var marker = new kakao.maps.Marker({ 	    
	    position: map.getCenter() 
	}); 
	marker.setMap(map);
	
	//줌 컨트롤
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
});