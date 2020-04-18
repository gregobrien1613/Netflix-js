// function filterYears(data){
//   return parseInt(data.release_year) > 2018
// }



var query = "http://127.0.0.1:5000/data"

d3.json(query).then(function(data){

  var leadActor = data.map(d => d.actor_1_name)
  // var gross = data.map(d => d.gross)
  var movieTitle = data.map(d => d.movie_title)
  var imdb = data.map(d => d.imdb_score)
  var actorLikes = data.map(d => d.actor_1_facebook_likes)
  console.log(imdb.length);

var actor1Name = data.map(function(value1, index) {return value1['actor_1_name']});
var actor2Name = data.map(function(value2, index) {return value2['actor_2_name']});
var actor3Name = data.map(function(value3, index) {return value3['actor_3_name']});
console.log("actor 1",actor1Name)

var combined = actor1Name.concat(actor2Name, actor3Name)
console.log("combined", combined)

var group_count = {};

combined.forEach(function(value, index) {
    if (value in group_count) {
        group_count[value] += 1;
    } else {
        group_count[value] = 1;
    }
});

delete group_count.null
console.log("group count", group_count.null)


var actorCountList = Object.entries(group_count).map(([key, value]) => {
var actorDict = {
  actorName:key,
  actorCount:value
  }
  return actorDict
});
console.log("test", Object.entries(group_count))
console.log("actorCountList", actorCountList)

// var sortedCount = Object.values(group_count);

actorCountList.sort(function compareFunction(firstNum, secondNum) {
  // resulting order is (3, 2, 1)
  return secondNum.actorCount - firstNum.actorCount;
});

// var sortedNames = Object.keys.sort((a, b) => b.Object.values(group_count)) - a.Object.values(group_count);

// var top10Actors = sortedNames.slice(0, 10);
var top10Count = actorCountList.slice(0, 10);
// Returns elements at index position 0 to 9.
console.log("top10count", top10Count);

var trace = {
  x: top10Count.map(actor => actor.actorName),
  y: top10Count.map(actor => actor.actorCount),
  // text: actorLikes,
  // name: "Greek",
  type: "bar",
  // orientation: "h"
};

console.log(actor1Name)

var data = [trace];

// 7. Define our plot layout
var layout = {
  title: "Top 10 Actors",
  xaxis: {title: "Lead Actor"},
  yaxis: {title: "# of Movies"}
};

Plotly.newPlot('myDiv', data, layout)

});
