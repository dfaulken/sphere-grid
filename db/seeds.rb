# CHARACTER STATS
Character.create! name: 'Tidus', color: 'blue', base_attributes: {
  'HP' => 520, 'MP' => 12,
  'Strength' => 15, 'Defense' => 5, 'Magic' => 5, 'Magic Defense' => 5,
  'Agility' => 10, 'Luck' => 18, 'Evasion' => 10, 'Accuracy' => 10
}
Character.create! name: 'Wakka', color: 'orange', base_attributes: {
  'HP' => 618, 'MP' => 10,
  'Strength' => 14, 'Defense' => 10, 'Magic' => 10, 'Magic Defense' => 5,
  'Agility' => 7, 'Luck' => 19, 'Evasion' => 5, 'Accuracy' => 25
}
Character.create! name: 'Yuna', color: 'white', base_attributes: {
  'HP' => 475, 'MP' => 84,
  'Strength' => 5, 'Defense' => 5, 'Magic' => 20, 'Magic Defense' => 20,
  'Agility' => 10, 'Luck' => 17, 'Evasion' => 30, 'Accuracy' => 3
}
Character.create! name: 'Lulu', color: 'purple', base_attributes: {
  'HP' => 380, 'MP' => 92,
  'Strength' => 5, 'Defense' => 8, 'Magic' => 20, 'Magic Defense' => 30,
  'Agility' => 5, 'Luck' => 17, 'Evasion' => 40, 'Accuracy' => 3
}
Character.create! name: 'Kimahri', color: 'dark blue', base_attributes: {
  'HP' => 644, 'MP' => 78,
  'Strength' => 16, 'Defense' => 15, 'Magic' => 17, 'Magic Defense' => 5,
  'Agility' => 6, 'Luck' => 18, 'Evasion' => 5, 'Accuracy' => 5
}
Character.create! name: 'Auron', color: 'red', base_attributes: {
  'HP' => 1030, 'MP' => 33,
  'Strength' => 20, 'Defense' => 15, 'Magic' => 5, 'Magic Defense' => 5,
  'Agility' => 5, 'Luck' => 17, 'Evasion' => 5, 'Accuracy' => 3
}
Character.create! name: 'Rikku', color: 'green', base_attributes: {
  'HP' => 360, 'MP' => 85,
  'Strength' => 10, 'Defense' => 8, 'Magic' => 10, 'Magic Defense' => 8,
  'Agility' => 16, 'Luck' => 18, 'Evasion' => 5, 'Accuracy' => 5
}

def node(n)
  Node.find(n)
end

Node.create! x: 862, y: 914
Node.create! x: 862, y: 818, connections: [[node(1).x, node(1).y]]
Ability.create! name: 'Cheer', node: node(2)
Node.create! x: 904, y: 818, attribute_name: 'Defense', value: 2, connections: [[node(2).x, node(2).y]]
Node.create! x: 904, y: 776, attribute_name: 'Agility', value: 1, connections: [[node(3).x, node(3).y]]
Node.create! x: 882, y: 798, attribute_name: 'Strength', value: 1, connections: [[node(4).x, node(4).y]]
Node.create! x: 862, y: 776, attribute_name: 'Accuracy', value: 1, connections: [[node(5).x, node(5).y]]
Node.create! x: 862, y: 728, connections: [[node(6).x, node(6).y]]
Ability.create! name: 'Flee', node: node(7)
Node.create! x: 818, y: 776, connections: [[node(7).x, node(7).y]]
Node.create! x: 776, y: 776, connections: [[node(8).x, node(8).y]]
Node.create! x: 796, y: 798, connections: [[node(9).x, node(9).y]]
Ability.create! name: 'Extract Power', node: node(10)
Node.create! x: 818, y: 818, connections: [[node(10).x, node(10).y]]
Node.create! x: 776, y: 818, connections: [[node(11).x, node(11).y]]
Node.create! x: 862, y: 690, attribute_name: 'Strength', value: 1, connections: [[node(7).x, node(7).y]]
