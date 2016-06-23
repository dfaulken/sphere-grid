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

Node.create! x: 862, y: 914
cheer_node = Node.create! x: 862, y: 818
Ability.create! name: 'Cheer', node: cheer_node
