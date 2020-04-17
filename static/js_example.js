
var query = "/data2"

d3.json(query).then(function(data) {

  console.log(data);

  var budget = data.map(d => parseInt(d.budget));
  var gross = data.map(d => parseInt(d.gross));
  var score = data.map(d => parseInt(d.imdb_score));
  var titles = data.map(d => d.movie_title);

console.log(titles);
console.log(gross);
console.log(budget);

});
// Create the Trace
// var trace1 = {
//   x: data.,
//   y: data.duration,
//   type: "bar"
// };
//
// // Create the data array for the plot
// var data = [trace1];
//
// // Define the plot layout
// var layout = {
//   title: "Eye Color vs Flicker",
//   xaxis: { title: "Eye Color" },
//   yaxis: { title: "Flicker Frequency" }
// };
//
// // Plot the chart to a div tag with id "bar-plot"
// Plotly.newPlot("bar-plot", data, layout);
// })
