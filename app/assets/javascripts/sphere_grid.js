ATTRIBUTE_COLORS = {
  'HP':            'green',
  'MP':            'green',
  'Strength':      'red',
  'Defense':       'blue',
  'Magic':         'purple',
  'Magic Defense': 'purple',
  'Agility':       'yellow',
  'Luck':          'gold',
  'Evasion':       'white',
  'Accuracy':      'orange'
}

$(document).ready(function(){
  CANVAS = Raphael('sphere-grid', '100%', '100%');


  $.get('/node_data', function(nodes){
    _.each(nodes, drawNode);
  });

  function drawNode(node){
    var circle = CANVAS.circle(node.x, node.y, 10);
    _.each(node.connections, function(connection){
      drawConnection(node.x, node.y, connection[0], connection[1]);
    });
    if(node.attribute_name){
      circle.attr({fill: ATTRIBUTE_COLORS[node.attribute_name]});
    }
    else circle.attr({fill: 'black'});
  }

  function drawConnection(start_x, start_y, end_x, end_y){
    var pathString = ['M', start_x, start_y, 'L', end_x, end_y].join(' ');
    CANVAS.path(pathString).toBack();
  }
});
