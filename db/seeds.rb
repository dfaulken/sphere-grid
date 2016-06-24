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
  [Node.find(n).x, Node.find(n).y]
end

Node.create! x: 862, y: 914
Node.create! x: 862, y: 818, connections: [node(1)]
Ability.create! name: 'Cheer', node: Node.find(2)
Node.create! x: 904, y: 818, attribute_name: 'Defense', value: 2, connections: [node(2)]
Node.create! x: 904, y: 776, attribute_name: 'Agility', value: 1, connections: [node(3)]
Node.create! x: 882, y: 798, attribute_name: 'Strength', value: 1, connections: [node(4)]
Node.create! x: 862, y: 776, attribute_name: 'Accuracy', value: 1, connections: [node(5)]
Node.create! x: 862, y: 728, connections: [node(6)]
Ability.create! name: 'Flee', node: Node.find(7)
Node.create! x: 818, y: 776, connections: [node(7)]
Node.create! x: 776, y: 776, connections: [node(8)]
Node.create! x: 796, y: 798, connections: [node(9)]
Ability.create! name: 'Extract Power', node: Node.find(10)
Node.create! x: 818, y: 818, connections: [node(10)]
Node.create! x: 776, y: 818, connections: [node(11)]
Node.create! x: 862, y: 690, attribute_name: 'Strength', value: 1, connections: [node(7)]
Node.create! x: 862, y: 655, attribute_name: 'Evasion', value: 2, connections: [node(13)]
Node.create! x: 862, y: 620, connections: [node(14)]
Ability.create! name: 'Haste', node: Node.find(15)
Node.create! x: 862, y: 582, attribute_name: 'Strength', value: 1, connections: [node(15)]
Node.create! x: 898, y: 620, connections: [node(16)]
Ability.create! name: 'Extract Speed', node: Node.find(17)
Node.create! x: 888, y: 646, attribute_name: 'Magic Defense', value: 3, connections: [node(17)]
Node.create! x: 914, y: 672, attribute_name: 'Magic', value: 3, connections: [node(18)]
Node.create! x: 808, y: 672, attribute_name: 'MP', value: 20, connections: [node(16)]
Node.create! x: 784, y: 696, attribute_name: 'HP', value: 200, connections: [node(20)]
Node.create! x: 704, y: 768, connections: [node(21)]
Node.create! x: 652, y: 746, connections: [node(22)]
Node.create! x: 652, y: 716, lock_level: 1, connections: [node(23)]
Node.create! x: 724, y: 818, attribute_name: 'HP', value: 200, connections: [node(22), node(12)]
Node.create! x: 704, y: 872, connections: [node(25)]
Node.create! x: 784, y: 946, connections: [node(26)]
Node.create! x: 652, y: 946, connections: [node(27)]
Ability.create! name: 'Power Break', node: Node.find(28)
Node.create! x: 652, y: 890, lock_level: 2, connections: [node(28)]
Node.create! x: 652, y: 854, attribute_name: 'Magic Defense', value: 4, connections: [node(29)]
Node.create! x: 690, y: 818, attribute_name: 'Magic Defense', value: 4, connections: [node(30)]
Node.create! x: 652, y: 782, lock_level: 4, connections: [node(31)]
Node.create! x: 616, y: 818, lock_level: 4, connections: [node(32)]
Node.create! x: 652, y: 818, connections: [node(33)]
Ability.create! name: 'Full Break', node: Node.find(34)
Node.create! x: 600, y: 768, attribute_name: 'HP', value: 200, connections: [node(23)]
Node.create! x: 580, y: 818, connections: [node(35)]
Ability.create! name: 'Guard', node: Node.find(36)
Node.create! x: 600, y: 872, connections: [node(36)]
Node.create! x: 540, y: 910, connections: [node(37)]
Node.create! x: 464, y: 948, attribute_name: 'Magic', value: 2, connections: [node(38)]
Node.create! x: 518, y: 968, attribute_name: 'Agility', value: 2, connections: [node(39)]
Node.create! x: 538, y: 1020, attribute_name: 'Accuracy', value: 2, connections: [node(40)]
Node.create! x: 650, y: 1020, connections: [node(41)]
Node.create! x: 464, y: 984, connections: [node(39)]
Node.create! x: 464, y: 1020, connections: [node(43)]
Ability.create! name: 'Silence Attack', node: Node.find(44)
Node.create! x: 492, y: 996, attribute_name: 'Strength', value: 1, connections: [node(44)]
Node.create! x: 492, y: 1048, attribute_name: 'Accuracy', value: 2, connections: [node(45)]
Node.create! x: 518, y: 1072, connections: [node(46)]
Node.create! x: 464, y: 1094, attribute_name: 'Strength', value: 1, connections: [node(47)]
Node.create! x: 414, y: 1072, attribute_name: 'HP', value: 200, connections: [node(48)]
Node.create! x: 436, y: 1048, lock_level: 3, connections: [node(44)]
Node.create! x: 436, y: 996, connections: [node(50)]
Node.create! x: 414, y: 968, attribute_name: 'Magic', value: 4, connections: [node(51)]
Node.create! x: 392, y: 1020, attribute_name: 'HP', value: 200, connections: [node(52)]
Node.create! x: 338, y: 966, connections: [node(53)]
Node.create! x: 338, y: 1008, connections: [node(54)]
Node.create! x: 318, y: 986, connections: [node(55)]
Ability.create! name: 'Zombie Attack', node: Node.find(56)
Node.create! x: 294, y: 966, attribute_name: 'Strength', value: 2, connections: [node(56)]
Node.create! x: 294, y: 1008, attribute_name: 'Magic', value: 2, connections: [node(57)]
