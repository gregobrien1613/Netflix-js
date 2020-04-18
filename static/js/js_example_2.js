function filterYears(data){
    return parseInt(data.release_year) > 2019
  }
  
  
  var query = "http://127.0.0.1:5000/data2"
  
  d3.json(query).then(function(data){
  
    var budget = data.map(d => d.budget)
    var gross = data.map(d => d.gross)
    var title = data.map(d => d.movie_title)
    var imdb = data.map(d => d.imdb_score)
    console.log(imdb.length);
  
  var trace = {
    x: budget,
    y: gross,
    mode: 'markers',
    type: 'scatter'
  };
  
  var data = [trace];
  
  // 7. Define our plot layout
  var layout = {
    title: "Budget vs Gross",
    xaxis: { title: "Budget" },
    yaxis: { title: "Gross"}
  };
  
  Plotly.newPlot('myDiv', data)
  
  });

