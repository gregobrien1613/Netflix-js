var query3 = "/data3"

d3.json(query3).then(function(data) {
  createMap(data);
});

function bindPopMaker(feature, layer) {
  layer.bindPopup("<h3>" + feature.country +
    "</h3><hr><p>" + feature.total_movies + "</p>");
}

function ColorCheck(d) {
  if (d >= 100000000000) {
      return "red";
  } else if (d >= 10000000000) {
      return "orange";
  } else if (d >= 5000000000) {
      return "yellow";
  } else if (d >= 10000000) {
      return "green";
  } else if (d >= 1000000) {
      return "blue";
  }
   else {
      return "black";
  };
}

function createMap(movieData) {
movie_Data = movieData.map((feature) =>
L.circle([feature.CapitalLatitude,feature.CapitalLongitude], {
  color: "red",
  fillColor: "red",
  fillOpacity: 0.75,
  radius: 200000
}).bindPopup("<h2> Country : " + feature.country +
"</h2><hr><h3> Total Movies: " + feature.total_movies +
"</h3><hr><p> Total Budget: " + feature.total_budget + "</p>")
)

var movie_Data=L.layerGroup(movie_Data)
  
   
  
  var worldmap = L.tileLayer("https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}", {
    attribution: "Map data &copy; <a href=\"https://www.openstreetmap.org/\">OpenStreetMap</a> contributors, <a href=\"https://creativecommons.org/licenses/by-sa/2.0/\">CC-BY-SA</a>, Imagery © <a href=\"https://www.mapbox.com/\">Mapbox</a>",
    maxZoom: 18,
    id: "mapbox.streets",
    accessToken: API_KEY
  });

  var baseMaps = {
    "World Map" : worldmap
  
  };

  
  var overlayMaps = {
    Movie_Data: movie_Data
  };

  
  var myMap = L.map("map", {
    center: [
      0,0
    ],
    zoom: 2.5,
    layers: [worldmap,movie_Data]
  });

  L.control.layers(baseMaps, overlayMaps, {
    collapsed: false
  }).addTo(myMap);


var legend = L.control({position: 'bottomright'});

legend.onAdd = function () {

  var div = L.DomUtil.create('div', 'info legend'),
  labels = ['<strong>Categories</strong>'],
  categories = [999999, 1000000, 10000000, 5000000000, 10000000000, 100000000000];

  for (var i = 0; i < categories.length; i++) {
    div.innerHTML += 
    labels.push(
        '<i style="background:' + ColorCheck(categories[i]) + '"></i> ' +
        (categories[i] ? categories[i] : '+'));
}

div.innerHTML = labels.join('<br>');
return div;

 };

legend.addTo(myMap);
  
}