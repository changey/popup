var map = L.map('map').setView([42.37, -71.03], 12);

			L.tileLayer('http://{s}.tile.cloudmade.com/1dfc20ee65ee40638ed29eb7b9975515/997/256/{z}/{x}/{y}.png', {
				maxZoom : 18,
				attribution : 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>'
			}).addTo(map);
			
L.marker([42.37, -71.03], {
				'title' : 'baba'
			}).addTo(map).bindPopup("<p contenteditable=\"true\">original</p><button >Done editing</button><br />").openPopup();

			var marker = new Array();

			var popup = L.popup();
			var i = 0;
			var index;
			var latlng;

			$.getJSON('fetch', function(data) {
				$.each(data, function(index, value) {

					latlng = index.split(" ");
					add_pop(parseFloat(latlng[0]), parseFloat(latlng[1]),value);
					// L.marker([parseFloat(latlng[0]), parseFloat(latlng[1])], {
					// }).addTo(map).bindPopup("<p contenteditable=\"true\">"+value+"</p><button >Done editing</button><br />")

					//add_note(cell, cellText, value, index);
				});

			});
			
			function add_pop(lat,lng,comment){
				var domelem = document.createElement('div');
				domelem.contenteditable = "true";
				var domelem2 = document.createElement('p');
				domelem2.contenteditable = "true";
				//domelem2.value = "lala";
				domelem2.innerHTML = comment;
				domelem2.id = lat +" "+ lng;

				domelem.appendChild(domelem2);

				var domelem3 = document.createElement('button');
				var t = document.createTextNode("done editing");
				domelem3.appendChild(t);
				domelem3.id = "t" + lat + lng;
				domelem3.onclick = function() {
				
					$.ajax({
						type : 'GET',
						url : 'updatecontent?name=' + lat + " " + lng + '&content=' + document.getElementById(lat +" "+ lng).innerHTML,
						//data : data,
						success : function(data) {
							console.log("lala");
						}
					});

				};
				domelem.appendChild(domelem3);

				var mapop = new L.LatLng(lat, lng), poppy = new L.Marker(mapop, {
					
				});
				marker.push(poppy);

				poppy.addTo(map).bindPopup(domelem).openPopup();
				document.getElementById(lat +" "+ lng).contentEditable = "true";
				poppy._icon.title = i;
				i++;
			}

			function onMapClick(e) {

				var lat = e.latlng.lat.toString();
				var lng = e.latlng.lng.toString();
				var name = lat + " " + lng;

				$.ajax({
					type : 'GET',
					url : 'newtext?name=' + name,
					success : function(data) {

					}
				});
				
				add_pop(parseFloat(lat), parseFloat(lng),"Enter text");

			}


			$(document).ready(function() {
				console.log("lala");

				$('body').keyup(function(e) {
					// map.removeLayer(marker[index]);
					// marker[index].addTo(map).bindPopup("<p class=\"location\" contenteditable=\"true\">new</p><button >Done editing</button><br />").openPopup();

				});

				$('#map').mousedown(function(e) {
					index = e.target.title;
					var text = $('#pop').val();

					console.log(e.target.title);
					console.log(text);
				});
				$('#baba').onclick(function(e) {
					console.log("fafa");
				});

			});

			map.on('click', onMapClick);