while True:
	for horizontal_position in range(get_world_size()):
		for vertical_position in range(get_world_size()):
			if can_harvest():
				harvest()
				move(North)
			if horizontal_position == 0:
				till()
				plant(Entities.carrot)
			if horizontal_position == 1:
				plant(Entities.grass)
			if horizontal_position ==2:
				plant(Entities.bush)
		move(East)
		