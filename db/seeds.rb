tidus = Character.create! name: 'Tidus', color: 'blue', base_attributes: {
  'HP' => 520, 'MP' => 12,
  'Strength' => 15, 'Defense' => 5, 'Magic' => 5, 'Magic Defense' => 5,
  'Agility' => 10, 'Luck' => 18, 'Evasion' => 10, 'Accuracy' => 10
}
cheer_node = Node.create!
cheer = Ability.create! name: 'Cheer', node: cheer_node
tidus.nodes << cheer_node

defense_node = Node.create! attribute_name: 'Defense', value: 2
