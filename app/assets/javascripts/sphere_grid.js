ATTRIBUTE_ABBREVIATIONS = {
  'HP':            'HP',
  'MP':            'MP',
  'Strength':      'STR',
  'Defense':       'DEF',
  'Magic':         'MAG',
  'Magic Defense': 'MDEF',
  'Agility':       'AGL',
  'Luck':          'LUCK',
  'Evasion':       'EVA',
  'Accuracy':      'ACC'
}

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
    var circle = CANVAS.circle(node.x, node.y, 13);
    _.each(node.connections, function(connection){
      drawConnection(node.x, node.y, connection[0], connection[1]);
    });
    if(node.attribute_name){
      circle.attr({fill: ATTRIBUTE_COLORS[node.attribute_name]});
      CANVAS.text(node.x, node.y - 4, ATTRIBUTE_ABBREVIATIONS[node.attribute_name]).attr('font-size', 8);
      var valueFontSize = node.attribute_name == 'HP' ? 10 : 12;
      CANVAS.text(node.x, node.y + 5, node.value).attr('font-size', valueFontSize);
    }
    else if(node.ability){
      circle.attr({fill: 'pink', title: node.ability.name});
      CANVAS.text(node.x, node.y, 'A').attr({fill: 'grey', 'font-size': 14});
    }
    else if(node.lock_level){
      circle.attr({fill: 'black'});
      CANVAS.text(node.x, node.y - 5, 'LV.').attr({fill: 'red', 'font-size': 8});
      CANVAS.text(node.x, node.y + 5, node.lock_level).attr({fill: 'red', 'font-size': 12});
    }
    else circle.attr({fill: 'grey'});
  }

  function drawConnection(start_x, start_y, end_x, end_y){
    var pathString = ['M', start_x, start_y, 'L', end_x, end_y].join(' ');
    CANVAS.path(pathString).attr('stroke-width', 2).toBack();
  }

});
