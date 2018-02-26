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

  var activations = [];
  var characterName = 'Tidus';
  var characterColor = 'blue';

  $('#character-tabs').tabs({ heightStyle: 'fill' });
  initializeSphereGrid();

  $('#info-panel').on('click', '.character-name', initializeSphereGrid);

  function initializeSphereGrid(){
    characterName = $('li.character-name.ui-state-active:eq(0)').data('name');
    characterColor = $('li.character-name.ui-state-active:eq(0)').data('color');
    _.each(activations, function(circle){ circle.remove(); });
    activations = [];
    $.get('/node_data', function(nodes){
      CANVAS.clear();
      _.each(nodes, drawNode);
    });
  }

  function drawNode(node){
    var circle = CANVAS.circle(node.x, node.y, 13)
    _.each(node.connections, function(connection){
      drawConnection(node.x, node.y, connection[0], connection[1]);
    });
    if (node.attribute_name) drawStatNode(circle, node);
    else if (node.ability) drawAbilityNode(circle, node);
    else if (node.lock_level) drawLockNode(circle, node);
    else drawEmptyNode(circle, node);
  }

  function drawConnection(start_x, start_y, end_x, end_y){
    var pathString = ['M', start_x, start_y, 'L', end_x, end_y].join(' ');
    CANVAS.path(pathString).attr('stroke-width', 2).toBack();
  }

  function drawEmptyNode(circle, node){
    circle.attr({fill: 'silver'})
          .dblclick(function(){ showNodePanel(node) });
  }

  function drawStatNode(circle, node){
    circle.attr({fill: ATTRIBUTE_COLORS[node.attribute_name]}).data(node)
          .click(function(){ toggleCharacterActivation(node) })
          .dblclick(function(){ showNodePanel(node) });
    CANVAS.text(node.x, node.y - 4, ATTRIBUTE_ABBREVIATIONS[node.attribute_name]).attr('font-size', 8);
    var valueFontSize = node.attribute_name == 'HP' ? 10 : 12;
    CANVAS.text(node.x, node.y + 5, node.value).attr('font-size', valueFontSize);
    if (characterHasActivated(node)) drawCharacterActivation(node);
  }

  function drawAbilityNode(circle, node){
    circle.attr({fill: 'palevioletred', title: node.ability.name}).data(node)
          .click(function(){ toggleCharacterActivation(node) })
          .dblclick(function(){ showNodePanel(node) });
    if (_.contains(node.ability.name, ' ')){
      var abilityWords = node.ability.name.split(' ');
      CANVAS.text(node.x, node.y - 4, abilityWords[0]).attr('font-size', 6);
      CANVAS.text(node.x, node.y + 4, abilityWords[1]).attr('font-size', 6);
    }
    else CANVAS.text(node.x, node.y, node.ability.name).attr('font-size', 6);
    if (characterHasActivated(node)) drawCharacterActivation(node);
  }

  function drawLockNode(circle, node){
    circle.attr({fill: 'black'});
    CANVAS.text(node.x, node.y - 5, 'LV.').attr({fill: 'red', 'font-size': 8});
    CANVAS.text(node.x, node.y + 5, node.lock_level).attr({fill: 'red', 'font-size': 12});
  }

  function characterHasActivated(node){
    var charNames = _.map(node.characters, 'name');
    return _.contains(charNames, characterName);
  }

  function drawCharacterActivation(node){
    var activation = CANVAS.circle(node.x, node.y, 15)
      .attr({stroke: characterColor, 'stroke-width': 5})
      .toBack();
    activations.push(activation);
  }

  function removeCharacterActivation(node){
    var matchingElements = CANVAS.getElementsByPoint(node.x, node.y + 14);
    var activationCircle = _.find(matchingElements, function(element){
      return element.type == 'circle' 
    });
    if (activationCircle !== undefined) activationCircle.remove();
  }
 
  function toggleCharacterActivation(node){
    $.post('/toggle_node', { character: characterName, id: node.id }, function(response){
      reloadCharacterInfo();
      if (response.activated) drawCharacterActivation(node);
      else removeCharacterActivation(node);
    });
  }

  function reloadCharacterInfo(){
    $.get('/character_info?character=' + characterName, function(resultHtml){
      $('.character-info:visible').html(resultHtml);
    });
  }

  function showNodePanel(node){
    var panel = $('#node-panel');
    panel.find('.node-attrs#id').text(node.id);
    panel.find('.node-attrs#x').text(node.x);
    panel.find('.node-attrs#y').text(node.y);
    var nodeAttr;
    if(node.attribute_name) nodeAttr = node.attribute_name;
    panel.find('.node-attrs#attribute').text(node.attribute_name);
    var nodeValue;
    if(node.value) nodeValue = node.value;
    panel.find('.node-attrs#value').text(nodeValue);
    var abilityName;
    if (node.ability) abilityName = node.ability.name;
    panel.find('.node-attrs#ability').text(abilityName);
    var lockLevel;
    if (node.lock_level) lockLevel = node.lock_level
    panel.find('.node-attrs#lock_level').text(lockLevel);
  }
});
