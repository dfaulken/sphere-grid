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

Node.create! x: 858, y: 914
Node.create! x: 858, y: 818, connections: [node(1)]
Ability.create! name: 'Cheer', node: Node.find(2)
Node.create! x: 904, y: 818, attribute_name: 'Defense', value: 2, connections: [node(2)]
Node.create! x: 904, y: 776, attribute_name: 'Agility', value: 1, connections: [node(3)]
Node.create! x: 882, y: 798, attribute_name: 'Strength', value: 1, connections: [node(4)]
Node.create! x: 858, y: 776, attribute_name: 'Accuracy', value: 1, connections: [node(5)]
Node.create! x: 858, y: 728, connections: [node(6)]
Ability.create! name: 'Flee', node: Node.find(7)
Node.create! x: 818, y: 776, connections: [node(7)]
Node.create! x: 776, y: 776, connections: [node(8)]
Node.create! x: 796, y: 798, connections: [node(9)]
Ability.create! name: 'Extract Power', node: Node.find(10)
Node.create! x: 818, y: 818, connections: [node(10)]
Node.create! x: 776, y: 818, connections: [node(11)]
Node.create! x: 858, y: 690, attribute_name: 'Strength', value: 1, connections: [node(7)]
Node.create! x: 858, y: 655, attribute_name: 'Evasion', value: 2, connections: [node(13)]
Node.create! x: 858, y: 620, connections: [node(14)]
Ability.create! name: 'Haste', node: Node.find(15)
Node.create! x: 858, y: 582, attribute_name: 'Strength', value: 1, connections: [node(15)]
Node.create! x: 894, y: 620, connections: [node(16)]
Ability.create! name: 'Extract Speed', node: Node.find(17)
Node.create! x: 886, y: 648, attribute_name: 'Magic Defense', value: 3, connections: [node(17)]
Node.create! x: 914, y: 672, attribute_name: 'Magic', value: 3, connections: [node(18)]
Node.create! x: 808, y: 672, attribute_name: 'MP', value: 20, connections: [node(15)]
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
Node.create! x: 858, y: 546, attribute_name: 'Agility', value: 2, connections: [node(16)]
Node.create! x: 910, y: 566, attribute_name: 'Defense', value: 2, connections: [node(59)]
Node.create! x: 930, y: 620, attribute_name: 'Strength', value: 1, connections: [node(60)]
Node.create! x: 966, y: 620, connections: [node(61)]
Ability.create! name: 'Provoke', node: Node.find(62)
Node.create! x: 934, y: 542, attribute_name: 'MP', value: 20, connections: [node(62)]
Node.create! x: 858, y: 510, attribute_name: 'HP', value: 200, connections: [node(63)]
Node.create! x: 782, y: 542, attribute_name: 'Agility', value: 3, connections: [node(64)]
Node.create! x: 806, y: 566, attribute_name: 'Defense', value: 2, connections: [node(65)]
Node.create! x: 786, y: 620, connections: [node(66)]
Ability.create! name: 'Delay Attack', node: Node.find(67)
Node.create! x: 822, y: 620, lock_level: 1, connections: [node(67)]
Node.create! x: 832, y: 592, attribute_name: 'Magic', value: 4, connections: [node(68)]
Node.create! x: 750, y: 620, attribute_name: 'MP', value: 20, connections: [node(67)]
Node.create! x: 1028, y: 620, lock_level: 1, connections: [node(62)]
Node.create! x: 1028, y: 728, attribute_name: 'MP', value: 20, connections: [node(71)]
Node.create! x: 1080, y: 750, attribute_name: 'Magic', value: 2, connections: [node(72)]
Node.create! x: 1150, y: 750, attribute_name: 'Accuracy', value: 1, connections: [node(73)]
Node.create! x: 1100, y: 802, lock_level: 2, connections: [node(73)]
Node.create! x: 1080, y: 856, attribute_name: 'Accuracy', value: 2, connections: [node(75)]
Node.create! x: 1056, y: 828, attribute_name: 'Defense', value: 2, connections: [node(76)]
Node.create! x: 1064, y: 802, attribute_name: 'MP', value: 20, connections: [node(77)]
Node.create! x: 1028, y: 766, attribute_name: 'Magic', value: 3, connections: [node(78)]
Node.create! x: 1028, y: 802, attribute_name: 'HP', value: 200, connections: [node(79)]
Node.create! x: 992, y: 802, attribute_name: 'Strength', value: 2, connections: [node(80)]
Node.create! x: 1000, y: 828, attribute_name: 'Agility', value: 3, connections: [node(81)]
Node.create! x: 1028, y: 838, attribute_name: 'HP', value: 200, connections: [node(82)]
Node.create! x: 1028, y: 874, connections: [node(83)]
Node.create! x: 976, y: 856, connections: [node(84)]
Node.create! x: 956, y: 802, connections: [node(85)]
Node.create! x: 976, y: 750, connections: [node(86)]
Node.create! x: 934, y: 696, connections: [node(87), node(62)]
Node.create! x: 1028, y: 926, connections: [node(83)]
Ability.create! name: 'Use', node: Node.find(89)
Node.create! x: 1142, y: 926, connections: [node(89)]
Node.create! x: 1122, y: 980, connections: [node(90)]
Node.create! x: 1143, y: 1032, attribute_name: 'Strength', value: 2, connections: [node(91)]
Node.create! x: 1194, y: 1052, connections: [node(92)]
Node.create! x: 1246, y: 1032, attribute_name: 'Magic Defense', value: 3, connections: [node(93)]
Node.create! x: 1194, y: 856, attribute_name: 'HP', value: 200, connections: [node(76)]
Node.create! x: 1194, y: 906, connections: [node(95)]
Ability.create! name: 'Luck', node: Node.find(96)
Node.create! x: 1194, y: 942, attribute_name: 'Agility', value: 4, connections: [node(96)]
Node.create! x: 1158, y: 980, attribute_name: 'Magic Defense', value: 2, connections: [node(97)]
Node.create! x: 1194, y: 1016, attribute_name: 'MP', value: 20, connections: [node(98)]
Node.create! x: 1194, y: 980, attribute_name: 'Strength', value: 2, connections: [node(99)]
Node.create! x: 1230, y: 980, connections: [node(100)]
Node.create! x: 1266, y: 980, connections: [node(101)]
Ability.create! name: 'Spare Change', node: Node.find(102)
Node.create! x: 1246, y: 926, attribute_name: 'HP', value: 200, connections: [node(102)]
Node.create! x: 1322, y: 926, attribute_name: 'MP', value: 20, connections: [node(103)]
Node.create! x: 1290, y: 850, attribute_name: 'Accuracy', value: 2, connections: [node(104)]
Node.create! x: 1326, y: 850, attribute_name: 'Agility', value: 3, connections: [node(105)]
Node.create! x: 1346, y: 902, connections: [node(106)]
Node.create! x: 1398, y: 922, attribute_name: 'Strength', value: 2, connections: [node(107)]
Node.create! x: 1398, y: 886, attribute_name: 'Magic', value: 4, connections: [node(108)]
Node.create! x: 1372, y: 878, attribute_name: 'HP', value: 200, connections: [node(109)]
Node.create! x: 1362, y: 850, attribute_name: 'Defense', value: 2, connections: [node(110)]
Node.create! x: 1372, y: 824, attribute_name: 'Magic Defense', value: 2, connections: [node(111)]
Node.create! x: 1398, y: 814, attribute_name: 'MP', value: 20, connections: [node(112)]
Node.create! x: 1426, y: 824, attribute_name: 'HP', value: 200, connections: [node(113)]
Node.create! x: 1450, y: 798, attribute_name: 'Accuracy', value: 3, connections: [node(114)]
Node.create! x: 1398, y: 778, connections: [node(115)]
Node.create! x: 1346, y: 798, connections: [node(116)]
Node.create! x: 1322, y: 774, connections: [node(117)]
Node.create! x: 1470, y: 850, connections: [node(115)]
Node.create! x: 1434, y: 850, lock_level: 3, connections: [node(119)]
Node.create! x: 1398, y: 850, connections: [node(120)]
Ability.create! name: 'Pilfer Gil', node: Node.find(121)
Node.create! x: 1450, y: 902, connections: [node(119)]
Node.create! x: 1474, y: 926, attribute_name: 'Magic', value: 4, connections: [node(122)]
Node.create! x: 1398, y: 958, connections: [node(123)]
Ability.create! name: 'Dispel', node: Node.find(124)
Node.create! x: 1506, y: 850, attribute_name: 'MP', value: 20, connections: [node(123)]
Node.create! x: 1474, y: 774, attribute_name: 'HP', value: 200, connections: [node(125)]
Node.create! x: 1398, y: 742, connections: [node(126)]
Node.create! x: 1448, y: 674, attribute_name: 'Agility', value: 4, connections: [node(127)]
Node.create! x: 1504, y: 674, connections: [node(128)]
Node.create! x: 1530, y: 648, attribute_name: 'Evasion', value: 4, connections: [node(129)]
Node.create! x: 1520, y: 622, connections: [node(130)]
Node.create! x: 1484, y: 622, attribute_name: 'HP', value: 200, connections: [node(131)]
Node.create! x: 1558, y: 692, lock_level: 3, connections: [node(129)]
Node.create! x: 1608, y: 674, connections: [node(133)]
Node.create! x: 1584, y: 648, connections: [node(134)]
Node.create! x: 1584, y: 594, connections: [node(135)]
Node.create! x: 1530, y: 594, connections: [node(136)]
Node.create! x: 1558, y: 622, connections: [node(137)]
Ability.create! name: 'Death', node: Node.find(138)
Node.create! x: 1558, y: 658, attribute_name: 'Agility', value: 1, connections: [node(138)]
Node.create! x: 1628, y: 622, attribute_name: 'HP', value: 200, connections: [node(134)]
Node.create! x: 1608, y: 570, connections: [node(140)]
Node.create! x: 1558, y: 550, attribute_name: 'Magic Defense', value: 4, connections: [node(141)]
Node.create! x: 1504, y: 570, attribute_name: 'Evasion', value: 4, connections: [node(142)]
Node.create! x: 1504, y: 500, connections: [node(143)]
