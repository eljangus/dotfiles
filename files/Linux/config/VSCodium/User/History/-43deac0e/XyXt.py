while True:
	for horizontal_position in range(get_world_size()):
		for vertical_position in range(get_world_size()):
			if can_harvest():
				harvest()
				plant(Entities.Bush)
				move(South)
		move(East)
		