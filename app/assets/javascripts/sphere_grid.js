ATTRIBUTE_ABBREVIATIONS = {
  'HP':            'HP',
  'MP':            'MP',
  'Strength':      'STR',
  'Defense':       'DEF',
  'Magic':         'MAG',
  'Magic Defense': 'MDef',
  'Agility':       'AGL',
  'Luck':          'Luck',
  'Evasion':       'EVA',
  'Accuracy':      'ACC'
}

ATTRIBUTE_COLORS = {
  'HP':            '#ade6b0',
  'MP':            '#ade6cc',
  'Strength':      '#e6adad',
  'Defense':       '#adcbe6',
  'Magic':         '#e1ade6',
  'Magic Defense': '#b9ade6',
  'Agility':       '#e6c9ad',
  'Luck':          '#e6daad',
  'Evasion':       '#b2e6ad',
  'Accuracy':      '#e6adc7'
}

$(document).ready(function(){
  CANVAS = Raphael('sphere-grid', '100%', '100%');

  var characterName = 'Tidus';
  var characterColor = 'blue';

  $('#character-tabs').tabs({
    heightStyle: 'fill'
  });
  initializeSphereGrid();

  $('#info-panel').on('click', '.character-name', initializeSphereGrid);

  function initializeSphereGrid(){
    characterName = $('li.character-name.ui-state-active:eq(0)').data('name');
    characterColor = $('li.character-name.ui-state-active:eq(0)').data('color');
    $.get('/node_data', function(nodes){
      CANVAS.clear();
      _.each(nodes, drawNode);
    });
  }

  function drawNode(node){
    var circle = CANVAS.circle(node.x, node.y, 13);
    _.each(node.connections, function(connection){
      drawConnection(node.x, node.y, connection[0], connection[1]);
    });
    if(node.attribute_name) drawStatNode(circle, node);
    else if(node.ability) drawAbilityNode(circle, node);
    else if(node.lock_level) drawLockNode(circle, node);
    else circle.attr({fill: 'silver'}); // empty node
    // drawNodeId(node);
  }

  function drawConnection(start_x, start_y, end_x, end_y){
    var pathString = ['M', start_x, start_y, 'L', end_x, end_y].join(' ');
    CANVAS.path(pathString).attr('stroke-width', 2).toBack();
  }

  function drawStatNode(circle, node){
    circle.attr({fill: ATTRIBUTE_COLORS[node.attribute_name]});
    CANVAS.text(node.x, node.y - 4, ATTRIBUTE_ABBREVIATIONS[node.attribute_name]).attr('font-size', 8);
    var valueFontSize = node.attribute_name == 'HP' ? 10 : 12;
    CANVAS.text(node.x, node.y + 5, node.value).attr('font-size', valueFontSize);
    if(node.characters) drawCharacterActivation(node, circle);
  }

  function drawAbilityNode(circle, node){
    circle.attr({fill: 'palevioletred', title: node.ability.name});
    if(_.contains(node.ability.name, ' ')){
      var abilityWords = node.ability.name.split(' ');
      CANVAS.text(node.x, node.y - 4, abilityWords[0]).attr('font-size', 6);
      CANVAS.text(node.x, node.y + 4, abilityWords[1]).attr('font-size', 6);
    }
    else CANVAS.text(node.x, node.y, node.ability.name).attr('font-size', 6);
    if(node.characters) drawCharacterActivation(node, circle);
  }

  function drawLockNode(circle, node){
    circle.attr({fill: 'black'});
    CANVAS.text(node.x, node.y - 5, 'LV.').attr({fill: 'red', 'font-size': 8});
    CANVAS.text(node.x, node.y + 5, node.lock_level).attr({fill: 'red', 'font-size': 12});
  }

  function drawNodeId(node){
    CANVAS.text(node.x + 13, node.y - 13, node.id).attr({fill: 'grey', 'font-size': 6});
  }

  function drawCharacterActivation(node, circle){
    var charNames = _.map(node.characters, 'name');
    if(_.contains(charNames, characterName)){
      var activationCircle = CANVAS.circle(node.x, node.y, 15)
        .attr({stroke: characterColor, 'stroke-width': 5})
        .toBack();
    }
  }
});
