function initMap(){
	var tyumen = {lat: 57.160455, lng: 65.525232};
	var isDraggable;
	if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
		isDraggable = false;
	} else{
		isDraggable = true;
	}

	var myMap = new google.maps.Map(document.getElementById('map'), {
		center: tyumen,
		zoom: 14,
		draggable:isDraggable,
		disableDefaultUI:true,
		scrollwheel: false,
		styles: [{"featureType":"administrative","elementType":"labels.text.fill","stylers":[{"color":"#444444"}]},{"featureType":"landscape","elementType":"all","stylers":[{"color":"#f2f2f2"}]},{"featureType":"landscape","elementType":"labels.text","stylers":[{"visibility":"on"},{"hue":"#ff0000"}]},{"featureType":"poi","elementType":"all","stylers":[{"visibility":"off"}]},{"featureType":"road","elementType":"all","stylers":[{"saturation":-100},{"lightness":45}]},{"featureType":"road.highway","elementType":"all","stylers":[{"visibility":"simplified"}]},{"featureType":"road.arterial","elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"featureType":"transit","elementType":"all","stylers":[{"visibility":"off"}]},{"featureType":"water","elementType":"all","stylers":[{"color":"#10ade4"},{"visibility":"on"}]}],
	});
	var markerTyumen = new google.maps.Marker({
		position: tyumen,
		map: myMap,
		title: 'Тюмень',
		icon: 'templates/assets/img/svg-for-sprites/pin-red.png'
	});
	var contentStringTyumen = '<div id="content">'+
	      '<div id="siteNotice">'+
	      '</div>'+
	      '<h1 id="firstHeading" class="firstHeading">Тюмень</h1>'+
	      '<div id="bodyContent">'+
	      '<p>Тюменская область<br>' +
	      'Тюмень, Россия</p>'+
	      '</div>'+
	      '</div>';
	var infowindowTyumen = new google.maps.InfoWindow({
		content: contentStringTyumen,
		maxWidth: 400
	});
	markerTyumen.addListener('click', function() {
		infowindowTyumen.open(myMap, markerTyumen);
	});
};
